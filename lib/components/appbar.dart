import 'package:caulva/features/search.dart';
import 'package:flutter/material.dart';
import 'package:caulva/features/dropdown_menu.dart'
    as dropdownmenu; // Import the file correctly

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final Widget? leading;
  final Widget? actions;
  

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.subtitle,
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      leading: const Padding(
        padding: EdgeInsets.only(left: 20.0), // Add padding to the leading
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?cs=srgb&dl=pexels-simon-robben-55958-614810.jpg&fm=jpg'), // Replace with your image URL
          radius: 20, // Adjust the radius to your liking
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0), // Add padding to the title
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
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
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
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      actions: [
        if (actions != null)
          Padding(
            padding: const EdgeInsets.all(16.0), // Add padding to the actions
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//...