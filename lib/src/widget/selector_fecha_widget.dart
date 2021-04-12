import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:control_usuarios/src/widget/textfield_widget.dart';
import 'package:control_usuarios/src/helpers/estilos.dart' as estilo;

class SelectorFechaWidget extends StatefulWidget {
  final IconData icono;
  final String hindText;
  final double ancho;
  final double alto;
  final String formatoFecha;

  const SelectorFechaWidget(
      {this.icono = Icons.ac_unit,
      this.hindText = '',
      this.ancho = 150,
      this.alto = 60,
      this.formatoFecha = 'dd/MM/yyyy'});

  @override
  _SelectorFechaWidgetState createState() => _SelectorFechaWidgetState();
}

class _SelectorFechaWidgetState extends State<SelectorFechaWidget> {
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    _controller.text = '';
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextfieldWidget(
      alineacionTexto: TextAlign.start,
      ancho: this.widget.ancho,
      alto: this.widget.alto,
      hindText: this.widget.hindText,
      icono: this.widget.icono,
      colorGradienteIconoInicio: estilo.colorPrimarioUno,
      colorGradienteIconoFin: estilo.colorPrimarioUnoGradiente,
      enableInteractiveSelection: false,
      controller: this._controller,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _mostrarSelectorFecha(context, this.widget.formatoFecha);
      },
    );
  }

  void _mostrarSelectorFecha(BuildContext context, String formatoFecha) async {
    DateTime fecha = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.input,
      initialDate: _verificarFechaValida(this._controller.text, formatoFecha),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: Locale('es', 'ES'),
      fieldHintText: 'dd/MM/yyyy',
      builder: (context, child) {
        return new Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: Colors.orangeAccent,
            ),
          ),
          child: child,
        );
      },
    );
    _controller.text =
        (fecha == null) ? '' : DateFormat(formatoFecha).format(fecha);
  }

  DateTime _verificarFechaValida(String date, String formatoFecha) {
    if (date == null || DateTime.tryParse(date.replaceAll('/', '')) == null)
      return DateTime.now();

    DateTime fecha = new DateFormat(formatoFecha).parse(date);

    if (fecha == null)
      return DateTime.now();
    else
      return fecha;
  }
}
