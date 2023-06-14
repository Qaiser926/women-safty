// ignore_for_file: public_member_api_docs, sort_constructors_first
class ParentModel {

  String? name;
String? id;
String? email;
String? cEmail;
String? type;
  ParentModel({
    this.name,
    this.id,
    this.email,
    this.cEmail,
    this.type,
  });

  Map<String , dynamic> toJson()=>{
    "name":name,
    "id":id,
    "email":email,
    "cEmail":cEmail,
    "type":type
    
  };
}


