class ProductModel {
  final String id;
  final String title;
  final String category;
  final String rating;
  final String imagePath;
  final String description;
  final List<String> steps;

  ProductModel({
    required this.id,
    required this.title,
    required this.category,
    required this.rating,
    required this.imagePath,
    required this.description,
    this.steps = const [],
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final stepsData = json['steps'];
    return ProductModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      category: json['category'] as String? ?? '',
      rating: json['rating'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      description: json['description'] as String? ?? '',
      steps: stepsData is List ? List<String>.from(stepsData) : const [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'rating': rating,
      'imagePath': imagePath,
      'description': description,
      'steps': steps,
    };
  }

  ProductModel copyWith({
    String? id,
    String? title,
    String? category,
    String? rating,
    String? imagePath,
    String? description,
    List<String>? steps,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      imagePath: imagePath ?? this.imagePath,
      description: description ?? this.description,
      steps: steps ?? this.steps,
    );
  }
}
