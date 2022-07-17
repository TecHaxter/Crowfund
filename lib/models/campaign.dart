class Campaign {
  String? name;
  String? provider;
  List<String>? images;
  List<String>? category;
  double? target;
  double? raised;
  String? location;
  String? about;
  bool? liked;

  Campaign({
    this.name,
    this.provider,
    this.images,
    this.category,
    this.target,
    this.raised,
    this.location,
    this.about,
    this.liked,
  });

  Campaign.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    provider = json['provider'];
    images = json['image'];
    category = json['category'].cast<String>();
    target = json['target'];
    raised = json['raised'];
    location = json['location'];
    about = json['about'];
    liked = json['liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['provider'] = provider;
    data['image'] = images;
    data['category'] = category;
    data['target'] = target;
    data['raised'] = raised;
    data['location'] = location;
    data['about'] = about;
    data['liked'] = liked;
    return data;
  }
}

final List<Campaign> campaigns = [
  Campaign(
    name: 'Early Childhood Education',
    provider: 'Merit Education',
    images: [
      'https://borgenproject.org/wp-content/uploads/ceria.jpg',
      'https://thumbs.dreamstime.com/b/two-silhouettes-child-sunset-background-against-sky-children-jump-setting-sun-127908855.jpg',
      'https://c.stocksy.com/a/CdN700/z9/1759138.jpg',
      'https://previews.123rf.com/images/zurijeta/zurijeta1205/zurijeta120500364/13676476-children-running-on-meadow-at-sunset.jpg',
      'https://cdn.pixabay.com/photo/2019/09/16/08/13/children-4480257_960_720.jpg'
    ],
    category: ['Education', 'Children'],
    target: 280.34,
    raised: 170.32,
    location: 'Jakarta, Indonesia',
    about:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    liked: true,
  ),
  Campaign(
    name: 'Cancer Care Fund',
    provider: 'Ecoli Health',
    images: [
      'https://dam.northwell.edu/m/17cf8e9e072b8c68/Drupal-web_GettyImages-110883286.jpg',
      'https://cdn.pixabay.com/photo/2019/09/16/08/13/children-4480257_960_720.jpg'
    ],
    category: ['Health', 'Cancer'],
    target: 678.34,
    raised: 247.32,
    location: 'Mumbai, India',
    about:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    liked: false,
  ),
  Campaign(
    name: 'Water Reinforcement',
    provider: 'Mother Nature Foundation',
    images: [
      'https://news.cgtn.com/news/2020-10-19/Water-crisis-in-Africa-Scarcity-amidst-abundance-UGMXwgwhkA/img/be8abfa0e26c45019ef60f23bc92ec59/be8abfa0e26c45019ef60f23bc92ec59-250.png',
      'https://cdn-stream.httpid.com/c248/wp-content/uploads/2014/02/CharityWater-Julian-Lennon.jpg',
      'https://cdn.pixabay.com/photo/2019/09/16/08/13/children-4480257_960_720.jpg'
    ],
    category: ['Nature', 'Water'],
    target: 530.22,
    raised: 442.82,
    location: 'Ghana',
    about:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    liked: true,
  )
];
