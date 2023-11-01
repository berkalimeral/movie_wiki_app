import 'package:http/http.dart' as https;
import 'package:uni_society_app/core/constants/api_const.dart';
import 'package:uni_society_app/products/network/network_values.dart';

class MovieService {
  Future<void> getNowPlayingMovies() async {
    https.get(
        Uri(
            scheme: 'https',
            host: nowPlayingMovie,
            path: EndPointsMovie.nowPlaying,
            queryParameters: {
              'language': 'tr-TR',
              'page': '1',
            }),
        headers: {
          'Authorization': apiReadAccessToken,
        });
  }
}
