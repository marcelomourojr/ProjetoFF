import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_vendas')) {
        try {
          final serializedData = prefs.getString('ff_vendas') ?? '{}';
          _vendas =
              VendasStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_json')) {
        try {
          _json = jsonDecode(prefs.getString('ff_json') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  VendasStruct _vendas = VendasStruct.fromSerializableMap(jsonDecode(
      '{\"vendas\":\"[\\\"{\\\\\\\"mes\\\\\\\":\\\\\\\"Janeiro\\\\\\\",\\\\\\\"quantidade\\\\\\\":\\\\\\\"10\\\\\\\"}\\\"]\"}'));
  VendasStruct get vendas => _vendas;
  set vendas(VendasStruct value) {
    _vendas = value;
    prefs.setString('ff_vendas', value.serialize());
  }

  void updateVendasStruct(Function(VendasStruct) updateFn) {
    updateFn(_vendas);
    prefs.setString('ff_vendas', _vendas.serialize());
  }

  dynamic _json = jsonDecode(
      '{\"orders\":[{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29359\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Incompleto\",\"cliente\":\"João Silva\",\"data\":\"10/01/2025 08:30\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29360\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Completo\",\"cliente\":\"Maria Santos\",\"data\":\"10/01/2025 09:15\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29361\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Em Processamento\",\"cliente\":\"Ana Oliveira\",\"data\":\"10/01/2025 10:00\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29362\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Enviado\",\"cliente\":\"Carlos Pereira\",\"data\":\"10/01/2025 10:45\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29363\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Pendente\",\"cliente\":\"Patricia Lima\",\"data\":\"10/01/2025 11:30\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29364\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Completo\",\"cliente\":\"Roberto Costa\",\"data\":\"10/01/2025 12:15\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29365\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Em Processamento\",\"cliente\":\"Fernanda Santos\",\"data\":\"10/01/2025 13:00\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29366\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Incompleto\",\"cliente\":\"Lucas Mendes\",\"data\":\"10/01/2025 13:45\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29367\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Enviado\",\"cliente\":\"Juliana Alves\",\"data\":\"10/01/2025 14:30\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29368\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Pendente\",\"cliente\":\"Marcelo Souza\",\"data\":\"10/01/2025 15:15\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29369\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Completo\",\"cliente\":\"Amanda Ferreira\",\"data\":\"10/01/2025 16:00\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29370\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Em Processamento\",\"cliente\":\"Ricardo Oliveira\",\"data\":\"10/01/2025 16:45\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29371\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Enviado\",\"cliente\":\"Camila Lima\",\"data\":\"10/01/2025 17:30\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29372\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Incompleto\",\"cliente\":\"Gabriel Santos\",\"data\":\"10/01/2025 18:15\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"},{\"pedido\":{\"nome\":\"Tênis Plataforma Walk\'n\'Dior Dourado\",\"codigo\":\"#29373\",\"imagem\":\"https://d2r9epyceweg5n.cloudfront.net/stores/003/221/891/rte/Tênis%20Plataforma%20Walk\'n\'Dior%20Dourado%2001.png\"},\"status\":\"Pendente\",\"cliente\":\"Beatriz Costa\",\"data\":\"10/01/2025 19:00\",\"preco\":\"R\$ 4599.99\",\"frete\":\"Grátis\"}]}');
  dynamic get json => _json;
  set json(dynamic value) {
    _json = value;
    prefs.setString('ff_json', jsonEncode(value));
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
