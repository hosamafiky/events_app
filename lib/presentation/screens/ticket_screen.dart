import 'package:events_app/constants/functions.dart';
import 'package:events_app/constants/palette.dart';
import 'package:events_app/constants/style.dart';
import 'package:events_app/data/ticket_model.dart';
import 'package:events_app/presentation/screens/sheets/reserve_ticket_sheet.dart';
import 'package:events_app/presentation/widgets/confirm_button.dart';
import 'package:events_app/presentation/widgets/custom_bottom_sheet.dart';
import 'package:events_app/presentation/widgets/navigation_button.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen(this.ticket, {Key? key}) : super(key: key);

  final Ticket ticket;

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            Row(
              children: [
                IconButton(
                  icon: ImageIcon(AssetImage(
                      'assets/images/${widget.ticket.isSaved ? 'saved.png' : 'save_event.png'}')),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const ImageIcon(
                      AssetImage('assets/images/share_event.png')),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            Image.asset(
              widget.ticket.imageUrl,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                const SizedBox(height: 170.0),
                Container(
                  height: 80.0,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Palette.kSecondaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          widget.ticket.formattedDate,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF31D73).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          '${widget.ticket.remainingHours}\nمتبقي',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  Text(
                                    widget.ticket.name,
                                    style: const TextStyle(fontSize: 20.0),
                                  ),
                                  const SizedBox(width: 10.0),
                                  if (!widget.ticket.isReserved) ...[
                                    Image.asset(
                                      'assets/images/green_dot.png',
                                      width: 10.0,
                                    ),
                                    const SizedBox(width: 5.0),
                                    const Text('متاح'),
                                  ],
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '${widget.ticket.price.round()} ريال',
                                style: const TextStyle(
                                  color: Color(0xFFF31D73),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        InfoRow(
                          text: widget.ticket.formattedTime,
                          icon: 'assets/images/gray_clock.png',
                        ),
                        const SizedBox(height: 10.0),
                        InfoRow(
                          text: widget.ticket.numericDate,
                          icon: 'assets/images/gray_calender.png',
                        ),
                        const SizedBox(height: 10.0),
                        InfoRow(
                          text: widget.ticket.location,
                          icon: 'assets/images/gray_location.png',
                        ),
                        if (widget.ticket.isReserved) ...[
                          const SizedBox(height: 10.0),
                          const InfoRow(
                            text: 'تم حجزه أونلاين',
                            icon: 'assets/images/gray_ticket.png',
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (widget.ticket.isReserved)
              Positioned(
                bottom: -2.0,
                right: -2.0,
                child: NavigationButton(
                  onTap: () {
                    setState(() {
                      widget.ticket.isReserved = false;
                      nextPage(context, TicketScreen(widget.ticket));
                    });
                  },
                  text: 'حذف التذكرة',
                  color: Colors.red,
                ),
              ),
            if (!widget.ticket.isReserved)
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: ConfirmButton(
                  width: MediaQuery.of(context).size.width * 0.5,
                  text: 'حجز التذكرة',
                  onTap: () => showModalCustomBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: borderRadius,
                    ),
                    builder: (context) => ReserveTicketSheet(
                      ticket: widget.ticket,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 25.0,
        ),
        const SizedBox(width: 10.0),
        Text(
          text,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
