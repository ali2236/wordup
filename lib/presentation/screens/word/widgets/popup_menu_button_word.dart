import 'package:flutter/material.dart';
import 'package:wordup/domain/domain.dart';
import 'package:wordup/presentation/widgets/buttons/button_icon_colored_circle.dart';
import 'package:wordup/presentation/widgets/menu/menu_popup_route.dart';

class WordPopupMenuButton extends StatelessWidget {
  final WordInfo word;
  const WordPopupMenuButton({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return ColoredCircleIconButton(
      icon: Icon(Icons.more_horiz_rounded, size: 32),
      backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
      onTapUp: (details) {
        final pos = details.globalPosition;
        final size = details.localPosition;
        showPopUp<void>(
          context: context,
          barrierColor: Colors.black54,
          menuPadding: EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 0,
          ),
          position: RelativeRect.fromLTRB(
            pos.dx,
            pos.dy,
            pos.dx + size.dx,
            pos.dy + size.dy,
          ),
          items: [
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.share_rounded, size: 18),
                  SizedBox(width: 8),
                  Text('Share'),
                ],
              ),
            ),
            PopupMenuDivider(),
            PopupMenuItem(child: Row(
              children: [
                Icon(Icons.note_alt_outlined, size: 18),
                SizedBox(width: 8),
                Text('Add Note'),

              ],
            )),
            PopupMenuItem(child: Row(
              children: [
                Icon(Icons.star_rounded, size: 18),
                SizedBox(width: 8),
                Text('Favorite'),
              ],
            )),
            PopupMenuItem(child: Row(
              children: [
                Icon(Icons.bookmark_rounded, size: 18),
                SizedBox(width: 8),
                Text('Add to list'),
              ],
            )),
            PopupMenuDivider(),
            PopupMenuItem(child: Row(
              children: [
                Icon(Icons.flag_rounded, size: 18),
                SizedBox(width: 8),
                Text('Report Image'),
              ],
            )),
          ],
        );
      },
    );
  }
}
