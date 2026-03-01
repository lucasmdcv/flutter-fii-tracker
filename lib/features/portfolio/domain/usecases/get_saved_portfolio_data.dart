import '../entities/fii_entity.dart';
import '../repositories/i_portfolio_repository.dart';

class GetSavedPortfolioData {
  final IPortfolioRepository repository;

  GetSavedPortfolioData(this.repository);

  Future<List<FiiEntity>> call() async {
    return await repository.getSavedPortfolio();
  }
}