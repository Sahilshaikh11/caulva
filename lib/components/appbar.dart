import 'package:caulva/features/search.dart';
import 'package:caulva/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:caulva/features/dropdown_menu.dart' as dropdownmenu;

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String subtitle;
  final Widget? leading;
  final Widget? actions;
  final double height;

  const CustomAppBar({
    Key? key,
    required this.subtitle,
    this.leading,
    this.actions,
    this.height = kToolbarHeight, // Default height to kToolbarHeight
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String userEmail = '';

  @override
  void initState() {
    super.initState();
    fetchUserEmail();
  }

  Future<void> fetchUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && user.email != null) {
      setState(() {
        userEmail = user.email!.split('@')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.accentColor,
      leading: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, top: 10.0), // Add padding to the leading
        child: Stack(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-55958-614810.jpg&fm=jpg'), // Replace with your image URL
              radius: 20, // Adjust the radius to your liking
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: const EdgeInsets.all(2.0), // Padding around the badge
                decoration: BoxDecoration(
                  color: Colors.red, // Badge background color
                  borderRadius: BorderRadius.circular(100.0), // Rounded corners
                ),
                constraints: const BoxConstraints(
                  minWidth: 15,
                  minHeight: 15,
                ),
                child: const Text(
                  '9+', // Badge text
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(
            left: 8.0, top: 10.0), // Add padding to the title
        child: GestureDetector(
          onTap: () {
            // Show the dropdown menu
            dropdownmenu
                .showDropdownMenu(context); // Call the function correctly
          },
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userEmail,
                    style: const TextStyle(
                      color: AppColors.textColorWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      color: AppColors.textColorWhite,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                  width:
                      8), // Add some space between the title and dropdown icon
              const Icon(
                Icons.arrow_drop_down,
                color: AppColors.textColorWhite,
              ),
            ],
          ),
        ),
      ),
      actions: [
        if (widget.actions != null)
          Padding(
            padding: const EdgeInsets.all(16.0), // Add padding to the actions
            child: IconButton(
              icon: const Icon(
                Icons.search,
                color: AppColors.textColorWhite,
              ),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
            ),
          ),
      ],
    );
  }
}
