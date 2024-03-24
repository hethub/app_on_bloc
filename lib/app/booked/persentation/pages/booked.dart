import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:local_storage/core/extension/date_time_extension.dart';
import '../../../../config/routes/paths.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../dep_injection.dart';
import '../../../book_ticket/domain/entities/ticket_detail_entity.dart';
import '../../../book_ticket/persentation/bloc/book_ticket_bloc.dart';
import '../../../book_ticket/persentation/bloc/book_ticket_event.dart';
import '../../../book_ticket/persentation/bloc/book_ticket_state.dart';

class Booked extends StatefulWidget {
  const Booked({super.key});

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {
  final TextEditingController _serchController = TextEditingController();

  @override
  void dispose() {
    _serchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookTicketBloc, BookTicketState>(
        builder: (context, state) {
          if (state is TicketsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookTicketErrorState) {
            return const Center(child: Text('Something went wrrong!'));
          } else if (state is TicketDetailState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kToolbarHeight),
                  const Text(
                    'All previously booked movies',
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _serchController,
                    onChanged: (value) {
                      sl<Debouncer>().run(
                        () {
                          context.read<BookTicketBloc>().add(
                                GetTicketsDetailEvent(
                                    query: _serchController.text.trim()),
                              );
                        },
                      );
                    },
                    decoration: inputDecoration.copyWith(
                      hintText: 'Search booked movies',
                      labelStyle: const TextStyle(color: Colors.amber),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                  if (state.tickets.isEmpty)
                    const Flexible(
                        child: Center(child: Text('No Data Found!'))),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 8),
                      itemCount: state.tickets.length,
                      itemBuilder: (context, index) {
                        return TicketContainer(data: state.tickets[index]);
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          return const Center(
            child: Text('Error!'),
          );
        },
      ),
    );
  }
}

class TicketContainer extends StatelessWidget {
  const TicketContainer({
    super.key,
    required this.data,
  });

  final TicketDetailEntity data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          PTH.detail,
          pathParameters: {
            'movieId': data.movieID.toString(),
          },
        );
      },
      child: Container(
        height: 100.h,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Image.network(data.url),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.movieTitle,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.amber,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'For : ${data.customerName}',
                  style: TextStyle(fontSize: 16, color: Colors.red.shade100),
                ),
                Text(
                  'Show : ${data.movieStartTime.formatDateddMMMyy}',
                  style: TextStyle(fontSize: 16, color: Colors.red.shade100),
                ),
                Text(
                  'Mob No : ${data.contactNumber}',
                  style: TextStyle(fontSize: 16, color: Colors.red.shade100),
                ),
              ],
            ),
            Expanded(
              child: IconButton(
                onPressed: () {
                  context
                      .read<BookTicketBloc>()
                      .add(DeleteMovieEvent(movieId: data.movieID));
                },
                icon: const Icon(Icons.delete, size: 32, color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
