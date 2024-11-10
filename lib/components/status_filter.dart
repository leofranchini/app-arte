import 'package:flutter/material.dart';

class StatusFilter extends StatelessWidget {
  final List<String> statuses;
  final String selectedStatus;
  final ValueChanged<String> onStatusSelected;

  StatusFilter({
    required this.statuses,
    required this.selectedStatus,
    required this.onStatusSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: statuses.map((status) {
        return ChoiceChip(
          label: Text(status),
          selected: selectedStatus == status,
          onSelected: (bool selected) {
            if (selected) {
              onStatusSelected(status);
            }
          },
        );
      }).toList(),
    );
  }
}
