class ProjectModel {
  
  const ProjectModel._({
    required this.title,
    required this.description,
    required this.pathImage,
    required this.route,
  });

  final String title;
  final String description;
  final String pathImage;
  final String route;

  static const people = ProjectModel._(
    title: "People",
    description: "App para Registrar Movimientos de una empresa",
    pathImage: 'assets/svgs/people.svg',
    route: "home_people",
  );
  static const cargo = ProjectModel._(
    title: "Cargo",
    description: "App para Registra Movimientos de Vehiculos",
    pathImage: 'assets/svgs/cargo.svg',
    route: "home_cargo",
  );
  static const listProjects = [
    people,
    cargo,
  ];
}
