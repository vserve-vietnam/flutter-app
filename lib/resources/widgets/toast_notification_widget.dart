import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ToastNotification extends StatelessWidget {
  const ToastNotification(ToastMeta toastMeta, {Function? onDismiss, Key? key})
      : _toastMeta = toastMeta,
        _dismiss = onDismiss,
        super(key: key);

  final Function? _dismiss;
  final ToastMeta _toastMeta;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: () {
          if (_toastMeta.action != null) {
            _toastMeta.action!();
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          height: 100,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            color: _toastMeta.color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: _toastMeta.icon ?? SizedBox.shrink(),
                    padding: EdgeInsets.only(right: 16),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _toastMeta.title.tr(),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _toastMeta.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 0,
        right: 6,
        child: IconButton(
            onPressed: () {
              if (_dismiss != null) {
                _dismiss!();
              }
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
            )),
      )
    ]);
  }
}
