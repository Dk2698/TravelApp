import 'package:equatable/equatable.dart';
import 'package:travel_app/model/data_model.dart';

abstract class CubitStates extends Equatable{

}

class InitialState extends CubitStates{
  late int x;
  @override
  // TODO: implement props
  List<Object?> get props => [];
  
}
class WelcomeState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class LoadingState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];
  
}
class LoadedState extends CubitStates{
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  // TODO: implement props
  List<Object> get props => [places];
  
}
// state create then after create new function emit
class DetailState extends CubitStates{
  DetailState(this.place);
  final DataModel place;
  @override
  // TODO: implement props
  List<Object> get props => [place];
  
}