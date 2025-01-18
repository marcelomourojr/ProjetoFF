// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';

class TabelaMentoriaFF extends StatefulWidget {
  const TabelaMentoriaFF({
    Key? key,
    this.width,
    this.height,
    this.json,
  }) : super(key: key);

  final double? width;
  final double? height;
  final dynamic json;

  @override
  _TabelaMentoriaFFState createState() => _TabelaMentoriaFFState();
}

class _TabelaMentoriaFFState extends State<TabelaMentoriaFF> {
  final ScrollController _horizontalController = ScrollController();
  final ScrollController _verticalController = ScrollController();
  int _linesPerPage = 10;
  int _currentPage = 1;
  List<Map<String, dynamic>> dadosTabela = [];
  final List<int> _availablePageSizes = [5, 10, 25, 50];

  @override
  void initState() {
    super.initState();
    processJsonData();
  }

  void processJsonData() {
    if (widget.json != null) {
      try {
        final jsonData = widget.json as Map<String, dynamic>;
        if (jsonData.containsKey('orders')) {
          setState(() {
            dadosTabela = (jsonData['orders'] as List).map((item) {
              return {
                'pedido': item['pedido']['codigo'],
                'status': item['status'],
                'cliente': item['cliente'],
                'data': item['data'],
                'descricao': item['pedido']['nome'],
                'imagem': item['pedido']['imagem'],
                'preco': double.tryParse(item['preco']
                        .replaceAll('R\$ ', '')
                        .replaceAll(',', '.')) ??
                    0.0,
                'frete': item['frete']
              };
            }).toList();
          });
        }
      } catch (e) {
        debugPrint('Erro ao processar JSON: $e');
      }
    }
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completo':
        return const Color(0xFF10B981);
      case 'em processamento':
        return const Color(0xFFF59E0B);
      case 'incompleto':
        return const Color(0xFFEF4444);
      case 'enviado':
        return const Color(0xFF3B82F6);
      case 'pendente':
        return const Color(0xFF8B5CF6);
      default:
        return const Color(0xFF64748B);
    }
  }

  Color getStatusBackgroundColor(String status) {
    switch (status.toLowerCase()) {
      case 'completo':
        return const Color(0xFFD1FAE5);
      case 'em processamento':
        return const Color(0xFFFEF3C7);
      case 'incompleto':
        return const Color(0xFFFEE2E2);
      case 'enviado':
        return const Color(0xFFDBEAFE);
      case 'pendente':
        return const Color(0xFFF3E8FF);
      default:
        return const Color(0xFFF1F5F9);
    }
  }

  @override
  Widget build(BuildContext context) {
    final startIndex = (_currentPage - 1) * _linesPerPage;
    final endIndex = startIndex + _linesPerPage;
    final paginatedData = dadosTabela.isEmpty
        ? []
        : dadosTabela.sublist(
            startIndex,
            endIndex > dadosTabela.length ? dadosTabela.length : endIndex,
          );
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                controller: _horizontalController,
                thumbVisibility: true,
                trackVisibility: true,
                child: SingleChildScrollView(
                  controller: _horizontalController,
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: max(screenWidth, 1200),
                    child: Column(
                      children: [
                        // Header
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAFAFA),
                            border: Border(
                              bottom: BorderSide(color: Colors.grey[300]!),
                            ),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 64),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  'PEDIDO',
                                  style: headerStyle,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'STATUS',
                                  style: headerStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'CLIENTE',
                                  style: headerStyle,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'DATA',
                                  style: headerStyle,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'PREÇO',
                                  style: headerStyle,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'FRETE',
                                  style: headerStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Table content
                        Expanded(
                          child: Scrollbar(
                            controller: _verticalController,
                            thumbVisibility: true,
                            child: ListView.builder(
                              controller: _verticalController,
                              itemCount: paginatedData.length,
                              itemBuilder: (context, index) {
                                final item = paginatedData[index];
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: index.isEven
                                        ? Colors.white
                                        : const Color(0xFFF8FAFC),
                                    border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[300]!),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Imagem
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          item['imagem'],
                                          width: 48,
                                          height: 48,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              width: 48,
                                              height: 48,
                                              color: const Color(0xFFE2E8F0),
                                              child: const Icon(
                                                  Icons.image_not_supported),
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 16),

                                      // Pedido e Descrição
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item['descricao'],
                                              style: const TextStyle(
                                                color: Color(0xFF1E293B),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              item['pedido'],
                                              style: const TextStyle(
                                                color: Color(0xFF64748B),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Status
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: getStatusBackgroundColor(
                                                  item['status']),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                color: getStatusColor(
                                                        item['status'])
                                                    .withOpacity(0.1),
                                              ),
                                            ),
                                            child: Text(
                                              item['status'],
                                              style: TextStyle(
                                                color: getStatusColor(
                                                    item['status']),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Cliente
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          item['cliente'],
                                          style: const TextStyle(
                                            color: Color(0xFF1E293B),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),

                                      // Data
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          item['data'],
                                          style: const TextStyle(
                                            color: Color(0xFF1E293B),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),

                                      // Preço
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'R\$ ${item['preco'].toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            color: Color(0xFF1E293B),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),

                                      // Frete
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          item['frete'],
                                          style: TextStyle(
                                            color: item['frete'] == 'Grátis'
                                                ? const Color(0xFF10B981)
                                                : const Color(0xFF64748B),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Footer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                border: Border(top: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Informação sobre itens mostrados
                  Text(
                    'Mostrando ${startIndex + 1}-${endIndex > dadosTabela.length ? dadosTabela.length : endIndex} de ${dadosTabela.length} registros',
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 14,
                    ),
                  ),

                  // Controles de paginação
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Seletor de itens por página
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Mostrar',
                              style: TextStyle(
                                color: Color(0xFF64748B),
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            DropdownButton<int>(
                              value: _linesPerPage,
                              underline: const SizedBox(),
                              items: _availablePageSizes.map((size) {
                                return DropdownMenuItem<int>(
                                  value: size,
                                  child: Text(
                                    size.toString(),
                                    style: const TextStyle(
                                      color: Color(0xFF1E293B),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _linesPerPage = value;
                                    _currentPage = 1;
                                  });
                                }
                              },
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'itens',
                              style: TextStyle(
                                color: Color(0xFF64748B),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Controles de navegação
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Row(
                          children: [
                            // Primeira página
                            _PageButton(
                              icon: Icons.first_page,
                              onPressed: _currentPage > 1
                                  ? () => setState(() => _currentPage = 1)
                                  : null,
                            ),

                            // Página anterior
                            _PageButton(
                              icon: Icons.chevron_left,
                              onPressed: _currentPage > 1
                                  ? () => setState(() => _currentPage--)
                                  : null,
                            ),

                            // Contador de página atual
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                border: Border.symmetric(
                                  vertical:
                                      BorderSide(color: Colors.grey[300]!),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Página $_currentPage de ${(dadosTabela.length / _linesPerPage).ceil()}',
                                    style: const TextStyle(
                                      color: Color(0xFF1E293B),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Próxima página
                            _PageButton(
                              icon: Icons.chevron_right,
                              onPressed: _currentPage <
                                      (dadosTabela.length / _linesPerPage)
                                          .ceil()
                                  ? () => setState(() => _currentPage++)
                                  : null,
                            ),

                            // Última página
                            _PageButton(
                              icon: Icons.last_page,
                              onPressed: _currentPage <
                                      (dadosTabela.length / _linesPerPage)
                                          .ceil()
                                  ? () => setState(() => _currentPage =
                                      (dadosTabela.length / _linesPerPage)
                                          .ceil())
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const headerStyle = TextStyle(
    color: Color(0xFF64748B),
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );
}

// Widget auxiliar para botões de paginação
class _PageButton extends StatelessWidget {
  const _PageButton({
    required this.icon,
    this.onPressed,
  });

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: 20,
        color: onPressed != null
            ? const Color(0xFF1E293B)
            : const Color(0xFFCBD5E1),
      ),
      onPressed: onPressed,
      splashRadius: 20,
      constraints: const BoxConstraints(
        minWidth: 32,
        minHeight: 32,
      ),
      padding: EdgeInsets.zero,
    );
  }
}
