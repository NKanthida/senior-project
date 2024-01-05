//รับข้อมูลจากurlมาแสดง
class MessageDogsDao {
  late String status;
  late String message;

  MessageDogsDao({required this.status, required this.message});

  MessageDogsDao.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}