// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {

  String? name;
String? id;
String? email;
String? gEmail;
String? type;
  UserModel({
    this.name,
    this.id,
    this.email,
    this.gEmail,
    this.type,
  });

  Map<String , dynamic> toJson()=>{
    "name":name,
    "id":id,
    "email":email,
    "gEmail":gEmail,
    "type":type,
  };
}




