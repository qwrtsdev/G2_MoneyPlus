import 'dart:io';
import 'package:flutter/material.dart';
import 'package:moneyplus_material/l10n/app_localizations.dart';
import 'amount_format.dart';

void showSlipImage(BuildContext context, Map<String, dynamic> item) {
  final imagePath = item['imagePath']?.toString() ?? '';
  final rawAmount = (item['amount'] ?? '').toString();
  final l10n = AppLocalizations.of(context)!;

  showDialog<void>(
    context: context,
    builder: (context) => Dialog(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: InteractiveViewer(
              child: Image.file(
                File(imagePath),
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(l10n.dashboard_image_not_found),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              rawAmount == 'Not Found'
                  ? l10n.common_amount_not_found
                  : l10n.dashboard_amount_read(formatAmountText(rawAmount)),
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.common_close),
          ),
        ],
      ),
    ),
  );
}
