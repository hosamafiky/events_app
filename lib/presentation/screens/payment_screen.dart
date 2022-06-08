import 'package:events_app/constants/functions.dart';
import 'package:events_app/constants/palette.dart';
import 'package:events_app/constants/style.dart';
import 'package:events_app/data/ticket_model.dart';
import 'package:events_app/presentation/screens/ticket_paid_screen.dart';
import 'package:events_app/presentation/widgets/cancel_button.dart';
import 'package:events_app/presentation/widgets/confirm_button.dart';
import 'package:events_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  final Ticket ticket;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Palette.kPrimaryColor,
        appBar: AppBar(
          backgroundColor: Palette.kPrimaryColor,
          elevation: 0.0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 70.0,
                height: 3.0,
                color: const Color(0xFFF31D73),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Column(
                    children: [
                      const SizedBox(height: 30.0),
                      Image.asset(
                        'assets/images/payment_visa_card.png',
                        width: 200.0,
                      ),
                      const SizedBox(height: 20.0),
                      const CustomTextField(
                        label: 'Credit Card',
                        icon: 'card',
                        isWhite: true,
                        hintText: '0000-0000-0000-0000',
                      ),
                      const SizedBox(height: 20.0),
                      const _InputCard(
                        label: 'First Name / Last Name',
                        firstInputHint: 'John',
                        secondInputHint: 'Doe',
                      ),
                      const SizedBox(height: 20.0),
                      const _InputCard(
                        label: 'EXP / CVV',
                        firstInputHint: 'EXP : MM/YY',
                        secondInputHint: 'CVV',
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ConfirmButton(
                      text: 'تأكيد',
                      onTap: () => nextPage(
                          context,
                          TicketPaidScreen(
                            ticket: widget.ticket,
                          )),
                    ),
                  ),
                  Expanded(
                    child: CancelButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputCard extends StatelessWidget {
  const _InputCard({
    Key? key,
    required this.label,
    this.firstInputHint,
    this.secondInputHint,
  }) : super(key: key);

  final String label;
  final String? firstInputHint;
  final String? secondInputHint;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.transparent,
            border: Border.all(
              color: Colors.grey,
              width: 2.0,
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 20.0),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: firstInputHint,
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: VerticalDivider(
                  indent: 10.0,
                  endIndent: 10.0,
                  width: 2.0,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: secondInputHint,
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0),
            ],
          ),
        ),
        Positioned(
          left: 20.0,
          top: -10.0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            color: Colors.white,
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
