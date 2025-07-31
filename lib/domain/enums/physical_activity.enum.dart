enum PhysicalActivityEnum {

  little(
    label:       "Poco",
    description: "Poco o ningún ejercicio", 
    multiplier:  1.2,
  ),
  light(
    label:       "Ligero",
    description: "Ejercicio ligero (1-3 días a la semana)", 
    multiplier:  1.375,
  ),
  moderate(
    label:       "Moderado",
    description: "Ejercicio moderado (3-5 días a la semana)", 
    multiplier:  1.55,
  ),
  strong(
    label:       "Fuerte",
    description: "Ejercicio fuerte (6-7 días a la semana)", 
    multiplier:  1.725,
  ),
  veryStrong(
    label:       "Muy fuerte",
    description: "Ejercicio muy fuerte (dos veces al día, entrenamientos muy duros)", 
    multiplier:  1.9,
  );


  const PhysicalActivityEnum({ 
    required double multiplier,
    required String description,
    required String label,
  }) : _multiplier = multiplier,
      _description = description,
      _label       = label;


  final double _multiplier;
  double get multiplier => _multiplier;
  final String _label;
  String get label => _label;
  final String _description;
  String get description => _description;
}
