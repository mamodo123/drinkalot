library swipe_cards;

import 'package:drinkalot/widgets/card_swipe/profile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'draggable_card.dart';

class SwipeCards extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final Widget? likeTag;
  final Widget? nopeTag;
  final Widget? superLikeTag;
  final MatchEngine matchEngine;
  final Function onStackFinished;
  final Function(SwipeItem, int)? itemChanged;
  final bool fillSpace;
  final bool upSwipeAllowed;
  final bool downSwipeAllowed;
  final bool leftSwipeAllowed;
  final bool rightSwipeAllowed;

  SwipeCards({
    Key? key,
    required this.matchEngine,
    required this.onStackFinished,
    required this.itemBuilder,
    this.likeTag,
    this.nopeTag,
    this.superLikeTag,
    this.fillSpace = true,
    this.upSwipeAllowed = false,
    this.downSwipeAllowed = false,
    this.leftSwipeAllowed = true,
    this.rightSwipeAllowed = true,
    this.itemChanged,
  }) : super(key: key);

  @override
  _SwipeCardsState createState() => _SwipeCardsState();
}

class _SwipeCardsState extends State<SwipeCards> {
  Key? _frontCard;
  SwipeItem? _currentItem;
  double _nextCardScale = 0.9;
  SlideRegion? slideRegion;

  @override
  void initState() {
    widget.matchEngine.addListener(_onMatchEngineChange);
    _currentItem = widget.matchEngine.currentItem;
    if (_currentItem != null) {
      _currentItem!.addListener(_onMatchChange);
    }
    int? currentItemIndex = widget.matchEngine._currentItemIndex;
    if (currentItemIndex != null) {
      _frontCard = Key(currentItemIndex.toString());
    }
    super.initState();
  }

  @override
  void dispose() {
    if (_currentItem != null) {
      _currentItem!.removeListener(_onMatchChange);
    }
    widget.matchEngine.removeListener(_onMatchEngineChange);
    super.dispose();
  }

  @override
  void didUpdateWidget(SwipeCards oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.matchEngine != oldWidget.matchEngine) {
      oldWidget.matchEngine.removeListener(_onMatchEngineChange);
      widget.matchEngine.addListener(_onMatchEngineChange);
    }
    if (_currentItem != null) {
      _currentItem!.removeListener(_onMatchChange);
    }
    _currentItem = widget.matchEngine.currentItem;
    if (_currentItem != null) {
      _currentItem!.addListener(_onMatchChange);
    }
  }

  void _onMatchEngineChange() {
    setState(() {
      if (_currentItem != null) {
        _currentItem!.removeListener(_onMatchChange);
      }
      _currentItem = widget.matchEngine.currentItem;
      if (_currentItem != null) {
        _currentItem!.addListener(_onMatchChange);
      }
      _frontCard = Key(widget.matchEngine._currentItemIndex.toString());
    });
  }

  void _onMatchChange() {
    setState(() {
      //match has been changed
    });
  }

  Widget _buildFrontCard() {
    return ProfileCard(
      child: widget.itemBuilder(context, widget.matchEngine._currentItemIndex!),
      key: _frontCard,
    );
  }

  Widget _buildBackCard() {
    return Transform(
      transform: Matrix4.identity()..scale(_nextCardScale, _nextCardScale),
      alignment: Alignment.center,
      child: ProfileCard(
        child: widget.itemBuilder(
            context, widget.matchEngine._currentItemIndex + 1),
      ),
    );
  }

  void _onSlideUpdate(double distance) {
    setState(() {
      _nextCardScale = 0.9 + (0.1 * (distance / 100.0)).clamp(0.0, 0.1);
    });
  }

  void _onSlideRegion(SlideRegion? region) {
    setState(() {
      slideRegion = region;
      SwipeItem? currentMatch = widget.matchEngine.currentItem;
      if (currentMatch != null && currentMatch.onSlideUpdate != null) {
        currentMatch.onSlideUpdate!(region);
      }
    });
  }

  void _onSlideOutComplete(SlideDirection? direction) {
    SwipeItem? currentMatch = widget.matchEngine.currentItem;
    // currentMatch?.beforeSide();
    switch (direction) {
      case SlideDirection.left:
        currentMatch?.left();
        break;
      case SlideDirection.right:
        currentMatch?.right();
        break;
      case SlideDirection.up:
        currentMatch?.top();
        break;
      case SlideDirection.down:
        currentMatch?.bottom();
        break;
      case null:
        break;
    }
    // currentMatch?.afterSide();

    if (widget.matchEngine._currentItemIndex + 1 <
        widget.matchEngine._swipeItems.length) {
      widget.itemChanged?.call(widget.matchEngine.nextItem!,
          widget.matchEngine._currentItemIndex + 1);
    }

    widget.matchEngine.cycleMatch();
    if (widget.matchEngine.currentItem == null) {
      widget.onStackFinished();
    }
  }

  SlideDirection? _desiredSlideOutDirection() {
    switch (widget.matchEngine.currentItem?.decision) {
      case Decision.left:
        return SlideDirection.left;
      case Decision.right:
        return SlideDirection.right;
      case Decision.top:
        return SlideDirection.up;
      case Decision.bottom:
        return SlideDirection.down;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: widget.fillSpace == true ? StackFit.expand : StackFit.loose,
      children: <Widget>[
        if (widget.matchEngine.nextItem != null)
          DraggableCard(
            isDraggable: false,
            card: _buildBackCard(),
            upSwipeAllowed: widget.upSwipeAllowed,
            downSwipeAllowed: widget.downSwipeAllowed,
            leftSwipeAllowed: widget.leftSwipeAllowed,
            rightSwipeAllowed: widget.rightSwipeAllowed,
            isBackCard: true,
          ),
        if (widget.matchEngine.currentItem != null)
          DraggableCard(
            card: _buildFrontCard(),
            likeTag: widget.likeTag,
            nopeTag: widget.nopeTag,
            superLikeTag: widget.superLikeTag,
            slideTo: _desiredSlideOutDirection(),
            onSlideUpdate: _onSlideUpdate,
            onSlideRegionUpdate: _onSlideRegion,
            onSlideOutComplete: _onSlideOutComplete,
            upSwipeAllowed: widget.upSwipeAllowed,
            downSwipeAllowed: widget.downSwipeAllowed,
            leftSwipeAllowed: widget.leftSwipeAllowed,
            rightSwipeAllowed: widget.rightSwipeAllowed,
            isBackCard: false,
          )
      ],
    );
  }
}

