extension PriceConvert on int {
  String dolarToGuarani() {
    final dolarToGuarani = this * 7100;
    return 'G\$ $dolarToGuarani';
  }

  String dolarToReal() {
    final dolarToReal = this * 1300;
    return 'R\$ $dolarToReal';
  }
}
