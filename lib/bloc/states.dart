abstract class states {}

class initialized_state extends states {}

class change_botoom_nav_state extends states {}

class NewgGetBusinessSuccessState extends states {}

class waitingBusinessSuccessState extends states {}

class NewgGetSportSuccessState extends states {}

class waitingSportSuccessState extends states {}

class NewgGetScienceSuccessState extends states {}

class waitingScienceSuccessState extends states {}

class NewsGetBusinessErrorState extends states {
  late final String error;

  NewsGetBusinessErrorState(this.error);
}

class statelightanddarkmode extends states {}

class gotourl extends states {}

class witingsearchwordstat extends states {}
class successearchwordstat extends states {}
class erroesearchwordstat extends states {}
