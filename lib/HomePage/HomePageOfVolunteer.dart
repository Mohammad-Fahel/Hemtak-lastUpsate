import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hemtak_app/HomePage/insideEvent.dart';
import 'package:hemtak_app/mahmoud/About.dart';
import 'package:hemtak_app/mahmoud/CodeRedeemingPage.dart';
import 'package:hemtak_app/mahmoud/Setting.dart';
import 'package:hemtak_app/mahmoud/Suggest.dart';
import 'package:hemtak_app/ui/welcomePage.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class HomePageVolunteer extends StatefulWidget {
  final String header;

  HomePageVolunteer({Key key, this.header}) : super(key: key);

  @override
  _HomePageVolunteerState createState() => _HomePageVolunteerState();
}

class _HomePageVolunteerState extends State<HomePageVolunteer> {
  Widget _eventCard() {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => InsideEvent())),
      child: Container(
        height: 110,
        width: (MediaQuery.of(context).size.width) - 30,
        child: ListView(
          primary: false,
          children: <Widget>[
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2, 4),
                        blurRadius: 10,
                        spreadRadius: 3)
                  ],
                  color: Colors.white),
              child: Row(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 10),
                  Image.asset(
                    "assets/images/v.png",
                    width: 75,
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "عنوان الفعالية",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "شرح عن محتوى الفعالية",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Container(height: 70, width: 1.0, color: Colors.black),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, size: 20),
                          SizedBox(width: 10),
                          Text("المكان - الحي"),
                        ],
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.date_range, size: 20),
                          SizedBox(width: 10),
                          Text("تاريخ الفعالية"),
                        ],
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.access_time_outlined, size: 20),
                          SizedBox(width: 10),
                          Text("توقيت الحدث"),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mainStatistc(String name, String point) {
    return Container(
      width: 140,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.80),
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.red[300].withOpacity(0.6),
              blurRadius: 5,
              spreadRadius: 3)
        ],
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          name,
          style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        Text(
          point,
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }

  Widget _sideMenu() {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: (MediaQuery.of(context).size.height) / 3,
          child: DrawerHeader(
            child: Column(
              children: [
                Icon(Icons.person_pin, size: 100),
                Text(
                  "اسم المتطوع",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            decoration: BoxDecoration(color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Icon(Icons.assessment),
          title: Text('إحصائيات'),
          onTap: () => {Navigator.of(context).pop()},
        ),
        ListTile(
          leading: Icon(Icons.assignment_turned_in),
          title: Text('بادر'),
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Suggest())),
        ),
        ListTile(
          leading: Icon(Icons.assignment_late),
          title: Text('عن همتك'),
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => About())),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('الإعدادات'),
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Setting())),
        ),
        ListTile(
          leading: Icon(Icons.account_balance_wallet),
          title: Text('تحصيل النقاط'),
          onTap: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => CodeRedeeming())),
        ),
        Container(
          height: 2,
          width: double.maxFinite,
          color: Colors.grey,
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('تسجيل الخروج'),
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => WelcomePage())),
        ),
      ]),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _sideMenu(),
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text("مرحبًا بك",
            style: TextStyle(color: Colors.black, fontSize: 23)),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.more_vert, color: Colors.black),onPressed: ()=> showFilterDialog(context))
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * .450,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                    image: DecorationImage(
                        image: AssetImage("assets/images/jordan3.png"),
                        fit: BoxFit.cover)),
                child: ClipRRect(
                    child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 1.5, sigmaX: 1.5),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.red[400].withOpacity(0.60),
                        child: Text(
                          "تصفح المبادرات التطوعية",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _mainStatistc("الترتيب المحلي", "المركز العاشر"),
                          _mainStatistc("النقاط المكتسبة", "٧٥ نقطة"),
                        ],
                      ),
                    ],
                  ),
                ))),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("الفعاليات المتاحة:",
                      style: TextStyle(
                          fontSize: 22.5, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            _eventCard(),
            SizedBox(height: 5),
            _eventCard(),
            SizedBox(height: 5),
            _eventCard(),
            SizedBox(height: 5),
            _eventCard(),
            SizedBox(height: 5),
            _eventCard(),
          ],
        ),
      ),
    );
  }
}


List _myActivities;
String _myActivitiesResult;
final formKey = new GlobalKey<FormState>();


Future<void> showFilterDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext build) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            actions: [
              TextButton(

                child: Text('إلغاء الفلترة',style: TextStyle(color: Colors.redAccent)),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text('تطبيق الفلترة',style: TextStyle(color: Colors.redAccent)),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                onPressed: () {
                  print('Pressed');
                },
              ),
            ],
            title: Center(
                child: Text(
                  "فلترة العناصر",
                  style: TextStyle(color: Colors.black),
                )),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 12, right: 10),
                    child: Row(
                      children: <Widget>[
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 16.0),
                        //   child: Icon(
                        //     Icons.sort,
                        //     color: Color(0xff808080),
                        //   ),
                        // ),
                        Expanded(
                          child: MultiSelectFormField(
                            autovalidate: false,
                            fillColor: Colors.white,
                            chipBackGroundColor: Colors.red[100],
                            checkBoxActiveColor: Colors.redAccent,
                            dialogShapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            title: Text("اختر من القائمة التالية الجوانب المفضلة لديك:",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w300),
                                textDirection: TextDirection.rtl),
                            dataSource: [
                              {
                                "display": "الجانب الرياضي والصحي  ",
                                "value": "الجانب الرياضي والصحي",
                              },
                              {
                                "display": "الجانب العلمي والعملي  ",
                                "value": "الجانب العلمي والعملي",
                              },
                              {
                                "display": "الجانب الوظيفي والمهاري  ",
                                "value": "الجانب الوظيفي والمهاري",
                              },
                              {
                                "display": "الجانب الإرشادي والتطوعي  ",
                                "value": "الجانب الإرشادي والتطوعي",
                              },
                              {
                                "display": "الجانب البيئي والصحي  ",
                                "value": "الجانب البيئي والصحي",
                              },
                            ],
                            
                            textField: 'display',
                            valueField: 'value',
                            okButtonLabel: 'موافق',
                            cancelButtonLabel: 'إلغاء',
                            hintWidget: Text(''),
                            initialValue: _myActivities,
                            onSaved: (value) {
                              if (value == null) return;
                              setState(() {
                                _myActivities = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      });
}
