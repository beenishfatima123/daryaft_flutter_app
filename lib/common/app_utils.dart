import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/helpers.dart';
import '../../common/app_pop_ups.dart';
import '../dio_networking/api_client.dart';
import '../dio_networking/api_response.dart';
import '../dio_networking/api_route.dart';
import '../dio_networking/app_apis.dart';
import '../my_application.dart';

class AppUtils {
  static Future<List<PlatformFile>?> pickMultipleFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      printWrapped(result.files.first.name);
      return result.files;
    } else {
      // User canceled the picker
      printWrapped('user cancelled picking files');
      return null;
    }
  }

  static void downloadAndOpenFile({String? url, required isLoading}) async {
    if ((url ?? '').isNotEmpty) {
      isLoading(true);
      url = ApiConstants.baseUrlNoSlash + url!;
      print('downloading url :=  $url');
      File? file = await downloadFile(url: url);
      isLoading(false);
      if (file != null) {
        print('file open path: ${file.path}');
/*
        OpenFile.open(file.path);
*/
      } else {
        AppPopUps.showSnackBar(
            message: 'Failed to open file', context: myContext!);
      }
    } else {
      AppPopUps.showSnackBar(message: 'Empty file', context: myContext!);
    }
  }

  static String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('hh:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = '${diff.inDays} DAY AGO';
      } else {
        time = '${diff.inDays} DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = '${(diff.inDays / 7).floor()} WEEK AGO';
      } else {
        // time = '${(diff.inDays / 7).floor()} WEEKS AGO';
        time = DateFormat('hh:mm a\nMM:YYYY').format(date);
      }
    }

    return time;
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static void showPicker(
      {required BuildContext context,
      onComplete,
      required onBottomSheetClosed}) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext x) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () async {
                      _pickImage(
                          source: 0,
                          onCompletedd: (File? file) {
                            print(file!.path.toString());
                            onComplete(file);
                          });

                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () async {
                    _pickImage(
                        source: 1,
                        onCompletedd: (File? file) {
                          onComplete(file);
                        });

                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.file_copy),
                  title: const Text('File'),
                  onTap: () async {
                    _pickFile(onCompletedd: (File? file) {
                      onComplete(file);
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        }).whenComplete(onBottomSheetClosed);
  }

  static void _pickFile(
      {required Null Function(File? file) onCompletedd}) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          /* allowedExtensions: ['jpg', 'pdf', 'doc','.mp3','.mp4'],
          allowMultiple: false,
          type: FileType.custom,*/
          allowCompression: true,
          onFileLoading: (FilePickerStatus status) {
            if (status == FilePickerStatus.done) {}
          });

      if (result != null) {
        print("result not empty file pick");
        onCompletedd(File(result.files.single.path!));
      } else {
        onCompletedd(null);
        Get.log('No file selected.');
        return null;
      }
    } catch (e) {
      onCompletedd(null);
      Get.log(e.toString(), isError: true);
    }
  }

  static void _pickImage({required int source, required onCompletedd}) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
          source: source == 1 ? ImageSource.camera : ImageSource.gallery);

      if (pickedFile != null) {
        onCompletedd(File(pickedFile.path));
      } else {
        onCompletedd(null);
        Get.log('No image selected.');
        return null;
      }
    } catch (e) {
      onCompletedd(null);
      Get.log(e.toString(), isError: true);
    }
  }

  static Future<void> dialNumber(
      {required String phoneNumber, required BuildContext context}) async {
    final url = "tel:$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      AppPopUps.showSnackBar(
          message: "Unable to call $phoneNumber", context: context);
    }

    return;
  }

  static void showDatePicker(
      {required Null Function(DateTime dateTime) onComplete}) {
    DatePicker.showDatePicker(myContext!,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime(2050, 6, 7),
        onChanged: (date) {}, onConfirm: (DateTime? date) {
      onComplete(date ?? DateTime.now());
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  static void showTimePicker(
      {required Null Function(DateTime dateTime) onCompletePickTime}) {
    DatePicker.showTime12hPicker(myContext!,
        showTitleActions: true,
        onChanged: (date) {}, onConfirm: (DateTime? date) {
      onCompletePickTime(date ?? DateTime.now());
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  static Future<bool> checkIfEmailAlreadyExists({required String email}) async {
    printWrapped("Checking email availablity...");
    var data = {
      "email": email,
    };
    try {
      var response =
          await APIClient(isCache: false, baseUrl: ApiConstants.baseUrl)
              .request(
                  needToAuthenticate: false,
                  route: APIRoute(
                    APIType.checkUniqueMail,
                    body: data,
                  ),
                  create: () => APIResponse(decoding: false),
                  apiFunction: checkIfEmailAlreadyExists);
      return Future.value((response.response?.success ?? false));
    } catch (e) {
      return Future.value(false);
    }
  }

  static unFocusKeyboard() {
    try {
      final FocusScopeNode currentScope = FocusScope.of(myContext!);
      if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<File?> downloadFile({required String url}) async {
    try {
      final appStorage = await getApplicationDocumentsDirectory();
      final name = url.split('/').last;
      final file = File('${appStorage.path}/$name');
      final response = await dio.Dio().get(url,
          options: dio.Options(
              responseType: dio.ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0));
      final ref = file.openSync(mode: FileMode.write);
      ref.writeFromSync(response.data);
      await ref.close();
      return file;
    } catch (e) {
      print(e);
    }
  }
}
