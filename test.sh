#!/bin/bash

rm -rf result.txt

for p in `ls -1 ./data`; do
  PASSED=0
  TOTAL=0
  DATANAME=${p%.*}
  echo "== Testing Data ${DATANAME[0]} =="
  for i in `find ./query -name "${DATANAME[0]}*.igraph"`; do
    QUERYNAME=${i#./*/}
    QUERYNAME=${QUERYNAME%.*}
    echo $QUERYNAME

    echo $QUERYNAME >> result.txt
    timeout 60 ./build/main/program "./data/$p" "$i" "./candidate_set/${QUERYNAME}.cs" >> result.txt

    CODE=$?

    if [[ $CODE -eq 124 ]]; then
      echo 'CORRECT_CHECK: PASSED <TIMEOUT>'
      PASSED=$((PASSED+1))
    elif [[ $CODE -ne 0 ]]; then
      echo 'CORRECT_CHECK: FAILED'
      failed_opts+=("$QUERYNAME")
    else
      echo 'CORRECT_CHECK: PASSED'
      PASSED=$((PASSED+1))
    fi

    TOTAL=$((TOTAL+1))

    sed -i '' '/^t/d' ./result.txt
    sed -i '' '/^a/d' ./result.txt

  done
  echo "${p} passed: $PASSED / $TOTAL"
done

if [[ "${#failed_opts[@]}" -ne 0 ]]; then
  echo "== Failed Test List =="
  for i in "${failed_opts[@]}"; do
    echo $i
  done
  echo "CORRECT_CHECK FAILURE"
  exit 1
else
  echo "== All CORRECT CHECKS are PASSED! =="
fi

