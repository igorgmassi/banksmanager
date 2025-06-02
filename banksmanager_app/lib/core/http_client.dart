import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class HttpClient {
  static final HttpClient _instance = HttpClient._internal();
  factory HttpClient() => _instance;
  HttpClient._internal();

  final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('${AppConfig.apiBaseUrl}$endpoint');
    return await http.get(url, headers: {..._defaultHeaders, ...?headers});
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> body, {Map<String, String>? headers}) async {
    final url = Uri.parse('${AppConfig.apiBaseUrl}$endpoint');
    return await http.post(
      url,
      headers: {..._defaultHeaders, ...?headers},
      body: jsonEncode(body),
    );
  }

  Future<http.Response> put(String endpoint, Map<String, dynamic> body, {Map<String, String>? headers}) async {
    final url = Uri.parse('${AppConfig.apiBaseUrl}$endpoint');
    return await http.put(
      url,
      headers: {..._defaultHeaders, ...?headers},
      body: jsonEncode(body),
    );
  }

  Future<http.Response> delete(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('${AppConfig.apiBaseUrl}$endpoint');
    return await http.delete(url, headers: {..._defaultHeaders, ...?headers});
  }
}