import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leafy/homecomponents/drawer.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  var imagePicker;

  var _image;

  bool isResultVisible = false;
  @override
  void initState() {
    imagePicker = ImagePicker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const TheDrawer(),
      appBar: AppBar(title: const Text("Classify")),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          // image placeholder
          imagePlaceholder(),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              // classification list results
              isResultVisible && _image != null
                  ? SizedBox(
                      height: 200,
                      child: ListView(
                        children: const [
                          Card(
                              child: ListTile(
                            title: Text("Top 1"),
                            subtitle: Text("Probability: 30%"),
                          )),
                          Card(child: ListTile(title: Text("Top 2"))),
                          Card(child: ListTile(title: Text("Top 3"))),
                          Card(child: ListTile(title: Text("Top 4"))),
                          Card(child: ListTile(title: Text("Top 5"))),
                        ],
                      ),
                    )
                  : Container(),
              // classify button
              _image != null
                  ? ElevatedButton(
                      onPressed: () => {
                        // if _image is null disable this button
                        sendImage(),
                        // classifyImage(),
                        setState(() {
                          isResultVisible = true;
                        }),
                      },
                      child: const Text("Classify"),
                    )
                  : Container(),
              const SizedBox(height: 10),
              imageSource()
            ],
          )
        ],
      ),
    );
  }

// FormData is used as a data type of a file to be posted to the server
// FormData is a Multipart thus:
  void sendImage() async {
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(_image.path,
          filename: path.basename(_image.path)),
    });
    var response = await Dio().post(
      // "https://juanl.pythonanywhere.com/classifiers/get-image",
      "https://juanl.pythonanywhere.com/classifiers/classify",
      data: formData,
    );
    print(response.data);
  }

  void classifyImage() async {
    var response = await Dio()
        .get("https://juanl.pythonanywhere.com/classifiers/classify");
    print(response.data);
  }

  Row imageSource() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton.icon(
            label: const Text("Open Camera"),
            onPressed: () => openDevice(ImageSource.camera),
            icon: const Icon(Icons.camera_alt)),
        ElevatedButton.icon(
            label: const Text("Open Gallery"),
            onPressed: () => openDevice(ImageSource.gallery),
            icon: const Icon(Icons.photo)),
      ],
    );
  }

  Center imagePlaceholder() {
    return Center(
      child: Stack(children: [
        SizedBox(
          height: 250,
          width: 200,
          child: (_image == null)
              ? Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 35.0, 8.0, 8.0),
                    child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.white,
                        ),
                        child: const Center(
                            child: Text(
                          "No Image",
                          style: TextStyle(fontSize: 20),
                        ))),
                  ),
                )
              : Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 35.0, 8.0, 8.0),
                    child: Image.file(
                      _image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
        ),
        // remove image
        Positioned(
          right: 0,
          child: IconButton(
            onPressed: () => setState(() {
              _image = null;
              isResultVisible = false;
            }),
            icon: const Icon(
              Icons.close,
            ),
            // color: Colors.white,
          ),
        ),
      ]),
    );
  }

  void openDevice(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(
        source: source,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.rear);
    if (image != null) {
      setState(() {
        isResultVisible = false;
        _image = File(image.path);
      });
    }
  }
}
