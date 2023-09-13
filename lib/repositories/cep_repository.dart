import '../model/cep_model.dart';
import 'cep_custom_dio.dart';

class CepRepository {
  final _custonDio = CustonDio();

  CepRepository();

  Future<CepModel> obterTarefas() async {
    var url = "Ceps";
    var result = await _custonDio.dio.get(url);
    return CepModel.fromJson(result.data);
  }

  Future<void> addedCep(Results resultCep) async {
    try {
      await _custonDio.dio.post("Ceps", data: resultCep.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update(Results resultCep) async {
    try {
      await _custonDio.dio.put("Ceps/${resultCep.objectId}", data: resultCep.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(String objectId) async {
    try {
      await _custonDio.dio.delete("Ceps/$objectId");
    } catch (e) {
      rethrow;
    }
  }
}
