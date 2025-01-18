// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VendaStruct extends BaseStruct {
  VendaStruct({
    String? mes,
    int? quantidade,
  })  : _mes = mes,
        _quantidade = quantidade;

  // "mes" field.
  String? _mes;
  String get mes => _mes ?? '';
  set mes(String? val) => _mes = val;

  bool hasMes() => _mes != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  set quantidade(int? val) => _quantidade = val;

  void incrementQuantidade(int amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  static VendaStruct fromMap(Map<String, dynamic> data) => VendaStruct(
        mes: data['mes'] as String?,
        quantidade: castToType<int>(data['quantidade']),
      );

  static VendaStruct? maybeFromMap(dynamic data) =>
      data is Map ? VendaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'mes': _mes,
        'quantidade': _quantidade,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mes': serializeParam(
          _mes,
          ParamType.String,
        ),
        'quantidade': serializeParam(
          _quantidade,
          ParamType.int,
        ),
      }.withoutNulls;

  static VendaStruct fromSerializableMap(Map<String, dynamic> data) =>
      VendaStruct(
        mes: deserializeParam(
          data['mes'],
          ParamType.String,
          false,
        ),
        quantidade: deserializeParam(
          data['quantidade'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'VendaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VendaStruct &&
        mes == other.mes &&
        quantidade == other.quantidade;
  }

  @override
  int get hashCode => const ListEquality().hash([mes, quantidade]);
}

VendaStruct createVendaStruct({
  String? mes,
  int? quantidade,
}) =>
    VendaStruct(
      mes: mes,
      quantidade: quantidade,
    );
