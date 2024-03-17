import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/pages/ebooks/ebook_manager.dart';
import 'package:fl_audio_book/pages/home/model/home_page_response_model.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:fl_audio_book/utility.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class EbookListScreen extends StatefulWidget {
  const EbookListScreen({Key? key}) : super(key: key);

  @override
  _EbookListScreenState createState() => _EbookListScreenState();
}

class _EbookListScreenState extends State<EbookListScreen> {
  late List<Ebook> eBookList = [];
  late bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    EbookManager.getAllEBooks()
        .then((value) => {
              setState(() {
                eBookList = value.result;
                isLoading = false;
              })
            })
        .catchError((onError) => {
              setState(() {
                isLoading = false;
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
          "Ebooks",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(), // Loader
            )
          : GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              itemCount: eBookList.length,
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
        Navigator.pushNamed(context, '/storyDetail',
            arguments: eBookList[index]);
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
                    image: NetworkImage(Utility.extractImageUrl(
                        eBookList[index].posterImage.first.response)),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              eBookList[index].title,
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
