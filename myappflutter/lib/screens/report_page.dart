import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String? _categoriaSelecionada;
  String? _intensidadeSelecionada;

  final _descricaoController = TextEditingController();
  final _cepController = TextEditingController();
  final _logradouroController = TextEditingController();
  final _complementoController = TextEditingController();
  final _bairroController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _estadoController = TextEditingController();

  final List<String> _categorias = [
    'Infraestrutura',
    'Iluminação Pública',
    'Saneamento',
    'Segurança',
    'Transporte',
  ];

  final List<String> _intensidades = [
    'Baixa',
    'Média',
    'Alta',
    'Urgente',
  ];

  @override
  void dispose() {
    _descricaoController.dispose();
    _cepController.dispose();
    _logradouroController.dispose();
    _complementoController.dispose();
    _bairroController.dispose();
    _cidadeController.dispose();
    _estadoController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xFF9E9E9E),
        fontSize: 16,
      ),
      filled: true,
      fillColor: const Color(0xFFEAEAEA),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 18,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Colors.green,
          width: 1.2,
        ),
      ),
    );
  }

  Widget _sectionCard({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _bottomNavItem(IconData icon, {bool active = false}) {
    return Icon(
      icon,
      color: Colors.white,
      size: active ? 34 : 32,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color(0xFF39A44A),
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Relatar Denúncia',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Vamos criar uma nova solicitação ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Preencha os campos a seguir',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 24, 22, 32),
                child: Column(
                  children: [
                    const Text(
                      'Preencha com seu relato ou denúncia',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 26),

                    _sectionCard(
                      title: 'Categoria',
                      child: DropdownButtonFormField<String>(
                        value: _categoriaSelecionada,
                        decoration: _inputDecoration(
                          hintText: 'Escolha a categoria da sua solicitação',
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 34,
                          color: Colors.black54,
                        ),
                        items: _categorias.map((categoria) {
                          return DropdownMenuItem(
                            value: categoria,
                            child: Text(categoria),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _categoriaSelecionada = value;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 22),

                    _sectionCard(
                      title: 'Descrição',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextField(
                            controller: _descricaoController,
                            maxLength: 50,
                            maxLines: 2,
                            decoration: _inputDecoration(
                              hintText: 'Preencha com o seu relato ou denúncia',
                            ).copyWith(counterText: ''),
                          ),
                          Text(
                            '${_descricaoController.text.length} / 50 caracteres',
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    _sectionCard(
                      title: 'Imagem',
                      child: Column(
                        children: [
                          SizedBox(
                            width: 230,
                            height: 58,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF39A44A),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                'Anexar Imagem',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Anexe foto para ajudar na solicitação',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    _sectionCard(
                      title: 'Grau de intensidade',
                      child: DropdownButtonFormField<String>(
                        value: _intensidadeSelecionada,
                        decoration: _inputDecoration(
                          hintText: 'Escolha com sinceridade o grau de intensidade',
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 34,
                          color: Colors.black54,
                        ),
                        items: _intensidades.map((nivel) {
                          return DropdownMenuItem(
                            value: nivel,
                            child: Text(nivel),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _intensidadeSelecionada = value;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 22),

                    _sectionCard(
                      title: 'Endereço',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 250,
                              height: 58,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF39A44A),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: const Text(
                                  'Marcar local no mapa',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 26),

                          _label('CEP :'),
                          TextField(
                            controller: _cepController,
                            keyboardType: TextInputType.number,
                            decoration: _inputDecoration(
                              hintText: '00000-000',
                            ),
                          ),

                          const SizedBox(height: 16),

                          _label('Logradouro :'),
                          TextField(
                            controller: _logradouroController,
                            decoration: _inputDecoration(),
                          ),

                          const SizedBox(height: 16),

                          _label('Complemento :'),
                          TextField(
                            controller: _complementoController,
                            decoration: _inputDecoration(),
                          ),

                          const SizedBox(height: 16),

                          _label('Bairro :'),
                          TextField(
                            controller: _bairroController,
                            decoration: _inputDecoration(),
                          ),

                          const SizedBox(height: 16),

                          _label('Cidade :'),
                          TextField(
                            controller: _cidadeController,
                            decoration: _inputDecoration(),
                          ),

                          const SizedBox(height: 16),

                          _label('Estado :'),
                          TextField(
                            controller: _estadoController,
                            decoration: _inputDecoration(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    SizedBox(
                      width: 250,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF39A44A),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Enviar Solicitação',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 88,
        decoration: const BoxDecoration(
          color: Color(0xFF39A44A),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomNavItem(Icons.home_outlined),
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.add,
                color: Color(0xFF39A44A),
                size: 34,
              ),
            ),
            _bottomNavItem(Icons.folder_outlined),
            _bottomNavItem(Icons.notifications_none),
            _bottomNavItem(Icons.person_outline),
          ],
        ),
      ),
    );
  }
}