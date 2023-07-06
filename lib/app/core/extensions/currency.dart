import 'package:intl/intl.dart';

extension DoubleExt on double {
  String get toGuarani {
    final formatador = NumberFormat("#,###", "es_PY");
    String guaraniValue = formatador.format(this);
    return 'G\$ $guaraniValue';
  }
}
