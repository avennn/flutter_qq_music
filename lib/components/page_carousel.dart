import 'package:flutter/material.dart';
import 'dart:async';

int _remander(int input, int source) {
  final int result = input % source;
  return result < 0 ? source + result : result;
}

int _getRealIndex(int position, int base, int length) {
  final int offset = position - base;
  return _remander(offset, length);
}

class Controller extends PageController {

}

class PageCarousel extends StatefulWidget {
  final List<Widget> children; //
  final Curve animationCurve; //
  final Duration animationDuration; //
  final Duration autoPlayDuration; //
  final bool autoPlay; //
  final int realIndex;
  final int initialIndex; // 初始的index
  final int index; // 传入状态当前的index
  final Function onSlide; //
  final double viewportFraction;
  final PageController pageController; //

  int get childrenCount => children.length;

  PageCarousel({
    @required this.children,
    this.animationCurve: Curves.fastOutSlowIn,
    this.animationDuration: const Duration(microseconds: 500),
    this.autoPlayDuration: const Duration(seconds: 3),
    this.autoPlay: true,
    this.realIndex: 750,
    this.initialIndex: 0,
    this.index: 0,
    this.viewportFraction: 1.0,
    this.onSlide
  }) :
      assert(children != null),
      assert(children.length > 1),
      assert(animationCurve != null),
      assert(animationDuration != null),
      assert(autoPlayDuration != null),
      assert(autoPlay != null),
      assert(initialIndex >= 0 && initialIndex < childrenCount),
      pageController = new PageController(
        initialPage: initialIndex,
        keepPage: true,
        viewportFraction: viewportFraction
      );

  @override
  _PageCarouselState createState() => new _PageCarouselState();

  Future<Null> nextPage({Duration duration, Curve curve}) {
    return pageController.nextPage(duration: duration, curve: curve);
  }

  Future<Null> previousPage({Duration duration, Curve curve}) {
    return pageController.previousPage(duration: duration, curve: curve);
  }

  // how to use pageController
  jumpToPage(int pageIndex) {
    print(pageController.page.toInt());
    final index = _getRealIndex(pageController.page.toInt(), realIndex, childrenCount);
    return pageController.jumpToPage(pageController.page.toInt() + pageIndex - index);
  }

  animateToPage(int pageIndex, {Duration duration, Curve curve}) {
    final index = _getRealIndex(pageController.page.toInt(), realIndex, childrenCount);
    return pageController.animateToPage(
        pageController.page.toInt() + pageIndex - index,
        duration: duration,
        curve: curve
    );
  }
}

class _PageCarouselState extends State<PageCarousel> with TickerProviderStateMixin {
  Timer _timer;

  @override
  void initState() {
    super.initState();

    if (widget.autoPlay) {
      _timer = new Timer.periodic(widget.autoPlayDuration, (_) {
        widget.pageController.nextPage(
          duration: widget.animationDuration,
          curve: widget.animationCurve
        );
      });
    }
  }


  @override
  void didUpdateWidget(PageCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
    print(oldWidget.index);
    print(widget.index);
    if (widget.index != oldWidget.index) {
      widget.jumpToPage(widget.index);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new PageView(
      children: widget.children,
      onPageChanged: (index) {
        print(index);
        widget.onSlide(index);
      },
      controller: widget.pageController,
    );
  }
}