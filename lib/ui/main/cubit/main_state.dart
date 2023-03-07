import 'package:equatable/equatable.dart';
import 'package:test_project/data/models/api/response/Products/Products.dart';

enum LoadingStatus { initial, loading, complete, listIsEmpty }

class MainState extends Equatable {
  final LoadingStatus status;
  final List<Products>? allProducts;

  const MainState({
    this.status = LoadingStatus.initial,
    this.allProducts,
  });

  MainState copyWith({
    LoadingStatus? status,
    List<Products>? allProducts,
  }) {
    return MainState(
      status: status ?? this.status,
      allProducts: allProducts ?? this.allProducts,
    );
  }

  @override
  List<Object> get props => [status, allProducts ?? ''];
}