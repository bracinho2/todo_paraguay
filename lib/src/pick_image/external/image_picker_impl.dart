import 'package:image_picker/image_picker.dart';
import 'package:todo_paraguay/src/pick_image/domain/entitity/image_entity.dart';
import 'package:todo_paraguay/src/pick_image/infra/datasources/pick_image_datasource_interface.dart';

class ImagePickerImpl implements IPickedImageDatasource {
  final ImagePicker _imagePicker;

  ImagePickerImpl(this._imagePicker);

  @override
  Future<List<PickedImage>> getImages({required bool loadCamera}) async {
    if (!loadCamera) {
      List<XFile>? imageFileList = [];
      final List<XFile>? selectedImages = await _imagePicker.pickMultiImage();
      if (selectedImages!.isNotEmpty) {
        imageFileList.addAll(selectedImages);
      }

      return imageFileList
          .map((image) => PickedImage(image.name, image.path))
          .toList();
    }
    final image = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    if (image != null) {
      List<PickedImage> finalList = [];
      finalList.add(PickedImage(image.name, image.path));

      return finalList;
    }
    return [];
  }
}
