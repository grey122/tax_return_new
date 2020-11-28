part of 'tax_return_cubit.dart';

abstract class TaxReturnState extends Equatable {
  const TaxReturnState();

  @override
  List<Object> get props => [];
}

class TaxReturnLoading extends TaxReturnState {}

class TaxReturnLoaded extends TaxReturnState {
  final List<TaxReturnBuilt> taxReturns;

  const TaxReturnLoaded([this.taxReturns = const []]);

  @override
  List<Object> get props => [taxReturns];

  @override
  String toString() => 'TodosLoaded { todos: $taxReturns }';
}

class TaxReturnNotLoaded extends TaxReturnState {}
