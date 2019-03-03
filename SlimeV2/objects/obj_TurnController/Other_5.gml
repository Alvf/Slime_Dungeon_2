/// @description Save turn

ini_open("turn.ini")
ini_write_real("meta", "your turn", your_turn)
ini_close();