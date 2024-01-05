
import 'dart:async';
import 'package:http/http.dart';


class ApiUrl{
  // ค่าตัวแปรสำหรับใช้งานจริง
  //static const String liveBaseURL = "https://d7b4-223-24-60-131.ap.ngrok.io/";
  // กรณีทดสอบที่ localhost android ใช้ค่าตามนี้ได้เลย เปลี่ยน path และ port เท่านั้น
  //static const String localBaseURL = "https://10.0.2.2:443/demo/api";
 
  //static const String baseURL = localBaseURL; // ทดสอบที่เครื่องใช้ค่านี้
  //static const String login = baseURL + "/user/authen";
  //static const String register = baseURL + "/user/create";
  static const urlPrefix = 'https://jsonplaceholder.typicode.com';

  static Future<void> makeGetRequest() async{
    final url = Uri.parse('$urlPrefix/posts');
    Response response = await get(url);
    print('status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('body: ${response.body}');


    //try{
    //var uri = Uri.parse("https://jsonplaceholder.typicode.com/albums");
    //final response = await http.get(uri);

    //if(response.statusCode == 200){
    //  return jsonDecode(response.body);
    //}
    //else{
    //  throw Exception("Failed to load album");
    //}
    //}
    //catch(e){
    //  print(e);
    //  throw e;
    //}
    //Map<String,dynamic> map = json.decode(response.body);
    //MessageDogsDao msg = MessageDogsDao.fromJson(map);
    //print("URL image = ${msg.message}");
    //return msg;
    //Http.get(url.toString()).then((response){
    //  print("Response status: ${response.body}");
    //}//);
  }
}

