
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'media_state.dart';

class ImageUploader extends Cubit<MediaState>
{
  ImageUploader() : super(ImageManagerInitial());
  static ImageUploader get(context) => BlocProvider.of(context);

  pickImage()async
  {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      emit(ImageManagerPicked(image));
    }
  }
}
