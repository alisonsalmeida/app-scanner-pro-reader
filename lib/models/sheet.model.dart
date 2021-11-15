class Sheet {
  String? sId;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? url;

  Sheet(
    this.sId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.url,
  );

  Sheet.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['url'] = this.url;
    return data;
  }
}
