import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tax_return/feature/tax_return/domain/entities/entities_export.dart';
import 'package:tax_return/feature/tax_return/domain/repositories/repositories_export.dart';
import 'dart:async';
part 'tax_return_state.dart';

class TaxReturnCubit extends Cubit<TaxReturnState> {
  final TaxReturnRepository _taxReturnRepository;
  StreamSubscription _taxReturnSubscription;

  TaxReturnCubit({@required TaxReturnRepository taxReturnRepository})
      : assert(taxReturnRepository != null),
        _taxReturnRepository = taxReturnRepository,
        super(TaxReturnLoading());

  Future<void> loadTaxReturns() async {
    _taxReturnSubscription?.cancel();
    _taxReturnSubscription = _taxReturnRepository
        .taxReturns()
        .listen((taxReturn) => taxReturnUpdated(taxReturn));
  }

  //will be passing a list of tax returns
  Future<void> taxReturnUpdated(List<TaxReturnBuilt> taxReturns) async {
    emit(TaxReturnLoaded(taxReturns));
  }

  Future<void> addTaxReturn(TaxReturnBuilt taxReturn) async {
    return _taxReturnRepository.addNewTaxReturn(taxReturn);
  }

  Future<void> updateTaxReturn(TaxReturnBuilt taxReturn) async {
    return _taxReturnRepository.updateTaxReturn(taxReturn);
  }

  Future<void> deleteTaxReturn(TaxReturnBuilt taxReturn) async {
    return _taxReturnRepository.deleteTaxReturn(taxReturn);
  }

  @override
  Future<void> close() {
    _taxReturnSubscription?.cancel();
    return super.close();
  }
}
