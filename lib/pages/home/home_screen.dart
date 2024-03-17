import 'package:fl_audio_book/pages/form/upcoming_satsang_manager.dart';
import 'package:fl_audio_book/pages/home/manager/home_page_manager.dart';
import 'package:fl_audio_book/pages/home/model/home_page_response_model.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:fl_audio_book/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import '../../localization/localization_const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<HomePageResponse> _homePageDataFuture;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _homePageDataFuture = HomePageManager.getHomePageData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        // Assigning the key to Scaffold
        backgroundColor: backgroundColor,
        endDrawer: SizedBox(
            width: size.width * 0.6,
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                      decoration: const BoxDecoration(
                        color: primaryColor,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icon.png',
                            // Provide the path to your image asset
                            fit: BoxFit.fill,
                            width: 100, // Set the desired width
                            height: 100,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 30, // Adjust the height as needed
                    child: ListTile(
                      title: const Text('Daily Vichar'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/newRelease');
                      },
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 30, // Adjust the height as needed
                    child: ListTile(
                      title: const Text('Satsang'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/newRelease');
                      },
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 30,
                    child: ListTile(
                      title: const Text('Darshan'),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.pushNamed(context, '/newRelease');
                      },
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 30,
                    child: ListTile(
                      title: const Text('Bhajan'),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.pushNamed(context, '/mostpopular');
                      },
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 30,
                    child: ListTile(
                      title: const Text('Ebooks'),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.pushNamed(context, '/recommended');
                      },
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 30,
                    child: ListTile(
                      title: const Text('Kids Zone'),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.pushNamed(context, '/newRelease');
                      },
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 30,
                    child: ListTile(
                      title: const Text('Parenting'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/newRelease');
                      },
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 30,
                    child: ListTile(
                      title: const Text('Donation'),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.pushNamed(context, '/notification');
                      },
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: 30,
                    child: ListTile(
                      title: const Text('Upcoming Satsang'),
                      onTap: () {
                        Navigator.pop(context); // Close the drawer
                        Navigator.pushNamed(context, '/notification');
                      },
                    ),
                  ),
                  // Add more list tiles for other menu items as needed
                ],
              ),
            )),
        appBar: AppBar(
          backgroundColor: backgroundColor,
          toolbarHeight: size.height * 0.11,
          elevation: 0,
          titleSpacing: 0,
          centerTitle: false,
          leadingWidth: 90,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
            child: Row(
              children: [
                Container(
                  height: size.height * 0.065,
                  width: size.height * 0.065,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/icon.png"),
                    ),
                  ),
                ),
                widthSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslate(context, 'home.good_morning'),
                        style: bold18Black2,
                      ),
                      Text(
                        getTranslate(context, 'home.time_read'),
                        style: bold14Grey94,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: primaryColor,
              ),
            )
          ],
        ),
        body: FutureBuilder<HomePageResponse>(
            future: _homePageDataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final homePageData = snapshot.data!;
                return ListView(
                  padding: const EdgeInsets.only(
                    bottom: fixPadding,
                  ),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    premiumBox(size),
                    heightSpace,
                    createCarousel(homePageData.data.banners),
                    heightSpace,
                    categoryListView(size, homePageData.data.categories),
                    heightSpace,
                    bhajanListView(homePageData.data.bhajans, size),
                    heightSpace,
                    eBookListView(homePageData.data.ebooks, size),
                    heightSpace,
                    videoListview(
                        size, homePageData.data.videoContents, "New Release"),
                    heightSpace,
                    videoListview(size, homePageData.data.satsang, "Satsang"),
                    heightSpace,
                    videoListview(
                        size, homePageData.data.dailyVichar, "Daily Vichar"),
                    heightSpace,
                    upcomingSatsang(size, homePageData.data.upcomingsatsang,
                        'Upcoming Satsang'),
                    DonationButton(onPressed: () {}),
                  ],
                );
              }
            }));
  }

  newReleaseListview(Size size, List<Category> categories, String title) {
    return Column(
      children: [
        titleText(getTranslate(context, title), () {
          Navigator.pushNamed(context, '/newRelease');
        }),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(fixPadding),
          child: Row(
            children: categories
                .map(
                  (category) =>
                      listContent(size, category.name, category.name, () {
                    Navigator.pushNamed(context, '/storyDetail');
                  }),
                )
                .toList(),
          ),
        )
      ],
    );
  }

  videoListview(Size size, List<VideoContent>? videoContents, String title) {
    if (videoContents == null) {
      return Container();
    }
    return Column(
      children: [
        titleText(getTranslate(context, title), () {
          Navigator.pushNamed(context, '/newRelease');
        }),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(fixPadding),
          child: Row(
            children: videoContents
                .map(
                  (category) => listContent(
                      size,
                      "https://img.youtube.com/vi/${category.youtubeUrl}/sddefault.jpg",
                      category.title, () {
                    Navigator.pushNamed(context, '/ytPlayer',
                        arguments: category.youtubeUrl);
                  }),
                )
                .toList(),
          ),
        )
      ],
    );
  }

  Widget eBookListView(List<Ebook> ebooks, Size size) {
    if (ebooks.isEmpty) {
      return const SizedBox(); // Return an empty SizedBox if the list is empty
    }

    return Column(
      children: [
        titleText(getTranslate(context, 'EBooks'), () {
          Navigator.pushNamed(context, '/recommended');
        }),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(fixPadding),
          child: Row(
            children: ebooks
                .map(
                  (ebook) => listContent(
                    size,
                    ebook.posterImage.isNotEmpty
                        ? Utility.extractImageUrl(
                            ebook.posterImage.first.response)
                        : "",
                    ebook.title,
                    () {
                      Navigator.pushNamed(context, '/storyDetail',
                          arguments: ebook);
                    },
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }

  Widget bhajanListView(List<Bhajan>? bhajans, Size size) {
    if (bhajans == null || bhajans.isEmpty) {
      // Return a placeholder or empty widget if the list is null or empty
      return const SizedBox();
    }

    return Column(
      children: [
        titleText(getTranslate(context, 'Bhajans'), () {
          Navigator.pushNamed(context, '/mostpopular');
        }),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(fixPadding),
          child: Row(
            children: bhajans
                .map(
                  (bhajan) => listContent(
                    size,
                    Utility.extractImageUrl(bhajan.poster?.first.response),
                    bhajan.title,
                    () {
                      Navigator.pushNamed(context, '/audioscreen',
                          arguments: bhajan);
                    },
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }

  Widget listContent(Size size, String image, String name, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.7,
        margin: const EdgeInsets.symmetric(horizontal: fixPadding),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.2,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            height5Space,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: bold15Black2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  titleText(String title, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: bold18Black2,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              getTranslate(context, 'home.see_all'),
              style: bold14Primary,
            ),
          )
        ],
      ),
    );
  }

  premiumBox(Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/getPremium');
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(fixPadding / 5),
        margin: const EdgeInsets.symmetric(horizontal: fixPadding * 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            colors: [
              primaryColor,
              Color(0xffEEC7AD),
            ],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding * 1.5, vertical: fixPadding * 1.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTranslate(context, "Get Premium!"),
                      style: extrabold20White,
                    ),
                    Text(
                      getTranslate(
                          context, 'Elevate your soul with every stream.'),
                      style: bold16White,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: fixPadding / 2,
                        horizontal: fixPadding * 2,
                      ),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        getTranslate(context, 'Subscribe Now'),
                        style: bold16Primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              "assets/home/premium.png",
              fit: BoxFit.cover,
              width: size.width * 0.32,
            ),
          ],
        ),
      ),
    );
  }

  categoryListView(Size size, List<Category> categories) {
    return Column(
      children: [
        titleText(getTranslate(context, 'Category'), () {
          Navigator.pushNamed(context, '/famousAuthor');
        }),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(fixPadding),
          child: Row(
            children: categories
                .map(
                  (category) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/newRelease',
                          arguments: category);
                    },
                    child: Container(
                      margin:
                          const EdgeInsets.symmetric(horizontal: fixPadding),
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.11,
                            width: size.height * 0.11,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(Utility.concatBaseUrl(
                                      category.image.first.response)),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          height5Space,
                          Text(
                            category.name,
                            style: bold14Black2,
                          )
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }

  createCarousel(List<BannerSlider>? banners) {
    if (banners == null || banners.isEmpty) {
      return Container();
    }
    return FlutterCarousel(
      options: CarouselOptions(
        height: 150.0,
        showIndicator: true,
        slideIndicator: const CircularSlideIndicator(),
      ),
      items: banners.expand((banner) {
        return banner.image.map((imageUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.network(Utility.concatBaseUrl(imageUrl.response),
                    fit: BoxFit.fill),
              );
            },
          );
        });
      }).toList(),
    );
  }

  upcomingSatsang(
      Size size, List<UpComingSatsang>? upcomingsatsang, String title) {
    if (upcomingsatsang == null || upcomingsatsang.isEmpty) {
      // Return a placeholder or empty widget if the list is null or empty
      return const SizedBox();
    }

    return Column(
      children: [
        titleText(getTranslate(context, title), () {
          Navigator.pushNamed(context, '/mostpopular');
        }),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(8),
          child: Column(
            children: upcomingsatsang
                .map(
                  (upcomingsatsang) => upComingSatsangItem(
                    size,
                    upcomingsatsang,
                    () {},
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }

  Widget upComingSatsangItem(
      Size size, UpComingSatsang upComingSatsang, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.9,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        // Adjust margin as needed
        color: Colors.transparent,
        child: Card(
          elevation: 4, // Adjust elevation as needed
          margin: const EdgeInsets.all(8), // Adjust margin as needed
          child: Padding(
            padding: const EdgeInsets.all(16), // Adjust padding as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  upComingSatsang.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Date: ${upComingSatsang.date}'),
                Text('Place: ${upComingSatsang.place}'),
                Text('Contact: ${upComingSatsang.contactInformation}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        UpComingSatsangManager.submitUpComingSatsangForm(upComingSatsang.id)
                            .then((value) => {

                        })
                            .catchError((error) => {

                        });
                      },
                      child: const Text('Book Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DonationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DonationButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20), // Adding margin to the button
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: primaryColor, // Background color
          onPrimary: Colors.white, // Text color
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Donate Now',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
