import 'package:fii_tracker/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:fii_tracker/features/portfolio/presentation/pages/portfolio_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Carrega as variáveis de ambiente primeiro
  await dotenv.load(fileName: ".env"); 
  
  await di.init();
  runApp(const FiiTrackerApp());
}

class FiiTrackerApp extends StatelessWidget {
  const FiiTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FII Tracker Analytics',
     theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      // O BlocProvider fornece o PortfolioBloc para a PortfolioPage
      home: BlocProvider(
        create: (_) => di.sl<PortfolioBloc>(),
        child: PortfolioPage(),
    ),
    );
  }
}