import 'package:flutter/material.dart';
import 'package:task1/models/nasa.dart';
import 'package:task1/screen/homeScreen/image_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.nasaData});

  final Nasa nasaData;

  @override
  State<HomeScreen> createState() => _HomeScreenState(data: nasaData);
}

class _HomeScreenState extends State<HomeScreen> {

  final Nasa data;
  _HomeScreenState({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('Rover Photo'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Rover name:', style: TextStyle(fontSize: 20),),
                        Text('${data.photos![1].rover?.name}', style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Sol:', style: TextStyle(fontSize: 20),),
                        Text('${data.photos![1].sol}', style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Rover id:', style: TextStyle(fontSize: 20),),
                        Text('${data.photos![1].rover!.id}', style: const TextStyle(fontSize: 20),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        width: double.infinity,
                        color: Colors.black,
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),  
              delegate: SliverChildBuilderDelegate((context, index) {
                return IconButton(
                  onPressed: (){
                    showDialog(context: context, builder: ((BuildContext context) => ImageDialog(photo: data.photos![index],)));
                  },
                  icon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 4)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                          data.photos![index].imgSrc!, 
                          fit: BoxFit.cover, 
                          width: double.infinity, 
                          height: double.infinity,
                      ),
                    )
                  )
                );
              }),
              
            ),
          ],
        ),
      ),
    );
  }
}

