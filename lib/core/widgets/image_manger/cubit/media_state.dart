import 'package:image_picker/image_picker.dart';

abstract class MediaState{}

class ImageManagerInitial extends MediaState{}

class ImageManagerPicked extends MediaState{
  XFile image;
  ImageManagerPicked(this.image);
}