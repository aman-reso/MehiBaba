import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/pages/category/category_manager.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:fl_audio_book/utility.dart';
import 'package:flutter/material.dart';

import '../home/model/home_page_response_model.dart';
import 'category_response.dart';

class CompleteCategoryScreen extends StatefulWidget {
  const CompleteCategoryScreen({Key? key}) : super(key: key);

  @override
  _CompleteCategoryScreenState createState() => _CompleteCategoryScreenState();
}

class _CompleteCategoryScreenState extends State<CompleteCategoryScreen> {
  List<CategoryResponse> categoryList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Call the API to fetch categories
    setState(() {
      isLoading = true;
    });
    CategoryManager.getAllCategory()
        .then((value) => {
              setState(() {
                categoryList = value.result;
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
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        foregroundColor: blackColor2,
        titleSpacing: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          getTranslate(context, 'famous_author.famous_authors'),
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(), // Loader
            )
          : GridView.builder(
              padding: const EdgeInsets.only(
                bottom: fixPadding * 2,
                left: fixPadding * 2,
                right: fixPadding * 2,
              ),
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: fixPadding * 3,
                mainAxisSpacing: fixPadding * 2,
                childAspectRatio: size.width / (size.height / 1.65),
              ),
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/newRelease');
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: size.height * 0.11,
                            width: size.height * 0.11,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  categoryList[index].image.isEmpty
                                      ? 'placeholder_image_path'
                                      : Utility.concatBaseUrl(
                                          categoryList[index]
                                              .image
                                              .first
                                              .response),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          categoryList[index].name,
                          style: bold14Black2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
