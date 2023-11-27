import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/filters_provider.dart';


class FiltersScreen extends ConsumerStatefulWidget{
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  ConsumerState<FiltersScreen> createState(){
    return _FiltersScreen();
  }
}

class _FiltersScreen extends ConsumerState<FiltersScreen>{
  var _glutenFreeFilterset = false;
  var _lactoseFreeFilterset = false;
  var _vegetarianFreeFilterset = false;
  var _veganFreeFilterset = false;
  @override
  
  void initState(){
    super.initState();
    _glutenFreeFilterset = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterset = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFreeFilterset = widget.currentFilters[Filter.vegetarian]!;
    _veganFreeFilterset = widget.currentFilters[Filter.vegan]!;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier == 'meals'){
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (ctx) => const TabsScreen(),
      //         )
      //     );
      //   }
      // }, ),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterset,
            Filter.lactoseFree: _lactoseFreeFilterset,
            Filter.vegetarian: _vegetarianFreeFilterset,
            Filter.vegan: _veganFreeFilterset
         } );
         return false;
        },
        child: Column(
          children: [
            SwitchListTile(
             value: _glutenFreeFilterset,
             onChanged: (isChecked){
              setState(() {
                _glutenFreeFilterset = isChecked;
              });
             },
             title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
             ),
             subtitle: Text(
              'Only include gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
             ),
             activeColor: Theme.of(context).colorScheme.tertiary,
             contentPadding: const EdgeInsets.only(left: 34, right: 22),
             ),
              SwitchListTile(
             value: _lactoseFreeFilterset,
             onChanged: (isChecked){
              setState(() {
                _lactoseFreeFilterset= isChecked;
              });
             },
             title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
             ),
             subtitle: Text(
              'Only include Lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
             ),
             activeColor: Theme.of(context).colorScheme.tertiary,
             contentPadding: const EdgeInsets.only(left: 34, right: 22),
             ),
              SwitchListTile(
             value: _vegetarianFreeFilterset,
             onChanged: (isChecked){
              setState(() {
                _vegetarianFreeFilterset  = isChecked;
              });
             },
             title: Text(
              'Vegatrian-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
             ),
             subtitle: Text(
              'Only include Vegatrian-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
             ),
             activeColor: Theme.of(context).colorScheme.tertiary,
             contentPadding: const EdgeInsets.only(left: 34, right: 22),
             ),
              SwitchListTile(
             value: _veganFreeFilterset,
             onChanged: (isChecked){
              setState(() {
                _veganFreeFilterset = isChecked;
              });
             },
             title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
             ),
             subtitle: Text(
              'Only include Vegan meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
             ),
             activeColor: Theme.of(context).colorScheme.tertiary,
             contentPadding: const EdgeInsets.only(left: 34, right: 22),
             ),
          ],
        ),
      ),
    );
   
  }
}