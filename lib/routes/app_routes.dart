import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteNames {
  static const String initial = '/';
  static const String signUp = '/sign-up';
  static const String signIn = '/sign-in';

  static const String home = '/home';
  static const String notification = '/notification';
  static const String profile = '/profile';
  
  // Details
  static const String commonInjuries = '/common-injuries';
  static const String injuryDetail = '/injury-detail';
  static const String preparation = '/preparation';
}

class AppRoutes {
  // Global Navigator Key
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.initial,
    navigatorKey: _rootNavigatorKey,
    routes: [
      // First Screen: Logo + Login/Sign Up buttons
      GoRoute(
        path: RouteNames.initial,
        builder: (context, state) => const FirstScreen(),
      ),
      
      // Sign Up Screen
      GoRoute(
        path: RouteNames.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      
      // Sign In Screen
      GoRoute(
        path: RouteNames.signIn,
        builder: (context, state) => const SignInScreen(),
      ),

      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainDashboardShell(child: child);
        },
        routes: [
          GoRoute(
            path: RouteNames.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: RouteNames.notification,
            builder: (context, state) => const NotificationScreen(),
          ),
          GoRoute(
            path: RouteNames.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),

      GoRoute(
        path: RouteNames.commonInjuries,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const CommonInjuriesScreen(),
      ),
      GoRoute(
        path: RouteNames.injuryDetail,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          // Nhận dữ liệu truyền sang (Ví dụ: tên chấn thương Skin wound, Bruise, Cramp...)
          final extra = state.extra as Map<String, dynamic>? ?? {};
          return InjuryDetailScreen(
            title: extra['title'] ?? 'Injury Detail',
            rating: extra['rating'] ?? '0.0',
            imagePath: extra['imagePath'] ?? '',
          );
        },
      ),
      GoRoute(
        path: RouteNames.preparation,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PreparationScreen(),
      ),
    ],
    
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Không tìm thấy trang: ${state.error}')),
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('First Screen')));
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Sign Up Screen')));
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Sign In Screen')));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Home Screen')));
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Notification Screen (Folder Empty)')));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Profile Screen')));
}

class CommonInjuriesScreen extends StatelessWidget {
  const CommonInjuriesScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Common Injuries Screen')));
}

class InjuryDetailScreen extends StatelessWidget {
  final String title;
  final String rating;
  final String imagePath;
  const InjuryDetailScreen({super.key, required this.title, required this.rating, required this.imagePath});
  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: Text('Chi tiết: $title ($rating)')));
}

class PreparationScreen extends StatelessWidget {
  const PreparationScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Preparation Screen')));
}

// Shell quản lý Bottom Navigation Bar đồng bộ với trạng thái Route hiện tại
class MainDashboardShell extends StatelessWidget {
  final Widget child;
  const MainDashboardShell({super.key, required this.child});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(RouteNames.notification)) return 1;
    if (location.startsWith(RouteNames.profile)) return 2;
    return 0; // Mặc định là Home
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0: context.go(RouteNames.home); break;
      case 1: context.go(RouteNames.notification); break;
      case 2: context.go(RouteNames.profile); break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
        selectedItemColor: const Color(0xff3b76f6),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}