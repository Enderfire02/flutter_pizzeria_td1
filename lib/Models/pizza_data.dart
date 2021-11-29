import 'pizza.dart';

class PizzaData
{
 static List<Pizza> buildList()
 {
   List<Pizza> list = [];
   list.add(Pizza(1,'Fromages', 'Pâte à pizza, sauce tomate en base, jambon et trois fromages.', 'pizza-bbq.jpg', 13));
   list.add(Pizza(2,'Champignons', 'Pâte à pizza, sauce tomate,  jambon et champignons.', 'pizza-hawai.jpg', 14));
   list.add(Pizza(3,'Bizarre', 'Dépend de l humeur du chef.', 'pizza-spinach.jpg', 7));
   list.add(Pizza(4,'Végétarienne', 'Pâte à pizza, sauce tomate, roquette et champignons.', 'pizza-vegetable.jpg', 9));
   return list;
 }
}