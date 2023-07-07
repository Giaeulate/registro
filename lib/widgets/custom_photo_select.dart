import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';

import '../theme/theme.dart';
import '../utils/size_config.dart';

class CustomPhotoSelect extends StatefulWidget {
  final bool isPhotoFile;
  final String? urlImage;
  final File? photo;
  final VoidCallback takePicture;
  final double marginTop;
  final double marginBottom;
  const CustomPhotoSelect({
    this.photo,
    required this.takePicture,
    this.marginTop = 0,
    this.marginBottom = 0,
    Key? key,
    required this.isPhotoFile,
    this.urlImage,
  }) : super(key: key);

  @override
  State<CustomPhotoSelect> createState() => _CustomPhotoSelectState();
}

class _CustomPhotoSelectState extends State<CustomPhotoSelect> {
  late double rotation;

  @override
  void initState() {
    rotation = (Platform.isIOS) ? math.pi : 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double photoRadius = SizeConfig.blockSizeDiagonal * 6;
    return Container(
      alignment: Alignment.center,
      margin:
          EdgeInsets.only(top: widget.marginTop, bottom: widget.marginBottom),
      child: GestureDetector(
        onTap: widget.takePicture,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: widget.photo == null
                  ? CircleAvatar(
                      radius: photoRadius,
                      backgroundImage:
                          const AssetImage("assets/png/blank_profile.png"),
                      // child: Image.asset("assets/png/blank_profile.png"),
                      // backgroundColor: Colors.black,
                    )
                  : ClipOval(
                      child: Transform(
                        transform: Matrix4.rotationY(rotation),
                        alignment: Alignment.center,
                        child: Image.file(
                          widget.photo!,
                          height: photoRadius * 2,
                          width: photoRadius * 2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
            Positioned(
              bottom: SizeConfig.blockSizeDiagonal * 1,
              right: SizeConfig.blockSizeDiagonal * 1,
              child: CircleAvatar(
                backgroundColor: ApplicationTheme.lightGrey,
                radius: photoRadius * 0.25,
                child: SvgPicture.asset(
                  "assets/svg/camera_edit.svg",
                  color: ApplicationTheme.red,
                  height: SizeConfig.blockSizeDiagonal * 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
