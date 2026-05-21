import 'package:flutter/material.dart';

/// 1. Khai báo Model dữ liệu Chấn thương / Sản phẩm y tế (Injury/Product Model)
/// Dựa theo các màn hình: Common Injuries, Injury Detail, Preparation
class ProductModel {
  final String id;
  final String title;       // Tên chấn thương (Skin wound, Bruise, Cramp...) hoặc dụng cụ y tế
  final String category;    // Phân loại: 'injury' hoặc 'preparation'
  final String rating;      // Đánh giá mức độ nguy hiểm hoặc độ phổ biến (ví dụ: 4.8)
  final String imagePath;   // Đường dẫn ảnh minh họa
  final String description; // Mô tả chi tiết chấn thương
  final List<String> steps; // Các bước sơ cứu (dùng cho màn hình Injuries Detail 1,2,3,4)

  ProductModel({
    required this.id,
    required this.title,
    required this.category,
    required this.rating,
    required this.imagePath,
    required this.description,
    required this.steps,
  });
}

/// 2. Lớp ProductProvider quản lý State bằng ChangeNotifier
class ProductProvider extends ChangeNotifier {
  // Danh sách gốc chứa toàn bộ dữ liệu
  List<ProductModel> _allProducts = [];
  
  // Các danh sách bộ lọc để UI dễ dàng lấy dữ liệu ra hiển thị
  List<ProductModel> _injuries = [];
  List<ProductModel> _preparations = [];
  
  // Trạng thái Loading của API
  bool _isLoading = false;
  String? _errorMessage;

  // Các Getter để UI bên ngoài chỉ đọc, không thể tự ý sửa đổi trực tiếp dữ liệu
  List<ProductModel> get injuries => _injuries;
  List<ProductModel> get preparations => _preparations;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Hàm giả lập hoặc gọi API để lấy danh sách chấn thương & đồ chuẩn bị y tế
  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Thông báo cho UI hiển thị trạng thái Loading

    try {
      // Trong thực tế, đoạn này bạn sẽ gọi qua ApiClient hoặc Repository:
      // final response = await _apiClient.get('/products');
      
      // Giả lập thời gian delay mạng 1 giây
      await Future.delayed(const Duration(seconds: 1));

      // Dữ liệu MockData chuẩn theo các màn hình thiết kế của bạn
      _allProducts = [
        // --- Danh mục Chấn thương (Common Injuries) ---
        ProductModel(
          id: 'inj_01',
          title: 'Skin wound',
          category: 'injury',
          rating: '4.8',
          imagePath: 'assets/images/skin_wound.png',
          description: 'Vết thương hở trên da xảy ra khi ngã hoặc va chạm mạnh trên sân đấu.',
          steps: [
            'Bước 1: Rửa sạch vết thương bằng nước muối sinh lý hoặc nước sạch.',
            'Bước 2: Sử dụng gạc sạch thấm nhẹ để làm khô bề mặt vết thương.',
            'Bước 3: Thoa thuốc sát trùng hoặc kem kháng sinh phù hợp.',
            'Bước 4: Băng bó lại bằng băng cá nhân hoặc gạc y tế vô trùng.'
          ],
        ),
        ProductModel(
          id: 'inj_02',
          title: 'Bruise',
          category: 'injury',
          rating: '4.5',
          imagePath: 'assets/images/bruise.png',
          description: 'Vết bầm tím xuất hiện do tổn thương các mạch máu nhỏ dưới da sau va đập.',
          steps: [
            'Bước 1: Chườm đá lạnh ngay lập tức lên vùng bị bầm trong 15-20 phút.',
            'Bước 2: Hạn chế vận động mạnh vùng cơ/khớp bị tổn thương.',
            'Bước 3: Sau 48 giờ, có thể chuyển sang chườm ấm để tan máu bầm.'
          ],
        ),
        ProductModel(
          id: 'inj_03',
          title: 'Cramp',
          category: 'injury',
          rating: '4.7',
          imagePath: 'assets/images/cramp.png',
          description: 'Chuột rút (co thắt cơ đột ngột) do cơ bắp hoạt động quá tải hoặc thiếu nước.',
          steps: [
            'Bước 1: Dừng ngay hoạt động và thả lỏng nhóm cơ đang bị chuột rút.',
            'Bước 2: Kéo giãn cơ nhẹ nhàng và giữ nguyên tư thế đến khi hết co thắt.',
            'Bước 3: Xoa bóp, massage nhẹ nhàng vùng cơ bị ảnh hưởng.',
            'Bước 4: Bổ sung nước và chất điện giải (Oresol, nước thể thao).'
          ],
        ),

        // --- Danh mục Chuẩn bị y tế (Preparation) ---
        ProductModel(
          id: 'prep_01',
          title: 'Medical Bag',
          category: 'preparation',
          rating: '5.0',
          imagePath: 'assets/images/medical_bag.png',
          description: 'Túi sơ cứu y tế chuyên dụng chứa đầy đủ các dụng cụ cơ bản cho sân thể thao.',
          steps: [],
        ),
        ProductModel(
          id: 'prep_02',
          title: 'Ice Pack',
          category: 'preparation',
          rating: '4.9',
          imagePath: 'assets/images/ice_pack.png',
          description: 'Túi chườm đá lạnh cấp tốc, vật dụng không thể thiếu để giảm sưng bầm.',
          steps: [],
        ),
      ];

      // Phân tách dữ liệu vào các danh mục tương ứng
      _injuries = _allProducts.where((p) => p.category == 'injury').toList();
      _preparations = _allProducts.where((p) => p.category == 'preparation').toList();
      
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Không thể tải dữ liệu: ${e.toString()}';
    }

    notifyListeners(); // Cập nhật lại UI sau khi đã có dữ liệu thành công hoặc lỗi
  }

  /// Tìm kiếm chấn thương theo từ khóa (Dùng cho thanh Search trên màn Home/Common Injuries)
  void searchInjuries(String query) {
    if (query.isEmpty) {
      _injuries = _allProducts.where((p) => p.category == 'injury').toList();
    } else {
      _injuries = _allProducts
          .where((p) => p.category == 'injury' && p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}