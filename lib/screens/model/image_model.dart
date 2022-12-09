class ImageModel {
  ImageModel({
    this.total,
    this.totalImages,
    this.imageDetails,
  });

  int? total;
  int? totalImages;
  List<ImageDetails>? imageDetails;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        total: json["total"],
        totalImages: json["totalHits"],
        imageDetails: List<ImageDetails>.from(
            json["hits"].map((x) => ImageDetails.fromJson(x))),
      );
}

class ImageDetails {
  ImageDetails({
    this.tags,
    this.webformatUrl,
    this.largeImageUrl,
  });

  String? tags;
  String? webformatUrl;
  String? largeImageUrl;

  factory ImageDetails.fromJson(Map<String, dynamic> json) => ImageDetails(
        tags: json["tags"],
        webformatUrl: json["webformatURL"],
        largeImageUrl: json["largeImageURL"],
      );
}
