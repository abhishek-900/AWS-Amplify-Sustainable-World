import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sustainable_world/main.dart';
import 'package:sustainable_world/models/UserType.dart';
import 'package:sustainable_world/ui/views/orders/orders_view_model.dart';
import 'package:sustainable_world/utils/error_image.dart';

class OrdersView extends ConsumerWidget {
  static const String routeName = "/orders";

  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: ref.watch(ordersViewModelProvider).when(
            data: (orders) {
              return ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(height: 4, thickness: 4),
                itemBuilder: (context, index) {
                  return _buildOrdersCard(
                    context,
                    orders[index],
                  );
                },
                itemCount: orders.length,
              );
            },
            error: (e, s) => Center(child: Text(e.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }

  Widget _buildOrdersCard(BuildContext context, dynamic order) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                child: order["product"]["producImages"].first != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: order["product"]["producImages"].first,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              const ErrorImage(),
                        ),
                      )
                    : const ErrorImage(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      order["product"]["title"] ?? "",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Transaction ID: ${order["transactionId"] ?? ""}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: mRole == UserType.RECYCLER
                                ? "Paid  "
                                : "Received  ",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: mRole == UserType.RECYCLER
                                      ? Colors.red
                                      : Colors.green.shade900,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          TextSpan(
                            text: "₹${order["product"]["amount"]}",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    color: mRole == UserType.RECYCLER
                                        ? Colors.red
                                        : Colors.green.shade900,
                                    fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                mRole == UserType.RECYCLER ? "PURCHASED" : "SOLD",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary),
              )
            ],
          ),
        ],
      ),
    );
  }
}
