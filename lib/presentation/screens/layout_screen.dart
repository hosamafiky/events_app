import 'package:events_app/constants/palette.dart';
import 'package:events_app/constants/style.dart';
import 'package:events_app/data/data.dart';
import 'package:events_app/presentation/screens/edit_profile_screen.dart';
import 'package:events_app/presentation/screens/sheets/notifications_sheet.dart';
import 'package:events_app/presentation/screens/sheets/saved_sheet_screen.dart';
import 'package:events_app/presentation/screens/sheets/search_sheet_screen.dart';
import 'package:events_app/presentation/screens/sheets/tickets_list_screen.dart';
import 'package:events_app/presentation/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int currentIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool isTicketsBottomSheetOpen = false;
  bool isSearchBottomSheetOpen = false;
  bool isSavedBottomSheetOpen = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: icons.length,
        child: Scaffold(
          key: scaffoldKey,
          extendBody: true,
          extendBodyBehindAppBar: true,
          drawer: const NavigationDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              padding: const EdgeInsets.all(15.0),
              icon: Image.asset('assets/images/menu.png'),
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
            ),
            actions: [
              currentIndex == 4
                  ? Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: IconButton(
                        icon: const ImageIcon(
                          AssetImage('assets/images/edit.png'),
                          size: 25.0,
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const EditProfileScreen(),
                          ),
                        ),
                      ),
                    )
                  : IconButton(
                      icon: const ImageIcon(
                        AssetImage('assets/images/notification.png'),
                        size: 25.0,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: borderRadius,
                          ),
                          builder: (context) {
                            return const NotificationsSheet();
                          },
                        );
                      },
                    )
            ],
          ),
          body: screens[currentIndex],
          bottomNavigationBar: Builder(
            builder: (ctx) => Container(
              width: double.infinity,
              height: 70.0,
              decoration: BoxDecoration(
                color: Palette.kPrimaryColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -5),
                    blurRadius: 5.0,
                    color: Colors.black54.withOpacity(0.5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30.0),
                ),
                child: TabBar(
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  indicator: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 3.0,
                        color: Palette.kSecondaryColor,
                      ),
                    ),
                  ),
                  tabs: icons
                      .asMap()
                      .map(
                        (index, value) => MapEntry(
                          index,
                          Tab(
                            icon: ImageIcon(
                              AssetImage(
                                  'assets/images/${index == currentIndex ? 'colored' : 'white'}_$value.png'),
                              size: 30.0,
                            ),
                          ),
                        ),
                      )
                      .values
                      .toList(),
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                    bottomSheetShow(ctx, index);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void bottomSheetShow(context, int index) {
    if (!isTicketsBottomSheetOpen &&
        !isSavedBottomSheetOpen &&
        !isSearchBottomSheetOpen) {
      switch (index) {
        case 1:
          {
            Scaffold.of(context)
                .showBottomSheet(
                  (context) => const TicketsList(),
                  enableDrag: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                  ),
                )
                .closed
                .then((value) {
              setState(() {
                isTicketsBottomSheetOpen = false;
              });
            });
            setState(() {
              isTicketsBottomSheetOpen = true;
            });
            break;
          }
        case 2:
          {
            Scaffold.of(context)
                .showBottomSheet(
                  (context) => const SearchContainer(),
                  enableDrag: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                  ),
                )
                .closed
                .then((value) {
              setState(() {
                isSearchBottomSheetOpen = false;
              });
            });
            setState(() {
              isSearchBottomSheetOpen = true;
            });
            break;
          }
        case 3:
          {
            Scaffold.of(context)
                .showBottomSheet(
                  (context) => const SavedContainer(),
                  enableDrag: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                  ),
                )
                .closed
                .then((value) {
              setState(() {
                isSavedBottomSheetOpen = false;
              });
            });
            setState(() {
              isSavedBottomSheetOpen = true;
            });
            break;
          }
      }
    } else if (isTicketsBottomSheetOpen &&
        !isSavedBottomSheetOpen &&
        !isSearchBottomSheetOpen) {
      switch (index) {
        case 0:
          Navigator.pop(context);
          setState(() {
            isTicketsBottomSheetOpen = false;
            isSavedBottomSheetOpen = false;
            isSearchBottomSheetOpen = false;
          });
          break;
        case 1:
          {
            Navigator.pop(context);
            setState(() {
              isTicketsBottomSheetOpen = false;
            });
            break;
          }
        case 2:
          {
            Navigator.pop(context);
            Scaffold.of(context)
                .showBottomSheet(
                  (context) => const SearchContainer(),
                  enableDrag: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                  ),
                )
                .closed
                .then((value) {
              setState(() {
                isSearchBottomSheetOpen = false;
              });
            });
            setState(() {
              isSearchBottomSheetOpen = true;
              isTicketsBottomSheetOpen = false;
              isSavedBottomSheetOpen = false;
            });
            break;
          }
        case 3:
          {
            Navigator.pop(context);
            Scaffold.of(context)
                .showBottomSheet(
                  (context) => const SavedContainer(),
                  enableDrag: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                  ),
                )
                .closed
                .then((value) {
              setState(() {
                isSavedBottomSheetOpen = false;
              });
            });
            setState(() {
              isSavedBottomSheetOpen = true;
              isTicketsBottomSheetOpen = false;
              isSearchBottomSheetOpen = false;
            });
          }
          break;
        case 4:
          Navigator.pop(context);
          setState(() {
            isTicketsBottomSheetOpen = false;
            isSavedBottomSheetOpen = false;
            isSearchBottomSheetOpen = false;
          });
          break;
      }
    } else if (!isTicketsBottomSheetOpen &&
        isSavedBottomSheetOpen &&
        !isSearchBottomSheetOpen) {
      switch (index) {
        case 0:
          Navigator.pop(context);
          setState(() {
            isTicketsBottomSheetOpen = false;
            isSavedBottomSheetOpen = false;
            isSearchBottomSheetOpen = false;
          });
          break;
        case 1:
          {
            Navigator.pop(context);
            Scaffold.of(context)
                .showBottomSheet(
                  (context) => const TicketsList(),
                  enableDrag: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                  ),
                )
                .closed
                .then((value) {
              setState(() {
                isTicketsBottomSheetOpen = false;
              });
            });
            setState(() {
              isSearchBottomSheetOpen = false;
              isTicketsBottomSheetOpen = true;
              isSavedBottomSheetOpen = false;
            });
            break;
          }
        case 2:
          {
            Navigator.pop(context);
            Scaffold.of(context)
                .showBottomSheet(
                  (context) => const SearchContainer(),
                  enableDrag: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                  ),
                )
                .closed
                .then((value) {
              setState(() {
                isSearchBottomSheetOpen = false;
              });
            });
            setState(() {
              isSearchBottomSheetOpen = true;
              isTicketsBottomSheetOpen = false;
              isSavedBottomSheetOpen = false;
            });
            break;
          }
        case 3:
          {
            Navigator.pop(context);
            setState(() {
              isSearchBottomSheetOpen = false;
              isTicketsBottomSheetOpen = false;
              isSavedBottomSheetOpen = false;
            });
            break;
          }
        case 4:
          Navigator.pop(context);
          setState(() {
            isTicketsBottomSheetOpen = false;
            isSavedBottomSheetOpen = false;
            isSearchBottomSheetOpen = false;
          });
          break;
      }
    } else if (!isTicketsBottomSheetOpen &&
        !isSavedBottomSheetOpen &&
        isSearchBottomSheetOpen) {
      switch (index) {
        case 0:
          Navigator.pop(context);
          setState(() {
            isTicketsBottomSheetOpen = false;
            isSavedBottomSheetOpen = false;
            isSearchBottomSheetOpen = false;
          });
          break;
        case 1:
          {
            Navigator.pop(context);
            Scaffold.of(context)
                .showBottomSheet(
                  (context) => const TicketsList(),
                  enableDrag: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                  ),
                )
                .closed
                .then((value) {
              setState(() {
                isTicketsBottomSheetOpen = false;
              });
            });
            setState(() {
              isSearchBottomSheetOpen = false;
              isTicketsBottomSheetOpen = true;
              isSavedBottomSheetOpen = false;
            });
            break;
          }
        case 2:
          {
            Navigator.pop(context);
            setState(() {
              isSearchBottomSheetOpen = false;
              isTicketsBottomSheetOpen = false;
              isSavedBottomSheetOpen = false;
            });
            break;
          }
        case 3:
          {
            Scaffold.of(context)
                .showBottomSheet(
                  (context) => const SavedContainer(),
                  enableDrag: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50.0),
                    ),
                  ),
                )
                .closed
                .then((value) {
              setState(() {
                isSavedBottomSheetOpen = false;
              });
            });
            setState(() {
              isSearchBottomSheetOpen = false;
              isTicketsBottomSheetOpen = false;
              isSavedBottomSheetOpen = true;
            });
            break;
          }
        case 4:
          Navigator.pop(context);
          setState(() {
            isTicketsBottomSheetOpen = false;
            isSavedBottomSheetOpen = false;
            isSearchBottomSheetOpen = false;
          });
          break;
      }
    }
  }
}
