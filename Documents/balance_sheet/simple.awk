BEGIN{
  FS=","
}
NR == 1 {
  balance = $5#收支平衡
  income = 0#收入
  expense = 0#支出
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
  next
}
$2 ~ /A0/ { next }
$2 ~ /A1/ { a1 += $5 }
$2 ~ /A2/ { a2 += $5 }
$2 ~ /I0/ { i0 += $3 ; income += $3 ; balance += $3 }
$2 ~ /I1/ { i1 += $3 ; income += $3 ; balance += $3 }
$2 ~ /I2/ { i2 += $3 ; income += $3 ; balance += $3 }
$2 ~ /I3/ { i3 += $3 ; income += $3 ; balance += $3 }
$2 ~ /I4/ { i4 += $3 ; income += $3 ; balance += $3 }
$2 ~ /I5/ { i5 += $3 ; income += $3 ; balance += $3 }
$2 ~ /O0/ { o0 += $4 ; expense += $4 ; balance += $4 }
$2 ~ /O1/ { o1 += $4 ; expense += $4 ; balance += $4 }
$2 ~ /O2/ { o2 += $4 ; expense += $4 ; balance += $4 }
$2 ~ /O3/ { o3 += $4 ; expense += $4 ; balance += $4 }
$2 ~ /O4/ { o4 += $4 ; expense += $4 ; balance += $4 }
$2 ~ /O5/ { o5 += $4 ; expense += $4 ; balance += $4 }
$2 ~ /O6/ { o6 += $4 ; expense += $4 ; balance += $4 }
$2 ~ /O7/ { o7 += $4 ; expense += $4 ; balance += $4 }
$2 ~ /O8/ { o8 += $4 ; expense += $4 ; balance += $4 }

END{
  printf " +------------------------------+\n"
  printf " | %s = %15.2f   |\n","上期余额",a0
  printf " +------------------------------+\n"
  printf " | %s = %15.2f   |\n","建行存款",a1
  printf " | %s = %15.2f   |\n","中行存款",a2
  printf " +------------------------------+\n"
  printf " | 当期收入:                    |\n"
  printf " |     %s = %10.2f        |\n","微信",i0
  printf " |     %s = %10.2f        |\n","开箱",i1
  printf " |     %s = %10.2f        |\n","功德",i2
  printf " |     %s = %10.2f        |\n","牌位",i3
  printf " |     %s = %10.2f        |\n","佛事",i4
  printf " |     %s = %10.2f        |\n","流通",i5
  printf " |          %17.2f   |\n",income
  printf " +------------------------------+\n"
  printf " | 当期支出:                    |\n"
  printf " |     %s = %10.2f        |\n","伙食",o0
  printf " |     %s = %10.2f        |\n","薪酬",o1
  printf " |     %s = %10.2f        |\n","慈善",o2
  printf " |     %s = %10.2f        |\n","交通",o3
  printf " |     %s = %10.2f        |\n","日常",o4
  printf " |     %s = %10.2f        |\n","维护",o5
  printf " |     %s = %10.2f        |\n","电话",o6
  printf " |     %s = %10.2f        |\n","活动",o7
  printf " |     %s = %10.2f        |\n","手续",o8
  printf " |          %17.2f   |\n",expense
  printf " +------------------------------+\n"
  printf " | %s = %15.2f   |\n","应有现金",balance-a1-a2
  printf " +------------------------------+\n"
  printf " | %s = %15.2f   |\n","本地平衡",balance
  printf " +------------------------------+\n"
}
