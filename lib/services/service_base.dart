
import 'package:radiantglow/helpers/enums.dart';
import 'package:radiantglow/persistence/data_context.dart';

getItems(CollectionTypes type) async {
   return (await db.collection(type.name).doc().get()).data();
}

addItem(CollectionTypes type, Map<String, dynamic> item) async{ 
   return await db.collection(type.name).add(item);
}

itemCount<int>(CollectionTypes type) async  {
   return (await db.collection(type.name).get()).size;
}