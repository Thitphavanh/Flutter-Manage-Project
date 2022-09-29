import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({super.key});

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPickerImage(),
          _buildPreviewImage(),
        ],
      ),
    );
  }

  OutlinedButton _buildPickerImage() {
    return OutlinedButton.icon(
      onPressed: () {
        _modalPickerImage();
      },
      icon: const FaIcon(FontAwesomeIcons.image),
      label: const Text('image'),
    );
  }

  dynamic _buildPreviewImage() {
    if (imageFile == null) {
      return const SizedBox();
    }
    container(Widget child) {
      return Container(
        color: Colors.grey.shade100,
        margin: const EdgeInsets.only(top: 4.0),
        alignment: Alignment.center,
        child: child,
      );
    }

    return Stack(
      children: [
        container(
          Image.file(imageFile!),
        ),
        _buildDeleteImageButton(),
      ],
    );
  }

  Positioned _buildDeleteImageButton() {
    return Positioned(
      child: IconButton(
        onPressed: () {
          setState(() {
            imageFile = null;
          });
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.black54,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }

  void _modalPickerImage() {
    buildListTile(
      IconData icon,
      String title,
      ImageSource imageSource,
    ) =>
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          onTap: () async {
            Navigator.pop(context);
            _pickImage(imageSource);
          },
        );
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildListTile(
            Icons.photo_camera,
            'Take a picture from camera',
            ImageSource.camera,
          ),
          buildListTile(
            Icons.photo_library,
            'Choose from photo library',
            ImageSource.gallery,
          ),
        ],
      ),
    );
  }

  void _pickImage(ImageSource imageSource) {
    _picker
        .pickImage(
      source: imageSource,
      imageQuality: 70,
      maxHeight: 500,
      maxWidth: 500,
    )
        .then((file) {
      if (file != null) {
        setState(() {
          imageFile = File(file.path);
        });
      }
    });
  }
}
