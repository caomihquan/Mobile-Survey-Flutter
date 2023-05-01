import 'package:flutter/material.dart';
import 'package:pokedex/routes.dart';

class showAlert {
  static dynamic show(context, type, String title, String message,
      [Function? fnOk, List<String>? listBtn, List<String>? msgBtn]) {
    void fnAlert(context) {
      Navigator.pop(context);
      if (fnOk != null && listBtn!.isEmpty) {
        fnOk();
      }
    }

    Icon fnIcon() {
      if (type == 'error') {
        return Icon(
          Icons.error,
          color: Colors.red,
          size: 80.0,
        );
      } else if (type == 'success') {
        return Icon(
          Icons.check_circle,
          color: Colors.teal,
          size: 80.0,
        );
      }
      return Icon(
        Icons.error_outline,
        color: Colors.teal,
        size: 80.0,
      );
    }

    return showDialog<PlaceholderDialog>(
      context: context,
      builder: (ctx) => PlaceholderDialog(
          icon: fnIcon(),
          title: title != null || title != '' ? title : 'Thông báo',
          message: message != null || message != '' ? message : '',
          actions: [
            listBtn!.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () => fnAlert(ctx),
                        child: Text(listBtn[1]),
                      ),
                      TextButton(
                        onPressed: () => fnOk!(),
                        child: Text(listBtn[0]),
                      ),
                    ],
                  )
                : Center(
                    child: TextButton(
                      onPressed: () => fnAlert(ctx),
                      child: Text('Đồng ý'),
                    ),
                  )
          ]),
    );
  }
}

class PlaceholderDialog extends StatelessWidget {
  const PlaceholderDialog({
    this.icon,
    this.title,
    this.message,
    this.actions = const [],
    Key? key,
  }) : super(key: key);

  final Widget? icon;
  final String? title;
  final String? message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      icon: icon,
      title: title == null
          ? null
          : Text(
              title!,
              textAlign: TextAlign.center,
            ),
      content: message == null
          ? null
          : Text(
              message!,
              textAlign: TextAlign.center,
            ),
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowButtonSpacing: 8.0,
      actions: actions,
    );
  }
}
