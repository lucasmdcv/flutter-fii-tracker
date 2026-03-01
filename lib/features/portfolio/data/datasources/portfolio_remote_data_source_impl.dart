import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Novo import
import '../models/fii_model.dart';
import 'portfolio_remote_data_source.dart';

class PortfolioRemoteDataSourceImpl implements IPortfolioRemoteDataSource {
  final Dio dio;

  PortfolioRemoteDataSourceImpl({required this.dio});

  @override
  Future<FiiModel> getFiiData(String ticker) async {
    try {
      // Extrai o token do arquivo .env de forma segura
      final apiToken = dotenv.env['BRAPI_TOKEN'];
      
      if (apiToken == null || apiToken.isEmpty) {
        throw Exception('Token de API não configurado no ambiente.');
      }

      final url = 'https://brapi.dev/api/quote/$ticker?modules=dividend&token=$apiToken';
      
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data['results'][0];
        return FiiModel.fromJson(data);
      } else {
        throw Exception('Erro no servidor da API: Código ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Falha de conexão ao buscar o ativo $ticker: ${e.message}');
    } catch (e) {
      throw Exception('Erro interno ao processar dados de $ticker: $e');
    }
  }
}