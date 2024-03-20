import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailLoadingWidget extends StatelessWidget {
  const DetailLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.red),
            ),
            _header(),
            const Divider(),
            _overview()
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lorem Ipsum',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text('01-01-2020'),
              Spacer(),
              Icon(Icons.star, color: Colors.amber),
              SizedBox(width: 8),
              Text('5.0')
            ],
          )
        ],
      ),
    );
  }

  Widget _overview() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Est aliquam rem sed repellat, ducimus laboriosam libero quae delectus iusto architecto perspiciatis beatae nemo odio eius accusamus aperiam soluta. Vel, dolorem!',
          )
        ],
      ),
    );
  }
}
