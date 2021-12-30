import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/bloc/post_bloc.dart';
import 'package:infinite_list/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => PostBloc()..add(GetAllPost()),
        child: HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
