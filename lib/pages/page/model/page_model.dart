/// data : [{"access_token":"EABPMEXvnzv4BAGEJ09O6WGLGNNGdibXKZAkQMyiydjvNb7zlAgriWW9n9ddgNuQjpfhDuAZAVpUafyctQCGkNf84rDIZBWBQo9mVt1aQces1WgTZBiVOJzZA6rqv6auoZC9V2WQHM1RY3LGpSsn8MD9lZCrPVdcQSceIRkdW96jx1IqVaJlikYEZB9nRiWSOs8ZADLoC0iQeNWQZDZD","category":"Cửa hàng quần áo nữ","name":"WinX","id":"292440411314960"}]

class PageModel {
  List<PageMD> _data;

  List<PageMD> get data => _data;

  PageModel({
      List<PageMD> data}){
    _data = data;
}
  factory PageModel.fromJson(Map<String, dynamic> json) {
    return PageModel(
      data: json['data'] != null ? (json['data'] as List).map((i) => PageMD.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// access_token : "EABPMEXvnzv4BAGEJ09O6WGLGNNGdibXKZAkQMyiydjvNb7zlAgriWW9n9ddgNuQjpfhDuAZAVpUafyctQCGkNf84rDIZBWBQo9mVt1aQces1WgTZBiVOJzZA6rqv6auoZC9V2WQHM1RY3LGpSsn8MD9lZCrPVdcQSceIRkdW96jx1IqVaJlikYEZB9nRiWSOs8ZADLoC0iQeNWQZDZD"
/// category : "Cửa hàng quần áo nữ"
/// name : "WinX"
/// id : "292440411314960"

class PageMD {
  String _accessToken;
  String _category;
  String _name;
  String _id;

  String get accessToken => _accessToken;
  String get category => _category;
  String get name => _name;
  String get id => _id;

  PageMD({
      String accessToken, 
      String category, 
      String name, 
      String id}){
    _accessToken = accessToken;
    _category = category;
    _name = name;
    _id = id;
}

  PageMD.fromJson(dynamic json) {
    _accessToken = json["access_token"];
    _category = json["category"];
    _name = json["name"];
    _id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["access_token"] = _accessToken;
    map["category"] = _category;
    map["name"] = _name;
    map["id"] = _id;
    return map;
  }

}