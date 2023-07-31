import 'package:flutter/material.dart' hide Notification;

class NotificationView extends StatelessWidget {
  static const String routeName = "/notification";
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifications = [
      const Notification(
        title: "My wedding flowers",
        description: "Flowers used in my wedding ceremony. Ready for disposal",
        time: "2 hours ago",
        unread: true,
      ),
      const Notification(
        title: "Old age house wants to purchase products posted by you",
        description: "Clothes for sale",
        time: "2 days ago",
        unread: true,
      ),
      const Notification(
        title: "Old newspapers scrap",
        description: "120 kg, ready for disposal",
        time: "3 days ago",
        unread: false,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) => Card(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ListTile(
              onTap: () {},
              title: Text(
                notifications[index].title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                notifications[index].description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Column(
                children: [
                  const Icon(Icons.notifications),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(notifications[index].time),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Notification {
  final String title;
  final String description;
  final String time;
  final bool unread;

  const Notification({
    required this.title,
    required this.description,
    required this.time,
    required this.unread,
  });
}
