import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:local_storage/core/utils/debouncer.dart';
import '../../../../config/routes/paths.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../dep_injection.dart';
import '../../../history/domain/entities/search_history_entitiy.dart';
import '../../../history/persentation/bloc/local/local_history_bloc.dart';
import '../../../history/persentation/bloc/local/local_history_event.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_event.dart';
import '../bloc/search_state.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late final TextEditingController searchController;
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    searchController = TextEditingController();
    focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (_) => sl<SearchBloc>(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Container(
            height: 40,
            color: Colors.transparent,
            child: Builder(builder: (context) {
              return TextField(
                focusNode: focusNode,
                controller: searchController,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  isDense: false,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.amber,
                    ),
                  ),
                  prefixIcon: const InkWell(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  hintText: 'Search Movies...',
                ),
                onChanged: (value) {
                  sl<Debouncer>().run(() {
                    context
                        .read<SearchBloc>()
                        .add(ONSearchEvent(query: searchController.text));
                  });
                },
              );
            }),
          ),
        ),
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Empty) {
              return const Center(
                child: Text('Enter text to search movies!'),
              );
            } else if (state is Error) {
              return Center(
                child: Text('${state.error?.message}'),
              );
            } else if (state is Done) {
              return ListView.builder(
                  itemCount: state.result!.length,
                  itemBuilder: (_, index) {
                    final url = state.result![index].image.isNotEmpty
                        ? AC.kDefaultImage + state.result![index].image
                        : AC.ifImageNull;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: Colors.white, width: 0.5)),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(url),
                          ),
                          title: Text(state.result![index].title),
                          onTap: () {
                            context.goNamed(
                              PTH.detail,
                              pathParameters: {
                                'movieId':
                                    state.result![index].movieId.toString(),
                              },
                            );
                            context.read<LocalHistoryBloc>().add(
                                  SaveLocalHistoryEvent(
                                    searchHistoryEntitity:
                                        SearchHistoryEntitity(
                                      movieId: state.result![index].movieId,
                                      title: state.result![index].title,
                                      searchAt:
                                          DateTime.now().millisecondsSinceEpoch,
                                      url: url,
                                    ),
                                  ),
                                );
                          },
                        ),
                      ),
                    );
                  });
            }
            return const Center(child: Text('Not Found'));
          },
        ),
      ),
    );
  }
}
