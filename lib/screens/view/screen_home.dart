import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kochitask/helper/app_spacing.dart';
import 'package:kochitask/screens/controller/image_provider.dart';
import 'package:kochitask/widgets/image_gridview_widget.dart';
import 'package:kochitask/widgets/textfeild_widget.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final imageConttroller =
        Provider.of<ImageController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      imageConttroller.searchController.clear();
    });
    return Scaffold(
      appBar: AppBar(
         title: Text('${imageConttroller.searchController.text}, Page ${imageConttroller.currentPage}/${imageConttroller.totelPages}',
            style: TextStyle(color:Colors.white),
          ),
          centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppSpacing.ksizedBox10,
            TextfeildWidget(
              text: "Enter the Image Name",
              obscureText: false,
              controller: imageConttroller.searchController,
              suffixIcon: IconButton(
                onPressed: () {
                  imageConttroller
                      .getImages(imageConttroller.searchController.text);
                },
                icon: const Icon(Icons.search),
              ),
            ),
            AppSpacing.ksizedBox20,
            const Expanded(
              child: ProductViewWidget(),
            )
          ],
        ),
      ),
    );
  }
}
