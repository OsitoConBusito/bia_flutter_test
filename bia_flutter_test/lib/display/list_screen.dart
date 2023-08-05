part of 'display.dart';

class ListScreen extends ConsumerStatefulWidget {
  const ListScreen({super.key});

  static const String route = '/';

  @override
  ConsumerState<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends ConsumerState<ListScreen> {
  @override
  Widget build(final BuildContext context) {
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
            ref.invalidate(getCharactersFutureProvider);
          },
          child: ListView.separated(
            itemBuilder: (final BuildContext context, final int index) {
              final String imageUrl =
                  '''${charactersResponse.data!.results![index].thumbnail!.path!}.${charactersResponse.data!.results![index].thumbnail!.extension}''';

              final Result result = charactersResponse.data!.results![index];
              return InkWell(
                onTap: () async => context.pushNamed(
                  DetailScreen.route,
                  extra: result,
                ),
                child: Container(
                  margin: Paddings.padding8,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(Sizes.small)),
                  ),
                  padding: Paddings.padding8,
                  child: Row(
                    children: <Widget>[
                      Hero(
                        tag: result.id!,
                        child: ClipOval(
                          child: Image.network(
                            imageUrl,
                            height: Sizes.xLarge,
                            width: Sizes.xLarge,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: Sizes.medium),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(result.name!),
                          Text(result.id.toString())
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: Paddings.padding8,
                        child: Icon(Icons.arrow_circle_right),
                      )
                    ],
                  ),
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
