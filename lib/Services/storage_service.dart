import 'dart:io';

import 'package:family/app.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxController {
  RxDouble progress = 0.0.obs;
  RxInt numbering = 0.obs;
  RxString ispic = ''.obs;

  Future<String> uploadPic(File image, {String bucketName, int i}) async {
    ispic.value = 'صورة';
    numbering.value = i;
    Reference reference = storage.ref(bucketName ?? 'profile').child(
        (bucketName ?? "profile") +
            "_image_${DateTime.now().millisecondsSinceEpoch}");
    UploadTask uploadTask = reference.putFile(image);
    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      progress.value = (snapshot.bytesTransferred.toDouble() /
          snapshot.totalBytes.toDouble());
      print(progress.value);
    }).onError((error) {
      print(error.toString());
    });
    TaskSnapshot taskSnapshot = await uploadTask;
    String url = await taskSnapshot.ref.getDownloadURL();
    print(url);
    return url;
  }

  Future<String> uploadVideo(File video, String bucketName, {int i}) async {
    ispic.value = 'فيديو';
    numbering.value = i;
    Reference reference = storage.ref(bucketName).child(
        "${bucketName ?? ""}_video_${DateTime.now().millisecondsSinceEpoch}");
    UploadTask uploadTask = reference.putFile(video);
    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      progress.value = (snapshot.bytesTransferred.toDouble() /
          snapshot.totalBytes.toDouble());
      print(progress.value);
    }).onError((error) {
      print(error.toString());
    });
    TaskSnapshot taskSnapshot = await uploadTask;

    String url = await taskSnapshot.ref.getDownloadURL();
    print(url);
    return url;
  }
}
