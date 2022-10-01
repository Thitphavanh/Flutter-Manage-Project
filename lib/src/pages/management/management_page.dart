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
  File? imageFiles;

  @override
  void initState() {
    isEdit = false;
    product = Product();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                ProductImage(callBack),
              ],
            ),
          ),
        ),
      ),
    );
  }

  callBack(File imageFile) {
    this.imageFiles = imageFile;
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(isEdit! ? 'Edit Product' : 'Create Product'),
      actions: [
        TextButton(
          onPressed: () {
            _formKey.currentState!.save();
            addProduct();
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
      decoration: inputStyle('name'),
      onSaved: (String? value) {
        product!.name = value!.isEmpty ? 'Please enter a name' : value;
      },
    );
  }

  TextFormField _buildPriceInput() {
    return TextFormField(
      decoration: inputStyle('price'),
      keyboardType: TextInputType.number,
      onSaved: (String? value) {
        product!.price = value!.isEmpty ? 0 : int.parse(value);
      },
    );
  }

  TextFormField _buildStockInput() {
    return TextFormField(
      decoration: inputStyle('stock'),
      keyboardType: TextInputType.number,
      onSaved: (String? value) {
        product!.stock = value!.isEmpty ? 0 : int.parse(value);
      },
    );
  }

  void addProduct() {
    NetworkService().addProduct(product!, imageFile: imageFiles).then((result) {
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
}
