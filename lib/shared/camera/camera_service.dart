import 'package:image_picker/image_picker.dart';

abstract class GetImages {
  Future<String?> image();
}

class PickImages implements GetImages {
  final ImagePicker _imagePicker;

  PickImages(this._imagePicker);

  @override
  Future<String?> image({bool loadCamera = true}) async {
    final image = await _imagePicker.pickImage(
      source: loadCamera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50,
    );

    return image?.path;
  }
}
