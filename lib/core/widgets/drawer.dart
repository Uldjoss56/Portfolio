import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/widgets/custom_blur_container.dart';
import 'package:portfolio/core/widgets/img_wid.dart';

class SideNavMenu extends StatelessWidget {
  const SideNavMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: CustomBlurContainer(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(
            20,
          ),
        ),
        paddingValue: 8,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 50.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.menu_outlined,
                        ),
                        onPressed: () => context.pop(),
                      ),
                      const SizedBox(width: 16),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: imageAsset(
                          'assets/imgs/logos/logo_04.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: const Text('Accueil'),
                leading: const Icon(
                  Icons.home_outlined,
                ),
                onTap: () => context.go("/"),
              ),
              ListTile(
                title: const Text('About me'),
                leading: const Icon(
                  Icons.badge_outlined,
                ),
                onTap: () => context.go("/about_me"),
              ),
              ListTile(
                title: const Text('Portfolio'),
                leading: const Icon(
                  Icons.brush_outlined, 
                ),
                onTap: () => context.go("/portfolio"),
              ),
              ListTile(
                title: const Text('Services'),
                leading: const Icon(
                  Icons.handshake_outlined,
                ),
                onTap: () => context.go("/services"),
              ),
              ListTile(
                title: const Text('Contacts'),
                leading: const Icon(
                  Icons.phone_in_talk_outlined,
                ),
                onTap: () => context.go("/contacts"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
