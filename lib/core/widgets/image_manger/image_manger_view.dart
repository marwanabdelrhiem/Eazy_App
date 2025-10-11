import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'cubit/image_uploader.dart';
import 'cubit/media_state.dart';

class ImageManagerView extends StatelessWidget {
  const ImageManagerView({super.key, required this.defaultBuilder,
    required this.imageBuilder, required this.onImagePicked});

  final Widget defaultBuilder;
  final Widget Function(XFile image) imageBuilder;
  final void Function(XFile image) onImagePicked;
  @override
  Widget build(BuildContext context) {
    return Builder(
          builder: (context) {
            return GestureDetector(
              onTap: ImageUploader.get(context).pickImage,
              child: BlocConsumer<ImageUploader, MediaState>(
                  listener: (context, state){
                    if(state is ImageManagerPicked)
                    {
                      onImagePicked(state.image);
                    }
                  },
                  builder: (context, state)
                  {
                    if(state is ImageManagerPicked)
                    {
                      return imageBuilder(state.image);
                    }
                    else
                    {
                      return defaultBuilder;
                    }
                  }
              ),
            );
          }
    );
  }
}
