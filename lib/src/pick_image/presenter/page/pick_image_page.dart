import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_paraguay/shared/snackbar_manager/snackbar_manager.dart';
import 'package:todo_paraguay/shared/widgets/bottombar_widget.dart';
import 'package:todo_paraguay/src/pick_image/domain/entitity/image_entity.dart';
import 'package:todo_paraguay/src/pick_image/domain/usecases/pick_Image_with_camera.dart';
import 'package:todo_paraguay/src/pick_image/domain/usecases/pick_image_from_gallery.dart';
import 'package:todo_paraguay/src/pick_image/external/image_picker_impl.dart';
import 'package:todo_paraguay/src/pick_image/infra/repositories/pick_image_repositories_impl.dart';
import 'package:todo_paraguay/src/pick_image/presenter/store/pick_image_store.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/page/widgets/popular_Item_list.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<PickedImage>? imageList;
  final pickImages = PickImageStore(
    SnackBarManager(),
    PickImageWithCameraUseCase(
        PickedImageRepository(ImagePickerImpl(ImagePicker()))),
    PickImageFromGalleryUseCase(
        PickedImageRepository(ImagePickerImpl(ImagePicker()))),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      imageList = await pickImages.pickImageWithCamera();
                    },
                    icon: const Icon(Icons.camera_alt),
                    label: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Tire uma foto'),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        textStyle: const TextStyle(
                          fontSize: 18,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('ou'),
                  ),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.attach_file),
                    label: const Text('Selecione um arquivo'),
                    onPressed: () {
                      pickImages.pickImageFromGallery();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottonBarWidget(
          exit: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
