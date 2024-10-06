import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import '../design/img_assets.dart';
import 'status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final double? width;
  final double? height;
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              AppImageAsset.loading,
              width: 250,
              height: 250,
            ),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(
                  AppImageAsset.offline,
                  width: 250,
                  height: 250,
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(
                      AppImageAsset.server,
                      width: 250,
                      height: 250,
                    ),
                  )
                : statusRequest == StatusRequest.serverException
                    ? Center(
                        child: Lottie.asset(
                          AppImageAsset.offline,
                          width: 250,
                          height: 250,
                        ),
                      )
                    : statusRequest == StatusRequest.failure
                        ? Center(
                            child: Lottie.asset(
                              AppImageAsset.noData,
                              width: 250,
                              height: 250,
                              repeat: true,
                            ),
                          )
                        : statusRequest == StatusRequest.countriesLoading
                            ? buildShimmerLoading(context, width, height)
                            : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              AppImageAsset.loading,
              width: 250,
              height: 250,
            ),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(
                  AppImageAsset.offline,
                  width: 250,
                  height: 250,
                ),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(
                      AppImageAsset.server,
                      width: 250,
                      height: 250,
                    ),
                  )
                : widget;
  }
}

Widget buildShimmerLoading(BuildContext context, width, height) {
  width != null && height != null ? Size(width!, height!) : null;
  Color baseColor;
  Color highlightColor;

  if (Theme.of(context).brightness == Brightness.dark) {
    baseColor = Colors.grey[850]!;
    highlightColor = Colors.grey[700]!;
  } else {
    baseColor = Colors.grey[300]!;
    highlightColor = Colors.white;
  }
  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          width: width,
          height: height,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
        );
      },
    ),
  );
}
