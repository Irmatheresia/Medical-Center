import 'package:flutter/material.dart';
import 'package:flutter_application_1/History/kesehatan_provider.dart';
import 'package:provider/provider.dart';

class RekamMedisScreen extends StatefulWidget {
  const RekamMedisScreen({super.key});

  @override
  State<RekamMedisScreen> createState() => _RekamMedisScreenState();
}

class _RekamMedisScreenState extends State<RekamMedisScreen> {
  // @override
  // void initState() {
  //   Future.microtask(() {
  //     Provider.of<KesehatanProvider>(context, listen: false).initialData();
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat Medis"),
        actions: [
          menuList(context),
        ],
      ),
      body: body(context),
    );
  }

  body(BuildContext context) {
    final prov = Provider.of<KesehatanProvider>(context);
    if (prov.data == null) {
      return const CircularProgressIndicator();
    } else {
      return ListView(
        children: List.generate(prov.data['data']!.length, (index) {
          var item = prov.data['data']![index];
          return Column(
            children: [
              ListTile(
                leading:
                    CircleAvatar(backgroundImage: NetworkImage(item['img'])),
                title: Text(item['penyakit']),
              ),
              const Divider()
            ],
          );
        }),
      );
    }
  }

  menuList(BuildContext context) {
    final prov = Provider.of<KesehatanProvider>(context);

    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: ((context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
              child: ListTile(
            onTap: () => prov.ubahList('rawatinap'),
            leading: const Icon(Icons.phone),
            title: const Text('Rawat Inap'),
          )),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              onTap: () => prov.ubahList('rawatjalan'),
              leading: const Icon(Icons.laptop),
              title: const Text('Rawat Jalan'),
            ),
          )
        ];
      }),
    );
  }
}
