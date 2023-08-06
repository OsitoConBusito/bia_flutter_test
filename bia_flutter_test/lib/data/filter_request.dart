enum Ordering {
  ascendName(name: 'name'),
  descendName(name: '-name');

  const Ordering({required this.name});

  final String name;
}

class FilterRequest {
  FilterRequest({
    this.orderBy = Ordering.ascendName,
  });

  final Ordering orderBy;
}
