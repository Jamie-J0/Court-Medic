import 'package:dio/dio.dart';
import 'api_client.dart';

class AuthRepository {
  final ApiClient _apiClient;

  // Injection ApiClient qua Constructor để dễ quản lý và viết Unit Test sau này
  AuthRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  /// 1. Hàm xử lý Đăng Nhập bằng Email & Password
  Future<Map<String, dynamic>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        '/auth/sign-in',
        data: {
          'email': email,
          'password': password,
        },
      );

      // Giả định Server trả về dạng: { "token": "xxx", "user": { "name": "..." } }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('Đăng nhập thất bại. Vui lòng thử lại!');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'] ?? 'Lỗi kết nối hệ thống';
      throw Exception(errorMessage);
    }
  }

  /// 2. Hàm xử lý Đăng Ký Tài Khoản Mới
  Future<Map<String, dynamic>> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        '/auth/sign-up',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('Đăng ký thất bại. Vui lòng kiểm tra lại thông tin.');
      }
    } on DioException catch (e) {
      final errorMessage = e.response?.data['message'] ?? 'Lỗi kết nối hệ thống';
      throw Exception(errorMessage);
    }
  }

  /// 3. Hàm xử lý Đăng Nhập Bằng Google (Dựa theo nút "Sign in with Google" trong hình)
  Future<Map<String, dynamic>> signInWithGoogle(String googleToken) async {
    try {
      final response = await _apiClient.post(
        '/auth/google',
        data: {'id_token': googleToken},
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Không thể đăng nhập bằng Google');
    }
  }

  /// 4. Hàm xử lý Đăng Nhập Bằng Apple ID (Dựa theo nút "Sign in with Apple ID" trong hình)
  Future<Map<String, dynamic>> signInWithApple(String appleToken) async {
    try {
      final response = await _apiClient.post(
        '/auth/apple',
        data: {'apple_token': appleToken},
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Không thể đăng nhập bằng Apple');
    }
  }

  /// 5. Hàm xử lý Đăng Xuất (Dùng cho nút "Logout" ở màn Profile)
  Future<void> logout() async {
    try {
      await _apiClient.post('/auth/logout');
      // TODO: Tiến hành xóa sạch Token lưu trong thiết bị tại đây
    } catch (e) {
      throw Exception('Lỗi khi đăng xuất: $e');
    }
  }
}