import 'package:events_app/presentation/widgets/info_text_field.dart';
import 'package:flutter/material.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 350.0,
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              InfoTextField(
                text: 'بحث',
                controller: searchController,
                isEdit: true,
                floating: false,
                icon: 'gray_search.png',
              ),
              const Spacer(),
              Row(
                children: [
                  Image.asset(
                    'assets/images/suggestion_events.png',
                    width: 60.0,
                  ),
                  const SizedBox(width: 10.0),
                  const Text('الإيفنتات المقترحة')
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Image.asset(
                    'assets/images/most_seen_events.png',
                    width: 60.0,
                  ),
                  const SizedBox(width: 10.0),
                  const Text('الإيفنتات الشائعة')
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Image.asset(
                    'assets/images/fav_events.png',
                    width: 60.0,
                  ),
                  const SizedBox(width: 10.0),
                  const Text('الإيفنتات المفضلة')
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 5.0,
          left: 100.0,
          right: 100.0,
          child: Container(
            width: 70.0,
            height: 3.0,
            color: const Color(0xFFF31D73),
          ),
        ),
      ],
    );
  }
}

// Container(
//       height: 500.0,
//       width: double.infinity,
//       padding: const EdgeInsets.only(top: 15.0),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
//       ),
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.only(
//           left: 25.0,
//           right: 25.0,
//           top: 40.0,
//           bottom: 0.0,
//         ),
//         child: Column(
//           children: const [
//             TicketItem(
//               title: 'حفلة عمر خيرت',
//               date: '15\nمايو',
//             ),
//             SizedBox(height: 15.0),
//             TicketItem(
//               title: 'حفلة عمر خيرت',
//               date: '15\nمايو',
//             ),
//             SizedBox(height: 15.0),
//             TicketItem(
//               title: 'حفلة عمر خيرت',
//               date: '15\nمايو',
//             ),
//             SizedBox(height: 15.0),
//             TicketItem(
//               title: 'حفلة عمر خيرت',
//               date: '15\nمايو',
//             ),
//             SizedBox(height: 15.0),
//             TicketItem(
//               title: 'حفلة عمر خيرت',
//               date: '15\nمايو',
//             ),
//           ],
//         ),
//       ),
//     );