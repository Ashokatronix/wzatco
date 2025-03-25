import 'package:flutter/material.dart';
import '../widgets/button.dart';

class RemoteOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 45.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 35, bottom: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RemoteButton("remoteOne", 1),
                      RemoteButton("remoteOne", 2),
                      RemoteButton("remoteOne", 3),
                      RemoteButton("remoteOne", 4),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RemoteButton("remoteOne", 4),
                      RemoteButton("remoteOne", 5),
                      RemoteButton("remoteOne", 6),
                      RemoteButton("remoteOne", 7),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RemoteButton("remoteOne", 8),
                      RemoteButton("remoteOne", 9),
                      RemoteButton("remoteOne", 10),
                      RemoteButton("remoteOne", 11),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RemoteButton("remoteOne", 12),
                      RemoteButton("remoteOne", 13),
                      RemoteButton("remoteOne", 14),
                      RemoteButton("remoteOne", 15),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RemoteButton("remoteOne", 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}