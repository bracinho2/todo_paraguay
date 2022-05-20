import 'package:dartz/dartz.dart';
import 'package:todo_paraguay/src/pick_image/domain/entitity/image_entity.dart';
import 'package:todo_paraguay/src/pick_image/domain/errors/errors.dart';
import 'package:todo_paraguay/src/pick_image/domain/repositories/pick_image_repository_interface.dart';

abstract class IPickImageWithCamera {
  Future<Either<PickImageFailure, List<PickedImage>>> call();
}

class PickImageWithCameraUseCase implements IPickImageWithCamera {
  final IPickedImageRepository _pickImageRepository;

  PickImageWithCameraUseCase(this._pickImageRepository);
  @override
  Future<Either<PickImageFailure, List<PickedImage>>> call() async {
    return _pickImageRepository.getImages(loadingCamera: true);
  }
}
