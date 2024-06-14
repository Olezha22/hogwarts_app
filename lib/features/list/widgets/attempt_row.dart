import 'package:flutter/material.dart';
import 'package:hogwards_app/features/home/widgets/attempts_widget.dart';

class AttemptRow extends StatelessWidget {
  const AttemptRow({super.key, required this.success, required this.failed});

  final int? success, failed;

  @override
  Widget build(BuildContext context) {
    final total = (success ?? 0) + (failed ?? 0);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AttemptsWidget(text: total.toString(), subText: "Total"),
        AttemptsWidget(text: success?.toString() ?? '0', subText: "Success"),
        AttemptsWidget(text: failed?.toString() ?? '0', subText: "Failed"),
      ],
    );
  }
}
