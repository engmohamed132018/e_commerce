import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/app_size.dart';
import '../../../../core/constant/app_style.dart';
import '../../../Auth/presentation/auth_widgets/custom_text.dart';
import '../../home_bloc/cubit/home_cubit.dart';
import '../../home_bloc/cubit/home_state.dart';
import 'homeexploreproductItem_listview.dart';

class HomeExploreListView extends StatefulWidget {
  const HomeExploreListView({super.key});

  @override
  State<HomeExploreListView> createState() => _HomeExploreListViewState();
}

class _HomeExploreListViewState extends State<HomeExploreListView> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getAllProducts();
    print(BlocProvider.of<HomeCubit>(context).products);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          height: Appsize.setHeight(height: 350),
          child: state is HomeProductsScusses
              ? _buildScussesWidget(state)
              : state is HomeProductsLoading
                  ? _buildLoadingWidget()
                  : state is HomeProductsFailure
                      ? _buildFailureWidget(state)
                      : _buildLoadingWidget(),
        );
      },
    );
  }

  Center _buildFailureWidget(HomeProductsFailure state) {
    return Center(
      child: CustomText(
          text: state.message.toString(),
          textStyle: AppStyle.boldAND18SizeStyle),
    );
  }

  Center _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  ListView _buildScussesWidget(HomeProductsScusses state) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.products.length,
        itemBuilder: (context, index) {
          var product = state.products[index];
          return HomeExploreProductItemListView(product: product);
        });
  }
}
