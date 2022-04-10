import 'package:image_picker/image_picker.dart';

pickImage(ImageSource imageSource) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: imageSource);
  if (_file != null) {
    return _file.readAsBytes();
  } else {
    print('no image selected');
  }
}
