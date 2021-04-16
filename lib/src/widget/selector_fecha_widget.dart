import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:control_usuarios/src/widget/textfield_widget.dart';

class SelectorFechaWidget extends StatefulWidget {
  final IconData icono;
  final String hindText;
  final String formatoFecha;
  final bool iconoIzquida;
  final Color colorGradienteIconoInicio;
  final Color colorGradienteIconoFin;
  final double alto;
  final double hintTextSize;

  const SelectorFechaWidget(
      {this.icono = Icons.ac_unit,
      this.hindText = '',
      this.formatoFecha = 'dd/MM/yyyy',
      this.iconoIzquida = false,
      this.colorGradienteIconoInicio = Colors.grey,
      this.colorGradienteIconoFin = Colors.grey,
      this.alto = 60,
      this.hintTextSize = 22});

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
    return Container(
      height: this.widget.alto,
      child: TextfieldWidget(
        iconoIzquida: this.widget.iconoIzquida,
        alineacionTexto: TextAlign.start,
        hindText: this.widget.hindText,
        icono: this.widget.icono,
        colorGradienteIconoInicio: this.widget.colorGradienteIconoInicio,
        colorGradienteIconoFin: this.widget.colorGradienteIconoFin,
        enableInteractiveSelection: false,
        controller: this._controller,
        hintTextSize: this.widget.hintTextSize,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _mostrarSelectorFecha(context, this.widget.formatoFecha);
        },
      ),
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
