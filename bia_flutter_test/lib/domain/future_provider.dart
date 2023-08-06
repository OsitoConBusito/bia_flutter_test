part of 'domain.dart';

final FutureProvider<CharactersResponse> getCharactersFutureProvider =
    FutureProvider<CharactersResponse>(
  (final FutureProviderRef<CharactersResponse> ref) async {
    final Ordering filterRequest = ref.watch(filterProvider);
    return Service.instance.getCharacters(filterRequest);
  },
);
