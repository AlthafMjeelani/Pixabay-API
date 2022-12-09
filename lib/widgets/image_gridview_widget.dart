import 'package:flutter/material.dart';
import 'package:kochitask/screens/controller/image_provider.dart';
import 'package:kochitask/widgets/no_data_widget.dart';
import 'package:provider/provider.dart';

class ProductViewWidget extends StatefulWidget {
  const ProductViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductViewWidget> createState() => _ProductViewWidgetState();
}
late ImageController imageController;

class _ProductViewWidgetState extends State<ProductViewWidget> {
  @override
  void initState() {
    imageController = Provider.of<ImageController>(context, listen: false);
    imageController.scrollController.addListener(() {
      if (imageController.scrollController.position.pixels ==
          imageController.scrollController.position
              // ignore: curly_braces_in_flow_control_structures
              .maxScrollExtent) if (imageController.currentPage <=
          imageController.totelPages) {
        ++imageController.currentPage;
        imageController.getImages(imageController.searchController.text);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final imageController =
        Provider.of<ImageController>(context, listen: false);
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
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : imageController.imageModel!.imageDetails!.isEmpty
                    ? const CustomNotFoundWidget(
                        title: "Product is Empty", subtitle: '')
                    : GridView.builder(
                        itemCount:
                            (value.imageModel == null ? 0 : value.hits.length),
                        controller: value.scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1 / 1.2),
                        itemBuilder: (BuildContext context, int index) {
                          final image = value.hits[index];
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
                                      image.toString(),
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
