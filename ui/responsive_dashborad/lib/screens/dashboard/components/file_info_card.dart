import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_dashboard/constants.dart';
import 'package:responsive_dashboard/models/MyFiles.dart';

class FileInfoCard extends StatelessWidget {
  final FileStorageInfo info;

  const FileInfoCard({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding - 5),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: info.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(
                  info.svgSrc!,
                  colorFilter: ColorFilter.mode(
                      info.color ?? Colors.black, BlendMode.srcIn),
                ),
              ),
              Icon(Icons.more_vert, color: Colors.white54)
            ],
          ),
          const Text(
            'info.title',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          LinearProgressIndicator(
            value: 0.5,
            minHeight: 3,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info.numOfFiles} Files",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white70),
              ),
              Text(
                info.totalStorage!,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
