part of 'display.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    required this.result,
    super.key,
  });

  static const String route = 'detail';

  final Result result;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticInOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final String imageUrl =
        '''${widget.result.thumbnail!.path!}.${widget.result.thumbnail!.extension}''';
    return Scaffold(
      body: CustomScrollView(
        physics: const ScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.result.id!,
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      imageUrl,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
              title: Text(
                widget.result.name!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  shadows: <Shadow>[
                    Shadow(color: Colors.black, blurRadius: 10),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: Sizes.medium,
                ),
                Padding(
                  padding: Paddings.padding24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SlideTransition(
                        position: _offsetAnimation,
                        child: Text(
                          widget.result.description ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: Sizes.medium,
                      ),
                      Text(
                        'Comics:',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.primaries[1],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.builder(
                        padding: Paddings.padding8,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.result.comics!.items!.length,
                        itemBuilder: (final BuildContext context,
                                final int index) =>
                            Text(
                                '* ${widget.result.comics!.items![index].name}'),
                      ),
                      const SizedBox(
                        height: Sizes.medium,
                      ),
                      Text(
                        'Stories:',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.primaries[1],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.builder(
                        padding: Paddings.padding8,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.result.stories!.items!.length,
                        itemBuilder: (final BuildContext context,
                                final int index) =>
                            Text(
                                '* ${widget.result.stories!.items![index].name}'),
                      ),
                      const SizedBox(
                        height: Sizes.medium,
                      ),
                      Text(
                        'Series:',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.primaries[1],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.builder(
                        padding: Paddings.padding8,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.result.series!.items!.length,
                        itemBuilder: (final BuildContext context,
                                final int index) =>
                            Text(
                                '* ${widget.result.series!.items![index].name}'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
