part of 'summary_statistics_cubit.dart';

class SummaryStatisticsState {
  final List<Event> events;

  SummaryStatisticsState({
    this.events = const [],
  });

  SummaryStatisticsState copyWith({
    List<Event>? newEvents,
  }) =>
      SummaryStatisticsState(
        events: newEvents ?? events,
      );
}
