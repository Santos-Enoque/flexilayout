// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
/// Returns the top navigation bar widget.
///
/// The `topNavBar` function takes a `BuildContext` as input and returns an `AppBar` widget.
/// It represents the top navigation bar with various icons and user information.
///
/// Example usage:
///
/// ```dart
/// AppBar appBar = topNavBar(context);
/// ```
AppBar topNavBar(BuildContext context) => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_active,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 16,
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        children: const [
                          TextSpan(
                            text: '\nSantos\n',
                          ),
                          TextSpan(
                            text: 'santos@cyberdyne.jp\n',
                          ),
                        ],
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          height: .4,
        ),
      ),
    );
