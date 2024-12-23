#!/bin/bash

# 초기 숫자 설정
count=1

# 무한 루프
while true
do
  # afl-fuzz 실행
  gnome-terminal -- timeout 5h afl-fuzz -i input1 -o output$count -- ./fuzzgoat/fuzzgoat @@

  # 5초 대기
  sleep 5

  # top 실행 (gnome-terminal 없이 백그라운드에서 실행하여 리다이렉트)
  timeout 5h top -b -n6 -d3600 > /home/test/output$count/top.txt &

  # 5시간 10초 대기
  sleep 5h 10s

  # 숫자 증가
  count=$((count + 1))
done

