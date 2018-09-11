BEGIN {
  FS=",";
  }
$1 ~ /^Event/ { print $1,$2 }
$1 ~ /^Heat/ { print $1,$2 }
$1 ~ /^[0-9]/ {
  if ($2 != "Group") {
    command="awk -v StudentName=\"" $2 "\" -f get_class_no_chinese.awk sport_utf8.csv";
#  print command;
    system(command);
    getline class_chinese < "ChineseName";
    close("ChineseName");
    getline class_no < "ClassNo";
    close("ClassNo");
    print $1,$2,class_chinese,$3;
    } 
  else {
    print $1,$2,$3;
    }
 }
