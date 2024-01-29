import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/Cubit/cubit_homepages.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is CategoriesDataSuccess && state is! CategoriesDataLoading
            ? Scaffold(
                appBar: AppBar(
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
                body: ListView.separated(
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
                                  image: NetworkImage(HomeCubit.get(context)
                                          .categoriesModel
                                          .dat
                                          .data[i]
                                          .image
                                          .isNotEmpty
                                      ? HomeCubit.get(context)
                                          .categoriesModel
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
                              "${HomeCubit.get(context).categoriesModel.dat.data[i].id}",
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Spacer(),
                                Text(
                                  HomeCubit.get(context)
                                          .categoriesModel
                                          .dat
                                          .data[i]
                                          .name ??
                                      "",
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
                  itemCount:
                      HomeCubit.get(context).categoriesModel.dat.data.length,
                ),
              )
            : const Center(
                child: Center(child: CircularProgressIndicator()),
              );
      },
    );
  }
}
