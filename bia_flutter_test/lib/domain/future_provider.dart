part of 'domain.dart';

final FutureProvider<CharactersResponse> getCharactersFutureProvider =
    FutureProvider<CharactersResponse>(
  (final FutureProviderRef<CharactersResponse> ref) async =>
      Service.instance.getCharacters(),
);
