class RestaurantModel {
  final String id;
  final String name;
  final String address;
  final String phone;
  final double ratings;
  final bool takeout;
  final String info;
  final int deliveryTime;
  final int deliveryFee;
  final String status;
  final String img;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.ratings,
    required this.takeout,
    required this.info,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.status,
    required this.img,
  });

  factory RestaurantModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      ratings: json['ratings'],
      takeout: json['takeout'],
      info: json['info'],
      deliveryTime: json['deliveryTime'],
      deliveryFee: json['deliveryFee'],
      status: json['status'],
      img: json['img'],
    );
  }
}
