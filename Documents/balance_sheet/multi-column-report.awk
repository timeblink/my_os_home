@include "core.awk"

END{
  printf " +------------------------+"
  printf "------------------------+"
  printf "------------------------+\n"
  printf " | %s = %11.2f |%24s|%24s|\n","上期余额",a0,"",""
  printf " +------------------------+"
  printf "------------------------+"
  printf "------------------------+\n"
  printf " |      %s = %10.2f","微信",i0
  printf " |      %s = %10.2f","伙食",o0
  printf " |%24s|\n",""
  printf " |      %s = %10.2f","开箱",i1
  printf " |      %s = %10.2f","薪酬",o1
  printf " |  %s = %11.2f|\n","建行定期",a1
  printf " |      %s = %10.2f","功德",i2
  printf " |      %s = %10.2f","慈善",o2
  printf " |  %s = %11.2f|\n","建行活期",a2
  printf " |      %s = %10.2f","牌位",i3
  printf " |      %s = %10.2f","交通",o3
  printf " |%24s|\n",""
  printf " |      %s = %10.2f","佛事",i4
  printf " |      %s = %10.2f","日常",o4
  printf " |  %s = %11.2f|\n","中行定期",b1
  printf " |      %s = %10.2f","流通",i5
  printf " |      %s = %10.2f","维护",o5
  printf " |  %s = %11.2f|\n","中行活期",b2
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
  printf " |  %s = %11.2f|\n","现金存款",balance-a1-a2-b1-b2
  printf " +------------------------+"
  printf "------------------------+"
  printf "------------------------+\n"
  printf " |    %s = %10.2f","总收入",i1+i2+i3+i4+i5
  printf " |    %s = %10.2f","总支出",o1+o2+o3+o4+o5+o6+o7+o8+o9
  printf " |  %s = %11.2f|\n","本期平衡",balance
  printf " +------------------------+"
  printf "------------------------+"
  printf "------------------------+\n"
}
