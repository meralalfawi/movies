class Genre {
  num id;
  String name ;
  String imageUrl ;
  Genre({
    required this.id,
    required this.name,
    required this.imageUrl
    });
  static List<Genre> getGenres() {
    return [
      Genre(
          id: 28,
        name: 'Action' ,
        imageUrl: 'assets/images/action.png'
      ),
      Genre(
          id: 12,
          name: 'Adventure',
          imageUrl: 'assets/images/adventure.jpg'
      ),
      Genre(
          id: 16,
          name: 'Animation'
          , imageUrl: 'assets/images/animation.png'
      ),
      Genre(
          id: 35,
          name: 'Comedy'
          , imageUrl: 'assets/images/comedy.jpg'
      ),
      Genre(
          id: 80,
          name: 'Crime'
          , imageUrl: 'assets/images/crime.jpg'
      ),
      Genre(
          id: 99,
          name: 'Documentary'
          , imageUrl: 'assets/images/documentary.jpg'
      ),
      Genre(
          id: 18,
          name: 'Drama'
          , imageUrl: 'assets/images/drama.jpg'
      ),
      Genre(
          id: 10751,
          name: 'Family'
          , imageUrl: 'assets/images/family.jpg'
      ),
      Genre(
          id:14,
          name: 'Fantasy'
          , imageUrl: 'assets/images/action.png'
      ),
      Genre(
          id: 36,
          name: 'History'
          , imageUrl: 'assets/images/action.png'
      ),
      Genre(
          id: 27,
          name: 'Horror'
          , imageUrl: 'assets/images/action.png'
      ),
      Genre(
          id: 10402,
          name: 'Mystery'
          , imageUrl: 'assets/images/action.png'
      ),
      Genre(
          id: 10749,
          name: 'Romance'
          , imageUrl: 'assets/images/action.png'
      ),
      Genre(
          id: 878,
          name: 'Science Fiction'
          , imageUrl: 'assets/images/action.png'
      ),

    ];
  }
}
