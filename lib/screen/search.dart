// ignore_for_file: prefer_const_constructors
import 'package:basic_flutter/screen/homepage.dart';
import 'package:flutter/material.dart';

import '../widget/bottomBar.dart';
//import 'FavScreens.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? valuecareer;
  String? valueprovince;
  List<String> career = [
    'ช่างไฟ',
    'ช่างปะปา',
    'ช่างแอร์',
    'คนทำสะอาด',
    'ทำสวน'
  ];
  List<String> province = [
    'กรุงเทพมหานคร',
    'กระบี่',
    'กาญจนบุรี',
    'กาฬสินธุ์',
    'กำแพงเพชร',
    'ขอนแก่น',
    '	จันทบุรี',
    'ฉะเชิงเทรา',
    'ชลบุรี',
    'ชัยนาท',
    'ชัยภูมิ',
    'ชุมพร',
    'เชียงราย',
    'เชียงใหม่',
    'ตรัง',
    'ตราด',
    'ตาก',
    'นครนายก',
    'นครปฐม',
    'นครพนม',
    'นครราชสีมา',
    'นครศรีธรรมราช',
    'นครสวรรค์',
    'นนทบุรี',
    'นราธิวาส',
    'น่าน',
    'บึงกาฬ',
    'บุรีรัมย์',
    'ปทุมธานี',
    'ปราจีนบุรี',
    'ปัตตานี',
    'พระนครศรีอยุธยา',
    'พะเยา',
    'พังงา',
    'พัทลุง',
    'พิจิตร',
    'พิษณุโลก',
    'เพชรบุรี',
    'เพชรบูรณ์',
    'แพร่',
    'ภูเก็ต',
    'มหาสารคาม',
    'มุกดาหาร',
    'แม่ฮ่องสอน',
    'ยโสธร',
    'ยะลา',
    'ร้อยเอ็ด',
    'ระนอง',
    '	ระยอง',
    'ราชบุรี',
    'ลพบุรี',
    'ลำปาง',
    'ลำพูน',
    'เลย',
    'ศรีสะเกษ',
    'สกลนคร',
    'สงขลา',
    'สตูล',
    'สมุทรปราการ',
    'สมุทรสงคราม',
    'สมุทรสาคร',
    'สระแก้ว',
    'สระบุรี',
    'สิงห์บุรี',
    'สุโขทัย',
    'สุพรรณบุรี',
    'สุราษฎร์ธานี',
    'สุรินทร์',
    'หนองคาย',
    'หนองบัวลำภู',
    'อ่างทอง',
    'อำนาจเจริญ',
    'อุดรธานี',
    'อุตรดิตถ์',
    'อุทัยธานี',
    'อุบลราชธานี',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment(0.43, 0.85),
          colors: [
            Color.fromRGBO(120, 255, 215, 1),
            Color.fromRGBO(101, 234, 204, 1),
            Color.fromRGBO(0, 122, 145, 1)
          ],
          //stops: [0.1, 0.56, 1]
        )),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) {
                    return login();
                  })));
                },
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  width: 374,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: DropdownButton(
                    underline: Container(),
                    hint: Text('เลือกประเภทอาชีพ'),
                    value: valuecareer,
                    onChanged: (value) {
                      setState(() {
                        valuecareer = value.toString();
                      });
                    },
                    items: career.map((item) {
                      return DropdownMenuItem<String>(
                          value: item,
                          child: SizedBox(
                              child: Center(
                            child: Text(item),
                          )));
                    }).toList(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                  width: 374,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: DropdownButton(
                    underline: Container(),
                    hint: Text(
                      ' เลือกจังหวัด',
                      textAlign: TextAlign.start,
                    ),
                    value: valueprovince,
                    onChanged: (value) {
                      setState(() {
                        valueprovince = value.toString();
                      });
                    },
                    items: province.map((option) {
                      return DropdownMenuItem(value: option, child: Text(option));
                    }).toList(),
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: Text(
                      'ค้นหา',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onTap: () {
                    //ใส่ข้อมูลที่หามา
                    print('click');
                  },
                )
              ],
            ),
            //bottomNavigationBar: BottomBar(),
            ),
      ),
    );
  }
}
