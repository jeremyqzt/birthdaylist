import 'package:flutter/material.dart';

class BottomCardForm extends StatefulWidget {
  BottomCardForm({Key key}) : super(key: key);

  @override
  _BottomCardForm createState() => _BottomCardForm();
}

class _BottomCardForm extends State<BottomCardForm> {
  final _formKey = GlobalKey<FormState>();

  String dateVal = 'Select A Date';
  String pickedDateType = '☀';
  bool isLunar = false;

  Future selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
    );
    if (picked != null) setState(() => dateVal = picked.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: new Row(children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a first name';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                  validator: (value) {
                    return null;
                  },
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: new Row(children: [
              Expanded(
                  child: new RaisedButton(
                onPressed: selectDate,
                child: new Text(dateVal),
              )),
              Switch(
                value: isLunar,
                onChanged: (value) {
                  String newSymbol = "☀";
                  if (value) {
                    print("setting");
                    newSymbol = "🌙";
                  }
                  setState(() {
                    isLunar = value;
                    pickedDateType = newSymbol;
                  });
                },
                inactiveThumbColor: Colors.orange,
                inactiveTrackColor: Colors.orange,
                activeTrackColor: Colors.yellowAccent,
                activeColor: Colors.yellow,
              ),
              new Text(pickedDateType)
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // Process data.
                }
              },
              child: Text('Save Contact'),
            ),
          ),
        ],
      ),
    );
  }
}
