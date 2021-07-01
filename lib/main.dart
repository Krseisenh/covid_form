import 'package:flutter/material.dart';

void main() {
  runApp(CovidForm());
}

class CovidForm extends StatelessWidget {
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
  TextEditingController _conFirst = TextEditingController();
  TextEditingController _conLast = TextEditingController();
  TextEditingController _conNick = TextEditingController();
  TextEditingController _conAge = TextEditingController();

  String firstname;
  String lastname;
  String nickname;
  String gender;
  int age;

  String selectedGender;

  bool _isOption1 = false;
  bool _isOption2 = false;
  bool _isOption3 = false;
  bool _isOption4 = false;

  List<String> selectedOptions = [];

  void _onRadioButtonChange(String value) {
    setState(() {
      selectedGender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key("form-page-tag"), // added key t
      appBar: AppBar(
        title: Text('กรอกประวัติคนไข้'),
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
                  TextFormField(
                    key: Key("firstname-tag"),
                    decoration: InputDecoration(
                      labelText: 'ชื่อ',
                    ),
                    controller: _conFirst,
                    keyboardType: TextInputType.name,
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
                  TextFormField(
                    key: Key("lastname-tag"),
                    decoration: InputDecoration(
                      labelText: 'นามสกุล',
                    ),
                    controller: _conLast,
                    keyboardType: TextInputType.name,
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
                  TextFormField(
                    key: Key("nickname-tag"),
                    decoration: InputDecoration(
                      labelText: 'ชื่อเล่น',
                    ),
                    controller: _conNick,
                    keyboardType: TextInputType.name,
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
                  TextFormField(
                    key: Key("age-tag"),
                    decoration: InputDecoration(
                      labelText: 'อายุ',
                    ),
                    controller: _conAge,
                    keyboardType: TextInputType.number,
                    onSaved: (value) => setState(() {
                      age = int.parse(value);
                    }),
                  ),
                  Text('เพศ'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('ชาย'),
                      Radio(
                        key: Key('male-tag'),
                        value: 'Male',
                        groupValue: selectedGender,
                        onChanged: (value) => _onRadioButtonChange(value),
                      ),
                      Text('หญิง'),
                      Radio(
                        key: Key('female-tag'),
                        value: 'Female',
                        groupValue: selectedGender,
                        onChanged: (value) => _onRadioButtonChange(value),
                      ),
                    ],
                  ),
                  Text('อาการ'),
                  Column(
                    children: [
                      CheckboxListTile(
                        key: Key('syntom-one-tag'),
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
                        key: Key('syntom-two-tag'),
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
                        key: Key('syntom-three-tag'),
                        title: Text('ไข้'),
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
                      CheckboxListTile(
                        key: Key('syntom-four-tag'),
                        title: Text('เสมหะ'),
                        value: _isOption4,
                        onChanged: (val) {
                          setState(() {
                            _isOption4 = !_isOption4;
                            if (_isOption4) {
                              selectedOptions.add('เสมหะ');
                            } else {
                              selectedOptions.remove('เสมหะ');
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  RaisedButton(
                    key: Key('save-button-tag'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        gender = selectedGender;
                        selectedGender = null;
                        _conFirst.clear();
                        _conLast.clear();
                        _conNick.clear();
                        _conAge.clear();
                        _isOption1 = false;
                        _isOption2 = false;
                        _isOption3 = false;
                        _isOption4 = false;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReportPage(
                              firstname: firstname,
                              lastname: lastname,
                              nickname: nickname,
                              age: age,
                              gender: gender,
                              symtopms: selectedOptions,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text('บันทึกข้อมูล'),
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

class ReportPage extends StatelessWidget {
  final String firstname;
  final String lastname;
  final String nickname;
  final String gender;
  final int age;
  final List<String> symtopms;

  ReportPage({
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
      key: Key("report-page-tag"),
      appBar: AppBar(
        title: Text('รายงาน'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo_v1.png',
              key: Key('covid-image-tag'),
              width: 300,
              height: 300,
            ),
            covidDetect(symtopms),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('confirm-button-tag'),
        onPressed: () => Navigator.pop(context),
        child: Text('ยืนยัน'),
      ),
    );
  }

  Widget covidDetect(List<String> symtopms) {
    return Container(
      width: 300,
      height: 300,
      child: Center(
        child: Column(
          children: [
            Text(
              'คุณ $firstname $lastname ($nickname)',
              key: Key('report-fullname-tag'),
              textAlign: TextAlign.center,
            ),
            Text(
              'อายุ $age',
              key: Key('report-age-tag'),
              textAlign: TextAlign.center,
            ),
            Text(
              symtopms.length >= 3 ? 'คุณเป็นโควิท' : 'คุณไม่เป็นโควิท',
              key: Key('covid-confirm-tag'),
            )
          ],
        ),
      ),
    );
  }
}
