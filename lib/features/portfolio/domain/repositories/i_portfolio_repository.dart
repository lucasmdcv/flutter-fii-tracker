import '../entities/fii_entity.dart';

abstract class IPortfolioRepository {
  /// Busca os detalhes atualizados de um ativo específico (Ex: MXRF11)
  Future<FiiEntity> getFiiQuote(String ticker);

  /// Retorna a lista completa da carteira salva pelo usuário
  Future<List<FiiEntity>> getSavedPortfolio();
}