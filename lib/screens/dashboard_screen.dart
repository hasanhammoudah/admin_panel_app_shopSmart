import 'package:admin_panel/models/dashboard_btn_model.dart';
import 'package:admin_panel/screens/widgets/app_bar_widget.dart';
import 'package:admin_panel/screens/widgets/dashboard_btns.dart';
import 'package:admin_panel/screens/widgets/title_text.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        imagePath: "assets/images/bag/shopping_cart.png",
        child: TitlesTextWidget(
          label: 'Shop smart',
          fontSize: 20,
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          DashBoardButtonModel.dashboardBtnList(context).length,
          (index) => DashBoardButtonsWidget(
            text: DashBoardButtonModel.dashboardBtnList(context)[index].text,
            imagePath: DashBoardButtonModel.dashboardBtnList(context)[index].imagePath,
            onPressed: DashBoardButtonModel.dashboardBtnList(context)[index].onPressed,
          ),
        ),
      ),
    );
  }
}
