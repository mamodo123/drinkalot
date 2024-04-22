import 'package:flutter/material.dart';

enum _STATE { nothing, started, end }

enum DIRECTION { top, bottom, left, right }

class DirectionDrag extends StatefulWidget {
  final Widget child;
  final Function(DIRECTION) onDirection;
  final double minAngleThreshold, minDistanceVertical, minDistanceHorizontal;

  const DirectionDrag(
      {super.key,
      required this.child,
      required this.onDirection,
      required this.minAngleThreshold,
      required this.minDistanceVertical,
      required this.minDistanceHorizontal});

  @override
  State<DirectionDrag> createState() => _DirectionDragState();
}

class _DirectionDragState extends State<DirectionDrag> {
  var _state = _STATE.nothing;
  Offset? _startOffset, _endOffset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (_state == _STATE.nothing) {
          _state = _STATE.started;
          _startOffset = details.globalPosition;
        } else if (_state == _STATE.started) {
          _endOffset = details.globalPosition;
        }
      },
      onPanEnd: (details) {
        if (_state == _STATE.started) {
          if (_startOffset != null && _endOffset != null) {
            _state = _STATE.end;
            final direction = _calcDirection(
                _startOffset!,
                _endOffset!,
                widget.minAngleThreshold,
                widget.minDistanceVertical,
                widget.minDistanceHorizontal);
            if (direction != null) {
              widget.onDirection(direction);
            }
          }
          _state = _STATE.nothing;
        }
      },
      child: widget.child,
    );
  }
}

DIRECTION? _calcDirection(
    Offset startOffset,
    Offset endOffset,
    double minAngleThreshold,
    double minDistanceVertical,
    double minDistanceHorizontal) {
  final deltaY = endOffset.dy - startOffset.dy;
  final deltaX = endOffset.dx - startOffset.dx;
  final absDistanceX = deltaX.abs();
  final absDistanceY = deltaY.abs();
  if (deltaX == 0 && absDistanceY >= minDistanceVertical) {
    if (deltaY < 0) {
      return DIRECTION.bottom;
    } else if (deltaY > 0) {
      return DIRECTION.top;
    }
  } else {
    final inclination = deltaY / deltaX;
    final inclinationInverted = deltaX / deltaY;
    if (-minAngleThreshold <= inclination && inclination <= minAngleThreshold) {
      if (absDistanceX >= minDistanceHorizontal) {
        if (deltaX > 0) {
          return DIRECTION.right;
        } else {
          return DIRECTION.left;
        }
      }
    } else if (-minAngleThreshold <= inclinationInverted &&
        inclinationInverted <= minAngleThreshold) {
      if (absDistanceY >= minDistanceVertical) {
        if (deltaY > 0) {
          return DIRECTION.bottom;
        } else {
          return DIRECTION.top;
        }
      }
    }
  }
  return null;
}
