part of 'shop_bloc_bloc.dart';

@immutable
sealed class ShopBlocState {}

final class ShopBlocInitial extends ShopBlocState {}

// action
abstract class ActiionOnShopPage extends ShopBlocState {}

// builder

class InitialDataLoading extends ShopBlocState {}

class SuccusDataLoading extends ShopBlocState {
  final ShopModell shopModell;
  SuccusDataLoading({required this.shopModell});
}

class ErrorDataLoading extends ShopBlocState {}
