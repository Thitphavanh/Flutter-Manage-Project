import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/config/colors.dart';
import 'package:flutter_project_manage/src/models/product.dart';
import 'package:flutter_project_manage/src/pages/management/widgets/product_image.dart';
import 'package:flutter_project_manage/src/services/network_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({super.key});

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  bool? isEdit;
  final spacing = 8.0;
  Product? product;
  final _formKey = GlobalKey<FormState>();
  File? _imageFile;

  @override
  void initState() {
    isEdit = false;
    product = Product();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Object? arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments is Product) {
      isEdit = true;
      product = arguments;
    }
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: spacing,
              horizontal: spacing,
            ),
            child: Column(
              children: <Widget>[
                _buildNameInput(),
                SizedBox(height: spacing),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: _buildPriceInput(),
                    ),
                    SizedBox(width: spacing),
                    Flexible(
                      flex: 1,
                      child: _buildStockInput(),
                    ),
                  ],
                ),
                ProductImage(
                  callBack,
                  product!.image,
                ),
                const SizedBox(height: 80.0)
              ],
            ),
          ),
        ),
      ),
    );
  }

  callBack(File? imageFile) {
    this._imageFile = imageFile;
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(isEdit! ? 'Edit Product' : 'Create Product'),
      actions: [
        if (isEdit!) _buildDeleteButton(),
        TextButton(
          onPressed: () {
            _formKey.currentState!.save();
            FocusScope.of(context).requestFocus(FocusNode());
            if (isEdit!) {
              editProduct();
            } else {
              addProduct();
            }
          },
          child: Text(
            'summit',
            style: TextStyle(
              color: MyColors.deeporange,
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration inputStyle(label) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: MyColors.orange,
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: MyColors.blue,
          width: 2.0,
        ),
      ),
      labelText: label,
    );
  }

  TextFormField _buildNameInput() {
    return TextFormField(
      initialValue: product!.name,
      decoration: inputStyle('name'),
      onSaved: (String? value) {
        product!.name = value!.isEmpty ? 'Please enter a name' : value;
      },
    );
  }

  TextFormField _buildPriceInput() {
    return TextFormField(
      initialValue: product!.price?.toString(),
      decoration: inputStyle('price'),
      keyboardType: TextInputType.number,
      onSaved: (String? value) {
        product!.price = value!.isEmpty ? 0 : int.parse(value);
      },
    );
  }

  TextFormField _buildStockInput() {
    return TextFormField(
      initialValue: product!.stock?.toString(),
      decoration: inputStyle('stock'),
      keyboardType: TextInputType.number,
      onSaved: (String? value) {
        product!.stock = value!.isEmpty ? 0 : int.parse(value);
      },
    );
  }

  void addProduct() {
    NetworkService().addProduct(product!, imageFile: _imageFile).then((result) {
      Navigator.pop(context);
      showAlertBar(result);
    }).catchError((error) {
      showAlertBar(
        error.toString(),
        // ignore: deprecated_member_use
        icon: FontAwesomeIcons.timesCircle,
        color: Colors.greenAccent,
      );
    });
  }

  void showAlertBar(String message,
      // ignore: deprecated_member_use
      {IconData icon = FontAwesomeIcons.checkCircle,
      Color color = Colors.redAccent}) {
    Flushbar(
      message: message,
      icon: FaIcon(
        icon,
        size: 28.0,
        color: color,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 3),
      flushbarStyle: FlushbarStyle.GROUNDED,
    ).show(context);
  }

  IconButton _buildDeleteButton() {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: const Text('Delete Product'),
              content: const Text('Are you sure you want to delete?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: const Text('cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    deleteProduct();
                  },
                  child: Text(
                    'confirm',
                    style: TextStyle(color: MyColors.deeporange),
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.delete_outline),
    );
  }

  void deleteProduct() {
    NetworkService().deleteProduct(product!.id).then((result) {
      Navigator.pop(context);
      showAlertBar(result);
    }).catchError((error) {
      showAlertBar(
        error.toString(),
        // ignore: deprecated_member_use
        icon: FontAwesomeIcons.timesCircle,
        color: Colors.red,
      );
    });
  }

  void editProduct() {
    NetworkService()
        .editProduct(product!, imageFile: _imageFile)
        .then((result) {
      Navigator.pop(context);
      showAlertBar(result);
    }).catchError((error) {
      showAlertBar(
        error.toString(),
        // ignore: deprecated_member_use
        icon: FontAwesomeIcons.timesCircle,
        color: Colors.red,
      );
    });
  }
}
