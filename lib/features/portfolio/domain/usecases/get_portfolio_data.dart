import '../entities/fii_entity.dart';
import '../repositories/i_portfolio_repository.dart';

class GetPortfolioData {
  // O Caso de Uso enxerga apenas o Contrato (Interface), nunca a implementação com Dio ou JSON.
  final IPortfolioRepository repository;

  GetPortfolioData(this.repository);

  /// O método 'call' permite invocar a classe como se fosse uma função.
  /// Exemplo de uso futuro: final fii = await getPortfolioData('MXRF11');
  Future<FiiEntity> call(String ticker) async {
    if (ticker.isEmpty) {
      throw Exception('O ticker do ativo não pode ser vazio.');
    }
    
    // Delega a busca ao repositório
    return await repository.getFiiQuote(ticker);
  }
}