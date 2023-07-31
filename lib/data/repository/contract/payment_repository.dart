enum PaymentStatus { SUCCESSFUL, FAILED, CANCELLED }

abstract class PaymentRepository {
  Future<PaymentStatus> makePayment(String amount, String currency);
}
