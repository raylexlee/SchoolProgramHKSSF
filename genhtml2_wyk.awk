BEGIN {
  FS=",";
  printf("<!DOCTYPE html> \n");
  printf("<html>\n");
  printf("<head>\n");
  printf("<meta charset=\"utf-8\">\n");
  printf("<title>WYK Administration Web App</title>\n");
  printf("<link href=\"http://code.jquery.com/mobile/1.0a3/jquery.mobile-1.0a3.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
  printf("<script src=\"http://code.jquery.com/jquery-1.5.min.js\" type=\"text/javascript\"></script>\n");
  printf("<script src=\"http://code.jquery.com/mobile/1.0a3/jquery.mobile-1.0a3.min.js\" type=\"text/javascript\"></script>\n");
  printf("</head> \n");
  printf("<body> \n");
  printf("<div data-role=\"page\" id=\"page_S1D1\">\n");
  printf("  <div data-role=\"header\" data-position=\"fixed\">\n");
  printf("	<h1>校際泳決賽日</h1>\n");
  printf("<a href=\"/index.html\" data-role=\"button\" data-icon=\"home\" class=\"ui-btn-right\" ></a>\n");
printf("  </div>\n");
printf("<div data-role=\"content\">\n");
printf("<ul data-role=\"listview\" data-filter=\"true\" data-divider-theme=\"b\">\n");
}
$1 ~ /^Event/ { 
printf("<li data-role=\"list-divider\">%s</li>\n",$1);
printf("  <li>%s</li>\n",$2);
printf("  <li>%s</li>\n",$3);
}
$1 ~ /^Final/ {
printf("  <li>%s</li>\n",$1);
}
$1 ~ /^[0-9]/ {
if ($2 != "Group") {
command="awk -v StudentName=\"" $2 "\" -f get_class_no_chinese.awk sport_utf8.csv";
#  print command;
system(command);
getline class_chinese < "ChineseName";
close("ChineseName");
getline class_no < "ClassNo";
close("ClassNo");
getline student_class < "StudentClass";
close("StudentClass");
getline student_number < "StudentNumber";
close("StudentNumber");
printf(" <li><a href=\"/public/school/student/class/%s/%s_e.html\">\n",student_class,student_number);
printf(" <img src=\"/local/student/photo/k%s.jpg\" />\n",class_no);
printf(" <h1>%s Lane %s</h1>\n",class_chinese,$1);
printf(" <p>%s</p>\n",$2);
printf(" </a></li>\n");
} 
else {
printf(" <li>\n");
printf(" <h1>G R O U P    Lane %s</h1>\n",$1);
printf(" </li>\n");
}
}
END {
#  if (StartOfHeat == 1) {
#    printf("   </Heat>\n");
#    }
#  if (StartOfEvent == 1) {
#    printf("  </Event>\n");
#    }
#  printf("</Events>\n");
printf("</ul>\n");
printf("</div>\n");
printf("</div>\n");
printf("</body></html>\n");
}
