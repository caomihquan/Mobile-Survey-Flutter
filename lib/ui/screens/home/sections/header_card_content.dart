part of '../home.dart';

class _HeaderCardContent extends StatelessWidget {
  static const double height = 582;
  void _onSelectCategory(Category category, context) {
    if (category.id == 6) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Thông báo'),
          content: const Text('Bạn có muốn đăng xuất không?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Hủy bỏ'),
            ),
            TextButton(
              onPressed: () => AppNavigator.push(category.route),
              child: const Text('Đồng ý'),
            ),
          ],
        ),
      );
      return;
    } else if (category.id == 4) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Thông báo'),
          content: const Text('Bạn có bản cập nhật mới'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Hủy bỏ'),
            ),
            TextButton(
              onPressed: () => AppNavigator.push(category.route),
              child: const Text('Cập nhật'),
            ),
          ],
        ),
      );
      return;
    }
    AppNavigator.push(category.route);
  }

  @override
  Widget build(BuildContext context) {
    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    var isDark = themeCubit.isDark;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      child: PokeballBackground(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      // Function to toggle theme
                      themeCubit.toggleTheme();
                    },
                    padding: EdgeInsets.only(
                      left: 28,
                    ),
                    icon: Icon(
                      isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
                      color: isDark ? Colors.yellow : Colors.black,
                      size: 25,
                    )),
              ),
            ),
            _buildTitle(),
            _buildCategories(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.all(28),
      alignment: Alignment.topCenter,
      child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state.EmployeeName != '') {
          return Text(state.EmployeeName);
        }
        return Container();
      }),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(28, 42, 28, 62),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        childAspectRatio: 1.7,
        mainAxisSpacing: 20,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          categories[index],
          onPress: () => _onSelectCategory(categories[index], context),
        );
      },
    );
  }
}
