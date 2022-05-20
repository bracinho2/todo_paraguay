import 'package:todo_paraguay/shared/snackbar_manager/snackbar_manager.dart';
import 'package:todo_paraguay/src/pick_image/domain/usecases/pick_Image_with_camera.dart';
import 'package:todo_paraguay/src/pick_image/domain/usecases/pick_image_from_gallery.dart';

class PickImageStore {
  final IPickImageWithCamera _iPickImageWithCamera;
  final IPickImageFromGallery _iPickImageFromGallery;
  final SnackBarManager _snackBarManager;

  PickImageStore(this._snackBarManager, this._iPickImageWithCamera,
      this._iPickImageFromGallery);

  Future<void> pickImageWithCamera() async {
    var result = await _iPickImageWithCamera.call();

    result.fold(
        (failure) => {
              _snackBarManager.showError(message: failure.message),
            },
        (pickedImages) =>
            pickedImages.map((images) => print(images.imagePath)).toList());
  }

  Future<void> pickImageFromGallery() async {
    var result = await _iPickImageFromGallery.call();
    result.fold(
        (failure) => _snackBarManager.showError(message: failure.message),
        (pickedImages) =>
            pickedImages.map((images) => print(images.imagePath)).toList());
  }
}
