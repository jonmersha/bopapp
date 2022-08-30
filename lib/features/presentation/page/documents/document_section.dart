
import 'package:bop/features/controllers/BranchServiceController.dart';
import 'package:bop/features/controllers/document_section_controller.dart';
import 'package:bop/features/presentation/page/documents/components/section_card.dart';
import 'package:bop/features/presentation/page/documents/section_pdf_viewer.dart';
import 'package:bop/features/presentation/page/service/component/service_card.dart';
import 'package:bop/features/presentation/page/service/main_service_list_container.dart';
import 'package:bop/features/utils/app_colors.dart';
import 'package:bop/features/utils/app_constants.dart';
import 'package:bop/features/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SectionList extends StatefulWidget {
  final int docId;
   SectionList({Key? key, required this.docId}) : super(key: key);
  @override
  State<SectionList> createState() => _SectionListState();
}



class _SectionListState extends State<SectionList> {
  @override
  Widget build(BuildContext context) {

    Get.find<DocumentSectionController>().getDocumentSectionListByID(widget.docId);

    return         GetBuilder<DocumentSectionController>(builder: (sectionController){
      return sectionController.isLoaded? ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: sectionController.sectionList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
               onTap: (){
                 Get.to(()=>SectionPDFView(sectionModel: sectionController.sectionList[index], documentSectionController: sectionController,),
                     transition: Transition.leftToRightWithFade,duration: const Duration(milliseconds: 800));
               },
              child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  children: [
                    Container(
                      margin:  const EdgeInsets.only(bottom: 7),
                      height: Dimensions.listViewIMG,
                      width: Dimensions.listViewIMG,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(Dimensions.width10),
                          color: Colors.blue,
                          // image:  DecorationImage(
                          //     fit: BoxFit.cover,
                          //     image: NetworkImage(AppConstants.IMAGE_URL+sectionController.sectionList[index].!)
                          // )
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //height: Dimensions.listViewTextView,
                        width: Dimensions.listViewTextView,
                        margin: const EdgeInsets.only(bottom: 7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(Dimensions.width10),
                                bottomRight:
                                Radius.circular(Dimensions.width10)),
                            color: Colors.white30),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10),
                          child: SectionCard(section:sectionController.sectionList[index]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }):CircularProgressIndicator(
        color: AppColors.mainColor,
      );
    });
  }
}


