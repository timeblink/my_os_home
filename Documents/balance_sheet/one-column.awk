@include "core.awk"

END{
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
  printf " | 现金存款: %17.2f  |\n",balance-a1-a2-b1-b2
  printf " +------------------------------+\n"
  printf " | %s = %16.2f  |\n","本期平衡",balance
  printf " +------------------------------+\n"
}
