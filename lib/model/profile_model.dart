/// id : "1203779986737006"
/// name : "Nguyễn Quang Thủ"
/// gender : "male"
/// picture : {"data":{"url":"https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=1203779986737006&height=50&width=50&ext=1623827754&hash=AeQ858F4c950oqv-4Ok"}}

class ProfileModel {
  String _id;
  String _name;
  String _gender;
  String _picture;

  String get id => _id;
  String get name => _name;
  String get gender => _gender;
  String get picture => _picture;

  ProfileModel({
      String id, 
      String name, 
      String gender, 
      String picture}){
    _id = id;
    _name = name;
    _gender = gender;
    _picture = picture;
}

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(id: json['id'],name: json["name"],gender: json["gender"],
      picture: json['picture']['data']['url']);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["gender"] = _gender;
    map["picture"] = _picture;
    return map;
  }

}