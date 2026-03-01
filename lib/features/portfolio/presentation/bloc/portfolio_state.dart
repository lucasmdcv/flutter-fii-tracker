import 'package:equatable/equatable.dart';
import '../../domain/entities/fii_entity.dart';

abstract class PortfolioState extends Equatable {
  @override
  List<Object> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final FiiEntity fii;
  PortfolioLoaded(this.fii);

  @override
  List<Object> get props => [fii];
}

class PortfolioError extends PortfolioState {
  final String message;
  PortfolioError(this.message);

  @override
  List<Object> get props => [message];
}

class PortfolioListLoaded extends PortfolioState {
  final List<FiiEntity> fiis;
  PortfolioListLoaded(this.fiis);

  @override
  List<Object> get props => [fiis];
}