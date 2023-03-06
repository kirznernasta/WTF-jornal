import 'package:flutter/foundation.dart';
import 'package:graduation_project/models/event_card_model.dart';

@immutable
class ChatModel {
  final dynamic id;
  final int iconId;
  final String title;
  final String lastEventTitle;

  final List<EventCardModel> cards;

  const ChatModel({
    required this.iconId,
    required this.title,
    required this.id,
    required this.cards,
    this.lastEventTitle = 'No events. Click here to create one.',
  });

  ChatModel copyWith({
    dynamic newId,
    int? newIconId,
    String? newTitle,
    String? newLastEventTitle,
    List<EventCardModel>? newCards,
  }) {
    return ChatModel(
      id: newId ?? id,
      iconId: newIconId ?? iconId,
      title: newTitle ?? title,
      lastEventTitle: newLastEventTitle ?? lastEventTitle,
      cards: newCards ?? cards,
    );
  }
}
