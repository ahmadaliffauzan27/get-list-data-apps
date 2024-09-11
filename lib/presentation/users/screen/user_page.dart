import 'package:aplikasi_sederhana/common/components/font_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/app_text_style.dart';
import '../../home/bloc/product/product_bloc.dart';
import '../../home/dashboard/widgets/container_product.dart';
import '../bloc/bloc/users_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pengguna',
          style: AppTextStyle.body1.regular,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
              child: GestureDetector(
                onTap: () {
                  final TextEditingController nameController =
                      TextEditingController();
                  final TextEditingController jobController =
                      TextEditingController();

                  // ignore: no_leading_underscores_for_local_identifiers
                  void _saveUser() {
                    final String name = nameController.text;
                    final String job = jobController.text;

                    if (name.isNotEmpty && job.isNotEmpty) {
                      context.read<UsersBloc>().add(UsersEvent.addUser(
                          name: nameController.text, job: jobController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Pengguna berhasil ditambahkan')),
                      );

                      nameController.clear();
                      jobController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Nama dan Pekerjaan harus diisi')),
                      );
                    }
                  }

                  showDialog(
                      context: context,
                      builder: (context) {
                        return BlocConsumer<UsersBloc, UsersState>(
                          listener: (context, state) {
                            state.maybeWhen(
                                orElse: () {},
                                loaded: (response) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Pengguna berhasil ditambahkan'),
                                    ),
                                  );
                                });
                          },
                          builder: (context, state) {
                            return AlertDialog(
                              title: Text(
                                'Tambah Pengguna',
                                style: AppTextStyle.body1
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      labelText: 'Nama',
                                    ),
                                  ),
                                  TextField(
                                    controller: jobController,
                                    decoration: const InputDecoration(
                                      labelText: 'Pekerjaan',
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Batal'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _saveUser();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Simpan'),
                                ),
                              ],
                            );
                          },
                        );
                      });
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: const Offset(0, 3))
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tambah Pengguna',
                          style: AppTextStyle.body3.medium,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }, loaded: (model) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: model.data.length,
                      itemBuilder: (context, index) => ContainerProduct(
                        data: model.data[index],
                      ),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
