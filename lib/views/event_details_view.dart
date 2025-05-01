import 'package:cached_network_image/cached_network_image.dart';
import 'package:creeartelo_challenge/global/event_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/event.dart';
import '../view_models/event_view_model.dart';

class EventDetailsView extends StatelessWidget {
  final Event event;

  const EventDetailsView({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<EventViewModel>(context);

    return Scaffold(
      backgroundColor: EventColors.roseWhite,
      appBar: AppBar(
        backgroundColor: EventColors.roseWhite,
        title: Text(event.name),
        actions: [
          IconButton(
            icon: Icon(
              event.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.redAccent,
            ),
            onPressed: () {
              viewModel.toggleFavorite(event);
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: event.urlImage,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.broken_image),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            event.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 20),
              const SizedBox(width: 8),
              Text(
                '${event.date.toLocal()}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.place, size: 20),
              const SizedBox(width: 8),
              Text(
                'Lat: ${event.lat.toStringAsFixed(2)}, Lng: ${event.long.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Descripción',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            event.description,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
