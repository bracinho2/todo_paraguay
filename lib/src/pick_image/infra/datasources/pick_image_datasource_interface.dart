import 'package:todo_paraguay/src/pick_image/domain/entitity/image_entity.dart';

abstract class IPickedImageDatasource {
  Future<List<PickedImage>> getImages({required bool loadCamera});
}
