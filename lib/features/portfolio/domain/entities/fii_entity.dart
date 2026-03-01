class FiiEntity {
  final String ticker;
  final double currentPrice;
  final double lastDividend;

  FiiEntity({
    required this.ticker,
    required this.currentPrice,
    required this.lastDividend,
  });

  // Regra de Negócio 1: Cálculo do Dividend Yield mensal (%)
  double get dividendYield {
    if (currentPrice == 0) return 0.0;
    return (lastDividend / currentPrice) * 100;
  }

  // Regra de Negócio 2: Cálculo do Número Mágico (cotas para o efeito bola de neve)
  int get magicNumber {
    if (lastDividend == 0) return 0;
    return (currentPrice / lastDividend).ceil();
  }
}