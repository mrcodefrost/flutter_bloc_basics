part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

// since ProductDataModel needs to be added in the wishlist
class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  // passing data through events
  final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}

// / since ProductDataModel needs to be added in the wishlist
class HomeProductCartButtonClickedEvent extends HomeEvent {
  // passing data through events
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
