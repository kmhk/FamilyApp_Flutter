class ProductItem {
  String foodName;
  List<String> imageList;
  List<String> videoList;
  String imageUrl;
  String departmentName;
  String description;
  String status;
  int calories;
  String size;
  String sizeUnit;
  int price;
  int discount;
  int deposit;
  int deliveryCost;
  bool readyForPickUp;
  String preparationTime;
  int preparationFrom;
  int preparationTo;
  bool intendedForVegetarians;
  String familyId;
  String creationDate;
  String rating;
  int noOfOrder;
  int noOfView;
  int noOfShare;
  int noOfRating;
  String docId;

  ProductItem({
    this.foodName,
    this.imageList,
    this.imageUrl,
    this.videoList,
    this.departmentName,
    this.description,
    this.status,
    this.calories,
    this.size,
    this.sizeUnit,
    this.price,
    this.discount,
    this.deposit,
    this.deliveryCost,
    this.readyForPickUp,
    this.preparationTime,
    this.preparationFrom,
    this.preparationTo,
    this.intendedForVegetarians,
    this.familyId,
    this.creationDate,
    this.rating,
    this.noOfOrder,
    this.noOfView,
    this.noOfShare,
    this.noOfRating,
    this.docId
  });

  factory ProductItem.fromJson(Map<String, dynamic> data, String id) => ProductItem(
      foodName: data['foodName'],
      imageList: List<String>.from(data["imageList"].map((x) => x)),
      videoList: List<String>.from(data["videoList"].map((x) => x)),
      imageUrl: data['imageUrl'],
      departmentName: data['departmentName'],
      description: data['description'],
      status: data['status'],
      calories: data['calories'],
      size: data['size'],
      sizeUnit: data['sizeUnit'],
      price:data["price"],
      discount:data["discount"],
      deposit:data["deposit"],
      deliveryCost:data["deliveryCost"],
      readyForPickUp:data["readyForPickUp"],
      preparationTime:data["preparationTime"],
      preparationFrom:data["preparationFrom"],
      preparationTo:data["preparationTo"],
      intendedForVegetarians: data['intendedForVegetarians'],
      familyId: data['familyId'],
      creationDate: data['creationDate'],
      rating: data['rating'],
      noOfOrder: data['noOfOrder'],
      noOfView: data['noOfView'],
      noOfShare: data['noOfShare'],
      noOfRating: data['noOfRating'],
      docId: id,
  );

  Map<String, dynamic> toJson() => {
    'foodName' : foodName,
    'imageList' : imageList,
    'imageUrl' : imageUrl,

  };
}

class ProductCategoryItem {

  String departmentName;
  List<ProductItem> productList = List();

  ProductCategoryItem({
    this.departmentName,
    this.productList,
  });

}