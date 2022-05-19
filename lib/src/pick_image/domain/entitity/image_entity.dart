import 'dart:typed_data';

class PickedImage {
  final String imageName;
  final String imagePath;
  final Uint8List bytes;

  PickedImage(
    this.imageName,
    this.imagePath,
    this.bytes,
  );
}
