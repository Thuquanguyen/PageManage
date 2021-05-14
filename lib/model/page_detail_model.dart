/// data : [{"created_time":"2020-05-08T05:37:20+0000","message":"Tưng bừng #GIẢM_50% #TẤT_CẢ_CÁC_MẶT_HÀNG cho ngày hè thêm #SÔI_ĐỘNG \n😍😍😍Chỉ còn #79K #79K 1 chiếc thôi ạ!\n😍😍😍#Đặt từ 3 áo trở lên được #FREE ngay 1 chiếc áo mệnh Giá #99K bất kỳ trên #WinX\n#Hết_dịch rồi ngại gì k #Quẩy cũng #Win_X\nEm này #vải cực #đẹp nhé mọi người SO CUTE 🥰🥰 #Freeship khi mua từ 2 áo trở lên nhé #couple nhé #hìnhthật100%\n#Đủ_Size cho các bạn từ 35-75Kg nha \nINBOX SHOP NGAY NHÉ","id":"292440411314960_654243921801272"},null]
class PageDetailModel {
  List<PostModel> _data;

  List<PostModel> get data => _data;

  PageDetailModel({
    List<PostModel> data}){
    _data = data;
  }

  factory PageDetailModel.fromJson(Map<String, dynamic> json) {
    return PageDetailModel(
      data: json['data'] != null ? (json['data'] as List).map((i) => PostModel.fromJson(i)).toList() : null,
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

/// created_time : "2020-05-08T05:37:20+0000"
/// message : "Tưng bừng #GIẢM_50% #TẤT_CẢ_CÁC_MẶT_HÀNG cho ngày hè thêm #SÔI_ĐỘNG \n😍😍😍Chỉ còn #79K #79K 1 chiếc thôi ạ!\n😍😍😍#Đặt từ 3 áo trở lên được #FREE ngay 1 chiếc áo mệnh Giá #99K bất kỳ trên #WinX\n#Hết_dịch rồi ngại gì k #Quẩy cũng #Win_X\nEm này #vải cực #đẹp nhé mọi người SO CUTE 🥰🥰 #Freeship khi mua từ 2 áo trở lên nhé #couple nhé #hìnhthật100%\n#Đủ_Size cho các bạn từ 35-75Kg nha \nINBOX SHOP NGAY NHÉ"
/// id : "292440411314960_654243921801272"
class PostModel {
  String _createdTime;
  String _message;
  String _id;

  String get createdTime => _createdTime;
  String get message => _message;
  String get id => _id;

  PostModel({
    String createdTime,
    String message,
    String id}){
    _createdTime = createdTime;
    _message = message;
    _id = id;
  }

  PostModel.fromJson(dynamic json) {
    _createdTime = json["created_time"];
    _message = json["message"];
    _id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["created_time"] = _createdTime;
    map["message"] = _message;
    map["id"] = _id;
    return map;
  }

}