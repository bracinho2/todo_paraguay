import 'package:image_picker/image_picker.dart';

class PickedImage {
  final XFile image;
  final List<XFile>? images;

  PickedImage(this.image, this.images);
}
