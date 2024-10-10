import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_app/core/navigation/routes.dart';
import 'package:iconly/iconly.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: size.width, height: size.height * 0.02),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: size.height * 0.06,
                    backgroundImage: const NetworkImage(
                      "https://avatars.githubusercontent.com/u/113280588?v=4",
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Pratham Sarankar",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: size.height * 0.022,
                          fontWeight: FontWeight.bold,
                          height: 1.4,
                        ),
                  ),
                  Text(
                    "developer.pratham@gmail.com",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          height: 1.5,
                          fontSize: size.height * 0.016,
                        ),
                  ),
                ],
              ),
            ),
            CupertinoListSection(
              topMargin: 20,
              header: Text(
                "Profile",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              margin: const EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: 10,
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
              additionalDividerMargin: 0,
              dividerMargin: 0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.zero,
                color: Theme.of(context).colorScheme.surface,
              ),
              children: [
                CupertinoListTile(
                  title: Text(
                    "Edit Profile",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          height: 1,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  subtitle: Text(
                    "Change your name, email & profile picture",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(height: 1.2),
                  ),
                  leading: const Icon(IconlyLight.edit),
                  leadingToTitle: 10,
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {},
                ),
              ],
            ),
            CupertinoListSection(
              header: Text(
                "Preferences",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              footer: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                alignment: Alignment.center,
                child: Text(
                  "Version 1.0.0",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        height: 1,
                        fontSize: size.height * 0.016,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              margin: const EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
                bottom: 10,
              ),
              backgroundColor: Theme.of(context).colorScheme.surface,
              additionalDividerMargin: 0,
              dividerMargin: 0,
              topMargin: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.zero,
                color: Theme.of(context).colorScheme.surface,
              ),
              children: [
                CupertinoListTile(
                  title: Text(
                    "Topics",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          height: 1,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  subtitle: Text(
                    "Select your favorite topics",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(height: 1.2),
                  ),
                  leading: const Icon(IconlyLight.filter),
                  leadingToTitle: 10,
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.topic);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
