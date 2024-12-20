class Post {
  final int? id;
  final String? title;
  final String? body;
  final String? imageUrl;  // Thêm trường imageUrl

  Post({
    required this.id,
    required this.title,
    required this.body,
    this.imageUrl,  // Khởi tạo trường imageUrl
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "imageUrl": imageUrl,  // Thêm imageUrl vào JSON
  };

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"],
      title: json["title"],
      body: json["body"],
      imageUrl: json["imageUrl"],  // Đảm bảo bạn lấy imageUrl từ JSON
    );
  }
}
