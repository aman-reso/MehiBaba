import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/pages/bhajans/bhajan_manager.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../utility.dart';
import 'bhajan_list_response_entity.dart';

class CompleteBhajansScreen extends StatefulWidget {
  const CompleteBhajansScreen({Key? key}) : super(key: key);

  @override
  _CompleteBhajansScreenState createState() => _CompleteBhajansScreenState();
}

class _CompleteBhajansScreenState extends State<CompleteBhajansScreen> {
  late List<BhajanListResponseResult> popularList = [];

  @override
  void initState() {
    super.initState();
    BhajanManager.getAllBhajan().then((value) => {
          setState(() {
            popularList = value.result;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white, // Example background color
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
          "Bhajans",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 16.0,
          bottom: 16.0,
        ),
        itemCount: popularList.length,
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
        Navigator.pushNamed(context, '/storyDetail');
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
                    image: NetworkImage(Utility.concatBaseUrl(popularList[index]
                        .poster
                        .first
                        .response
                        .file
                        .filename)),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              popularList[index].poster.first.name,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
