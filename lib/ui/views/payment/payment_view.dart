import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sustainable_world/data/repository/remote/remote_payment_repository.dart';
import 'package:sustainable_world/models/Product.dart';
import 'package:sustainable_world/ui/views/home/home_view.dart';

import '../../../data/repository/contract/payment_repository.dart';
import '../home/home_view_model.dart';
import '../product_details/product_details_view_model.dart';

class PaymentView extends ConsumerWidget {
  static const String routeName = "/payment";

  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Options"),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  textBaseline: TextBaseline.ideographic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "Amount Payable ",
                          children: [
                            TextSpan(
                              text: "(Incl. of all taxes)",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                        NumberFormat.simpleCurrency(
                                locale: "en_IN", decimalDigits: 0)
                            .format(product.amount),
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ),
              const Divider(height: 8, thickness: 8),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "How would you like to pay?",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    const Text("Select a payment method"),
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const Divider(height: 0),
                  ExpansionTile(
                    childrenPadding: const EdgeInsets.all(16),
                    leading: const Icon(Icons.payment),
                    title: const Text("Credit/Debit Card"),
                    subtitle: const Text(
                      "Pay using your debit or credit card",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    children: [
                      const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                          suffixIcon: Icon(Icons.payment),
                          hintText: "Card Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        onChanged: (name) {},
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                          hintText: "Name on Card",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (number) {
                                // viewModel.cardExpMonth = data[0];
                                // viewModel.cardExpYear = data[1];
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 0, 0, 0),
                                hintText: "Valid Thru (MM/YY)",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 0, 0, 0),
                                hintText: "CVC",
                                suffixIcon: Icon(Icons.info),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CheckboxListTile(
                        value: true,
                        onChanged: (value) {},
                        title: const Text("Save this card for faster payments"),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                  ExpansionTile(
                    childrenPadding: const EdgeInsets.all(16),
                    leading: _upiIcon(context),
                    title: const Text("UPI"),
                    subtitle: const Text(
                      "Pay using UPI options",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    children: const [
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                          hintText: "Enter BHIM UPI",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                  const Divider(height: 0),
                  ListTile(
                    onTap: () async {
                      var navigator = Navigator.of(context);
                      var scaffoldMessenger = ScaffoldMessenger.of(context);
                      var status = await ref
                          .read(remotePaymentRepositoryProvider)
                          .makePayment(
                              product.amount!.toInt().toString(), "INR");
                      if (status == PaymentStatus.SUCCESSFUL) {
                        ref
                            .read(productDetailsViewModelProvider)
                            .createOrder(product: product);

                        scaffoldMessenger.showSnackBar(
                          const SnackBar(
                            content: Text("Thank you for your contribution!"),
                          ),
                        );
                        ref.read(homeViewModelProvider).bottomNavBarIndex = 0;
                        navigator.pushNamedAndRemoveUntil(
                            HomeView.routeName, (route) => false);
                      } else {
                        scaffoldMessenger.showSnackBar(
                          const SnackBar(
                            content: Text("Payment Failed"),
                          ),
                        );
                      }
                    },
                    leading: const Icon(Icons.account_balance_wallet),
                    title: const Text("Strip Payment"),
                    subtitle: const Text(
                      "Powered by Stripe",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _upiIcon(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey.shade500)),
      child: Text(
        "UPI",
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.black),
      ),
    );
  }
}
