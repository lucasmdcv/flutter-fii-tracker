import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/portfolio_event.dart';
import '../bloc/portfolio_state.dart';
import '../widgets/fii_card_widget.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  void initState() {
    super.initState();
    // Dispara o carregamento da carteira assim que a tela inicializa
    BlocProvider.of<PortfolioBloc>(context).add(LoadPortfolioListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Carteira (Efeito Bola de Neve)'),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => BlocProvider.of<PortfolioBloc>(context).add(LoadPortfolioListEvent()),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<PortfolioBloc, PortfolioState>(
          builder: (context, state) {
            if (state is PortfolioLoading) {
              return const Center(child: CircularProgressIndicator(color: Colors.blueAccent));
            } else if (state is PortfolioListLoaded) {
              return ListView.builder(
                itemCount: state.fiis.length,
                itemBuilder: (context, index) {
                  return FiiCardWidget(fii: state.fiis[index]);
                },
              );
            } else if (state is PortfolioError) {
              return Center(
                child: Text('Falha de Análise: ${state.message}', 
                style: const TextStyle(color: Colors.redAccent), textAlign: TextAlign.center),
              );
            }
            return const Center(child: Text('Inicializando sistema analítico...'));
          },
        ),
      ),
    );
  }
}