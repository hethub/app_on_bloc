import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../auth/persentation/bloc/auth_block.dart';
import '../../data/models/ticket_detail_model.dart';
import '../bloc/book_ticket_bloc.dart';
import '../bloc/book_ticket_event.dart';
import '../bloc/book_ticket_state.dart';
import '../widgets/date_time_picker.dart';

class BookTicket extends StatefulWidget {
  final String title;
  final String url;
  final int movieId;
  const BookTicket(
      {required this.title,
      required this.movieId,
      required this.url,
      super.key});

  static const SizedBox space = SizedBox(height: 15);

  @override
  State<BookTicket> createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController customerNameContoller = TextEditingController();
  final TextEditingController customerEmailController = TextEditingController();
  final TextEditingController constactNumberContoller = TextEditingController();
  final TextEditingController selectedDateController = TextEditingController();
  late TicketDetailModel ticketDetail;

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required*';
    }
    return null;
  }

  @override
  void initState() {
    ticketDetail = TicketDetailModel(
        movieID: widget.movieId,
        customerName: '',
        email: '',
        customerID: 0,
        contactNumber: 0,
        movieTitle: widget.title,
        movieStartTime: 0,
        movieEndTime: 0,
        url: widget.url);
    customerEmailController.text =
        context.read<AuthBloc>().userCredentials?.email ?? '';

    ticketDetail = ticketDetail.copyWith(
        customerID: context.read<AuthBloc>().userCredentials!.userId);
    super.initState();
  }

  @override
  void dispose() {
    customerNameContoller.dispose();
    customerEmailController.dispose();
    constactNumberContoller.dispose();
    selectedDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Book Ticket'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    BookTicket.space,
                    Center(
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    BookTicket.space,
                    TextFormField(
                      controller: customerNameContoller,
                      validator: validator,
                      onSaved: (value) {
                        ticketDetail = ticketDetail.copyWith(
                          customerName: customerNameContoller.text.trim(),
                        );
                      },
                      decoration:
                          inputDecoration.copyWith(labelText: 'Customer Name'),
                    ),
                    BookTicket.space,
                    TextFormField(
                      readOnly: true,
                      validator: validator,
                      controller: customerEmailController,
                      onSaved: (value) {
                        ticketDetail = ticketDetail.copyWith(
                          email: customerEmailController.text,
                        );
                      },
                      keyboardType: TextInputType.number,
                      decoration:
                          inputDecoration.copyWith(labelText: 'Customer Email'),
                    ),
                    BookTicket.space,
                    TextFormField(
                      controller: constactNumberContoller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required*';
                        } else if (value.length != 10) {
                          return 'Contact Number must be 10 digits';
                        }
                        return null;
                      },
                      maxLength: 10,
                      onSaved: (value) {
                        ticketDetail = ticketDetail.copyWith(
                          contactNumber:
                              int.tryParse(constactNumberContoller.text),
                        );
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: inputDecoration.copyWith(
                          labelText: 'Contact Number', counterText: ""),
                    ),
                    BookTicket.space,
                    TextFormField(
                      readOnly: true,
                      onSaved: (value) {},
                      validator: validator,
                      initialValue: widget.title,
                      decoration: inputDecoration.copyWith(
                        labelText: 'Movie Title',
                      ),
                    ),
                    BookTicket.space,
                  ],
                ),
              ),
              const DateTimePicker(),
              BookTicket.space,
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    if (context.read<BookTicketBloc>().selectedDateTime ==
                        null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Select Time!',
                        ),
                        backgroundColor: Colors.red,
                      ));
                    } else {
                      final dt =
                          context.read<BookTicketBloc>().setDateTimeRange();
                      ticketDetail = ticketDetail.copyWith(
                        movieStartTime: dt!.start.millisecondsSinceEpoch,
                        movieEndTime: dt.end.millisecondsSinceEpoch,
                      );
                      context.read<BookTicketBloc>().add(
                            InsertTicketEvent(
                              ticketDetailEntity: ticketDetail,
                            ),
                          );
                    }
                  }
                },
                child: BlocListener<BookTicketBloc, BookTicketState>(
                  listener: (context, state) {
                    if (state is TicketDetailState) {
                      context.pop();
                    } else if (state is BookTicketErrorState) {
                      print('error');
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'Book Again',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
