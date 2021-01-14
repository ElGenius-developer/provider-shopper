import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_shopper/secondScreen/catalog_widget.dart';

import '../usernames_and_passwords.dart';

final _formKey = GlobalKey<FormState>();
bool _isUsernameValid = false;
bool _isPasswordValid = false;

buildForm(BuildContext context) {


  return Form(
    key: _formKey,
    child: FractionallySizedBox(
        alignment: Alignment. center,
        widthFactor: .7,
        heightFactor: .7,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Welcome",
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xfFfFEB1F)),
                  ),
                  enabled: true,
                  labelText: "Username",
                  labelStyle: TextStyle(
                    fontSize: 15,
                  )),
              validator: (value) {
                if (value.isEmpty)
                  return "please Enter username";
                else {
                  if (!EmailValidator.validate(value)) return "invalid Email address";

                  if (users.contains(value)) {
                    _isUsernameValid = true;
                  } else {
                    _isUsernameValid = false;
                  }
                }

                return null;
              },
            ),
            TextFormField(
              obscureText: true,

              decoration: InputDecoration(

                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfFfFEB1F)),
                ),
                enabled: true,
                labelText: "Password",
                labelStyle: TextStyle(
                  fontSize: 15,
                ),
              ),
              validator: (value) {
                if (value.isEmpty)
                  return "please Enter the password";
                else if(_isUsernameValid==false)
                  {
                    return "Email or password is not valid ";
                  }
                else {
                  if (value.length < 8)
                    return "password is too short";
                  else {
                    if (pass.contains(value)) {
                      _isPasswordValid = true;
                    } else {
                      if(_isUsernameValid!=true)
                        {
                          return "Email or password is not valid ";
                        }
                      else {
                        _isPasswordValid = false;
                        return "incorrect password"
                            "";
                      }
                    }
                  }
                }

                return null;
              },
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 25),
              child: CupertinoButton(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Text(
                  "Enter",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                   // print('length and mail valid');
                    if (_isUsernameValid && _isPasswordValid) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) =>

                              CatalogWidget( )));
                    }
                  }
                },
                color: Color(0xfFfFEB3B),
              ),
            )
          ],
        ),
    ),
  );



}
