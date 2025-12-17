class Podcast {
  final List<String> availableMarkets;
  final String description;
  final bool explicit;
  final String href;
  final List<Image> images;
  final List<String> languages;
  final String mediaType;
  final String name;
  final String publisher;
  final String uri;
  final int totalEpisodes;

  Podcast({
    this.availableMarkets = const [],
    this.description = '',
    this.explicit = false,
    this.href = '',
    this.images = const [],
    this.languages = const [],
    this.mediaType = '',
    this.name = '',
    this.publisher = '',
    this.uri = '',
    this.totalEpisodes = 0,
  });

  factory Podcast.fromJson(Map<String, dynamic> json) {
    return Podcast(
      availableMarkets: List<String>.from(json['available_markets'] ?? []),
      description: json['description'] ?? '',
      explicit: json['explicit'] ?? false,
      href: json['href'] ?? '',
      images: (json['images'] as List<dynamic>? ?? [])
          .map(
            (imageJson) => Image(
              url: imageJson['url'] ?? '',
              height: imageJson['height'] ?? 0,
              width: imageJson['width'] ?? 0,
            ),
          )
          .toList(),
      languages: List<String>.from(json['languages'] ?? []),
      mediaType: json['media_type'] ?? '',
      name: json['name'] ?? '',
      publisher: json['publisher'] ?? '',
      uri: json['uri'] ?? '',
      totalEpisodes: json['total_episodes'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'Podcast{name: $name, publisher: $publisher, totalEpisodes: $totalEpisodes}';
  }
}

class Copyright {
  final String text;
  final String type;

  Copyright({required this.text, required this.type});
}

class Episodes {
  final String href;
  final int limit;
  final String next;
  final int offset;
  final String previous;
  final int total;
  final List<Item> items;

  Episodes({
    required this.href,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
    required this.items,
  });
}

class Item {
  final String audioPreviewUrl;
  final String description;
  final String htmlDescription;
  final int durationMs;
  final bool explicit;
  final String href;
  final String id;
  final List<Image> images;
  final bool isExternallyHosted;
  final bool isPlayable;
  final String language;
  final List<String> languages;
  final String name;
  final DateTime releaseDate;
  final String releaseDatePrecision;
  final ResumePoint resumePoint;
  final String type;
  final String uri;

  Item({
    required this.audioPreviewUrl,
    required this.description,
    required this.htmlDescription,
    required this.durationMs,
    required this.explicit,
    required this.href,
    required this.id,
    required this.images,
    required this.isExternallyHosted,
    required this.isPlayable,
    required this.language,
    required this.languages,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.resumePoint,
    required this.type,
    required this.uri,
  });
}

class Image {
  final String url;
  final int height;
  final int width;

  Image({required this.url, required this.height, required this.width});
}

class ResumePoint {
  final bool fullyPlayed;
  final int resumePositionMs;

  ResumePoint({required this.fullyPlayed, required this.resumePositionMs});
}
