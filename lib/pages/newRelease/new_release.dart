import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/pages/newRelease/new_release_manager.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:fl_audio_book/utility.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'new_release_video_list_entity.dart';

class NewReleaseScreen extends StatefulWidget {
  const NewReleaseScreen({Key? key}) : super(key: key);

  @override
  _NewReleaseScreenState createState() => _NewReleaseScreenState();
}

class _NewReleaseScreenState extends State<NewReleaseScreen> {
  late List<NewReleaseVideoListResult> newreleaseList = [];
  late bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    NewReleaseManager.getAllNewReleaseVideo().then((value) {
      setState(() {
        isLoading = false;
        newreleaseList = value.result;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        // Example app bar color
        foregroundColor: Colors.black,
        // Example text color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Video',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              itemCount: newreleaseList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: size.width / (size.height / 1.4),
              ),
              itemBuilder: (BuildContext context, int index) {
                return _buildListItem(index, context);
              },
            ),
    );
  }

  Widget _buildListItem(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/ytPlayer',
            arguments: newreleaseList[index].youtubeUrl);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(Utility.createYoutubeThumbnail(
                        newreleaseList[index].youtubeUrl)),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Text(newreleaseList[index].title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
          ],
        ),
      ),
    );
  }
}
