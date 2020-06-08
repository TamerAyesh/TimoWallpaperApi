import 'package:wallpaperflutterapi/model/categories_model.dart';

List<CategoriesModel> getCategories(){

  List<CategoriesModel> catList = new List();
  CategoriesModel categoriesModel = new CategoriesModel();

  //
  categoriesModel.imgURL = "https://images.pexels.com/photos/162396/lost-places-pforphoto-leave-factory-162396.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Street Art";
  catList.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgURL = "https://images.pexels.com/photos/397857/pexels-photo-397857.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Wild Life";
  catList.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgURL = "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260";
  categoriesModel.categoriesName = "Nature";
  catList.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgURL = "https://images.pexels.com/photos/373912/pexels-photo-373912.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "City";
  catList.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgURL = "https://images.pexels.com/photos/853168/pexels-photo-853168.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Motivation";
  catList.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgURL = "https://images.pexels.com/photos/296735/pexels-photo-296735.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  categoriesModel.categoriesName = "Bikes";
  catList.add(categoriesModel);
  categoriesModel = new CategoriesModel();

  categoriesModel.imgURL = "https://images.pexels.com/photos/241316/pexels-photo-241316.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  categoriesModel.categoriesName = "Cars";
  catList.add(categoriesModel);
  categoriesModel = new CategoriesModel();



  return catList;
}