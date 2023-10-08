import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:kesl/infrastructure/api.dart';
import 'package:kesl/model/shop_model.dart';
import 'package:meta/meta.dart';

part 'shop_bloc_event.dart';
part 'shop_bloc_state.dart';

class ShopBlocBloc extends Bloc<ShopBlocEvent, ShopBlocState> {
  ShopBlocBloc() : super(ShopBlocInitial()) {
    on<ApiShopCalling>(apiShopCalling);
  }

  FutureOr<void> apiShopCalling(
      ApiShopCalling event, Emitter<ShopBlocState> emit)async {
    emit(InitialDataLoading());
    var resDetails = await ApiForshopDetails().getDataFromAPi();

    resDetails.fold(
      (left) => emit(ErrorDataLoading()),
      (right) => emit(SuccusDataLoading(shopModell: resDetails.right)),
    );
  }
}
