
import 'package:eazy_app/core/utils/appIcons.dart';
import 'package:eazy_app/features/home/views/widgets/home_grid_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/home_cubit/home_cubit.dart';
import '../../../manager/home_cubit/home_state.dart';

class AllCategoriesGrid extends StatelessWidget {
  const AllCategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else if (state is HomeLoaded) {
          final cubit = HomeCubit.get(context);
          return GridView.builder(
            itemCount: state.homeResponse.categories!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 9.82,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final category = state.homeResponse.categories![index];
              return HomeGridContainer(
                id: category.id!,
                iconPath: category.image!,
                text: category.title!,
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
