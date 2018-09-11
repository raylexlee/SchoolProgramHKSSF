BEGIN {
  FS=",";
#  print StudentName;
  }
$1 == StudentName {
  print $2 > "ChineseName";
  print $3 > "ClassNo";
  print $4 > "StudentClass";
  print $5 > "StudentNumber";
  }
