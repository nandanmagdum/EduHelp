import 'package:flutter/material.dart';

class DonationRequestCard extends StatelessWidget {
  final String title;
  final int amount;
  final String description;
  const DonationRequestCard({
    super.key,
    required this.title,
    required this.amount,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      trailing: Text(amount.toString()),
    );
  }
}
