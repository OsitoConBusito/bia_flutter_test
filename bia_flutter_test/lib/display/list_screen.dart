part of 'display.dart';

class ListScreen extends ConsumerWidget {
  const ListScreen({super.key});

  static const String route = '/';

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final AsyncValue<CharactersResponse> asyncData =
        ref.watch(getCharactersFutureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BIA Flutter Test'),
      ),
      body: asyncData.when(
        data: (final CharactersResponse charactersResponse) =>
            RefreshIndicator.adaptive(
          onRefresh: () async {
            ref.read(getCharactersFutureProvider);
          },
          child: ListView.separated(
            itemBuilder: (final BuildContext context, final int index) {
              final String imageUrl =
                  '''${charactersResponse.data!.results![index].thumbnail!.path!}.${charactersResponse.data!.results![index].thumbnail!.extension}''';

              return Container(
                margin: Paddings.padding8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(Sizes.small)),
                ),
                padding: Paddings.padding8,
                child: Row(
                  children: <Widget>[
                    ClipOval(
                      child: Image.network(
                        imageUrl,
                        height: Sizes.xLarge,
                        width: Sizes.xLarge,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: Sizes.medium),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          charactersResponse.data!.results![index].name!,
                        ),
                        Text(
                          charactersResponse.data!.results![index].id
                              .toString(),
                        )
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        //navigation
                      },
                      icon: const Icon(Icons.arrow_circle_right),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (final BuildContext context, final int index) =>
                const SizedBox(
              height: Sizes.small,
            ),
            itemCount: 10,
          ),
        ),
        error: (final Object error, final StackTrace stackTrace) =>
            const Center(
          child: Text('Ups lo siento tuvimos un error'),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
