import 'package:flutter/material.dart';
import 'dart:async';

class CustomCarousel extends StatefulWidget {
  final List<Widget> children;
  final Curve animationCurve;
  final Duration animationDuration;
  final Duration autoPlayDuration;
  final bool autoPlay;
  final int initialIndex;
  final Function onSlide;

  int get childrenCount => children.length;

  CustomCarousel({
    @required this.children,
    this.animationCurve = Curves.fastOutSlowIn,
    this.animationDuration = const Duration(microseconds: 100),
    this.autoPlayDuration = const Duration(seconds: 3),
    this.autoPlay = true,
    this.initialIndex = 0,
    this.onSlide
  }) :
    assert(children != null),
    assert(children.length > 1),
    assert(animationCurve != null),
    assert(animationDuration != null),
    assert(autoPlayDuration != null),
    assert(autoPlay != null),
    assert(initialIndex >= 0 && initialIndex < childrenCount);

  @override
  _CustomCarouselState createState() => new _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> with SingleTickerProviderStateMixin {
  TabController _tabController;
  Timer _timer;

  int get currentIndex => _tabController.index;

  int get nextIndex {
    var nextIndexValue = currentIndex;

    if(nextIndexValue < _tabController.length - 1)
      nextIndexValue++;
    else
      nextIndexValue = 0;

    print('next value');
    print(nextIndexValue);

    if (widget.onSlide != null) {
      print('next value');
      print(nextIndexValue);
      widget.onSlide(nextIndexValue);
    }

    return nextIndexValue;
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(initialIndex: widget.initialIndex, length: widget.childrenCount, vsync: this);

    if (widget.autoPlay) {
      startAnimating();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _timer?.cancel();
    super.dispose();
  }


  void startAnimating() {
    _timer?.cancel();

    //Every widget.displayDuration (time) the tabbar controller will animate to the next index.
    _timer = new Timer.periodic(widget.autoPlayDuration, (t) => this._tabController.animateTo(
      this.nextIndex,
      curve: widget.animationCurve,
      duration: widget.animationDuration
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new TabBarView(
      children: widget.children.map((widget) => new Center(child: widget,)).toList(),
      controller: this._tabController
    );
  }
}