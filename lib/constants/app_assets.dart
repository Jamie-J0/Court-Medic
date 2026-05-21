class AppAssets {
  // Đường dẫn thư mục gốc chứa asset (Cấu hình tương ứng trong pubspec.yaml)
  static const String _imagesPath = 'assets/images/';
  static const String _iconsPath = 'assets/icons/';

  // --- 1. Hình ảnh minh họa & Giao diện chính (Images / Illustrations) ---
  static const String imgLogo = '${_imagesPath}court_medic_logo.png'; // Logo chữ thập xanh lá + băng cá nhân
  static const String imgBackgroundHome = '${_imagesPath}bg_home_pink.png'; // Nền hồng phía trên màn hình Home
  static const String imgFirstAidKit = '${_imagesPath}first_aid_kit.png'; // Hộp sơ cứu 3D ở màn hình Preparation

  // --- 2. Hình ảnh chấn thương (Injury Images) ---
  static const String imgSkinWound = '${_imagesPath}skin_wound.png';
  static const String imgBruise = '${_imagesPath}bruise.png';
  static const String imgCramp = '${_imagesPath}cramp.png';
  static const String imgTornToenail = '${_imagesPath}torn_toenail.png';

  // --- 3. Hình ảnh danh mục sản phẩm (Product Images) ---
  static const String imgProductBandages = '${_imagesPath}product_bandages.png';
  static const String imgProductCotton = '${_imagesPath}product_cotton.png';
  static const String imgProductPovidone = '${_imagesPath}product_povidone.png';
  static const String imgProductElasticBandage = '${_imagesPath}product_elastic_bandage.png';

  // --- 4. Biểu tượng / Icon chức năng (Icons) ---
  static const String icSearch = '${_iconsPath}ic_search.png'; // Kính lúp ô tìm kiếm
  static const String icArrowBack = '${_iconsPath}ic_arrow_back.png'; // Mũi tên quay lại góc trái
  static const String icArrowRight = '${_iconsPath}ic_arrow_right.png'; // Mũi tên chỉ sang phải ở Setting
  
  // Icon mạng xã hội / Đăng nhập bên thứ 3
  static const String icGoogle = '${_iconsPath}ic_google.png';
  static const String icApple = '${_iconsPath}ic_apple.png';

  // Icon vòng tròn danh mục ở Home
  static const String icCategoryInjuries = '${_iconsPath}ic_cat_injuries.png'; // Icon xịt thuốc/bôi thuốc chấn thương
  static const String icCategoryPreparation = '${_iconsPath}ic_cat_preparation.png'; // Icon quấn băng cổ tay

  // Icon thanh điều hướng phía dưới (Bottom Navigation Bar)
  static const String icNavHome = '${_iconsPath}ic_nav_home.png';
  static const String icNavNotification = '${_iconsPath}ic_nav_notification.png';
  static const String icNavProfile = '${_iconsPath}ic_nav_profile.png';

  // Icon trong trang cài đặt (Setting)
  static const String icSettingGear = '${_iconsPath}ic_setting_gear.png'; // Bánh răng màu xanh dương/xanh lá nhạt
  static const String icLogout = '${_iconsPath}ic_logout.png'; // Icon đăng xuất màu xanh lá
}