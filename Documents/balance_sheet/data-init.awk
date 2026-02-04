BEGIN{
  FS=","
  db_date = ""
  bottomline = 0#净利润
  a0 = 0#上期余额
  a1 = 0#建行定存
  a2 = 0#建行活
  b1 = 0#中行定存
  b2 = 0#中行活
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
}

{ db_date = substr($1,1,7) }

$2 ~ /A0/ { a0 = $5 }
$2 ~ /A1/ { a1 = $5 }
$2 ~ /A2/ { a2 = $5 }
$2 ~ /B1/ { b1 = $5 }
$2 ~ /B2/ { b2 = $5 }

$2 ~ /I0/ { i0 += $3 ; bottomline += $3 }
$2 ~ /I1/ { i1 += $3 ; bottomline += $3 }
$2 ~ /I2/ { i2 += $3 ; bottomline += $3 }
$2 ~ /I3/ { i3 += $3 ; bottomline += $3 }
$2 ~ /I4/ { i4 += $3 ; bottomline += $3 }
$2 ~ /I5/ { i5 += $3 ; bottomline += $3 }

$2 ~ /O0/ { o0 += $4 ; bottomline -= $4 }
$2 ~ /O1/ { o1 += $4 ; bottomline -= $4 }
$2 ~ /O2/ { o2 += $4 ; bottomline -= $4 }
$2 ~ /O3/ { o3 += $4 ; bottomline -= $4 }
$2 ~ /O4/ { o4 += $4 ; bottomline -= $4 }
$2 ~ /O5/ { o5 += $4 ; bottomline -= $4 }
$2 ~ /O6/ { o6 += $4 ; bottomline -= $4 }
$2 ~ /O7/ { o7 += $4 ; bottomline -= $4 }
$2 ~ /O8/ { o8 += $4 ; bottomline -= $4 }
$2 ~ /O9/ { o9 += $4 ; bottomline -= $4 }

