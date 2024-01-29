import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Cubit/cubit_homepages.dart';

import '../ApiData/Api_homData.dart';
import 'const.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state is HomeDataSuccess && state is! HomeDataLoading
              ? screen(HomeCubit.get(context).model, context)
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }

  Widget screen(HomeModel model, BuildContext context) {

    data = model.data.products;
    double mg = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: mg * (model.data.products.length - (model.data.products.length) / 1.23),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 40, 20, 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFF605F5F), width: 2),
                  right: BorderSide(color: Color(0xFF605F5F), width: 2),
                  left: BorderSide(color: Color(0xFF605F5F), width: 2),
                ),
                color: Colors.white,
              ),
              child: CarouselSlider(
                  items: data.map(
                        (e) => Image(
                          image: e.image != null
                              ? NetworkImage("${e.image}")
                              : const NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSri6oIiGSbLfx9TDj3e4uqBHgetk8jVyZvdQ&usqp=CAU"),
                          height: 300,
                        ),
                      ).toList(),
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  )
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.grey[300],
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 1.45,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.white,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Image(
                                image: NetworkImage(data[index].image !=
                                    null
                                    ? '${data[index].image}'
                                    : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSri6oIiGSbLfx9TDj3e4uqBHgetk8jVyZvdQ&usqp=CAU"),
                                height: 150,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${data[index].name ?? ""}",
                                style: const TextStyle(
                                  height: 1.4,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              padding: const EdgeInsets.all(7.0),
                              child: Row(
                                children: [
                                  const Text(
                                    "\$",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.red),
                                  ),
                                  Text(
                                    " ${data[index].price.round() ?? ""}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Spacer(),
                                  data[index].discount != 0
                                      ? Text(
                                    "\$ ${data[index].old_price.round() ?? ""}",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        decoration: TextDecoration
                                            .lineThrough,
                                        color: Colors.grey),
                                  )
                                      : Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        data[index].old_price - data[index].price! != 0
                            ? Container(
                          padding: const EdgeInsets.all(3),
                          child: const Text(
                            "Discount",
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                            : Container()
                      ],
                    ),
                  );
                },
                itemCount: data.length,

              ),
            )),
          ],
        ),
      ),
    );
  }
}
