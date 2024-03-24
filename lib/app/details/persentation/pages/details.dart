import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:local_storage/config/routes/paths.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../dep_injection.dart';
import '../bloc/details_bloc.dart';
import '../bloc/details_event.dart';
import '../bloc/details_state.dart';

class Details extends StatelessWidget {
  final String movieId;
  const Details({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (context) => sl()..add(GetDetailsEvent(movieId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movie Details'),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: BlocBuilder<DetailsBloc, MovieDetailsState>(
            builder: (context, state) {
              if (state is MovieDetailsLoading) {
                return const SizedBox.shrink();
              }
              return FloatingActionButton.extended(
                backgroundColor: Colors.white24,
                onPressed: () async {
                  // if (false) {
                  //   await showDialog(
                  //     context: context,
                  //     useRootNavigator: false,
                  //     builder: (ctx) => AlertDialog(
                  //       title: const Text("You Already Booked"),
                  //       content: const Text(
                  //           'Are you want to again Book this movie to press yes'),
                  //       actions: <Widget>[
                  //         TextButton(
                  //           onPressed: () {
                  //             context.pop();
                  //           },
                  //           child: Container(
                  //             padding: const EdgeInsets.all(14),
                  //             child: const Text("No"),
                  //           ),
                  //         ),
                  //         TextButton(
                  //           onPressed: () {
                  //             // Get.back();
                  //             // Get.toNamed(AppRoute.booking,
                  //             //     arguments: {'title': movieTitle, 'movieID': movieId});
                  //           },
                  //           child: Container(
                  //             padding: const EdgeInsets.all(14),
                  //             child: const Text("Yes"),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   );
                  // } else {
                  ({int movieId, String title, String url}) extra = (
                    movieId: state.detail!.id!,
                    title: state.detail!.title!,
                    url: '${AC.kDefaultImage}/${state.detail!.posterPath}'
                  );
                  context.pushNamed(PTH.bookTicket, extra: extra);
                  // }
                },
                label: const Text(
                  'Book Ticket',
                ),
              );
            },
          ),
        ),
        body: BlocBuilder<DetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is MovieDetailsError) {
              return const Center(child: Icon(Icons.refresh));
            }
            final data = state.detail!;
            return SingleChildScrollView(
              padding: const EdgeInsets.only(
                  top: 16, bottom: kBottomNavigationBarHeight + 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    alignment: AlignmentDirectional.topEnd,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: data.posterPath != null
                          ? DecorationImage(
                              image: NetworkImage(
                                  '${AC.kDefaultImage}/${data.posterPath}'),
                              fit: BoxFit.cover,
                            )
                          : const DecorationImage(
                              image: NetworkImage(AC.ifImageNull),
                              fit: BoxFit.cover,
                            ),
                    ),

                    /// TODO: locally store
                    // child: Icon(
                    //   controller.isTicketBooked != null
                    //       ? Icons.favorite
                    //       : Icons.favorite_outline,
                    //   color: Colors.red,
                    //   size: 45,
                    // ),
                    // child: const Icon(
                    //   Icons.favorite_outline,
                    //   color: Colors.red,
                    //   size: 45,
                    // ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      'Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title('Title : ', '${data.title}'),
                        const SizedBox(height: 20),
                        const Text(
                          'Overview',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text('${data.overview}'),
                        const SizedBox(height: 10),
                        title('Status : ', '${data.status}'),
                        title('Realesed Date : ', '${data.releaseDate}'),
                        const SizedBox(height: 10),
                        title('Budget : ',
                            '\$ ${data.budget != null ? (data.budget! / 1000000).toStringAsFixed(2) : '0'} M'),
                        title('Revenue : ',
                            '\$ ${data.revenue != null ? (data.revenue! / 1000000).toStringAsFixed(2) : '0'} M'),
                        title('Total Vote : ', '${data.voteCount}'),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  RichText title(String text1, String text2) {
    return RichText(
      text: TextSpan(
        // text: 'Title : ',
        text: text1,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        children: <TextSpan>[
          TextSpan(
            text: text2,
          ),
        ],
      ),
    );
  }
}
