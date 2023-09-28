import 'package:assignment/Common/Theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../Common/AppStrings/app_strings.dart';
import '../../../Common/utilities.dart';

import 'package:flutter/material.dart';

Padding HomeSearch() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: TextFormField(
      enabled: false,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
        ),
        hintText: 'Search your movie',
        hintStyle: const TextStyle(fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            width: 1,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(16),
        fillColor: MyColors.secColor,
      ),
    ),
  );
}

class PopularHeader extends StatelessWidget {
  const PopularHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.popularMovies,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.w600),
          ),
          TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(comingSoonSnackBar());
              },
              child: Text(
                AppStrings.seeMore,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    fontWeight: FontWeight.w400),
              ))
        ],
      ),
    );
  }
}

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.categories,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontWeight: FontWeight.w600),
          ),
          TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(comingSoonSnackBar());
              },
              child: Text(
                AppStrings.seeMore,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    fontWeight: FontWeight.w400),
              ))
        ],
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hi, CrewLogix!",
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w600),
          ),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_image.jpg"),
            radius: 20,
          )
        ],
      ),
    );
  }
}
