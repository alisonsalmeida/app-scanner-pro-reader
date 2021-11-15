class CreateSheet {
  String? name;
  List<String>? fields;

  CreateSheet(this.name, this.fields);

  CreateSheet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['fields'] != null) {
      fields = [];
      json['fields'].forEach((v) {
        fields?.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.fields != null) {
      data['fields'] = this.fields?.map((v) => v).toList();
    }
    return data;
  }
}
