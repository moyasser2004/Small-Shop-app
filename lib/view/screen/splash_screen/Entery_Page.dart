import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controller/cubit/splash/enter_cubit.dart';
import '../../../controller/state/splash/enter_states.dart';
import '../../../core/class/sharePrefrences.dart';
import '../../../core/const/app_image_name.dart';
import '../../../core/const/app_route_name.dart';
import '../../../model/local/enter_screen_model.dart';
import '../../widget/splash/enter_page_item.dart';

class EnterPage extends StatelessWidget {
  const EnterPage({Key? key}) : super(key: key);

  static List<Widget> pages = [
    EnterPageItem(
        enterScreenModel: EnterScreenModel(
            image: AppImageName.imageOne,
            title: "Enjoy free shipping on all orders",
            content: " Hot discounts")),
    EnterPageItem(
        enterScreenModel: EnterScreenModel(
            image: AppImageName.imageTwo,
            title: "Start your shopping adventure today!",
            content: " Free shipping")),
    EnterPageItem(
        enterScreenModel: EnterScreenModel(
            image: AppImageName.imageThree,
            title: "Get the most out of your shopping experience ",
            content: " Shop by category")),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => EnterCubit(),
      child: BlocBuilder<EnterCubit, EnterStates>(
          builder: (context, state) {
        EnterCubit controller = EnterCubit.get(context);
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (value) {
                    controller.changeIndex(value);
                  },
                  controller: controller.pageController,
                  itemBuilder: (context, i) {
                    return pages[controller.currentIndex];
                  },
                  itemCount: pages.length,
                ),
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: controller.pageController,
                    count: pages.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.deepOrange,
                      dotColor: Colors.yellow,
                      dotHeight: 15,
                      dotWidth: 15,
                      spacing: 10,
                      expansionFactor: 5,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (controller.currentIndex ==
                          pages.length - 1) {
                        bool? value = SharedPreferencesHelper.getBool(
                            key: "key");
                        if (value == true) {
                          Navigator.of(context).pushReplacementNamed(
                              AppRouteName.homeScreen);
                        } else {
                          Navigator.of(context).pushReplacementNamed(
                              AppRouteName.logIn);
                        }
                      }
                      controller.pageController.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastEaseInToSlowEaseOut);
                    },
                    child: const Icon(Icons.arrow_forward),
                  ),
                ],
              )
            ],
          ),
        ));
      }),
    );
  }
}
