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

$2 ~ /余额/ { a0 = $5 }
$2 ~ /建行定期/ { a1 = $5 }
$2 ~ /建行活期/ { a2 = $5 }
$2 ~ /中行定期/ { b1 = $5 }
$2 ~ /中行活期/ { b2 = $5 }

$2 ~ /微信/ { i0 += $3 ; bottomline += $3 }
$2 ~ /开箱/ { i1 += $3 ; bottomline += $3 }
$2 ~ /功德/ { i2 += $3 ; bottomline += $3 }
$2 ~ /牌位/ { i3 += $3 ; bottomline += $3 }
$2 ~ /佛事/ { i4 += $3 ; bottomline += $3 }
$2 ~ /流通/ { i5 += $3 ; bottomline += $3 }

$2 ~ /伙食/ { o0 += $4 ; bottomline -= $4 }
$2 ~ /薪酬/ { o1 += $4 ; bottomline -= $4 }
$2 ~ /慈善/ { o2 += $4 ; bottomline -= $4 }
$2 ~ /交通/ { o3 += $4 ; bottomline -= $4 }
$2 ~ /日常/ { o4 += $4 ; bottomline -= $4 }
$2 ~ /维护/ { o5 += $4 ; bottomline -= $4 }
$2 ~ /电话/ { o6 += $4 ; bottomline -= $4 }
$2 ~ /活动/ { o7 += $4 ; bottomline -= $4 }
$2 ~ /手续/ { o8 += $4 ; bottomline -= $4 }
$2 ~ /水电/ { o9 += $4 ; bottomline -= $4 }

