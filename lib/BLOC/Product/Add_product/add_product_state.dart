part of 'add_product_bloc.dart';

abstract class AddProductState extends Equatable {
  const AddProductState();
}

class AddProductInitial extends AddProductState {
  @override
  List<Object> get props => [];
}
