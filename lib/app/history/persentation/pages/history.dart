import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/local/local_history_bloc.dart';
import '../bloc/local/local_history_event.dart';
import '../widgets/history_grid.dart';
import '../widgets/search_field.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kToolbarHeight),
            const Text(
              'Search History',
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            const SizedBox(height: 8),
            SearchField(
              hintText: 'Search movies',
              onTextChanged: (searchQuery) {
                context
                    .read<LocalHistoryBloc>()
                    .add(GetLocalHistoryEvent(query: searchQuery));
              },
            ),
            const Expanded(child: HistoryGrid()),
          ],
        ),
      ),
    );
  }
}
