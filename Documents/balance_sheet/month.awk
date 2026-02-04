@include "core.awk"

END{
  printf "%s,I0微信,%.2f,0,0,I0微信\n",db_date,i0
  printf "%s,I1开箱,%.2f,0,0,I1开箱\n",db_date,i1
  printf "%s,I2功德,%.2f,0,0,I2功德\n",db_date,i2
  printf "%s,I3牌位,%.2f,0,0,I3牌位\n",db_date,i3
  printf "%s,I4佛事,%.2f,0,0,I4佛事\n",db_date,i4
  printf "%s,I5流通,%.2f,0,0,I5流通\n",db_date,i5
  printf "%s,O0伙食,0,%.2f,0,O0伙食\n",db_date,o0
  printf "%s,O1薪酬,0,%.2f,0,O1薪酬\n",db_date,o1
  printf "%s,O2慈善,0,%.2f,0,O2慈善\n",db_date,o2
  printf "%s,O3交通,0,%.2f,0,O3交通\n",db_date,o3
  printf "%s,O4日常,0,%.2f,0,O4日常\n",db_date,o4
  printf "%s,O5维护,0,%.2f,0,O5维护\n",db_date,o5
  printf "%s,O6电话,0,%.2f,0,O6电话\n",db_date,o6
  printf "%s,O7活动,0,%.2f,0,O7活动\n",db_date,o7
  printf "%s,O8手续,0,%.2f,0,O8手续\n",db_date,o8
  printf "%s,O9水电,0,%.2f,0,O9水电\n",db_date,o9
}

