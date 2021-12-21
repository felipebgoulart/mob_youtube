import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube/global/api.dart';
import 'package:youtube/models/video.dart';

class Home extends StatefulWidget {
  final String? search;
  
  Home({
    Key? key,
    this.search = ''
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? search = '';

  _listVideos() {
    search = widget.search;
    Api api = Api();
    return api.search(search);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listVideos(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  
                  List<Video> videos = snapshot.data;
                  Video video = videos[index];

                  return GestureDetector(
                    onTap: () {
                      FlutterYoutube.playYoutubeVideoById(
                        apiKey: KEY,
                        videoId: video.id,
                        fullScreen: true,
                        autoPlay: true
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.image)
                            )
                          )
                        ),
                        ListTile(
                          title: Text(video.title),
                          subtitle: Text(video.channel),
                        )
                      ],
                    )
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Divider(height: 3),
                  );
                },
                itemCount: snapshot.data.length
              );
            } else {
              return Center(
                child: Text('Nenhum dado a ser exibido!'),
              );
            }
        }
      }
    );
  }
}