class ItemModel {
  int? id;
  String? description;
  String? title;
  int? count;
  int? amount;
  String? image;

  ItemModel({
    this.id,
    this.description,
    this.title,
    this.count,
    this.amount,
    this.image,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    title = json['title'];
    count = json['count'];
    amount = json['amount'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['title'] = title;
    data['count'] = count;
    data['amount'] = amount;
    data['image'] = image;
    return data;
  }
}
