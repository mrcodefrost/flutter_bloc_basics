import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_basics/data/cart_items.dart';
import 'package:flutter_bloc_basics/data/grocery_data.dart';
import 'package:flutter_bloc_basics/data/wishlist_items.dart';
import 'package:meta/meta.dart';

import '../models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    // Click events
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    // Navigate events
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  Future<FutureOr<void>> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    // first state will always be loading
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
      products: GroceryData.groceryProducts
          .map((product) => ProductDataModel(
                id: product['id'],
                name: product['name'],
                description: product['description'],
                price: product['price'],
                imageUrl: product['imageUrl'],
              ))
          .toList(),
    ));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
  }
}
