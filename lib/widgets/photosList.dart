import 'package:flutter/material.dart';

import '../models/data.dart';

class photosListWidget extends StatelessWidget {
  const photosListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    future: getPhoto(),
    builder: (context, snapshot) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: ((context, index) {
            if (snapshot.hasData && snapshot.data != null) {
              final item = snapshot.data![index]; 
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          item.url,
                          fit:BoxFit.fill,
                          width: 140,
                          height: 130,
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          })
          
        );
        return Container();
      }
      );
  }
}