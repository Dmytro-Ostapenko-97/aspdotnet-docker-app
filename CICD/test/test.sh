result=`grep "AspDotNet" test.html | wc -l`
#echo $result
if [ "$result" -gt 1 ]
  then 
    echo "Test Passed"
  else
    echo "Test Failed"
    exit 1
fi
