import 'package:flutter/material.dart';
import 'package:udemy_flutter/screens/favourites/favourite_cubit/favourite_cubit.dart';
import 'package:udemy_flutter/screens/home/home_cubit/home_cubit.dart';
import 'package:udemy_flutter/shared/components/custom%20_card.dart';
import 'package:udemy_flutter/shared/components/custom_favourite-icon.dart';
import 'package:udemy_flutter/shared/components/custom_text.dart';
import 'package:udemy_flutter/shared/styles/color.dart';

class BuildItem extends StatelessWidget {
  final model;

  const BuildItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 10),
      child: CustomCard(
        widget: SizedBox(
          height: 130,
          width: double.infinity,
          child: Row(
            children: [
              SizedBox(width: 7.0),
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.image),
                    width: 120,
                    height: 120,
                  ),
                  if (model.discount != 0)
                    Image.asset(
                      "assets/icons/discount.png",
                    ),
                ],
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 10.0, bottom: 10, right: 10,left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: model.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                      Spacer(),
                      Row(
                        children: [
                          CustomText(
                            text: 'EGP ${model.price.toString()}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 15,
                            height: 1.3,
                            fontWeight: FontWeight.bold,
                            textColor: mainColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          if (model.discount != 0)
                            CustomText(
                                text: 'EGP ${model.oldPrice.toString()}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 13,
                                height: 1.3,
                                textColor: grey,
                                decoration: TextDecoration.lineThrough),
                          Spacer(),
                          CustomFavouriteIcon(
                              checkFavourite:
                              HomeCubit.get(context).favourites[model.id],
                              onPressed: () => FavouriteCubit.get(context)
                                  .changeFavorites(model.id!, context))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}