import 'package:flutter/material.dart';

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
                  icon: Icon(
                    Icons.notifications_active,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
                SizedBox(
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
                        children: [
                          const TextSpan(
                            text: '\nSantos\n',
                          ),
                          const TextSpan(
                            text: 'santos@cyberdyne.jp\n',
                          ),
                        ],
                        style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(4),
        child: Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          height: .4,
        ),
      ),
    );
