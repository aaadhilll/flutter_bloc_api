import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kesl/application/shop_bloc/bloc/shop_bloc_bloc.dart';

class ShopeMainScreen extends StatelessWidget {
  ShopeMainScreen({super.key});
  final ShopBlocBloc shopBlocBloc = ShopBlocBloc();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    shopBlocBloc.add(ApiShopCalling());
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(12.0),
          child: BlocConsumer<ShopBlocBloc, ShopBlocState>(
            bloc: shopBlocBloc,
            listenWhen: (previous, current) => current is ActiionOnShopPage,
            buildWhen: (previous, current) => current is! ActiionOnShopPage,
            listener: (context, state) {},
            builder: (context, state) {
              {
                switch (state.runtimeType) {
                  case InitialDataLoading:
                    return const CircularProgressIndicator();

                  case SuccusDataLoading:
                    final succusState = state as SuccusDataLoading;
                    return GridView.builder(
                      itemCount: succusState.shopModell.menuItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: height / 5,
                          width: width / 3,
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(succusState.shopModell
                                          .menuItems[index].sliderImage),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Text(
                                state.shopModell.menuItems[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              state.shopModell.menuItems[index].isActive == '1'
                                  ? const Text('Available')
                                  : const Text('Not Available'),
                            ],
                          ),
                        );
                      },
                    );
                }
                return SizedBox(
                  height: width,
                  width: width,
                );
              }
            },
          )),
    );
  }
}

class MenuCardWidGet extends StatelessWidget {
  const MenuCardWidGet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
