
void setup(){
  String[] lines = loadStrings("1.txt");
  String text = join(lines,"\n");
  String[] NextMapRX =     match(text, "^@\\s*NEXTMAP\\s*=\\s*(.{0,4}\\x2Etxt)$");
  String[] PrevMapRX =     match(text, "^@\\s*PREVMAP\\s*=\\s*(.{0,4}\\x2Etxt)$");
  String[] CheckPointRX =  match(text, "^@\\s*CHECKPOINT\\s*=\\s*(.{0,4}\\x2Etxt)$");
  String[] PlayerModelRX = match(text, "^@\\s*PLAYERMODEL\\s*=\\s*(.{0,18}png)$");
  String[] BGimageRX =     match(text, "^@\\s*BGIMAGE\\s*=\\s*(.{0,18}\\x2Epng)$");
  String[] BounceBox =     match(text, "^@\\s*BOUNCBOX\\s*=\\s*(\\d{0,5}),\\s*(\\d{0,5}),\\s*(\\d{0,5}),\\s*(\\d{0,5})\\s{0,2}$");
  String[] DeathBox =      match(text, "^@\\s*DEATHBOX\\s*=\\s*(\\d{0,5}),\\s*(\\d{0,5}),\\s*(\\d{0,5}),\\s*(\\d{0,5})\\s{0,2}$");
  printArray(DeathBox);
  printArray(PrevMapRX);
  printArray(CheckPointRX);
  printArray(PlayerModelRX);
  printArray(BGimageRX);
  printArray(BounceBox);
  println(NextMapRX[1]);
}

void draw(){

}
