import 'package:creeartelo_challenge/global/event_colors.dart';
import 'package:creeartelo_challenge/view_models/event_view_model.dart';
import 'package:creeartelo_challenge/views/favorites_list_view.dart';
import 'package:creeartelo_challenge/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventListView extends StatelessWidget {
  const EventListView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<EventViewModel>(context);

    return Scaffold(
      backgroundColor: EventColors.roseWhite,
      appBar: AppBar(
        backgroundColor: EventColors.roseWhite,
        title: const Text('Eventos App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoritesListView()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: EventSearchDelegate(viewModel),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: viewModel.events.length,
        itemBuilder: (context, index) {
          final event = viewModel.events[index];
          return EventCard(event: event);
        },
      ),
    );
  }
}

class EventSearchDelegate extends SearchDelegate {
  final EventViewModel viewModel;

  EventSearchDelegate(this.viewModel);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = viewModel.filteredEvents(query);
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].name),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = viewModel.filteredEvents(query);
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].name),
        );
      },
    );
  }
}
