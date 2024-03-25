import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:http/http.dart' as http;

class TFLiteProvider extends ChangeNotifier {
  File? _image;
  late Interpreter _interpreter;

  File? get image => _image;

  String? _result;

  String? get result => _result;

  Future<void> uploadImage() async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://1e2d-117-217-108-189.ngrok-free.app/predict"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'file',
        _image!.readAsBytes().asStream(),
        _image!.lengthSync(),
        filename: basename(_image!.path),
        contentType: MediaType('image', 'jpeg'),
      ),
    );
    request.headers.addAll(headers);
    request.fields
        .addAll({"name": "test", "email": "test@gmail.com", "id": "12345"});
    print("request: " + request.toString());
    var res = await request.send();

    String responseString = await res.stream.bytesToString();
    _result = responseString;
    notifyListeners();
    log(responseString);

    // log(res.toString());
    // http.Response response = await http.Response.fromStream(res);
    // print("This is response:" + response.toString());
  }

  Future<void> uploadImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }
}
