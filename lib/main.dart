import 'package:creeartelo_challenge/view_models/event_view_model.dart';
import 'package:creeartelo_challenge/views/event_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EventViewModel()..fetchEvents(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Creeartelo Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const EventListView(),
      ),
    );
  }
}
