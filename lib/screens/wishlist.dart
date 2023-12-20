import 'package:flutter/material.dart';
import 'package:travella/models/activity_model.dart';
import 'package:travella/models/destination_model.dart';
import 'package:travella/models/destination_model.dart';
import 'package:travella/models/hotel_model.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  Text _buildRatingsStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += "⭐️ ";
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("WishList Item Count: ${Count.count}",style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),)
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    Activity activity = destinations[index].activities[index];
                    return activity.isFavorite
                        ? Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(40, 5.0, 20.0, 5.0),
                                height: 190,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(100, 20.0, 20.0, 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 120.0,
                                            child: Text(
                                              activity.name,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    activity.isFavorite =
                                                        !activity.isFavorite;
                                                         activity.isFavorite==true?Count.count++:Count.count--; 
                                                  });
                                                },
                                                child: Icon(
                                                  activity.isFavorite
                                                      ? Icons.favorite
                                                      : Icons
                                                          .favorite_border_outlined,
                                                  color: activity.isFavorite
                                                      ? Colors.red
                                                      : null,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            activity.type,
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            '\$${activity.price}',
                                            style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      _buildRatingsStars(activity.rating),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            width: 85,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).cardColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(activity.startTimes[0]),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5.0),
                                            width: 85.0,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).cardColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(activity.startTimes[1]),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20.0,
                                top: 15.0,
                                bottom: 15.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                                    image: AssetImage(activity.imageUrl),
                                    fit: BoxFit.cover,
                                    width: 110.0,
                                  ),
                                ),
                              )
                            ],
                          )
                        : const SizedBox.shrink();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
