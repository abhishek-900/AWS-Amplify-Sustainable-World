import 'package:flutter/material.dart';

class SocialView extends StatelessWidget {
  const SocialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Map<String, String>> ngoList = [
      {
        'name': 'Helping Hands Foundation',
        'email': 'contact@helpinghands.org',
      },
      {
        'name': 'Green Earth Society',
        'email': 'info@greenearthsociety.in',
      },
      {
        'name': 'Care for All',
        'email': 'careforall.ngo@gmail.com',
      },
      {
        'name': 'Women Empowerment Trust',
        'email': 'wetrust.india@gmail.com',
      },
      {
        'name': 'Child Rights Foundation',
        'email': 'info@childrightsfoundation.org',
      },
    ];

    final List<Map<String, String>> members = [
      {
        'name': 'Prashant Kumar',
        'email': 'prashant@gmail.com',
        'image': 'assets/icons/flag.png'
      },
      {
        'name': 'Aditi Singh',
        'email': 'aditi123@gmail.com',
        'image': 'assets/icons/bird.png'
      },
      {
        'name': 'Rahul Gupta',
        'email': 'rahul.gupta@gmail.com',
        'image': 'assets/icons/tiger.png'
      },
      {
        'name': 'Priya Patel',
        'email': 'priya.patel@gmail.com',
        'image': 'assets/icons/deer.png'
      },
      {
        'name': 'Amit Singh',
        'email': 'amit.singh@gmail.com',
        'image': 'assets/icons/champion.png'
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Social")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: ngoList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (contex, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.tertiary,
                          width: 2,
                        ),
                      ),
                      width: size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            child: Text(ngoList[index]['name']![0]),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            ngoList[index]['name']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            ngoList[index]['email']!,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Image.asset(
                        members[index]['image']!,
                      ),
                    ),
                    title: Text(members[index]['name']!),
                    subtitle: Text(members[index]['email']!),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
