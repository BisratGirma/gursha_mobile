import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(borderRadius: border),
      child: Image.network(
        url,
        height: height,
        width: width,

        // cacheHeight: height!.toInt(),
        // cacheWidth: width!.toInt(),
        fit: fit,
        errorBuilder: (context, error, stackTrace) => Container(
          decoration: const BoxDecoration(color: Colors.grey),
        ),
      ),
    )

        // Container(
        //   height: widget.height,
        //   width: widget.width,
        //   margin: widget.margin,
        //   decoration: BoxDecoration(
        //       borderRadius: widget.border,
        //       color: Colors.orange,
        //       image: DecorationImage(
        //         fit: widget.fit,
        //         image: const AssetImage('assets/default.jpg'),
        //         onError: (exception, stackTrace) {
        //           // print(exception.toString());
        //           Future.delayed(
        //               Duration.zero,
        //               () => setState(() {
        //                     netImage = const AssetImage('assets/default.jpg');
        //                   }));
        //         },
        //       )),
        // )
        ;
  }
}
