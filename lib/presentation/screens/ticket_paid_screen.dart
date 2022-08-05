import 'package:events_app/constants/functions.dart';
import 'package:events_app/constants/palette.dart';
import 'package:events_app/constants/style.dart';
import 'package:events_app/data/models/ticket_model.dart';
import 'package:events_app/presentation/screens/layout_screen.dart';
import 'package:events_app/presentation/screens/ticket_screen.dart';
import 'package:events_app/presentation/widgets/cancel_button.dart';
import 'package:events_app/presentation/widgets/confirm_button.dart';
import 'package:flutter/material.dart';

class TicketPaidScreen extends StatefulWidget {
  const TicketPaidScreen({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  final Ticket ticket;
  @override
  State<TicketPaidScreen> createState() => _TicketPaidScreenState();
}

class _TicketPaidScreenState extends State<TicketPaidScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Palette.kPrimaryColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20.0),
            Image.asset(
              'assets/images/bg_confirm_payment.png',
              fit: BoxFit.fitWidth,
              //height: 200.0,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: partBorderRadius,
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 80.0),
                      child: const Text(
                        'تم تأكيد الدفع',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ConfirmButton(
                            text: 'الذهاب للتذكرة',
                            onTap: () {
                              setState(() {
                                widget.ticket.isReserved = true;
                                nextPage(context, TicketScreen(widget.ticket));
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: CancelButton(
                            text: 'العودة للرئيسية',
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AppLayout(),
                                ),
                                (route) => false,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
