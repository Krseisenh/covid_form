import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_form/firebase_options.dart';
import 'package:covid_form/report.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CovidForm());
}

class CovidForm extends StatelessWidget {
  const CovidForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _conFirst = TextEditingController();
  final TextEditingController _conLast = TextEditingController();
  final TextEditingController _conNick = TextEditingController();
  final TextEditingController _conAge = TextEditingController();

  String? firstname;
  String? lastname;
  String? nickname;
  String? gender;
  int? age;

  String? selectedGender;

  bool _isOption1 = false;
  bool _isOption2 = false;
  bool _isOption3 = false;
  bool _isOption4 = false;

  List<String> selectedOptions = [];

  void _onRadioButtonChange(String? value) {
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
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
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
                    String? message;
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
                    String? message;
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
                    String? message;
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
                  onSaved: (String? value) => setState(() {
                    age = int.parse(value!);
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
                      onChanged: (String? value) => _onRadioButtonChange(value),
                    ),
                    Text('หญิง'),
                    Radio(
                      key: Key('female-tag'),
                      value: 'Female',
                      groupValue: selectedGender,
                      onChanged: (String? value) => _onRadioButtonChange(value),
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
                      onChanged: (bool? val) {
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
                      onChanged: (bool? val) {
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
                      onChanged: (bool? val) {
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
                      onChanged: (bool? val) {
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
                ElevatedButton(
                  key: Key('save-button-tag'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      await FirebaseFirestore.instance
                          .collection('reports')
                          .add(
                            Report(
                              firstname: firstname,
                              lastname: lastname,
                              nickname: nickname,
                              age: age,
                              gender: selectedGender,
                              syntoms: selectedOptions,
                            ).toJson(),
                          )
                          .then((report) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ReportPage(),
                            settings: RouteSettings(arguments: {
                              "id": report.id,
                            }),
                          ),
                        );
                      }).whenComplete(() {
                        selectedGender = null;
                        _conFirst.clear();
                        _conLast.clear();
                        _conNick.clear();
                        _conAge.clear();
                        _isOption1 = false;
                        _isOption2 = false;
                        _isOption3 = false;
                        _isOption4 = false;

                        selectedOptions.clear();

                        setState(() {});
                      });
                    }
                  },
                  child: Text('บันทึกข้อมูล'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
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
            FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('reports')
                  .doc(data!['id'])
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (snapshot.hasError) {
                  return Placeholder();
                }

                DocumentSnapshot? doc = snapshot.data as DocumentSnapshot?;
                print("=========> ${doc?.data()}");
                Report report =
                    Report.fromJson(doc?.data() as Map<String, dynamic>);
                return covidDetect(
                  firstname: report.firstname,
                  lastname: report.lastname,
                  nickname: report.nickname,
                  age: report.age,
                  symtopms: report.syntoms,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('confirm-button-tag'),
        onPressed: () async => await FirebaseFirestore.instance.collection('reports').doc(data['id'])
        // .delete()
        .update({
          "updated_at": Timestamp.now(),
        }).whenComplete(() {
          
        }),
        child: Text('ยืนยัน'),
      ),
    );
  }

  List<Widget> getSymtomList({List? symtopms}) {
    List<Widget> _list = [];

    for (var symtom in symtopms ?? []) {
      _list.add(Text(symtom));
    }

    return _list;
  }

  Widget covidDetect({
    String? firstname,
    String? lastname,
    String? nickname,
    int? age,
    String? gender,
    List? symtopms = const [],
  }) {
    return SizedBox(
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
            Expanded(
              flex: 2,
              child: Column(
                children: getSymtomList(symtopms: symtopms),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
