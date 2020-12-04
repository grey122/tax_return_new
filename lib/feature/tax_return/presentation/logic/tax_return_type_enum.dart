enum TaxReturnType { companyIncomeTax, personalIcomeTax }

extension TaxReturnValue on TaxReturnType {
  String get taxValue {
    switch (this) {
      case TaxReturnType.companyIncomeTax:
        return 'Company Income Tax';
      case TaxReturnType.personalIcomeTax:
        return 'Personal Income Tax';
        break;
      default:
    }
    return '';
  }
}
