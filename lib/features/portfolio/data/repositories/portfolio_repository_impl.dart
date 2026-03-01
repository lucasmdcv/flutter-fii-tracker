import '../../domain/entities/fii_entity.dart';
import '../../domain/repositories/i_portfolio_repository.dart';
import '../datasources/portfolio_remote_data_source.dart';

class PortfolioRepositoryImpl implements IPortfolioRepository {
  // A injeção de dependência acontece aqui. O repositório não sabe qual pacote HTTP estamos usando.
  final IPortfolioRemoteDataSource remoteDataSource;

  PortfolioRepositoryImpl(this.remoteDataSource);

  @override
  Future<FiiEntity> getFiiQuote(String ticker) async {
    try {
      // Tenta buscar os dados na API
      final fiiModel = await remoteDataSource.getFiiData(ticker);
      
      // Retorna o Model. Como FiiModel herda de FiiEntity (Polimorfismo), isso é perfeitamente válido.
      return fiiModel;
    } catch (e) {
      // Em um projeto real, aqui você mapearia exceções do Dio para exceções customizadas (ServerException).
      throw Exception('Falha ao buscar dados do ativo $ticker: $e');
    }
  }

  @override
  Future<List<FiiEntity>> getSavedPortfolio() async {
      // Carteira padrão de inicialização
    final tickers = ['MXRF11', 'VRTM11', 'VGRI11'];
    
    try {
      // Dispara todas as requisições HTTP ao mesmo tempo (Concorrência)
      final responses = await Future.wait(
        tickers.map((ticker) => remoteDataSource.getFiiData(ticker))
      );
      
      return responses;
    } catch (e) {
      throw Exception('Falha ao sincronizar a carteira: $e');
    }
    
  }
}