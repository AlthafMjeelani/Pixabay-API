import 'package:flutter/material.dart';
import 'package:kochitask/screens/controller/image_provider.dart';
import 'package:kochitask/widgets/no_data_widget.dart';
import 'package:provider/provider.dart';

class ProductViewWidget extends StatelessWidget {
  const ProductViewWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final imageController =
        Provider.of<ImageController>(context, listen: false);
    //imageController.handler(imageController.searchController.text);
    return Consumer(
      builder: (context, ImageController value, child) {
        return value.isLoading
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : imageController.imageModel == null
                ? const SizedBox()
                : imageController.imageModel!.imageDetails!.isEmpty
                    ? const CustomNotFoundWidget(
                        title: "Product is Empty", subtitle: '')
                    :
                    // NotificationListener<ScrollNotification>(
                    //     onNotification: (notification) {
                    //       if (notification.metrics.pixels ==
                    //           notification.metrics.maxScrollExtent) {
                    //         value.handler(
                    //             value.searchController.text, value.isLoading);
                    //       }
                    //       return false;
                    //     },
                    //     child:

                    GridView.builder(
                        controller: value.scrollController,
                        itemCount: value.imageModel!.imageDetails!.length,
                        //value.currentPage,
                        //shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1 / 1.2),
                        itemBuilder: (BuildContext context, int index) {
                          final image =
                              imageController.imageModel!.imageDetails![index];
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                // width: double.infinity,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      image.webformatUrl.toString(),
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        //),
                      );
        //);
      },
    );
  }
}
