import 'package:equatable/equatable.dart';

abstract class PortfolioEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetFiiQuoteEvent extends PortfolioEvent {
  final String ticker;
  GetFiiQuoteEvent(this.ticker);

  @override
  List<Object> get props => [ticker];
}

class LoadPortfolioListEvent extends PortfolioEvent {}