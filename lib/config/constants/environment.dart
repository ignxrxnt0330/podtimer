import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String clientId = dotenv.env['spotify.client.id'] ?? '';
  static String clienSecret = dotenv.env['spotify.client.secret'] ?? '';
  static String scope =
      'user-library-read user-library-modify user-read-recently-played user-top-read user-read-playback-position user-follow-read user-follow-modify app-remote-control user-read-currently-playing user-modify-playback-state user-read-playback-state';
  static String redirectUri = 'podtimer://callback';

  // auth
  static String accountsBaseUrl = 'https://accounts.spotify.com/api';
  static String tokenUrl = '$accountsBaseUrl/token';

  // user
  static String userBaseUrl = 'https://api.spotify.com/v1/me';

  // shows
  static String userShowsUrl = '$userBaseUrl/shows';

  // podcast
  static String podcastUrl = 'https://api.spotify.com/v1/shows';
}
