import 'dart:io';
import 'dart:math';

class Racing_Choice_Game {
  int random_number = Random().nextInt(1000);
  Random _rnd;//random_Choice_Number
  int min_computer = 0;//game_Rules
  int max_computer = 1000;//game_Rules
  int _computer_choice;//game_Rules
  List<String> number_dictionary = ['0','1','2','3','4','5','6','7','8', '9' ];
  List<String> list_typing = [];//search_For_Numbers
  List<bool> check_list = [];//search_For_Numbers
  var user_choice;//game_rules
  List<String> str_to_list = []; //string_To_List
  List<String> wyz = []; // filtering_To_Number
  List<String> abc_dictionary = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
                                 '&','é','"','','(','-','è','è','_','ç','à',')','=','<','>',',',';',':','!','?','.','/','§','ù','*','%',
                                  '^','µ','*','£','¨+','°','²','-','*','/','[','#'];
  List<String> fin_number_list = [];
  int fin_number;
  int percentage ;
  String help_tool;
  bool keep_playing = true;
  String keep;
  String username;
  List counter_list = [];
  int round;
  void welcome_Structure() {
    print('============================================='
          '|           Welcome To Our Choice Game      |'
          '=============================================');
    print('Pls Enter your name');
    username = stdin.readLineSync();
    print('Hey $username , hope you will enjoy with our game');

    print('___________________________________________________________________ \n ');
    print('Pls Type Enter after any line To make our game moving step by step:');
    stdin.readLineSync();
    print('___________________________________________________________________ \n ');
  } //welcome_Structure

  int random_Choice_Number(min, max) {
    _rnd = Random();
    int r = min + _rnd.nextInt(max - min);
    return r;
  } //random_Choice_Number

  List string_To_List(sample) {
    for (var i = 0; i < sample.toString().length; i++) {
      str_to_list.add(sample[i]);
    }//for
    return str_to_list;
  }//string_To_List

  bool search_For_Numbers(string_Input) {
    // string_Input ;
   for (var i = 0; i < string_Input.toString().length; i++) {
      list_typing.add(string_Input[i]);
    } //for 1
    for (var i = 0; i < list_typing.length; i++) {
      var checker = number_dictionary.contains(list_typing[i]);
      check_list.add(checker);
    } //for 2
    if (check_list.contains(true)) {
      list_typing.clear();
      check_list.clear();
      return true;
    } else {
      list_typing.clear();
      check_list.clear();
      return false;
    }//else
  } //search_For_Numbers

  List filtering_To_Number(dirty_input) {
    wyz = string_To_List(dirty_input);
    for (int i = 0; i < abc_dictionary.length; i++) {
      if (wyz.contains(abc_dictionary[i])) {
        wyz.removeWhere((p) => p.startsWith(abc_dictionary[i]));
      }//if
    }//for
    return wyz;
  }//filtering_To_Number

  void game_Rules() {
    print(' -----------------------------------------------------------| Game Start  |-----------------------------------------------------------------');

    print(' ----------------------------------------------| Notice : <The Lucky Number is $random_number>  |---------------------------------------------- \n ');

    percentage = 20;
    do {
      _computer_choice = random_Choice_Number(min_computer, max_computer);
      counter_list.add('A');
      round = counter_list.lastIndexOf('A');
      print('=============================================================={Round ${round + 1}}============================================================ \n ' );

      print('--------------------------------------------------------[pls Enter Your Choice:]------------------------------------------------------- \n' );
      user_choice = stdin.readLineSync().toUpperCase();
      wyz.clear();
      bool checker_TF = search_For_Numbers(user_choice);

      if (checker_TF) {
        fin_number_list = filtering_To_Number(user_choice);
        int fin_number = int.parse(fin_number_list.join());

        if (fin_number > random_number) {
          if (fin_number < (random_number + ((percentage * 0.01) * random_number))) /*if*/ {
            print('[--$username--]');
            print(' ---------------------------------------------------| You Almost Get it !! Hurry up !!  |------------------------------------------------');
            print(' -------------------------------------| Notice: You have passed the target with less than $percentage% of him  |----------------------------------');
            print('');
          } // ifS1
          else {
            print('[--$username--]');
            print(
                ' ----------------------------------------------|  your choice "$fin_number" is very high! |------------------------------------------------');
            print(
                ' -----------------------------------------|  Try lower number than that or Alex_Bot will kick your ass   |-----------------------------------');
            print('');
          }//else
        } //if_1

        if (  fin_number < random_number &&
             _computer_choice != random_number &&
              fin_number != random_number) {

          if (random_number - ((percentage * 0.01) * random_number) < (fin_number)) {
            print('[--$username--]');

            print(
                ' ------------------------------------------------|  You Almost Get it !! Hurry up !!   |-----------------------------------------------------');
            print('');
            print(' -----------------------| |Notice|: You have passed ${100 - percentage}% of whole numbers below the lucky one | |-------------------------');
            stdin.readLineSync();
            print('');
          } //ifS1
          else {
            print('[--$username--]');
            print(
                ' -------------| |Notice|: your choice "$fin_number" is very low! Try bigger number than that or Alex_Bot will kick your ass | |--------------');
            stdin.readLineSync();
            print('');
          }//else
        } //if_2

        if (fin_number == random_number && _computer_choice != random_number) {
          print(
              ' --------------------------------------------| WoW! You Win! the lucky number is $random_number   |---------------------------------------------');
          print('');
          stdin.readLineSync();
          print(
              ' -----------------------------------------{ <Alex_BOT> : Oups! Lets play again and i will crush you?  }-----------------------------------------');

          print('');

          print(
              ' -------------------------------------------------------------| [Type] : (yes/no)  |------------------------------------------------------------');
          print('');
          keep = stdin.readLineSync().toUpperCase().trim();
          if (keep.contains('NO')) {

            print(keep);
            print(
                ' -------------------------------------------------{ <Alex_Bot> :  Mmm NVM Asshole...  }-------------------------------------------------');
            print('');

            keep_playing = false;
          }//idS1
          else {

            print(
                ' ----------------------------------{ <Alex_Bot> : Oh You Want To Take Your Revenge heheh , Im so Scared }-------------------------------------');

            print('');
            random_number = Random().nextInt(1000);

            print(' --------------------------------------|  Notice : <The New Lucky Number is $random_number>  |----------------------------------------------');
            stdin.readLineSync();
            print('');
            print(' ---------------------------------------------{   <Alex_Bot> : I will be  first now  }-----------------------------------------------------');

            print('');

            min_computer = 0;
            max_computer = 1000;
          } //else
        } //if_3
        if (_computer_choice > random_number && _computer_choice != random_number && fin_number != random_number) {
          print('[--Alex_Bot--]');
          print(' ---------------------------------| <Alex_Bot> Choose "$_computer_choice" and his too High of lucky number |-----------------------------------');
          max_computer = _computer_choice;
          print(' ----------------------------------| |Notice| : Alex_Bot range is between $min_computer and $max_computer |------------------------------------');
          stdin.readLineSync();
          print('');
        } //if_4
        if (_computer_choice < random_number &&
            _computer_choice != random_number && fin_number != random_number) {
          print('[--Alex_Bot--]');
          print(' ---------------------------------| <Alex_Bot> Choose "$_computer_choice" and his too low than lucky number |----------------------------------');
          print('');
          min_computer = _computer_choice;
          print(' ----------------------------------| |Notice| : Alex_Bot range is between $min_computer and $max_computer |-------------------------------------');
          print('');
          stdin.readLineSync();

        } //if_5
        if (_computer_choice == random_number && fin_number != random_number) {
          print('[--Alex_Bot--]');
          print(' --------------------------------------------| Alex_Bot Win! the Lucky Number is "$random_number |-----------------------------------------------');
          stdin.readLineSync();
          print('');
          print(' ------------------------------------------------------| <Alex_BOT> : play again ? |-------------------------------------------------------------');
          print('');
          print(' ----------------------------------------------------------| [Type] : (yes/no) |-----------------------------------------------------------------');
          print('');
          keep = stdin.readLineSync().toUpperCase().trim();
          if (keep.contains('NO')) {
            print(' ------------------------------------------------------| <Alex_Bot> :  See You Later Noob Lmao  |-----------------------------------------------');
            keep_playing = false;
          }//idS1
          else {
            print(' ----------------------------------| <Alex_Bot> : Oh You Want To Take Your Revenge heheh , Im so Scared   |-------------------------------------');

            print('');

            random_number = Random().nextInt(1000);
            print(' ----------------------------------------------| |Notice| : The New Lucky Number is $random_number |--------------------------------------------');
            stdin.readLineSync();
            print('');
            print(' --------------------------------------------------------| Alex_Bot> I will play first now |----------------------------------------------------');

            print('');
            min_computer = 0;
            max_computer = 1000;
          } //else
        } //if_6

        if (_computer_choice == random_number && fin_number == random_number) {
          print(' -------------------------------------------------------------| WoW !! DRAW !! Amazing |-------------------------------------------------------------');
          print(' --------------------------------------| Alex_Bot> choose "$_computer_choice" and your choice is "$fin_number |--------------------------------------');
          print('');
          print(' ------------------------------------------------------------| <Alex_BOT> : play again ? |------------------------------------------------------------');
          stdin.readLineSync();
          print(' -------------------------------------------------------------| [Type] : (yes/no) |-------------------------------------------------------------------');
          keep = stdin.readLineSync().toUpperCase().trim();
          if (keep.contains('NO')) {

          print(' --------------------------------------------------| <Alex_Bot> : MM.. Ok, see You Next Time Looser hehe  |-------------------------------------------');
          print('');
            keep_playing = false;
          }//if S1
           else {
            print(' ------------------------------------| <Alex_Bot> : Oh You Want To Take Your Revenge heheh , Im so Scared  |---------------------------------------');
            print('');
            random_number = Random().nextInt(1000);

            print(' ----------------------------------------------| |Notice| : The New Lucky Number is $random_number |--------------------------------------------');
          print('');
            stdin.readLineSync();
          print('======================================================={ <Alex_Bot> :"I will play first now }======================================================= ');
            print('');
              min_computer = 0;
              max_computer = 1000;
        } //else
      } //if_7
    }//if checker_tf
    else {
    if (user_choice == 'EXIT') {

      print('==========================================================[---Game_Over---]=====================================================') ;

    keep_playing = false;
    } //if string1
    else {

     print('=============================================[ Pls type "Exit" if you want to go out ]============================================') ;
     stdin.readLineSync();
     print('');
    } //else
    }//big else

    } //do
    while ( keep_playing);
  } //game_Rules

} //Computer_Choice_Game
