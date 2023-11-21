import 'package:dawrni/core/constants/app_colors.dart';
import 'package:dawrni/core/core_compoent/app_button.dart';
import 'package:dawrni/core/core_compoent/app_network_image.dart';
import 'package:dawrni/core/extension/theme_extensions/text_theme_extension.dart';
import 'package:dawrni/core/paths/images_paths.dart';
import 'package:dawrni/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';

class CompanyDetailsView extends StatelessWidget {
  final String id;

  CompanyDetailsView({Key? key, required this.id})
      : super(key: key); // Fix the constructor
  List<String> listOfUrls = [
    "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
    "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
    "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
    "https://s23574.pcdn.co/wp-content/uploads/Singular-1140x703.jpg",
    "https://www.expatica.com/app/uploads/sites/9/2017/06/Lake-Oeschinen-1200x675.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          buildTopImage(),
          Stack(
            children: [
              buildProfileData(context),
              buildProfileImage(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildProfileData(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 200),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColors.offBlack,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), topLeft: Radius.circular(40)),
      ),
      child: ListView(
        children: [
          const SizedBox(height: 90),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Al Husein Repairing", style: context.f25700),
                  const SizedBox(height: 20),
                  Text("Apartment repair", style: context.f20400),
                ],
              ),
              Column(
                children: [
                  Image.asset(ImagesPaths.certifiedPng, height: 40, width: 40),
                  const SizedBox(height: 7),
                  Text(S.of(context).certified, style: context.f15600)
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(S.of(context).about, style: context.f20700),
          const SizedBox(height: 20),
          Text(
              "From minor repairs to major installations, we tackle each project with precision and care, ensuring that your plumbing systems are in optimal condition.",
              style: context.f15300),
          const SizedBox(height: 20),
          GalleryImage(
            imageUrls: listOfUrls,
            numOfShowImages: 6,
            titleGallery: "Title",
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: AppButton(
                    onPressed: () {},
                    type: AppButtonType.gradientPrimary,
                    text: S.of(context).bookNow),
              ),
              const SizedBox(width: 20),
              Container(
                width: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Image.asset(ImagesPaths.chatPng),
              )
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildProfileImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 120),
          decoration: const BoxDecoration(
              color: AppColors.offBlack, shape: BoxShape.circle),
          height: 160,
          width: 160,
          child: AppNetworkImage(
            url:
                "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }

  Widget buildTopImage() {
    return Column(
      children: [
        SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              ImagesPaths.backgroundImagePng,
              fit: BoxFit.cover,
            )),
      ],
    );
  }
}
