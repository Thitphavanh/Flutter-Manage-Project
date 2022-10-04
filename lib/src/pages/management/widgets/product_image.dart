// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_project_manage/src/constanrs/api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProductImage extends StatefulWidget {
  final Function(File? imageFile) callBack;
  final String? imageUrl;

  const ProductImage(this.callBack, this.imageUrl);

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  String? _imageUrl;

  @override
  void initState() {
    _imageUrl = widget.imageUrl;
    super.initState();
  }

  @override
  void dispose() {
    _imageFile?.delete();
    super.dispose();
  }

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
    if ((_imageUrl == null || _imageUrl!.isEmpty) && _imageFile == null) {
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

    return _imageUrl != null
        ? container(Image.network('${API.imagesUrl}/$_imageUrl'))
        : Stack(
            children: [
              container(
                Image.file(_imageFile!),
              ),
              _buildDeleteImageButton(),
            ],
          );
  }

  Positioned _buildDeleteImageButton() {
    return Positioned(
      right: 0.0,
      child: IconButton(
        onPressed: () {
          setState(() {
            _imageFile = null;
            widget.callBack(null);
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
        _cropImage(file.path);
      }
    });
  }

  void _cropImage(String file) {
    ImageCropper().cropImage(
      sourcePath: file,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.dialog,
          boundary: const CroppieBoundary(
            width: 520,
            height: 520,
          ),
        ),
      ],
    ).then((file) {
      if (file != null) {
        setState(() {
          _imageFile = File(file.path);
          widget.callBack(_imageFile!);
          _imageUrl = null;
        });
      }
    });
  }
}
