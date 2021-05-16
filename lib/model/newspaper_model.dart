/// link : "sdfsdfsfdsfsdfsd"
/// title : "mdkfmsdfkds"

class NewspaperModel {
  String _link;
  String _title;

  String get link => _link;
  String get title => _title;

  NewspaperModel({
      String link, 
      String title}){
    _link = link;
    _title = title;
}

  NewspaperModel.fromJson(dynamic json) {
    _link = json["link"];
    _title = json["title"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["link"] = _link;
    map["title"] = _title;
    return map;
  }

}