// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VendasStruct extends BaseStruct {
  VendasStruct({
    List<VendaStruct>? vendas,
  }) : _vendas = vendas;

  // "vendas" field.
  List<VendaStruct>? _vendas;
  List<VendaStruct> get vendas => _vendas ?? const [];
  set vendas(List<VendaStruct>? val) => _vendas = val;

  void updateVendas(Function(List<VendaStruct>) updateFn) {
    updateFn(_vendas ??= []);
  }

  bool hasVendas() => _vendas != null;

  static VendasStruct fromMap(Map<String, dynamic> data) => VendasStruct(
        vendas: getStructList(
          data['vendas'],
          VendaStruct.fromMap,
        ),
      );

  static VendasStruct? maybeFromMap(dynamic data) =>
      data is Map ? VendasStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'vendas': _vendas?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'vendas': serializeParam(
          _vendas,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static VendasStruct fromSerializableMap(Map<String, dynamic> data) =>
      VendasStruct(
        vendas: deserializeStructParam<VendaStruct>(
          data['vendas'],
          ParamType.DataStruct,
          true,
          structBuilder: VendaStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'VendasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is VendasStruct && listEquality.equals(vendas, other.vendas);
  }

  @override
  int get hashCode => const ListEquality().hash([vendas]);
}

VendasStruct createVendasStruct() => VendasStruct();
