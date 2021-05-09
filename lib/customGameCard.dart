import 'package:flutter/material.dart';

class CustomGameCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              new Container(
                height: 113,
                width: 5,
                color: Color(0xffcddc39),
              )
            ]),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 0, 10),
                    child: Text(
                      '내전 MMR이 가장 높은 소환사',
                      style: TextStyle(color: Color(0xffcddc39)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      'Daegu',
                      style: TextStyle(
                          color: Color(0xffcddc39),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Divider(indent: 10, endIndent: 10, thickness: 1),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                    child: Text(
                      '1873',
                      style: TextStyle(color: Color(0xffcddc39)),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
