part of 'domain.dart';

final StateProvider<Ordering> filterProvider = StateProvider<Ordering>(
  (final StateProviderRef<Ordering> ref) => Ordering.ascendName,
);
