import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum ImageSourceType { gallery, camera }

class Classifier extends StatelessWidget {
  const Classifier({Key? key}) : super(key: key);

  void _handleURLButtonPress(BuildContext context, ImageSourceType type) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImageFromGalleryEx(type: type)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            width: 300,
            color: Colors.red,
          ),
          const SizedBox(
            height: 25,
          ),
          MaterialButton(
            color: Colors.blue,
            child: const Text(
              "Pick Image from Gallery",
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              _handleURLButtonPress(context, ImageSourceType.gallery);
            },
          ),
          MaterialButton(
            color: Colors.blue,
            child: const Text(
              "Pick Image from Camera",
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              _handleURLButtonPress(context, ImageSourceType.camera);
            },
          ),
        ],
      ),
    ));
  }
}

class ImageFromGalleryEx extends StatefulWidget {
  final ImageSourceType type;
  const ImageFromGalleryEx({Key? key, required this.type}) : super(key: key);

  @override
  ImageFromGalleryExState createState() => ImageFromGalleryExState();
}

class ImageFromGalleryExState extends State<ImageFromGalleryEx> {
  File? _image;
  var imagePicker;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.type == ImageSourceType.camera
              ? "Image from Camera"
              : "Image from Gallery")),
      body: Column(
        children: <Widget>[
          // Margin
          const SizedBox(
            height: 52,
          ),

          Center(
            child: GestureDetector(
              onTap: openDevice,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(color: Colors.red[200]),
                child: _image != null
                    ? Image.file(
                        _image!,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.fitHeight,
                      )
                    : Container(
                        decoration: BoxDecoration(color: Colors.red[200]),
                        width: 200,
                        height: 200,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void openDevice() async {
    var source = widget.type == ImageSourceType.camera
        ? ImageSource.camera
        : ImageSource.gallery;
    XFile? image = await imagePicker.pickImage(
        source: source,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }
}
