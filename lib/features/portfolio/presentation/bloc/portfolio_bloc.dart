import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_portfolio_data.dart';
import '../../domain/usecases/get_saved_portfolio_data.dart';
import 'portfolio_event.dart';
import 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GetPortfolioData getPortfolioData;
  final GetSavedPortfolioData getSavedPortfolioData;

  PortfolioBloc({required this.getPortfolioData, required this.getSavedPortfolioData,}) : super(PortfolioInitial()) {
    on<GetFiiQuoteEvent>((event, emit) async {
      emit(PortfolioLoading());
      try {
        // Executa o Caso de Uso
        final fii = await getPortfolioData(event.ticker);
        emit(PortfolioLoaded(fii));
      } catch (e) {
        emit(PortfolioError(e.toString()));
      }
    });
    on<LoadPortfolioListEvent>((event, emit) async {
      emit(PortfolioLoading());
      try {
        final fiis = await getSavedPortfolioData();
        emit(PortfolioListLoaded(fiis));
      } catch (e) {
        emit(PortfolioError(e.toString()));
      }
    });
  }
}