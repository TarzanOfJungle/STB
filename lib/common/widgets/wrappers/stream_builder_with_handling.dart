import 'package:flutter/material.dart';
import 'package:split_the_bill/common/widgets/error_banner.dart';
import 'package:split_the_bill/common/widgets/loading_indicator.dart';
import 'package:split_the_bill/common/widgets/no_data_banner.dart';

class StreamBuilderWithHandling<T> extends StatelessWidget {
  final Stream<T> stream;
  final Widget Function(BuildContext context, T data) buildWhenData;
  final bool assumeNullDataMeansLoading;
  final Widget? whenLoading;
  final Widget? whenError;
  final Widget? whenNoData;

  const StreamBuilderWithHandling({
    super.key,
    required this.stream,
    required this.buildWhenData,
    this.assumeNullDataMeansLoading = true,
    this.whenLoading,
    this.whenError,
    this.whenNoData,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return whenError ?? _buildDefaultWhenError();
        }
        if (!snapshot.hasData) {
          if (assumeNullDataMeansLoading) {
            return whenLoading ?? _buildDefaultWhenLoading();
          } else {
            return whenNoData ?? _buildDefaultWhenNoData();
          }
        }
        // ignore: null_check_on_nullable_type_parameter
        return buildWhenData(context, snapshot.data!);
      },
    );
  }

  Widget _buildDefaultWhenError() {
    return const Center(
      child: ErrorBanner(),
    );
  }

  Widget _buildDefaultWhenLoading() {
    return const Center(
      child: LoadingIndicator(),
    );
  }

  Widget _buildDefaultWhenNoData() {
    return const Center(
      child: NoDataBanner()
    );
  }
}
