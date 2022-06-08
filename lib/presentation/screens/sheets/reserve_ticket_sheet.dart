import 'package:events_app/constants/functions.dart';
import 'package:events_app/data/ticket_model.dart';
import 'package:events_app/presentation/screens/payment_screen.dart';
import 'package:flutter/material.dart';

class ReserveTicketSheet extends StatefulWidget {
  const ReserveTicketSheet({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  final Ticket ticket;
  @override
  State<ReserveTicketSheet> createState() => _ReserveTicketSheetState();
}

class _ReserveTicketSheetState extends State<ReserveTicketSheet> {
  bool _isTicketChoosed = false;
  String _ticketPrice = '';
  String _ticketType = '';
  String _ticketIcon = '';
  @override
  Widget build(BuildContext context) {
    return _isTicketChoosed
        ? _choosePaymentMethod(
            _ticketIcon,
            _ticketPrice,
            _ticketType,
          )
        : _chooseTicket();
  }

  Widget _chooseTicket() => Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'اختر نوع التذكرة',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 30.0),
                  InkWell(
                    onTap: () => setState(() {
                      _ticketPrice = '2500 ريال';
                      _ticketType = 'تذكرة VIP';
                      _ticketIcon = 'vip.png';
                      _isTicketChoosed = true;
                    }),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/vip.png',
                          width: 45.0,
                        ),
                        const SizedBox(width: 10.0),
                        const Text('تذكرة VIP'),
                        const Spacer(),
                        const Text('2500 ريال'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(
                      height: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _ticketPrice = '1500 ريال';
                      _ticketType = 'تذكرة ذهبية';
                      _ticketIcon = 'gold.png';
                      _isTicketChoosed = true;
                    }),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/gold.png',
                          width: 45.0,
                        ),
                        const SizedBox(width: 10.0),
                        const Text('تذكرة ذهبية'),
                        const Spacer(),
                        const Text('1500 ريال'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(
                      height: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _ticketPrice = '500 ريال';
                      _ticketType = 'تذكرة عادية';
                      _ticketIcon = 'normal.png';
                      _isTicketChoosed = true;
                    }),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/normal.png',
                          width: 45.0,
                        ),
                        const SizedBox(width: 10.0),
                        const Text('تذكرة عادية'),
                        const Spacer(),
                        const Text('500 ريال'),
                      ],
                    ),
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
        ),
      );
  Widget _choosePaymentMethod(String icon, String price, String type) =>
      Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/online_payment.png',
                        width: 50.0,
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'دفع أونلاين',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Container(
                          width: double.infinity,
                          color: Colors.grey.withOpacity(0.5),
                          height: 1.0,
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(() {
                          _isTicketChoosed = false;
                        }),
                        child: Container(
                          color: const Color(0xffFFFAEE),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 20.0,
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/$icon',
                                width: 45.0,
                              ),
                              const SizedBox(width: 10.0),
                              Text(type),
                              const Spacer(),
                              Text(price),
                              const SizedBox(width: 10.0),
                              Image.asset(
                                'assets/images/check.png',
                                width: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 30.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, -2),
                        blurRadius: 7.0,
                        color: Colors.black54.withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => nextPage(
                            context,
                            PaymentScreen(
                              ticket: widget.ticket,
                            )),
                        child: Image.asset(
                          'assets/images/visa.png',
                          width: 60.0,
                        ),
                      ),
                      Image.asset(
                        'assets/images/sadad.png',
                        width: 60.0,
                      ),
                      Image.asset(
                        'assets/images/mada.png',
                        width: 60.0,
                      ),
                    ],
                  ),
                ),
              ],
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
