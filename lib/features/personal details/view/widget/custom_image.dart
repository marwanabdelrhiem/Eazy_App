
import 'package:eazy_app/core/utils/appColor.dart';
import 'package:eazy_app/core/utils/appIcons.dart';
import 'package:eazy_app/core/widgets/customSvg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/appImages.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, this.image = const AssetImage(Appimages.image_person_null)});
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        
        radius: 60.r,
        backgroundImage: image,
        child: Padding(
          padding: const EdgeInsets.only(top: 80,left: 80),
          child: Container(
            decoration: BoxDecoration(
               color: AppColors.white,
              borderRadius:BorderRadius.circular(16) 
            ),
             width: 40.w,
              height: 40.h,
             
            child: Center(
              child: CustomSvg(path: AppIcons.cameraIcon,
               width: 25.w,
                height: 25.h,
              color: AppColors.iconCamare,
                         
                         
              ),
            ),
          ),
        ),
       );
  }
}