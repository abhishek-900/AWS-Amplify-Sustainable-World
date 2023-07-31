import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/data/repository/contract/payment_repository.dart';
import 'package:sustainable_world/services/dio_service.dart';

var remotePaymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  final dio = ref.watch(stripeDioProvider);
  return RemotePaymentRepository(dio);
});

class RemotePaymentRepository extends PaymentRepository {
  final Dio _dio;

  RemotePaymentRepository(this._dio);

  @override
  Future<PaymentStatus> makePayment(String amount, String currency) async {
    try {
      var paymentIntent = await _createPaymentIntent(amount, currency);

      var paymentStatus = await _displayPaymentSheet(paymentIntent);
      return paymentStatus;
    } on StripeException {
      return PaymentStatus.CANCELLED;
    } on DioException {
      return PaymentStatus.FAILED;
    } catch (e) {
      rethrow;
    }
  }

  Future<PaymentStatus> _displayPaymentSheet(
      Map<String, dynamic> paymentIntent) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent['intentClientSecret'],
          style: ThemeMode.dark,
          merchantDisplayName: 'Sustainable World',
        ),
      );
      await Stripe.instance.presentPaymentSheet();
      return PaymentStatus.SUCCESSFUL;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        "customerEmail": dotenv.env['CUSTOMER_EMAIL'],
        "currency": currency,
        "amount": _calculateAmount(amount)
      };
      var response = await _dio.post(
        '/api/payment/stripe/client/checkout',
        data: body,
      );
      return response.data;
    } catch (err) {
      rethrow;
    }
  }

  String _calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount));
    return calculatedAmout.toString();
  }
}