class MatchEngine extends ChangeNotifier {
  final List<SwipeItem> _swipeItems;
  int _currentItemIndex = 0;

  MatchEngine({required List<SwipeItem> swipeItems}) : _swipeItems = swipeItems;

  SwipeItem? get currentItem => _currentItemIndex < _swipeItems.length
      ? _swipeItems[_currentItemIndex]
      : null;

  SwipeItem? get nextItem => _currentItemIndex + 1 < _swipeItems.length
      ? _swipeItems[_currentItemIndex + 1]
      : null;

  int get currentItemIndex => _currentItemIndex;

  void cycleMatch() {
    if (currentItem?.decision != Decision.undecided) {
      currentItem?.resetMatch();
      _currentItemIndex += 1;
      notifyListeners();
    }
  }

  void rewindMatch() {
    if (_currentItemIndex != 0) {
      currentItem!.resetMatch();
      _currentItemIndex = _currentItemIndex - 1;
      currentItem!.resetMatch();
      notifyListeners();
    }
  }
}

class SwipeItem<T> extends ChangeNotifier {
  final T content;
  final Function? rightAction;
  final Function? topAction;
  final Function? leftAction;
  final Function? bottomAction;
  final Function? beforeSideAction;
  final Function? afterSideAction;
  final Future Function(SlideRegion? slideRegion)? onSlideUpdate;
  Decision decision = Decision.undecided;

  SwipeItem({
    required this.content,
    this.rightAction,
    this.beforeSideAction,
    this.afterSideAction,
    this.topAction,
    this.leftAction,
    this.bottomAction,
    this.onSlideUpdate,
  });

  void slideUpdateAction(SlideRegion? slideRegion) async {
    try {
      await onSlideUpdate!(slideRegion);
    } catch (e) {}
    notifyListeners();
  }

  void right() {
    if (decision == Decision.undecided) {
      beforeSideAction?.call();
      decision = Decision.right;
      try {
        rightAction?.call();
      } catch (e) {}
      afterSideAction?.call();
      notifyListeners();
    }
  }

  void left() {
    if (decision == Decision.undecided) {
      beforeSideAction?.call();
      decision = Decision.left;
      try {
        leftAction?.call();
      } catch (e) {}
      afterSideAction?.call();

      notifyListeners();
    }
  }

  void top() {
    if (decision == Decision.undecided) {
      beforeSideAction?.call();
      decision = Decision.top;
      try {
        topAction?.call();
      } catch (e) {}
      afterSideAction?.call();

      notifyListeners();
    }
  }

  void bottom() {
    if (decision == Decision.undecided) {
      beforeSideAction?.call();

      decision = Decision.bottom;
      try {
        bottomAction?.call();
      } catch (e) {}
      afterSideAction?.call();

      notifyListeners();
    }
  }

  void beforeSide() {
    if (decision == Decision.undecided) {
      try {
        beforeSideAction?.call();
      } catch (e) {}
    }
  }

  void afterSide() {
    if (decision == Decision.undecided) {
      try {
        afterSideAction?.call();
      } catch (e) {}
    }
  }

  void resetMatch() {
    if (decision != Decision.undecided) {
      decision = Decision.undecided;
      notifyListeners();
    }
  }
}

enum Decision { undecided, left, right, top, bottom }
