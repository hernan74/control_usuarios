class ModeloMotivoHistorial {
  final String fecha;
  final String motivo;
  final bool sincronizado;

  ModeloMotivoHistorial({this.fecha, this.motivo, this.sincronizado});
}

final List<ModeloMotivoHistorial> listaHistorialMotivo = [
  ModeloMotivoHistorial(
    fecha       : '19/02/2020',
    motivo      : 'Primer motivo',
    sincronizado: false,
  ),
  ModeloMotivoHistorial(
    fecha       : '07/02/2021',
    motivo      : 'Segun motivo',
    sincronizado: true,
  ),
  ModeloMotivoHistorial(
    fecha       : '31/10/2018',
    motivo      : 'Tercer motivo',
    sincronizado: true,
  ),
  ModeloMotivoHistorial(
    fecha       : '19/02/2020',
    motivo      : 'Primer motivo',
    sincronizado: false,
  ),
  ModeloMotivoHistorial(
    fecha       : '07/02/2021',
    motivo      : 'Segun motivo',
    sincronizado: true,
  ),
  ModeloMotivoHistorial(
    fecha       : '31/10/2018',
    motivo      : 'Tercer motivo',
    sincronizado: true,
  ),
  ModeloMotivoHistorial(
    fecha       : '19/02/2020',
    motivo      : 'Primer motivo',
    sincronizado: false,
  ),
  ModeloMotivoHistorial(
    fecha       : '07/02/2021',
    motivo      : 'Segun motivo',
    sincronizado: true,
  ),
  ModeloMotivoHistorial(
    fecha       : '31/10/2018',
    motivo      : 'Tercer motivo',
    sincronizado: true,
  ),
];
