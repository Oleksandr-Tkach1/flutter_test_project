import 'package:bloc/bloc.dart';
import 'package:test_project/ui/main/cubit/main_state.dart';
import '../../../data/models/repositories/product_repository.dart';

class MainCubit extends Cubit<MainState> {
  final ProductRepository _productRepository;
  MainCubit(this._productRepository) : super(const MainState());

  fetchAllProducts() async{
    emit(state.copyWith(status: LoadingStatus.loading));
    _productRepository.getAllProducts().then((value) {
      emit(state.copyWith(allProducts: value, status: LoadingStatus.complete));
    });
  }
}