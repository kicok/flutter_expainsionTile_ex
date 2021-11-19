import 'package:flutter/material.dart';
import 'package:flutter_expansion_tile/models/pixabay_photo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PixabayOneScreen extends StatefulWidget {
  const PixabayOneScreen({Key? key}) : super(key: key);

  @override
  State<PixabayOneScreen> createState() => _PixabayOneScreenState();
}

class _PixabayOneScreenState extends State<PixabayOneScreen> {
  static const String pixaBayKey = "17368288-b20c3369024b51a2e1df52944";
  final List<dynamic> _photos = [];

  @override
  void initState() {
    super.initState();
    getPixabayPhotos();
  }

  Future<void> getPixabayPhotos() async {
    try {
      const String url =
          "https://pixabay.com/api/?key=$pixaBayKey&q=yellow+flowers&image_type=photo";
      final http.Response response = await http.get(Uri.parse(url));
      final items = json.decode(response.body)['hits'];

      items.forEach((item) {
        final newPhoto = PixabayPhoto.fromJson(item);
        _photos.add(newPhoto);
      });
      setState(() {});
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("one"),
      ),
      body: ListView.builder(
          itemCount: _photos.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.network(
                  _photos[index].webformatURL,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                ExpansionTile(
                  key: PageStorageKey<int>(_photos[index].id),
                  leading: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(_photos[index].userImageURL),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(
                          _photos[index].stat.views > 100000
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                  title: Text(_photos[index].user),
                  children: [
                    ListTile(
                      title: Text(
                          'size: ${_photos[index].webformatWidth} x ${_photos[index].webformatHeight}'),
                    ),
                    ExpansionTile(
                      key: PageStorageKey<int>(_photos[index].id),
                      title: const Text('stats'),
                      children: [
                        ListTile(
                          title: Text('views: ${_photos[index].stat.views}'),
                        ),
                        ListTile(
                          title: Text('likes: ${_photos[index].stat.likes}'),
                        ),
                        ListTile(
                          title: Text(
                              'downloads: ${_photos[index].stat.downloads}'),
                        ),
                        ListTile(
                          title:
                              Text('comments: ${_photos[index].stat.comments}'),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            );
          }),
    );
  }
}
