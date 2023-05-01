part of '../home.dart';

class _HeaderCardContent extends StatelessWidget {
  static const double height = 582;
  void _onSelectCategory(Category category, context) {
    if (category.id == 6) {
      showAlert.show(context, '', 'Thông báo', 'Bạn có muốn đăng xuất không?',
          () => AppNavigator.push(category.route), ['Đồng ý', 'Hủy Bỏ']);
      return;
    } else if (category.id == 4) {
      showAlert.show(
          context,
          '',
          'Thông báo',
          'DTV hãy đồng bộ dữ liệu trước khi cập nhập chương trình',
          () => AppNavigator.push(category.route),
          ['Đã đồng bộ', 'Đồng bộ']);
      return;
    }
    AppNavigator.push(category.route);
  }

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {},
                    padding: EdgeInsets.only(
                      left: 28,
                    ),
                    icon: Icon(
                      //isDark ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
                      Icons.home,
                      color: Colors.white,
                      //color: isDark ? Colors.yellow : Colors.black,
                      size: 25,
                    )),
              ),
            ),
            _buildTitle(),
            Expanded(child: Center(child: _buildCategories(context)))
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
          return Column(
            children: [
              Text(
                state.EmployeeName,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 10),
              Text(
                'DTV: ' + state.EmployeeCode,
                style: TextStyle(fontSize: 18),
              ),
            ],
          );
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
        childAspectRatio: 1.4,
        mainAxisSpacing: 30,
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
