import 'dart:io';
import 'package:file_picker/file_picker.dart';

class MyFilePickerUtil {
  Future<File?> showPicker() async {
    File? result;
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      // allowedExtensions:
      //     fileType == FileType.custom ? ["png", "jpg", "pdf", "jpeg"] : null,
    );
    if (pickedFile != null) {
      result = File(pickedFile.files.single.path!);
    }
    return result;
  }
}
