import 'package:creeartelo_challenge/global/event_colors.dart';
import 'package:creeartelo_challenge/models/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/event_view_model.dart';
import '../widgets/event_card.dart';

class FavoritesListView extends StatefulWidget {
  const FavoritesListView({super.key});

  @override
  State<FavoritesListView> createState() => _FavoritesListViewState();
}

class _FavoritesListViewState extends State<FavoritesListView> {
  List<Event> favorites = [];

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  void fetchFavorites() async {
    final viewModel = Provider.of<EventViewModel>(context, listen: false);
    final result = await viewModel.fetchFavoritesEvents();
    setState(() {
      favorites = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EventColors.roseWhite,
      appBar: AppBar(
        backgroundColor: EventColors.roseWhite,
        title: const Text('Favoritos'),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No tienes eventos favoritos.'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                return EventCard(event: favorites[index]);
              },
            ),
    );
  }
}
