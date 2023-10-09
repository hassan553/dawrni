/// In this class, we will define the paths to the svgs in assets.
/// Do not forget to add the paths to the files that contain the svgs in "pubspec.yaml" in line 63.
///
/// Adding a new path to the class will be done using the following method
/// static const String svgName = '$_baseSvgsPath/svg_name.svg';
///
/// Using [SvgsPaths] with flutter_svg library
/// by set path to [SvgPicture] widget
///
/// Ex: SvgPicture.asset(_path),

// TODO: add svgs assest pathes here

class SvgsPaths {
  static const String _baseSvgsPath = 'assets/svgs';
  static const String svg = '$_baseSvgsPath/svg.svg';
}
