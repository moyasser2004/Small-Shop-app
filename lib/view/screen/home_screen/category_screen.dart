import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/cubit/home/home_cubit.dart';
import '../../../controller/state/home/home_states.dart';
import '../../widget/home/categories_screen_body.dart';


class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is CategoriesDataSuccess &&
            state is! CategoriesDataLoading) {
          return CategoriesScreenBody(categoriesModel: HomeCubit.get(context).categoriesModel);
        } else {
          return const Center(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}


