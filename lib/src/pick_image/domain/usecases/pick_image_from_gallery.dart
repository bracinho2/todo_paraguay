import 'package:dartz/dartz.dart';
import 'package:todo_paraguay/src/pick_image/domain/entitity/image_entity.dart';
import 'package:todo_paraguay/src/pick_image/domain/errors/errors.dart';
import 'package:todo_paraguay/src/pick_image/domain/repositories/pick_image_repository_interface.dart';

abstract class IPickImageFromGallery {
  Future<Either<PickImageFailure, Future<List<PickedImage>>>> call();
}

class PIckImageFromGalleryUseCase implements IPickImageFromGallery {
  final IPIckimageRepository _pickImageRepository;

  PIckImageFromGalleryUseCase(this._pickImageRepository);
  @override
  Future<Either<PickImageFailure, Future<List<PickedImage>>>> call() async {
    return _pickImageRepository.getImages(loadingCamera: false);
  }
}
