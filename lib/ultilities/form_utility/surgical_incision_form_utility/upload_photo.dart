import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/interfaces/calculation_service_interface.dart';
import '../../../services/interfaces/firebase_service_interface.dart';
import '../../../services/interfaces/storage_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../../stores/user_store.dart';

class UploadPhoto extends StatefulWidget {
  // final String fromId;
  final Map<String, dynamic> formDataToDB;
  UploadPhoto(this.formDataToDB);
  @override
  _UploadPhotoState createState() => _UploadPhotoState(formDataToDB);
}

class _UploadPhotoState extends State<UploadPhoto> {
  File _image;
  final Map<String, dynamic> formDataToDB;
  final picker = ImagePicker();
  _UploadPhotoState(this.formDataToDB);
  var _anSubCollection;

  final _firebaseService = locator<IFirebaseService>();
  final _calculationService = locator<ICalculationService>();
  final _storageService = locator<IStorageService>();

  void initData() async {
    _anSubCollection = await _firebaseService.getLatestAnSubCollection(
        userId: UserStore.getValueFromStore('storedUserId'));
    print('_anSubCollectionHere $_anSubCollection');
  }

  Future<void> getImage() async {
    await picker.getImage(source: ImageSource.camera).then((image) {
      setState(() {
        _image = File(image.path);
        print('_image = $_image');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("ให้ผู้ป่วยส่งรูปแผลของตน",
              style: Theme.of(context).textTheme.bodyText2),
          Text("เพื่อให้พยาบาลประเมิน",
              style: Theme.of(context).textTheme.bodyText2),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: getImage,
                  child: Center(
                    child: _image != null
                        ? Image.file(
                            _image,
                            height: 100,
                            width: 100,
                          )
                        : Image.asset(
                            'assets/image.png',
                            height: 100,
                            width: 100,
                          ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_a_photo),
                  iconSize: 40,
                  onPressed: getImage,
                )
              ],
            ),
          ),
        ],
      ),
      actions: [
        RaisedButton(
          color: Color(0xFFC37447),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "ตกลง",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          onPressed: () async {
            if (_image != null) {
              String imgUrl = await _storageService.uploadImageToFirebase(
                  imageFile: _image);
              formDataToDB['imgURL'] = imgUrl;
              print('printFormDataToDb in upload_photo $formDataToDB');
              var formId = await _firebaseService.addDataToFormsCollection(
                  formName: 'Surgical Incision', data: formDataToDB);
              var userId = UserStore.getValueFromStore('storedUserId');
              await _firebaseService.addNotification(
                  formId: formId,
                  formName: 'Surgical Incision',
                  userId: userId);
              Navigator.pushNamed(context, '/evaluation_page');
            }
          },
        ),
      ],
    );
  }
}
