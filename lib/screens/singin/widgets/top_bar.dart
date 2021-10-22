import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 380,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/sign.png'),
                  fit: BoxFit.fill)),
        ),
        Logo()
      ],
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
        Row(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 55, left: 20),
                child: Row(children: [
                  Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        'asset/icons/logo.png',
                        height: 20,
                        width: 17.9,
                        fit: BoxFit.contain,
                      )),
                  const Text(
                    'afoa',
                    style: TextStyle(
                        letterSpacing: 0.4,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF353434)),
                  ),
                ]),
              ),
            ],
          )
        ]);
  }
}