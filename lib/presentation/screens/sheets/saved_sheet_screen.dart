import 'package:events_app/constants/functions.dart';
import 'package:events_app/constants/style.dart';
import 'package:events_app/data/data.dart';
import 'package:events_app/presentation/screens/ticket_screen.dart';
import 'package:events_app/presentation/widgets/ticket_item.dart';
import 'package:flutter/material.dart';

class SavedContainer extends StatefulWidget {
  const SavedContainer({Key? key}) : super(key: key);

  @override
  State<SavedContainer> createState() => _SavedContainerState();
}

class _SavedContainerState extends State<SavedContainer> {
  var savedTickets =
      tickets.where((element) => element.isSaved == true).toList();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 500.0,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 100,
                  fit: FlexFit.tight,
                  child: Container(
                    padding: const EdgeInsets.only(top: 30.0),
                    decoration: const BoxDecoration(
                      borderRadius: borderRadius,
                    ),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15.0),
                      itemBuilder: (context, index) {
                        var ticket = savedTickets[index];
                        return InkWell(
                          onTap: () => nextPage(context, TicketScreen(ticket)),
                          child: TicketItem(
                            date: ticket.formattedDate,
                            imageUrl: ticket.imageUrl,
                            title: ticket.name,
                            isSaved: true,
                          ),
                        );
                      },
                      itemCount: savedTickets.length,
                    ),
                  ),
                ),
              ],
            ),
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
