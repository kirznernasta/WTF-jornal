import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/event.dart';
import '../../../repositories/event_repository.dart';
import '../../../services/statistics_util.dart';

part 'summary_statistics_state.dart';

class SummaryStatisticsCubit extends Cubit<SummaryStatisticsState> {
  final EventRepository _eventsRepository;
  late final StreamSubscription<List<Event>> _eventsSubscription;

  SummaryStatisticsCubit({required EventRepository eventsRepository})
      : _eventsRepository = eventsRepository,
        super(SummaryStatisticsState()) {
    _initSubscription();
  }

  void _initSubscription() {
    _eventsSubscription = _eventsRepository.eventsStream.listen(
      (events) async {
        emit(
          state.copyWith(
            newEvents: events,
          ),
        );
      },
    );
  }

  void updateEvents(List<Event> filteredEvents) => emit(
        state.copyWith(
          newEvents: filteredEvents,
        ),
      );

  List<int> summaryStatistics(String timeOption) =>
      StatisticsUtil.calculateSummaryStatistics(state.events, timeOption);

  int maxY(String timeOption) {
    if (chartsStatistics(timeOption).isNotEmpty) {
      final values = chartsStatistics(timeOption)
          .map((dayStat) => dayStat.getRange(1, dayStat.length).reduce(max));
      return values.reduce(max) + 1;
    }
    return 10;
  }

  List<List<int>> chartsStatistics(String timeOption) {
    final sortedEvents = List<Event>.from(state.events)
      ..sort((event_1, event_2) => event_1.time.compareTo(event_2.time));
    return StatisticsUtil.calculateChartsStatistics(sortedEvents, timeOption);
  }
}
