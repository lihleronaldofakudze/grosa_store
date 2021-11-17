import 'package:flutter/material.dart';

Widget mainContainer (String image, title) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(8),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image)
                  )
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                    title,
                  style: TextStyle(
                    fontSize: 13
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    )
  );
}
