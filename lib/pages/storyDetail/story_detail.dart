import 'package:fl_audio_book/localization/localization_const.dart';
import 'package:fl_audio_book/pages/home/model/home_page_response_model.dart';
import 'package:fl_audio_book/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../theme/theme.dart';
import '../../utility.dart';

class StoryDetailScreen extends StatefulWidget {
  final Ebook ebook; // Declare ebook as a non-nullable property

  const StoryDetailScreen(this.ebook, {Key? key}) : super(key: key);

  @override
  State<StoryDetailScreen> createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  final reviewList = [];

  bool isFavorite = false;
  late Ebook? ebook;

  @override
  void initState() {
    super.initState();
    ebook = widget.ebook;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: false,
            backgroundColor: backgroundColor,
            foregroundColor: blackColor2,
            elevation: 0,
            expandedHeight: size.height * 0.59,
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              shareIconButton(context, size),
              favoriteIconButton(context),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  topImageBox(size),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                heightSpace,
                heightSpace,
                description(),
                heightSpace,
                heightSpace,
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: bottomNavigation(size),
    );
  }

  favoriteIconButton(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(fixPadding),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: blackColor,
            content: Text(
              isFavorite
                  ? getTranslate(context, 'favorite.add_book')
                  : getTranslate(context, 'favorite.remove_book'),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: whiteColor,
              ),
            ),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(milliseconds: 1500),
          ),
        );
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: 22,
        color: blackColor2,
      ),
    );
  }

  shareIconButton(BuildContext context, Size size) {
    return IconButton(
      padding: const EdgeInsets.symmetric(vertical: fixPadding, horizontal: 1),
      onPressed: () {
        shareBottomSheet(context, size);
      },
      icon: const Icon(
        Icons.share_outlined,
        size: 22,
        color: blackColor2,
      ),
    );
  }

  bottomNavigation(Size size) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
          horizontal: fixPadding * 2, vertical: fixPadding),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: grey94Color.withOpacity(0.3),
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        children: [
          buttonWidget(size, getTranslate(context, 'story_detail.read'), () {
            Navigator.pushNamed(context, '/reading',arguments: widget.ebook);
          }),
          widthSpace,
          widthSpace,
        ],
      ),
    );
  }

  buttonWidget(Size size, String text, Function() onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: fixPadding / 2),
          height: size.height * 0.07,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: grey94Color.withOpacity(0.2),
                blurRadius: 24,
                offset: const Offset(12, 12),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: FittedBox(
            child: Text(
              text,
              style: bold18White,
            ),
          ),
        ),
      ),
    );
  }

  shareBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(fixPadding * 2),
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getTranslate(context, 'story_detail.share_via'),
                style: bold18Black2,
              ),
              heightSpace,
              heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  socialOption(context, size,
                      "assets/storyDetail/facebook 1.png", "Facebook"),
                  socialOption(context, size,
                      "assets/storyDetail/whatsapp 1.png", "WhatsApp"),
                  socialOption(context, size,
                      "assets/storyDetail/instagram 1.png", "Instagram"),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  socialOption(BuildContext context, Size size, String image, String name) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Column(
        children: [
          Image.asset(
            image,
            height: size.height * 0.045,
            width: size.height * 0.045,
            fit: BoxFit.cover,
          ),
          height5Space,
          Text(
            name,
            style: regular17Black2,
          )
        ],
      ),
    );
  }

  description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getTranslate(context, 'story_detail.description'),
            style: bold18Black2,
          ),
          height5Space,
          ReadMoreText(
            ebook?.description ?? "",
            style: semibold16Grey94.copyWith(
              color: const Color(0xFF605E5E),
            ),
            lessStyle: bold16Primary,
            moreStyle: bold16Primary,
            trimExpandedText: getTranslate(context, 'story_detail.show_less'),
            trimCollapsedText: getTranslate(context, 'story_detail.read_more'),
          )
        ],
      ),
    );
  }

  topImageBox(Size size) {
    return SizedBox(
      height: size.height * 0.62,
      width: double.maxFinite,
      child: Stack(
        children: [
          imageAndTitle(size),
          detailBox(),
        ],
      ),
    );
  }

  detailBox() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: fixPadding / 2),
        padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.5, vertical: fixPadding),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: blackColor.withOpacity(0.25),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            detailWidget(Icons.star, "3.5"),
            divider(),
            detailWidget(Icons.visibility, "2.5m"),
            divider(),
            detailWidget(Icons.menu_book_sharp, "2h"),
            divider(),
            detailWidget(Icons.music_note, "1h"),
          ],
        ),
      ),
    );
  }

  imageAndTitle(Size size) {
    return Container(
      height: size.height * 0.59,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              ""),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            backgroundColor.withOpacity(0.2),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          heightSpace,
          Text(
            widget.ebook.title,
            style: bold24Black2,
          ),
          height5Space,
          Container(
            height: size.height * 0.28,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.25),
                  blurRadius: 5,
                )
              ],
              image: DecorationImage(
                image: NetworkImage(Utility.extractImageUrl(
                    widget.ebook.posterImage.first.response)),
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }

  divider() {
    return Container(
      height: 22,
      width: 1,
      color: const Color(0xFFD4D4D4),
      margin: const EdgeInsets.symmetric(
        horizontal: fixPadding,
      ),
    );
  }

  detailWidget(IconData icon, String title) {
    return Row(
      children: [
        Icon(
          icon,
          color: primaryColor,
          size: 14,
        ),
        width5Space,
        Text(
          title,
          style: bold14Black2,
        )
      ],
    );
  }
}
