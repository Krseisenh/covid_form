import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  String firstname;
  String lastname;
  String nickname;
  int age;

  String selectedGender;

  bool _isOption1 = false;
  bool _isOption2 = false;
  bool _isOption3 = false;

  List<String> selectedOptions = [];

  void _onRadioButtonChange(String value) {
    setState(() {
      selectedGender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Form'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text('Firstname'),
                  TextFormField(
                    validator: (value) {
                      String message;
                      if (value == null || value.isEmpty) {
                        message = 'ต้องการข้อมูล';
                      }
                      return message;
                    },
                    onSaved: (value) => setState(() {
                      firstname = value;
                    }),
                  ),
                  Text('Lastname'),
                  TextFormField(
                    validator: (value) {
                      String message;
                      if (value == null || value.isEmpty) {
                        message = 'ต้องการข้อมูล';
                      }
                      return message;
                    },
                    onSaved: (value) => setState(() {
                      lastname = value;
                    }),
                  ),
                  Text('nickname'),
                  TextFormField(
                    validator: (value) {
                      String message;
                      if (value == null || value.isEmpty) {
                        message = 'ต้องการข้อมูล';
                      }
                      return message;
                    },
                    onSaved: (value) => setState(() {
                      nickname = value;
                    }),
                  ),

                  /// fill age
                  Text('Age'),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onSaved: (value) => setState(() {
                      age = int.parse(value);
                    }),
                  ),
                  Text('Gender'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Male'),
                      Radio(
                        value: 'Male',
                        groupValue: selectedGender,
                        onChanged: (value) => _onRadioButtonChange(value),
                      ),
                      Text('Female'),
                      Radio(
                        value: 'Female',
                        groupValue: selectedGender,
                        onChanged: (value) => _onRadioButtonChange(value),
                      ),
                    ],
                  ),
                  Text('Symtomps'),
                  Column(
                    children: [
                      CheckboxListTile(
                        title: Text('ไอ'),
                        value: _isOption1,
                        onChanged: (val) {
                          setState(() {
                            _isOption1 = !_isOption1;
                            if (_isOption1) {
                              selectedOptions.add('ไอ');
                            } else {
                              selectedOptions.remove('ไอ');
                            }
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('เจ็บคอ'),
                        value: _isOption2,
                        onChanged: (val) {
                          setState(() {
                            _isOption2 = !_isOption2;
                            if (_isOption2) {
                              selectedOptions.add('เจ็บคอ');
                            } else {
                              selectedOptions.remove('เจ็บคอ');
                            }
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('มีไข้'),
                        value: _isOption3,
                        onChanged: (val) {
                          setState(() {
                            _isOption3 = !_isOption3;
                            if (_isOption3) {
                              selectedOptions.add('มีไข้');
                            } else {
                              selectedOptions.remove('มีไข้');
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Page1(
                              firstname: firstname,
                              lastname: lastname,
                              nickname: nickname,
                              age: age,
                              gender: selectedGender,
                              symtopms: selectedOptions,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text('Save'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final String firstname;
  final String lastname;
  final String nickname;
  final String gender;
  final int age;
  final List<String> symtopms;

  final String description = 'Hello World';

  Page1({
    this.firstname,
    this.lastname,
    this.nickname,
    this.gender,
    this.symtopms,
    this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://s3.xopic.de/openwho-public/channels/7fSc4JEBeO9H0P4b8d1Cfq/logo_v1.png',
            ),
            covidDetect(symtopms),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Page2(
              description: description,
            ),
          ),
        ),
        child: Text('ยืนยัน'),
      ),
    );
  }

  Widget covidDetect(List<String> symtopms) {
    if (symtopms.length == 3) {
      return Container(
        width: 300,
        height: 300,
        child: Center(
          child: Text(
            'คุณ $firstname $lastname ($nickname), อายุ $age\n คุณเป็นโควิท',
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return Container(
        width: 300,
        height: 300,
        child: Center(
          child: Text(
            'คุณ $firstname $lastname ($nickname), อายุ $age\n คุณไม่เป็นโควิท',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}

class Page2 extends StatelessWidget {
  final String description;

  const Page2({
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(description),
            ),
            RaisedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
