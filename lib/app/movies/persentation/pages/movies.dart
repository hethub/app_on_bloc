import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:local_storage/app/auth/persentation/bloc/auth_event.dart';
import 'package:local_storage/app/auth/persentation/bloc/auth_state.dart';
import 'package:local_storage/config/routes/paths.dart';
import '../../../auth/persentation/bloc/auth_block.dart';
import '../bloc/movies_bloc.dart';
import '../bloc/movies_state.dart';
import '../widgets/movie_listing.dart';

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (_, state) {
          if (state is MoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MoviesError) {
            return const Center(child: Icon(Icons.refresh));
          }
          if (state is MoviesDone) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.black,
                  floating: true,
                  pinned: true,
                  snap: false,
                  centerTitle: false,
                  title: const Text(
                    'TMDB',
                    style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 1.1,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: BlocListener<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is SignOutState) {
                            context.go(PTH.signIn);
                          }
                        },
                        child: IconButton(
                          onPressed: () async {
                            context.read<AuthBloc>().add(const SignOutEvent());
                          },
                          icon: const Icon(Icons.logout),
                        ),
                      ),
                    )
                  ],
                  bottom: AppBar(
                    backgroundColor: Colors.black,
                    title: InkWell(
                      onTap: () {
                        context.pushNamed(PTH.search);
                      },
                      child: Container(
                          width: double.infinity,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border:
                                  Border.all(width: 0.5, color: Colors.white)),
                          child: const Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text(
                                'Search movies',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 18),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    List.generate(
                      state.movies!.length,
                      (index) => MovieListing(
                        result: state.movies![index],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
