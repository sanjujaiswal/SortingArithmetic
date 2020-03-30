#!/bin/bash

function ascendingOrder(){
   for (( i=1;i<=4;i++ ))
   do
      for (( j=1;j<=4;j++ ))
      do
         if [ ${array[$i]} -lt ${array[$j]} ]
         then
            Temp=${array[$i]};
            array[$i]=${array[$j]};
            array[$j]=$Temp;
         fi
      done
   done
}

function descendingOrder(){
   for (( i=1;i<=4;i++ ))
   do
      for (( j=1;j<=4;j++ ))
      do
         if [ ${array[$i]} -gt ${array[$j]} ]
         then
            Temp=${array[$i]};
            array[$i]=${array[$j]};
            array[$j]=$Temp;
         fi
      done
   done
}


read -p "Enter value of a :" Number1
read -p "Enter value of b :" Number2
read -p "Enter value of c :" Number3

declare -A resultArray
resultArray[exp1]=$(( $Number1 + $Number2 * $Number3));
resultArray[exp2]=$(($Number1*$Number2+$Number3));
resultArray[exp3]=$(($Number3+$Number1/$Number2));
resultArray[exp4]=$(($Number1%$Number2+$Number3));

for (( i=1;i<=4;i++ ))
do
	eval array[$i]=${resultArray[exp$i]};
done

#Function call
ascendingOrder
echo "Ascending order is :${array[@]}"
descendingOrder
echo "Descending order is :${array[@]}"
