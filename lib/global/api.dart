import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube/models/video.dart';

const KEY = 'AIzaSyBBSr-tm5YAY9yVenqqcCqpHRlrK64iw6s';
const ID_CHANNEL = 'UCVHFbqXqoYvEWM1Ddxl0QDg'; //&channelId=$ID_CHANNEL
const BASE_URL = 'https://www.googleapis.com/youtube/v3/';

class Api {

  Future<List<Video>> search(String? search) async {
    http.Response response = await http.get(Uri.parse('${BASE_URL}search?part=snippet&type=video&maxResults=20&order=date&key=$KEY&q=$search'));
    List<Video> videos = List.empty(growable: true);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      videos = data['items'].map<Video>((video) => Video.fromJson(video)).toList();
    }
    
    return videos;
  }

}