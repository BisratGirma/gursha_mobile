import 'package:flutter/material.dart';

class ImageLoader extends StatefulWidget {
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
  State<ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  @override
  Widget build(BuildContext context) {
    ImageProvider netImage = NetworkImage(widget.url);
    return Container(
      height: widget.height,
      width: widget.width,
      margin: widget.margin,
      decoration: BoxDecoration(
          borderRadius: widget.border,
          color: Colors.orange,
          image: DecorationImage(
            fit: widget.fit,
            image: netImage,
            onError: (exception, stackTrace) {
              // print(exception.toString());
              Future.delayed(
                  Duration.zero,
                  () => setState(() {
                        netImage = const AssetImage('assets/default.jpg');
                      }));
            },
          )),
    );
  }
}
