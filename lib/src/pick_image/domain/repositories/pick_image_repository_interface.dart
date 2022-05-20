import 'package:dartz/dartz.dart';
import 'package:todo_paraguay/src/pick_image/domain/entitity/image_entity.dart';
import 'package:todo_paraguay/src/pick_image/domain/errors/errors.dart';

abstract class IPickedImageRepository {
  Future<Either<PickImageFailure, List<PickedImage>>> getImages(
      {required bool loadingCamera});
}
