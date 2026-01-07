enum Machinestate {
  empty,
  quater,
  half,
  full
}

extension MachinestateEx on Machinestate{
  String get imagePath{
    switch(this){
      case Machinestate.empty:
        return 'assets/images/machine_empty.svg';
      case Machinestate.quater:
        return 'assets/images/machine_quater.svg';
      case Machinestate.half:
        return 'assets/images/machine_half.svg';
      case Machinestate.full:
        return 'assets/images/machine_full.svg';
    }
  }
}