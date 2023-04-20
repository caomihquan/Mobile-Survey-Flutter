import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/domain/entities/category.dart';
import 'package:pokedex/routes.dart';

const List<Category> categories = [
  Category(id: 1, name: 'Phỏng vấn', color: AppColors.teal, route: Routes.surveyprogress),
  Category(id: 2, name: 'Đồng bộ', color: AppColors.red, route: Routes.pokedex),
  Category(id: 3, name: 'Tiến độ', color: AppColors.blue, route: Routes.progress),
  Category(id: 4, name: 'Cập nhật', color: AppColors.yellow, route: Routes.items),
  Category(id: 5, name: 'Đổi Mật Khẩu', color: AppColors.purple, route: Routes.changepassword),
  Category(id: 6, name: 'Đăng Xuất', color: AppColors.brown, route: Routes.login),
];
