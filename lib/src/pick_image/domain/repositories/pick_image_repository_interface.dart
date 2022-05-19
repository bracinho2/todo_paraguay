import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_paraguay/src/pick_image/domain/errors/errors.dart';

abstract class IPIckimageRepository {
  Future<Either<PickImageFailure, XFile>> pickImage(
      {required bool loadingCamera});
}
