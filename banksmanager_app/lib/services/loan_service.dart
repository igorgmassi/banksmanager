import 'package:banksamanager_app/models/loan.dart';
import 'package:banksamanager_app/services/api_service.dart';

class LoanService {
  static Future<List<Loan>> getLoans() async {
    final response = await ApiService.get('loans');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.body as List;
      return data.map((json) => Loan.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load loans');
    }
  }

  static Future<Loan> getLoan(String id) async {
    final response = await ApiService.get('loans/$id');

    if (response.statusCode == 200) {
      return Loan.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load loan');
    }
  }

  static Future<Loan> createLoan(Loan loan) async {
    final response = await ApiService.post('loans', loan.toJson());

    if (response.statusCode == 201) {
      return Loan.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create loan');
    }
  }

  static Future<void> deleteLoan(String id) async {
    final response = await ApiService.delete('loans/$id');

    if (response.statusCode != 204) {
      throw Exception('Failed to delete loan');
    }
  }
}