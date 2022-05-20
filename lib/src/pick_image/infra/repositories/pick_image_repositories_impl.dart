import 'package:dartz/dartz.dart';
import 'package:todo_paraguay/src/pick_image/domain/entitity/image_entity.dart';
import 'package:todo_paraguay/src/pick_image/domain/errors/errors.dart';
import 'package:todo_paraguay/src/pick_image/domain/repositories/pick_image_repository_interface.dart';
import 'package:todo_paraguay/src/pick_image/infra/datasources/pick_image_datasource_interface.dart';

class PickedImageRepository implements IPickedImageRepository {
  final IPickedImageDatasource _iPickedImageDatasource;

  PickedImageRepository(this._iPickedImageDatasource);

  @override
  Future<Either<PickImageFailure, List<PickedImage>>> getImages(
      {required bool loadingCamera}) async {
    try {
      final response =
          await _iPickedImageDatasource.getImages(loadCamera: loadingCamera);
      return Right(response);
    } catch (error) {
      return Left(
          PickImageError(message: 'Suas credenciais não foram encontradas.'));
    }
  }
}
