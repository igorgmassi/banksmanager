import 'package:banksamanager_app/models/loan.dart';
import 'package:banksamanager_app/services/api_service.dart';
import 'dart:convert' as convert;

class LoanService {
  static Future<List<Loan>> getLoans() async {
    final response = await ApiService.get('loans/');
    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as List<dynamic>;
      print(jsonData);
      return jsonData.map((loan) => Loan.fromJson(loan as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load loans');
    }
  }

  static Future<Loan> getLoan(num id) async {
    final response = await ApiService.get('loans/$id');
    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as Map<String, dynamic>;
      return Loan.fromJson(jsonData);
    } else {
      throw Exception('Failed to load loan');
    }
  }

  static Future<Loan> createLoan(Loan loan) async {
    final response = await ApiService.post('loans/', loan.toJson());
    if (response.statusCode == 201) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as Map<String, dynamic>;
      return Loan.fromJson(jsonData);
    } else {
      throw Exception('Failed to create loan');
    }
  }

  static Future<Loan> updateLoan(num id, Loan loan) async {
    final response = await ApiService.put('loans/$id/', loan.toJson());
    if (response.statusCode == 200) {
      final data = response.body;
      final jsonData = convert.jsonDecode(data) as Map<String, dynamic>;
      return Loan.fromJson(jsonData);
    } else {
      throw Exception('Failed to update loan');
    }
  }

  static Future<void> deleteLoan(num id) async {
    final response = await ApiService.delete('loans/$id/');
    if (response.statusCode != 204) {
      throw Exception('Failed to delete loan');
    }
  }
}