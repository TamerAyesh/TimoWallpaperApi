class WallpaperModel {
  String photographer;
  String photographer_url;
  int photographer_id;
  SrcModel srcModel;

  WallpaperModel({
    this.srcModel,
    this.photographer,
    this.photographer_url,
    this.photographer_id,
  });

  factory WallpaperModel.fromMap(Map<String,dynamic> jsonData){
    return WallpaperModel(
      srcModel: SrcModel.fromMap(jsonData['src']),
      photographer: jsonData['photographer'],
      photographer_url: jsonData['photographer_url'],
      photographer_id: jsonData['photographer_id'],
    );
  }

}

class SrcModel {
  String original;
  String small;
  String portrait;

  SrcModel({this.original, this.small, this.portrait});

  factory SrcModel.fromMap(Map<String,dynamic> jsonData){
    return SrcModel(
      original: jsonData['original'],
      small: jsonData['small'],
      portrait: jsonData['portrait'],
    );
  }

}
