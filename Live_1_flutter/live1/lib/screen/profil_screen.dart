import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilScreen extends StatefulWidget {
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen>
    with AutomaticKeepAliveClientMixin<ProfilScreen> {
  File _image;
  final _form = GlobalKey<FormState>();
  final _lastNameFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Stack(children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _image == null
                      ? AssetImage('assets/img/user.png')
                      : FileImage(_image, scale: 1),
                ),
                Positioned(
                  top: -15,
                  left: 67,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    onPressed: takePicture,
                  ),
                )
              ]),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Form(
                  key: _form,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Prénom'),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_lastNameFocus);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Rentrez un prénom";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        focusNode: _lastNameFocus,
                        decoration: InputDecoration(labelText: 'Nom'),
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Rentrez un prénom";
                          }
                          return null;
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.save),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _form.currentState.validate();
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future takePicture() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  bool get wantKeepAlive => true;
}
