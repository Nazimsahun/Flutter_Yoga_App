class YogaModel{
  static String YogaTable1 = "BeginnerYoga";
  static String YogaTable2 = "WeightLossYoga";
  static String YogaTable3 = "KidsYoga";
  static String YogaSummary = "YogaSummary";
  static String YogaWorkOutName = "YogaWorkOutName";
  static String BackImg = "BackImg";
  static String TimeTaken = "TimeTaken";
  static String TotalNoOfWork = "TotalNoOfWork";
  static String IDName = "ID";
  static String YogaName = "YogaName";
  static String SecondsOrNot = "SecondsOrNot";
  static String SecondsOrTimes = "SecondsOrTimes";
  static String ImageName = "ImageName";
  static List<String>? YogaTable1ColumnName = [YogaModel.IDName,YogaModel.SecondsOrNot,YogaModel.YogaName,YogaModel.ImageName,YogaModel.SecondsOrTimes];

}



class Yoga{
  final int? id;
  final bool Seconds;
  final String YogaTitle;
  final String YogaImgUrl;
  final String SecondsOrTimes;

  const Yoga({
    this.id,
    required this.Seconds,
    required this.YogaImgUrl,
    required this.YogaTitle,
    required this.SecondsOrTimes
});

  Yoga copy({
  int? id,
    bool? Seconds,
    String? YogaTitle,
    String? YogaImgUrl,
    String? SecondsOrTimes
}){
    return Yoga(
      id: id?? this.id,
        Seconds: Seconds?? this.Seconds,
        YogaImgUrl: YogaImgUrl?? this.YogaImgUrl,
         YogaTitle: YogaTitle?? this.YogaTitle,
    SecondsOrTimes: SecondsOrTimes?? this.SecondsOrTimes);
  }



  static Yoga fromJson(Map<String, Object?> json){
    return Yoga(
      id: json[YogaModel.IDName] as int?,
        Seconds: json[YogaModel.SecondsOrNot] == 1,
        YogaImgUrl: json[YogaModel.ImageName] as String,
        YogaTitle: json[YogaModel.YogaName] as String,
        SecondsOrTimes: json[YogaModel.SecondsOrTimes] as String);
  }

  Map<String , Object?> toJson(){
    return{
      YogaModel.IDName : id,
      YogaModel.SecondsOrNot: Seconds?1:0,
      YogaModel.YogaName : YogaTitle,
      YogaModel.ImageName : YogaImgUrl,
      YogaModel.SecondsOrTimes: SecondsOrTimes
    };
  }
}




class YogaSummary{



  final int? id;

  final String YogaWorkOutName;
  final String BackImg;
  final String TimeTaken;
  final String TotalNoOfWork;

  const YogaSummary({
    this.id,
    required this.YogaWorkOutName,
    required this.BackImg,
    required this.TimeTaken,
    required this.TotalNoOfWork
  });

  YogaSummary copy({
    int? id,
    String? YogaWorkOutName,
    String? BackImg,
    String? TimeTaken,
    String? TotalNoOfWork
  }){
    return YogaSummary(
        id: id?? this.id,
      YogaWorkOutName: YogaWorkOutName?? this.YogaWorkOutName,
      BackImg: BackImg?? this.BackImg,
      TimeTaken: TimeTaken?? this.TimeTaken,
      TotalNoOfWork: TotalNoOfWork?? this.TotalNoOfWork,
    );
  }



  static YogaSummary fromJson(Map<String, Object?> json){
    return YogaSummary(
        id: json[YogaModel.IDName] as int?,
        YogaWorkOutName: json[YogaModel.YogaWorkOutName] as String,
        BackImg: json[YogaModel.BackImg] as String,
        TimeTaken: json[YogaModel.TimeTaken] as String,
      TotalNoOfWork: json[YogaModel.TotalNoOfWork] as String,
    );
  }

  Map<String , Object?> toJson(){
    return{
      YogaModel.IDName : id,
      YogaModel.YogaWorkOutName: YogaWorkOutName,
      YogaModel.BackImg : BackImg,
      YogaModel.TimeTaken : TimeTaken,
      YogaModel.TotalNoOfWork : TotalNoOfWork,
    };
  }
}