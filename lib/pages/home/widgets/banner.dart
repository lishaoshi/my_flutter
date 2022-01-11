import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:my_flutter/netWork/api/home.dart';
import '../modules/banner.dart';
import 'banner_title_type.dart';

class HomeBanner extends StatefulWidget {
  late final List<BannerModuleItem> banners;
  HomeBanner({Key? key, required List<dynamic> banners}) : super(key: key) {
    this.banners = banners.map((e) => BannerModuleItem.fromJosn(e)).toList();
  }

  @override
  State<StatefulWidget> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
        itemCount: widget.banners.length,
        key: UniqueKey(),
        autoplay: true,
        duration: 500,
        itemBuilder: (context, index) {
          BannerModuleItem item = widget.banners[index];
          return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: Container(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          item.pic,
                        )),
                    item.typeTitle != null
                        ? TitleType(
                            item.typeTitle!,
                            color: item.titleColor,
                          )
                        : Container()
                  ],
                ),
              ));
        });
  }
}
