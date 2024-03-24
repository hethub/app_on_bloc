import 'package:flutter/material.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../dep_injection.dart';

class SearchField extends StatefulWidget {
  final String hintText;

  /// 1 Sec Debouncer
  /// =
  final void Function(String) onTextChanged;
  const SearchField({
    super.key,
    required this.hintText,
    required this.onTextChanged,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: (value) {
        sl<Debouncer>().run(
          () {
            widget.onTextChanged(searchController.text.trim());
          },
        );
      },
      decoration: inputDecoration.copyWith(
        hintText: widget.hintText,
        labelStyle: const TextStyle(color: Colors.amber),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
