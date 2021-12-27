import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:my_flutter/netWork/api/home.dart';
import '../modules/banner.dart';
import 'banner_title_type.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  List<BannerModuleItem> banners = [];

  getBanners() async {
    BannerModule bannerModule = await HomeApi.getBanner();
    setState(() {
      banners = bannerModule.banners;
    });
  }

  @override
  void initState() {
    super.initState();
    getBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
        itemCount: banners.length,
        key: UniqueKey(),
        control: const SwiperControl(size: 0),
        itemBuilder: (context, index) {
          BannerModuleItem item = banners[index];
          List<Widget> stackWidgets = [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  item.pic,
                )),
          ];
          if (item.typeTitle != null) {
            String title = item.typeTitle!;
            stackWidgets.add(TitleType(title));
          }
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02),
            color: Colors.yellow,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(16),
            //     image: DecorationImage(image: NetworkImage(item.pic))),
            child: Stack(
              children: stackWidgets,
            ),
          );
        });
  }
}
