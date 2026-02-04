BEGIN{
  FS=","
}
NR == 1 {
  balance = $5#收支平衡
  a0 = $5#上期余额
  a1 = 0#建行定活存款
  a2 = 0#中行定活存款
  i0 = 0#微信
  i1 = 0#开箱
  i2 = 0#功德
  i3 = 0#牌位
  i4 = 0#佛事
  i5 = 0#流通
  o0 = 0#伙食
  o1 = 0#薪酬
  o2 = 0#慈善
  o3 = 0#交通
  o4 = 0#日常
  o5 = 0#维护
  o6 = 0#电话
  o7 = 0#活动
  o8 = 0#手续
  o9 = 0#水电
  next
}
$2 ~ /A0/ { next }
$2 ~ /A1/ { a1 += $5 }
$2 ~ /A2/ { a2 += $5 }
$2 ~ /I0/ { i0 += $3 ; balance += $3 }
$2 ~ /I1/ { i1 += $3 ; balance += $3 }
$2 ~ /I2/ { i2 += $3 ; balance += $3 }
$2 ~ /I3/ { i3 += $3 ; balance += $3 }
$2 ~ /I4/ { i4 += $3 ; balance += $3 }
$2 ~ /I5/ { i5 += $3 ; balance += $3 }
$2 ~ /O0/ { o0 += $4 ; balance -= $4 }
$2 ~ /O1/ { o1 += $4 ; balance -= $4 }
$2 ~ /O2/ { o2 += $4 ; balance -= $4 }
$2 ~ /O3/ { o3 += $4 ; balance -= $4 }
$2 ~ /O4/ { o4 += $4 ; balance -= $4 }
$2 ~ /O5/ { o5 += $4 ; balance -= $4 }
$2 ~ /O6/ { o6 += $4 ; balance -= $4 }
$2 ~ /O7/ { o7 += $4 ; balance -= $4 }
$2 ~ /O8/ { o8 += $4 ; balance -= $4 }
$2 ~ /O9/ { o9 += $4 ; balance -= $4 }

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
  printf " | 建行存款: %17.2f  |\n",a1
  printf " | 中行存款: %17.2f  |\n",a2
  printf " | 现金存款: %17.2f  |\n",balance-a1-a2
  printf " +------------------------------+\n"
  printf " | %s = %16.2f  |\n","本地平衡",balance
  printf " +------------------------------+\n"
}
