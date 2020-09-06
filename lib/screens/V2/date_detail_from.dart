import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
class Model {
  String firstName;
  String lastName;
  String email;
  String password;
  Model({this.firstName, this.lastName, this.email, this.password});
}
class Result extends StatelessWidget {
  Model model;
  Result({this.model});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: Text('Successful')),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(model.firstName, style: TextStyle(fontSize: 22)),
            Text(model.lastName, style: TextStyle(fontSize: 22)),
            Text(model.email, style: TextStyle(fontSize: 22)),
            Text(model.password, style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    ));
  }
}
class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}
class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model();
  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'First Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.firstName = value;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Last Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.lastName = value;
                    },
                  ),
                )
              ],
            ),
          ),
          MyTextFormField(
            hintText: 'Email',
            isEmail: true,
            validator: (String value) {
              if (!validator.isEmail(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            onSaved: (String value) {
              model.email = value;
            },
          ),
          MyTextFormField(
            hintText: 'Password',
            isPassword: true,
            validator: (String value) {
              if (value.length < 7) {
                return 'Password should be minimum 7 characters';
              }
              _formKey.currentState.save();
              return null;
            },
            onSaved: (String value) {
              model.password = value;
            },
          ),
          MyTextFormField(
            hintText: 'Confirm Password',
            isPassword: true,
            validator: (String value) {
              if (value.length < 7) {
                return 'Password should be minimum 7 characters';
              } else if (model.password != null && value != model.password) {
                print(value);
                print(model.password);
                return 'Password not matched';
              }
              return null;
            },
          ),
          RaisedButton(
            color: Colors.blueAccent,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(model: this.model)));
              }
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}