import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_paraguay/shared/snackbar_manager/snackbar_manager.dart';
import 'package:todo_paraguay/src/pick_image/domain/entitity/image_entity.dart';
import 'package:todo_paraguay/src/pick_image/domain/usecases/pick_Image_with_camera.dart';
import 'package:todo_paraguay/src/pick_image/domain/usecases/pick_image_from_gallery.dart';
import 'package:todo_paraguay/src/pick_image/external/image_picker_impl.dart';
import 'package:todo_paraguay/src/pick_image/infra/repositories/pick_image_repositories_impl.dart';
import 'package:todo_paraguay/src/pick_image/presenter/store/pick_image_store.dart';
import 'package:todo_paraguay/src/search_page/presenter_bloc/page/widgets/new_item_list.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  List<PickedImage> imageList = [];

  final pickImages = PickImageStore(
    SnackBarManager(),
    PickImageWithCameraUseCase(
        PickedImageRepository(ImagePickerImpl(ImagePicker()))),
    PickImageFromGalleryUseCase(
        PickedImageRepository(ImagePickerImpl(ImagePicker()))),
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                  if (imageList.isNotEmpty && imageList.length > 1)
                    Container(
                      margin: const EdgeInsets.only(top: 21),
                      height: 120,
                      width: size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(left: 5, right: 6),
                        itemCount: imageList.length,
                        //physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final image = imageList[index];
                          print(imageList.length);
                          return SizedBox(
                            height: 120,
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(300), // Image border
                                child: Image.file(File(image.imagePath)),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  if (imageList.isNotEmpty)
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.file(File(imageList[0].imagePath)),
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      imageList = await pickImages.pickImageWithCamera();
                      setState(() {});
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
                    onPressed: () async {
                      imageList = await pickImages.pickImageFromGallery();
                      print(imageList.length);
                      setState(() {});
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
