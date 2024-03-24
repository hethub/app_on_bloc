import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../core/enum/ticket_enum.dart';
import '../bloc/book_ticket_bloc.dart';
import '../bloc/book_ticket_event.dart';
import '../bloc/book_ticket_state.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({super.key});

  void setTime(TicketDateTime time, BuildContext context) {
    int tiketTime = time
        .bookingDateTime(
            context.read<BookTicketBloc>().selectedDateController.text)
        .start
        .millisecondsSinceEpoch;
    // int tiketTime = context
    //         .read<BookTicketBloc>()
    //         .setDateTimeRange()
    //         ?.start
    //         .millisecondsSinceEpoch ??
    //     0;
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now < tiketTime) {
      context.read<BookTicketBloc>().add(SetDateTimeEvent(time));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Time over You Can\'t Booked!',
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookTicketBloc, BookTicketState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              readOnly: true,
              controller: context.read<BookTicketBloc>().selectedDateController,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));
                if (pickedDate != null) {
                  context.read<BookTicketBloc>().add(SetDateTimeEvent(null));
                  String formattedDate =
                      DateFormat('dd-MM-yyyy').format(pickedDate);

                  context.read<BookTicketBloc>().selectedDateController.text =
                      formattedDate;
                }
              },
              decoration: inputDecoration.copyWith(
                  labelText: 'Select Date',
                  suffixIcon: const Icon(Icons.calendar_month_outlined)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'Select Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                TicketDateTime.firstRow.length,
                (index) => InkWell(
                  onTap: () {
                    setTime(TicketDateTime.firstRow[index], context);
                  },
                  child: chipButton(TicketDateTime.firstRow[index],
                      context.read<BookTicketBloc>().selectedDateTime),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                TicketDateTime.secondRow.length,
                (index) => InkWell(
                  onTap: () {
                    setTime(TicketDateTime.secondRow[index], context);
                  },
                  child: chipButton(TicketDateTime.secondRow[index],
                      context.read<BookTicketBloc>().selectedDateTime),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Chip chipButton(TicketDateTime current, TicketDateTime? selected) {
    return Chip(
      labelPadding: EdgeInsets.zero,
      backgroundColor: current == selected ? Colors.red : null,
      label: Text(current.title),
    );
  }
}
