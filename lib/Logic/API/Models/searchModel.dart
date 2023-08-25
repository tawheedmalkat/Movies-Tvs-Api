
class SearchModel {
  final String image ;
  final String title ;
  final String description ;

  SearchModel({
    required this.image,
    required this.title,
    required this.description
  });

  factory SearchModel.fromJSON(Map<String,dynamic> json) =>
      SearchModel(
          image: json['image'] ?? "",
          title: json['title'] ?? "",
          description: json['description'] ?? ""
      );
}