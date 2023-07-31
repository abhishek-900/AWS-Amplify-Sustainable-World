import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sustainable_world/ui/views/dispose_form/dispose_form_provider.dart';
import 'package:sustainable_world/ui/views/dispose_form/select_organization/select_organization_view_model.dart';

import '../../product_details/product_details_view.dart';

class SelectOrganizationView extends ConsumerWidget {
  const SelectOrganizationView({Key? key}) : super(key: key);

  // final List<Map<String, dynamic>> data = [
  //   {
  //     "name": "Phool.co.in",
  //     "image":
  //         "https://5.imimg.com/data5/BQ/LB/OD/SELLER-6583431/tagetes-erecta-genda-phool-flower-extract-500x500.Jpg",
  //     "location": "Ibrahim Bagh, Hyderabad",
  //   },
  //   {
  //     "name": "Imagine Clothes Bank",
  //     "image": "https://www.theimaginetrust.org/img/clothbank_detail.jpg",
  //     "location": "Bahadurpura, Hyderabad",
  //   },
  //   {
  //     "name": "Sishu Bhavan Orphanage",
  //     "image":
  //         "https://lh5.googleusercontent.com/p/AF1QipO70CeuwSNpQ7sw5SGaUb2lWZexKRomH1zY3iH0=w1080-k-no",
  //     "location": "Motigalli, Hyderabad",
  //   },
  //   {
  //     "name": "My Happy Home - Old Age Home",
  //     "image":
  //         "https://akm-img-a-in.tosshub.com/indiatoday/images/story/201708/27fir16-17-1_647_082717124129.jpg?size=770:433",
  //     "location": "Jubilee Hills, Hyderabad"
  //   },
  //   {
  //     "name": "The Association Of Plastic Recyclers",
  //     "image":
  //         "https://www.mcclabel.com/sites/default/files/images/2020-08/download.png",
  //     "location": "Necklace Road, Hyderabad"
  //   },
  //   {
  //     "name": "Eco Eclectic Group",
  //     "image":
  //         "https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/cjndsxqowhnl5mjauls8",
  //     "location": "Necklace Road, Hyderabad",
  //   },
  //   {
  //     "name": "Ramky E-waste Recycling Factory",
  //     "image":
  //         "https://img.etimg.com/thumb/msid-76572822,width-300,imgsize-202287,,resizemode-4,quality-100/njuk.jpg",
  //     "location": "Necklace Road, Hyderabad",
  //   },
  // ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var orgModel = ref.watch(selectOrganizationViewModelProvider);
    var disposeFormModel = ref.watch(disposeFormProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            disposeFormModel
                .setData((oldData) => {...oldData, 'selectiveRecyclers': []});

            Navigator.of(context).pushNamed(
              ProductDetailsView.routeName,
              arguments: {
                'product': disposeFormModel.getPreviewProduct(),
                'preview': true,
              },
            );
          },
          child: const Icon(Icons.arrow_right_alt)),
      appBar: AppBar(
        title: const Text("Search organization"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: orgModel.searchController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(8),
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: "Type to get suggestions",
              ),
            ),
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: orgModel.organization.length,
        separatorBuilder: (context, index) => const Divider(height: 0),
        itemBuilder: (context, index) {
          return CheckboxListTile(
            secondary: CircleAvatar(
              child: Text(orgModel.organization[index]?.companyName?[0] ?? ""),
            ),
            title: Text(orgModel.organization[index]?.companyName ?? ""),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  orgModel.organization[index]?.companyAddress ?? "",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                Text(
                    "- ${orgModel.organization[index]?.firstName ?? ""}  ${orgModel.organization[index]?.lastName ?? ""}"),
              ],
            ),
            value: orgModel.isCheckorg[index],
            onChanged: (value) {},
          );
        },
      ),
    );
  }
}
