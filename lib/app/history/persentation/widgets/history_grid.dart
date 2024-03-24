import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:local_storage/core/extension/date_time_extension.dart';
import '../../../../config/routes/paths.dart';
import '../bloc/local/local_history_bloc.dart';
import '../bloc/local/local_history_event.dart';
import '../bloc/local/local_history_sate.dart';

class HistoryGrid extends StatelessWidget {
  const HistoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalHistoryBloc, LocalHistoryState>(
      builder: (context, state) {
        if (state is LocalHistoryDone) {
          return GridView.builder(
            itemCount: state.searchHistoryEntitity!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (context, index) {
              final data = state.searchHistoryEntitity![index];

              return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: InkWell(
                  onLongPress: () {
                    context
                        .read<LocalHistoryBloc>()
                        .add(DeleteLocalHistoryEvent(id: data.movieId));
                  },
                  onTap: () {
                    context.pushNamed(
                      PTH.detail,
                      pathParameters: {
                        'movieId': data.movieId.toString(),
                      },
                    );
                  },
                  child: GridTile(
                    header: TileBar(
                      color: Colors.grey.shade800.withOpacity(0.5),
                      vericalTop: 16,
                      child: Text(
                        data.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.amber,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    footer: SizedBox(
                      height: 40,
                      child: TileBar(
                        vericalBottom: 16,
                        color: Colors.grey.shade800.withOpacity(0.5),
                        subTitle: Text(
                          data.searchAt.formatDateddMMMyy,
                          style: const TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                        child: const Text(
                          'Date',
                          style: TextStyle(
                              color: Colors.amber, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(data.url))),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is LocalHistoryEmpty) {
          return const Center(
            child: Text('Empty!'),
          );
        } else if (state is LocalHistoryNotFound) {
          return const Center(
            child: Text('Result Not Found!'),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class TileBar extends StatelessWidget {
  final double vericalTop;
  final double vericalBottom;
  final Color? color;
  final double? height;
  final Widget? child;
  final Widget? subTitle;

  const TileBar(
      {super.key,
      this.vericalTop = 0,
      this.vericalBottom = 0,
      this.color,
      this.height,
      this.child,
      this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(vericalTop),
          bottom: Radius.circular(vericalBottom),
        ),
      ),
      child: GridTileBar(
        title: child,
        subtitle: subTitle,
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:bloc/bloc.dart'; // Import from bloc package instead of flutter_bloc

// part 'form_validator_state.dart';

// class FormValidatorBloc extends Bloc<FormValidatorEvent, FormValidatorState> {
//   FormValidatorBloc() : super(const FormValidatorUpdate());

//   @override
//   Stream<FormValidatorState> mapEventToState(FormValidatorEvent event) async* {
//     if (event is InitFormEvent) {
//       yield* _mapInitFormEventToState(event);
//     } else if (event is UpdateFieldEvent) {
//       yield* _mapUpdateFieldEventToState(event);
//     } else if (event is ToggleObscureTextEvent) {
//       yield* _mapToggleObscureTextEventToState();
//     } else if (event is ResetFormEvent) {
//       yield const FormValidatorUpdate();
//     }
//   }

//   Stream<FormValidatorState> _mapInitFormEventToState(InitFormEvent event) async* {
//     yield state.copyWith(
//       email: event.email,
//       name: event.name,
//       address: event.address,
//       city: event.city,
//     );
//   }

//   Stream<FormValidatorState> _mapUpdateFieldEventToState(UpdateFieldEvent event) async* {
//     if (event.field == 'email') {
//       yield state.copyWith(email: event.value);
//     } else if (event.field == 'password') {
//       yield state.copyWith(password: event.value);
//     } else if (event.field == 'confirmPassword') {
//       yield state.copyWith(confirmPassword: event.value);
//     } else if (event.field == 'name') {
//       yield state.copyWith(name: event.value);
//     } else if (event.field == 'address') {
//       yield state.copyWith(address: event.value);
//     } else if (event.field == 'city') {
//       yield state.copyWith(city: event.value);
//     }
//   }

//   Stream<FormValidatorState> _mapToggleObscureTextEventToState() async* {
//     yield state.copyWith(obscureText: !state.obscureText);
//   }
// }
