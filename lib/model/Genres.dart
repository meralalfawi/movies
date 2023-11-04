class Genre {
  num id;
  String name ;
  Genre({
    required this.id,
    required this.name,
    });
  static List<Genre> getGenres() {
    return [
      Genre(
          id: 28,
        name: 'Action'
      ),
      Genre(
          id: 12,
          name: 'Adventure'
      ),
      Genre(
          id: 16,
          name: 'Animation'
      ),
      Genre(
          id: 35,
          name: 'Comedy'
      ),
      Genre(
          id: 80,
          name: 'Crime'
      ),
      Genre(
          id: 99,
          name: 'Documentary'
      ),
      Genre(
          id: 18,
          name: 'Drama'
      ),
      Genre(
          id: 10751,
          name: 'Family'
      ),
      Genre(
          id:14,
          name: 'Fantasy'
      ),
      Genre(
          id: 36,
          name: 'History'
      ),
      Genre(
          id: 27,
          name: 'Horror'
      ),
      Genre(
          id: 10402,
          name: 'Mystery'
      ),
      Genre(
          id: 10749,
          name: 'Romance'
      ),
      Genre(
          id: 878,
          name: 'Science Fiction'
      ),

    ];
  }
}
