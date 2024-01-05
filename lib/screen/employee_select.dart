import 'package:basic_flutter/screen/homepage.dart';
import 'package:basic_flutter/screen/register_employee.dart';
import 'package:flutter/material.dart';

class employeeSelect extends StatefulWidget {
  @override
  State<employeeSelect> createState() => _employeeSelectState();
}

class _employeeSelectState extends State<employeeSelect> {
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
    'จันทบุรี',
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
    'ระยอง',
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
    return Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return const employee();
                })));
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              )),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              width: 374,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: DropdownButton(
                underline: Container(),
                hint: const Text('เลือกประเภทอาชีพ'),
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
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              width: 374,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: DropdownButton(
                underline: Container(),
                hint: const Text(
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
            SizedBox(
              width: 100,
              child: ElevatedButton(
                child: const Text("ถัดไป", style: TextStyle(fontSize: 15)), //ส่งให้firebase
                  onPressed: () async {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return const login();
                      }));
                  }
              )
            )
          ],
        ));
  }
}
