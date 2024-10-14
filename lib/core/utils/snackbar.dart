import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1000),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
    ),
  );
}

void showErrorSnackBar(BuildContext context,
    {required String message, VoidCallback? onRetry}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 10),
      action: onRetry == null
          ? null
          : SnackBarAction(
              label: "Retry",
              onPressed: () {
                onRetry();
              },
            ),
    ),
  );
}
