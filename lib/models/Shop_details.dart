<<<<<<< HEAD
class Shop {
  final String shopname;
  final bool shopisOpen;
  final double shopratings;
  final String shopimage;

  Shop({
    required this.shopname,
    required this.shopisOpen,
    required this.shopratings,
    required this.shopimage,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      shopname: json['name'],
      shopisOpen: json['isOpen'],
      shopratings: json['ratings'].toDouble(),
      shopimage: json['image'],
    );
  }
=======
class Shop {
  final String shopname;
  final bool shopisOpen;
  final double shopratings;
  final String shopimage;

  Shop({
    required this.shopname,
    required this.shopisOpen,
    required this.shopratings,
    required this.shopimage,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      shopname: json['name'],
      shopisOpen: json['isOpen'],
      shopratings: json['ratings'].toDouble(),
      shopimage: json['image'],
    );
  }
>>>>>>> 4e45f051bdbfbfc0f1315072d770b4825243ce9a
}