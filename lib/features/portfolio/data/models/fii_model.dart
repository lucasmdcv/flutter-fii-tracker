import '../../domain/entities/fii_entity.dart';

class FiiModel extends FiiEntity {
  FiiModel({
    required super.ticker,
    required super.currentPrice,
    required super.lastDividend,
  });

  // Factory constructor: Analisa o JSON genérico da API e o converte em um FiiModel seguro.
  // Os campos (como 'symbol' e 'regularMarketPrice') variam dependendo da API escolhida (ex: Brapi).
  factory FiiModel.fromJson(Map<String, dynamic> json) {
    return FiiModel(
      ticker: json['symbol'] ?? 'Desconhecido',
      currentPrice: (json['regularMarketPrice'] ?? 0.0).toDouble(),
      // Assumindo que a API retorna o último dividendo dentro de um objeto aninhado ou campo específico
      lastDividend: (json['dividendsData']?['yieldValue'] ?? 0.0).toDouble(), 
    );
  }

  // Serialização: Converte o objeto de volta para JSON (útil para salvar no banco de dados local SQLite/Isar).
  Map<String, dynamic> toJson() {
    return {
      'symbol': ticker,
      'regularMarketPrice': currentPrice,
      'dividend': lastDividend,
    };
  }
}