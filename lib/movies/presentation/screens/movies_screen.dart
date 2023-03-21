import 'package:clean/movies/presentation/controller/movies_bloc.dart';
import 'package:clean/movies/presentation/controller/movies_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/movies_state.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MoviesBloc()..add(GetNowPlayingMoviesEvent());
      },
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return const Scaffold();
        },
      ),
    );
  }
}
