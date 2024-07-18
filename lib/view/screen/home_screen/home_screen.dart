import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/cubit/home/home_cubit.dart';
import '../../../controller/state/home/home_states.dart';
import '../../widget/home/home_screen_body.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Scaffold(
          body: state is HomeDataSuccess && state is! HomeDataLoading
              ? HomeScreenBody(
                  model: HomeCubit.get(context).model,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
