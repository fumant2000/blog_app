import 'dart:io';

import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/core/utils/pick_image.dart';
import 'package:blog_app/features/blog/presentation/widgets/blog_editor.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddBlogPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const AddBlogPage());
  const AddBlogPage({super.key});

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  File? image;
  List<String> selectedTopics = [];
  final formKey = GlobalKey<FormState>();

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.done_rounded)),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                    onTap: selectImage,
                    child:  image != null
                  ? SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.file(image!, fit: BoxFit.cover)),
                  )
                  : DottedBorder(
                      color: AppPallete.borderColor,
                      dashPattern: const [20, 4],
                      radius: Radius.circular(10),
                      borderType: BorderType.RRect,
                      strokeCap: StrokeCap.butt,
                      child: SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 15,
                          children: [
                            Icon(Icons.folder_open, size: 40),
                            Text(
                              'Select you image',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      ['Technology', 'Buisness', 'Programming', 'Entertaiment']
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () {
                                  if (selectedTopics.contains(e)) {
                                    selectedTopics.remove(e);
                                  } else {
                                    selectedTopics.add(e);
                                  }
                                  setState(() {});
                                },
                                child: Chip(
                                  backgroundColor:
                                      selectedTopics.contains(e)
                                          ? AppPallete.gradient1
                                          : null,
                                  label: Text(e),
                                  side:
                                      selectedTopics.contains(e)
                                          ? null
                                          : const BorderSide(
                                            color: AppPallete.borderColor,
                                          ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
              BlogEditor(controller: titleController, hintText: 'Blog Title'),
              BlogEditor(
                controller: contentController,
                hintText: 'Blog Content',
                isContent: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
