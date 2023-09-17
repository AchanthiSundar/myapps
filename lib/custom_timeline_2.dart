import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const CustomTimeLine());
}

class CustomTimeLine extends StatelessWidget {
  const CustomTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    color: HexColor("#F1F3F6"),
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 328,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, top: 16, right: 0, bottom: 16),
                          child: SizedBox(
                            width: 239,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: Text(
                                    "ABSLI Digishield Plan",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Arvo",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: HexColor("#2E2E2E")),
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                SizedBox(
                                  width: 114,
                                  height: 18,
                                  child: Text(
                                    "Level Cover Option",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: HexColor("#797979")),
                                  ),
                                ),
                                const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AgeColumn(),
                                      TimeLineColumn(),
                                      DetailsContainerColumn(),
                                    ]),
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}

class AgeColumn extends StatelessWidget {
  const AgeColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            width: 60,
            height: 30,
            child: Text(
              "Policy Term \nStart",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: HexColor("#979CAE"),
                  letterSpacing: 0.1),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Container(
            width: 52,
            height: 23,
            decoration: BoxDecoration(
                color: HexColor("#4374D0"),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: SizedBox(
                    width: 36,
                    height: 15,
                    child: Text(
                      "Age 35",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: HexColor("#FFFFFF"),
                          letterSpacing: 0.1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 155,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Container(
            width: 52,
            height: 23,
            decoration: BoxDecoration(
                color: HexColor("#4374D0"),
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: SizedBox(
                    width: 36,
                    height: 15,
                    child: Text(
                      "Age 85",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: HexColor("#FFFFFF"),
                          letterSpacing: 0.1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 5),
          child: SizedBox(
            width: 60,
            height: 30,
            child: Text(
              "Policy Term \nEnd",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: HexColor("#979CAE"),
                  letterSpacing: 0.1),
            ),
          ),
        ),
      ],
    );
  }
}

class TimeLineColumn extends StatelessWidget {
  const TimeLineColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 34,
        ),
        Padding(
          padding: const EdgeInsets.only(left:4,bottom:4),
          child: SizedBox(
              width: 12,
              height: 10,
              child: Text(
                "0",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: HexColor("#979CAE")),
              )),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 1,
                  color: HexColor("#062662"),
                ),
                Container(
                  width: 2,
                  height: 70.0,
                  color: HexColor("#4374D0"),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: SizedBox(
            width: 24,
            height: 24,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: HexColor("#FFFFFF"),
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    color: HexColor("#D3452880"),
                    //color of shadow
                    spreadRadius: 0,
                    //spread radius
                    blurRadius: 20, // blur radius
                  ),
                ],
              ),
              child: SizedBox(
                  width: 16,
                  height: 16,
                  child: SvgPicture.asset("asset/icons/vector.svg")),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Column(
              children: [
                SizedBox(
                  width: 2,
                  height: 85,
                  child: CustomPaint(
                    painter: DashedVerticalLinePainter(),
                  ),
                ),
                Container(
                  width: 12,
                  height: 1,
                  color: HexColor("#062662"),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(left:5,top:4),
          child: SizedBox(
              width: 12,
              height: 10,
              child: Text(
                "50",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: HexColor("#979CAE")),
              )),
        ),
      ],
    );
  }
}

class DetailsContainerColumn extends StatelessWidget {
  const DetailsContainerColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13, top: 24),
          child: Container(
            width: 200,
            height: 53,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: HexColor("#FFFFFF")),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: SvgPicture.asset(
                      "asset/icons/text_box_check.svg",
                      width: 12.5,
                      height: 12,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 99,
                    height: 18,
                    child: Text(
                      "Get insured now",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: HexColor("#2E2E2E")),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13, top: 14),
          child: Container(
            width: 200,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: HexColor("#FFFFFF")),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: SvgPicture.asset(
                      "asset/icons/cash.svg",
                      width: 12,
                      height: 8,
                    ),
                  ),
                  SizedBox(
                    width: 172,
                    height: 60,
                    child: Text(
                      "Your nominee will be paid cover amount in the event of your untimely demise, as one-time payment, tax free*",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: HexColor("#2E2E2E"),
                          letterSpacing: 0.1),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13, top: 34),
          child: Container(
            width: 200,
            height: 53,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: HexColor("#FFFFFF")),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: SvgPicture.asset(
                      "asset/icons/text_box_remove_outline.svg",
                      width: 12.36,
                      height: 12.36,
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 18,
                    child: Text(
                      "Policy coverage ends",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: HexColor("#2E2E2E")),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DashedVerticalLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashGap;

  DashedVerticalLinePainter({
    this.dashWidth = 5.0,
    this.dashGap = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = HexColor("4374D0")
      ..strokeWidth = 1.0 // Adjust as needed
      ..style = PaintingStyle.stroke;

    double currentX = 0;
    while (currentX < size.height) {
      canvas.drawLine(
        Offset(0, currentX),
        Offset(0, currentX + dashWidth),
        paint,
      );
      currentX += dashWidth + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
