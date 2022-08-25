import 'package:flutter/material.dart';
import 'package:gursha/presentation/util/colors.dart';

class ImageLoader extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BorderRadiusGeometry? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? margin;
  const ImageLoader(
      {Key? key,
      required this.url,
      this.height,
      this.width,
      this.border,
      this.fit,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        // child: Container(
        //   height: height,
        //   width: width,
        //   margin: margin,
        // decoration: BoxDecoration(borderRadius: border),
        child: Image.network(url,
            height: double.maxFinite,
            width: double.infinity,
            fit: fit,
            loadingBuilder: (context, child, loadingProgress) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                  strokeWidth: 2,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) => Image.asset(
                  'default.jpg',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
            // Container(
            //   decoration: const BoxDecoration(color: Colors.grey),
            ),
        // ),
        // ),
      ),
    );
  }
}
