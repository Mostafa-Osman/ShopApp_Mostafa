import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy_flutter/layout/layout_cubit/cubit.dart';
import 'package:udemy_flutter/route/route_constants.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/components/navigate.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

import 'layout_cubit/states.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: HexColor('#af4537'),
            title: CustomText(
              text: 'Home Page',
            ),
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.grey[200],
                )),
            actions: [
              IconButton(
                onPressed: () => navigateTo(context, RouteConstant.myBagRoute),
                icon: Icon(
                  Icons.add_shopping_cart,
                  size: 30,
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
          body: cubit.bottomNavScreen[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            index: 2,
            height: 50,
            backgroundColor: Color(0xFFFFFFFF),
            color: HexColor('#af4537'),
            buttonBackgroundColor: mainColor,
            items: cubit.bottomNavIcons,
            onTap: (index) => cubit.changeCurrentIndex(index),
          ),
        );
      },
    );
  }
}
