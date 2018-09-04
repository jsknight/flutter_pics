import 'package:flutter/material.dart';
import 'package:pics/src/models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  
  ImageList(this.images);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(20.0),
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index){
        return buildImage(images[index]);
      }
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width:1.0
        )
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Column(
        children: <Widget>[
          Image.network(image.url),
          SizedBox(height:20.0),
          Text(image.title, textAlign: TextAlign.center,),
        ],
      )
    );
  }

}
