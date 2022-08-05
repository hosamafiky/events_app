import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:events_app/constants/functions.dart';
import 'package:events_app/constants/palette.dart';
import 'package:events_app/constants/style.dart';
import 'package:events_app/data/data.dart';
import 'package:events_app/presentation/screens/ticket_screen.dart';
import 'package:events_app/presentation/widgets/ticket_item.dart';
import 'package:flutter/material.dart';

class TicketsList extends StatefulWidget {
  const TicketsList({Key? key}) : super(key: key);

  @override
  State<TicketsList> createState() => _TicketsListState();
}

class _TicketsListState extends State<TicketsList> {
  DateTime _selectedDateTime = DateTime.now();
  var reservedTickets =
      tickets.where((element) => element.isReserved == true).toList();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Stack(
        children: [
          SizedBox(
            height: 500.0,
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 20,
                    fit: FlexFit.tight,
                    child: Container(
                      padding: const EdgeInsets.only(top: 30.0, right: 10.0),
                      child: DatePicker(
                        DateTime.now(),
                        initialSelectedDate: _selectedDateTime,
                        locale: 'ar',
                        selectedTextColor: Colors.white,
                        selectionColor: Palette.kSecondaryColor,
                        daysCount: 60,
                        onDateChange: (date) {
                          setState(() {
                            _selectedDateTime = date;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 80,
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
                          var ticket = reservedTickets[index];
                          return InkWell(
                            onTap: () =>
                                nextPage(context, TicketScreen(ticket)),
                            child: TicketItem(
                              date: ticket.formattedDate,
                              imageUrl: ticket.imageUrl,
                              title: ticket.name,
                            ),
                          );
                        },
                        itemCount: reservedTickets.length,
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
      ),
    );
  }
}
