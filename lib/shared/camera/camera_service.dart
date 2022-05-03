import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

abstract class GetImages {
  Future<String?> imageFromCamera();
  Future<String?> imageFromGallery();
}

class PickImages implements GetImages {
  final ImagePicker _imagePicker;

  PickImages(this._imagePicker);

  @override
  Future<String?> imageFromCamera() async {
    final image = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      preferredCameraDevice: CameraDevice.rear,
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/imagem.jpg';
    final File file = File(path);

    await image!.saveTo(path);
    print(path);
    return path;
  }

  @override
  Future<String?> imageFromGallery() async {
    final image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (image != null) {
      return image.path;
    } else {
      return null;
    }
  }
}
