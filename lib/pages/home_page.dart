import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePgae extends StatefulWidget {
  const HomePgae({ Key? key }) : super(key: key);

  @override
  State<HomePgae> createState() => _HomePgaeState();
}

class _HomePgaeState extends State<HomePgae>  with TickerProviderStateMixin{

  var images ={
    "image1.jpg": " image1",
    "image2.jpg": " image2",
    "image3.jpg": " image3",
    "image4.jpg": " image4",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if (state is LoadedState){
            var info = state.places;

             return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, size: 30,color: Colors.black54,),
                Container(  
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5)
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discovery"),
          ),
          SizedBox(height: 10,),
          // tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: [
                  Tab(text: "places",),
                  Tab(text: "Inspiration",),
                  Tab(text: "Emations",)
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
              ListView.builder(
                itemCount: info.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: () {
                       BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                    },
                    child: Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+ info[index].img),
                        fit: BoxFit.cover
                      ),
                    ),
                                  ),
                  );
                },
              ),
              Text("Bye"),
              Text("helllo")
            ]),
          ),
          SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppLargeText(text: "Explore more", size: 22,),
              AppText(text: "See all", color: AppColors.textColor1,),
            ],
          )
          ),
          SizedBox(height: 10,),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_, index){
                return Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Container(
                        // margin: const EdgeInsets.only(right: 20),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("img/"+ images.keys.elementAt(index)),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                      // SizedBox(height: 5,),
                      Container(
                        child: AppText(text: images.values.elementAt(index), color: AppColors.textColor2,),
                      ),
                    ],
                  ),
                );
              }),
          ),
        ],
      );
          } else{
             return Container();
          }
         
        }
      )
      
    );
  }
}

class CircleTabIndicator  extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    // throw UnimplementedError();
    return  _CirclePainter(color:color,radius:radius);
  }
  
}

class _CirclePainter  extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    // offset means area of coodinate
    final Offset circleOffset = Offset(configuration.size!.width/2 - radius/2, configuration.size!.height -radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
    
  }