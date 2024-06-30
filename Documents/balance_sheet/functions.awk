
function onecolumn(){
  printf " +------------------------------+\n"
  printf " | %s = %16.2f  |\n","上期余额",a0
  printf " +------------------------------+\n"
  printf " | 当期收入: %17.2f  |\n",i0+i1+i2+i3+i4+i5
  printf " |     %s = %10.2f        |\n","微信",i0
  printf " |     %s = %10.2f        |\n","开箱",i1
  printf " |     %s = %10.2f        |\n","功德",i2
  printf " |     %s = %10.2f        |\n","牌位",i3
  printf " |     %s = %10.2f        |\n","佛事",i4
  printf " |     %s = %10.2f        |\n","流通",i5
  printf " +------------------------------+\n"
  printf " | 当期支出: %17.2f  |\n",o0+o1+o2+o3+o4+o5+o6+o7+o8+o9
  printf " |     %s = %10.2f        |\n","伙食",o0
  printf " |     %s = %10.2f        |\n","薪酬",o1
  printf " |     %s = %10.2f        |\n","慈善",o2
  printf " |     %s = %10.2f        |\n","交通",o3
  printf " |     %s = %10.2f        |\n","日常",o4
  printf " |     %s = %10.2f        |\n","维护",o5
  printf " |     %s = %10.2f        |\n","电话",o6
  printf " |     %s = %10.2f        |\n","活动",o7
  printf " |     %s = %10.2f        |\n","手续",o8
  printf " |     %s = %10.2f        |\n","水电",o9
  printf " +------------------------------+\n"
  printf " | 建行定期: %17.2f  |\n",a1
  printf " |     活期: %17.2f  |\n",a2
  printf " +------------------------------+\n"
  printf " | 中行定期: %17.2f  |\n",b1
  printf " |     活期: %17.2f  |\n",b2
  printf " +------------------------------+\n"
  printf " | 现金存款: %17.2f  |\n",a0+bottomline-a1-a2-b1-b2
  printf " +------------------------------+\n"
  printf " | %s = %16.2f  |\n","本期平衡",a0+bottomline
  printf " +------------------------------+\n"
}

function mulcolumn(){
  printf " +------------------------+\n"
  printf " | %s = %11.2f | %39s\n","上期余额",a0,db_date
  printf " +------------------------+"
  printf "------------------------+"
  printf "------------------------+\n"
  printf " |      %s = %10.2f","微信",i0
  printf " |      %s = %10.2f","伙食",o0
  printf " |%24s|\n",""
  printf " |      %s = %10.2f","开箱",i1
  printf " |      %s = %10.2f","薪酬",o1
  printf " | %s = %11.2f |\n","建行定期",a1
  printf " |      %s = %10.2f","功德",i2
  printf " |      %s = %10.2f","慈善",o2
  printf " | %s = %11.2f |\n","建行活期",a2
  printf " |      %s = %10.2f","牌位",i3
  printf " |      %s = %10.2f","交通",o3
  printf " |%24s|\n",""
  printf " |      %s = %10.2f","佛事",i4
  printf " |      %s = %10.2f","日常",o4
  printf " | %s = %11.2f |\n","中行定期",b1
  printf " |      %s = %10.2f","流通",i5
  printf " |      %s = %10.2f","维护",o5
  printf " | %s = %11.2f |\n","中行活期",b2
  printf " |%23s",""
  printf " |      %s = %10.2f","电话",o6
  printf " |%24s|\n",""
  printf " |%23s",""
  printf " |      %s = %10.2f","活动",o7
  printf " |%24s|\n",""
  printf " |%23s",""
  printf " |      %s = %10.2f","手续",o8
  printf " |%24s|\n",""
  printf " |%23s",""
  printf " |      %s = %10.2f","水电",o9
  printf " |%24s|\n",""
  printf " +------------------------+"
  printf "------------------------+"
  printf "------------------------+\n"
  printf " |      %s = %10.2f","收入",i0+i1+i2+i3+i4+i5
  printf " |      %s = %10.2f","支出",o1+o2+o3+o4+o5+o6+o7+o8+o9
  printf " | %s = %11.2f |\n","现金存款",a0+bottomline-a1-a2-b1-b2
  printf " +------------------------+"
  printf "------------------------+"
  printf "------------------------+\n"
  printf " |   %s = %10.2f","总收入",a0+i0+i1+i2+i3+i4+i5
  printf " |%23s",""
  printf " | %s = %11.2f |\n","本期平衡",a0+bottomline
  printf " +------------------------+"
  printf "------------------------+"
  printf "------------------------+\n"
}

function monthrow(){
  printf "%s,微信,%.2f,0,0,微信\n",db_date,i0
  printf "%s,开箱,%.2f,0,0,开箱\n",db_date,i1
  printf "%s,功德,%.2f,0,0,功德\n",db_date,i2
  printf "%s,牌位,%.2f,0,0,牌位\n",db_date,i3
  printf "%s,佛事,%.2f,0,0,佛事\n",db_date,i4
  printf "%s,流通,%.2f,0,0,流通\n",db_date,i5
  printf "%s,伙食,0,%.2f,0,伙食\n",db_date,o0
  printf "%s,薪酬,0,%.2f,0,薪酬\n",db_date,o1
  printf "%s,慈善,0,%.2f,0,慈善\n",db_date,o2
  printf "%s,交通,0,%.2f,0,交通\n",db_date,o3
  printf "%s,日常,0,%.2f,0,日常\n",db_date,o4
  printf "%s,维护,0,%.2f,0,维护\n",db_date,o5
  printf "%s,电话,0,%.2f,0,电话\n",db_date,o6
  printf "%s,活动,0,%.2f,0,活动\n",db_date,o7
  printf "%s,手续,0,%.2f,0,手续\n",db_date,o8
  printf "%s,水电,0,%.2f,0,水电\n",db_date,o9
}

