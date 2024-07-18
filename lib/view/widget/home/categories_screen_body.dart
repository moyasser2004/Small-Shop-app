import 'package:flutter/material.dart';

import '../../../model/remote/home/Api_categoryData.dart';



class CategoriesScreenBody extends StatelessWidget {
  final CategoriesModel categoriesModel;

  const CategoriesScreenBody(
      {Key? key, required this.categoriesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppBar(
          title: const Text(
            "Categories",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Container(
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.category_outlined,
                  color: Colors.black,
                  size: 30,
                ))
          ],
        ),
        ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, i) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Image(
                          image: NetworkImage(categoriesModel
                              .dat.data[i].image.isNotEmpty
                              ? categoriesModel
                              .dat
                              .data[i]
                              .image
                              : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSri6oIiGSbLfx9TDj3e4uqBHgetk8jVyZvdQ&usqp=CAU"),
                          height: 100,
                          width: 100,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${categoriesModel.dat.data[i].id}",
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Spacer(),
                        Text(
                          categoriesModel.dat.data[i].name,
                          style: const TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, i) {
            return Divider(
              height: 2,
              thickness: 1,
              color: Colors.grey[400],
            );
          },
          itemCount: categoriesModel.dat.data.length,
        ),
      ],
    );
  }
}