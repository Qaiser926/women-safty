// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class ContactModel{

  String? _name;
  int? _id;
  String? _number;

  ContactModel(
    this._name,this._number
  );
  ContactModel.withId(this._id,this._name,this._number);

// getter method hum private ko access k liye likte he 

  // getter 
  int get id=> _id!;
  String get name=> _name!;
  String get number=> _number!;
  

  @override
  String toString(){
    return "Contact: {id: $_id, name:$_name, number: $_number}";
  }


// setter
set number(String newNumber)=>this._number=newNumber;
set name(String newName)=> this._name=newName;


// when we push data to database then we use toMap function

Map<String , dynamic> toMap(){
  var map=new Map<String , dynamic>();
  map["id"]=this._id;
  map['number']=this._number;
  map["name"]=this._name;

  return map;
}

// when get data from data base then use fromMapObject

ContactModel.fromMapObject(Map<String, dynamic> map){
  this._id=map["id"];
  this._number=map["number"];
  this._name=map["name"];
}


}