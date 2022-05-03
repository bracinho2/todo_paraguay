import 'package:image_picker/image_picker.dart';

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

    return image?.path;
  }

  @override
  Future<String?> imageFromGallery() async {
    final image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    return image?.path;
  }
}
