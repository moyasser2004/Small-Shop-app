import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Cubit/cubit_homepages.dart';





class HomePage extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context)=> HomeCubit()..getHomeData(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context,state){},
        builder: (context,state){
           HomeCubit c =HomeCubit.get(context);
          return Scaffold(
            body: Stack(
              children: [
                c.pages[c.currentIndex],
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    height: displayWidth * .155,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.1),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          c.getIndex(index);
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Stack(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == c.currentIndex
                                  ? displayWidth * .32
                                  : displayWidth * .18,
                              alignment: Alignment.center,
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                height: index == c.currentIndex ? displayWidth * .12 : 0,
                                width: index == c.currentIndex ? displayWidth * .32 : 0,
                                decoration: BoxDecoration(
                                  color: index == c.currentIndex
                                      ? Colors.blueAccent.withOpacity(.2)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == c.currentIndex
                                  ? displayWidth * .31
                                  : displayWidth * .18,
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        width:
                                        index == c.currentIndex ? displayWidth * .13 : 0,
                                      ),
                                      AnimatedOpacity(
                                        opacity: index == c.currentIndex ? 1 : 0,
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        child: Text(
                                          index == c.currentIndex
                                              ? c.listOfStrings[index]
                                              : '',
                                          style: const TextStyle(
                                            color: Colors.blueAccent,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      AnimatedContainer(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        width:
                                        index == c.currentIndex? displayWidth * .03 : 20,
                                      ),
                                      Icon(
                                        c.listOfIcons[index],
                                        size: displayWidth * .076,
                                        color: index == c.currentIndex
                                            ? const Color(0xffe84e4e)
                                            : Colors.grey[500],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          );
        },
      ),
    );
  }

}