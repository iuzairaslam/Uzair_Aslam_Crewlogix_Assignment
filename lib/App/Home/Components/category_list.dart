import 'package:assignment/App/Home/Model/category_model.dart';
import 'package:assignment/Common/Theme/colors.dart';
import 'package:assignment/RoutesAndBindings/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  List<CategoryModel> categoryList;
  CategoryList({
    super.key,
    required this.categoryList,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(children: [
              Wrap(
                  children:
                      List<Widget>.generate(categoryList.length, (int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: GestureDetector(

                    child: Container(
                      decoration: BoxDecoration(
                          color: MyColors.priColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              categoryList[index].icon,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.065,
                              ),
                            ),
                            Text(
                              categoryList[index].text,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }))
            ])));
  }
}
