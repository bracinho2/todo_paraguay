import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_paraguay/src/pick_image/domain/errors/errors.dart';
import 'package:todo_paraguay/src/pick_image/domain/repositories/pick_image_repository_interface.dart';

abstract class IPickImageFromGallery {
  Future<Either<PickImageFailure, XFile>> call();
}

class PIckImageFromGalleryUseCase implements IPickImageFromGallery {
  final IPIckimageRepository _pickImageRepository;

  PIckImageFromGalleryUseCase(this._pickImageRepository);
  @override
  Future<Either<PickImageFailure, XFile>> call() async {
    return _pickImageRepository.pickImage(loadingCamera: false);
  }
}
