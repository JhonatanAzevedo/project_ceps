import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app_widget.dart';
import 'model/cep_model.dart';
import 'repositories/cep_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const AppWidget());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CepRepository cepRepository = CepRepository();
  final TextEditingController cepController = TextEditingController(text: '');
  final TextEditingController streetController = TextEditingController(text: '');
  final TextEditingController districtController = TextEditingController(text: '');
  final TextEditingController cityController = TextEditingController(text: '');
  final TextEditingController stateController = TextEditingController(text: '');

  CepModel ceps = CepModel(results: []);

  @override
  void initState() {
    getCeps();
    super.initState();
  }

  void getCeps() async {
    ceps = await cepRepository.obterTarefas();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ceps'),
      ),
      body: ListView.builder(
          itemCount: ceps.results.length,
          itemBuilder: (_, int index) {
            final cep = ceps.results[index];
            return Center(child: Text(cep.city));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModalBottomSheet();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  _showModalBottomSheet() {
    return showModalBottomSheet(
        backgroundColor: Colors.grey[200],
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (context) {
          double screenHeight = MediaQuery.of(context).size.height;
          return SizedBox(
            height: screenHeight * 0.8,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              child: ListView(
                children: [
                  SizedBox(
                    child: TextField(
                      maxLength: 8,
                      keyboardType: TextInputType.number,
                      controller: cepController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        hintText: 'Digite o Cep',
                        contentPadding: EdgeInsets.only(top: 0, left: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: cityController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      hintText: 'Digite a cidade',
                      contentPadding: EdgeInsets.only(top: 0, left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: districtController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      hintText: 'Digite o bairro',
                      contentPadding: EdgeInsets.only(top: 0, left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    //focusNode: heightFocusNode,
                    controller: streetController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      hintText: 'Digite a rua',
                      contentPadding: EdgeInsets.only(top: 0, left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    //focusNode: heightFocusNode,
                    controller: stateController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      hintText: 'Digite o estado',
                      contentPadding: EdgeInsets.only(top: 0, left: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text('Adicionar'),
                    onPressed: () async {
                      cepRepository.addedCep(
                        Results(
                          cep: cepController.text,
                          street: streetController.text,
                          district: districtController.text,
                          city: cityController.text,
                          state: stateController.text,
                        ),
                      );
                      Navigator.pop(context);
                      getCeps();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}





