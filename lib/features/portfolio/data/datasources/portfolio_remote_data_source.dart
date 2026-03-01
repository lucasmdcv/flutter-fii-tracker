import '../models/fii_model.dart';

abstract class IPortfolioRemoteDataSource {
  /// Faz a requisição GET na API de finanças para um ticker específico
  Future<FiiModel> getFiiData(String ticker);
}