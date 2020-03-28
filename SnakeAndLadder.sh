# welcome to snake and ladder game simulator
START_POSITION=0;
NUMBER_OF_PLAYER=2;
DIE_ROLL_COUNTER=0;
DIE_ROLL_COUNTER2=0;
#player rolls the die to get Random number between 1 to 6
firstPlayerIndex=$START_POSITION;
secondPlayerIndex=$START_POSITION;
echo "firstPlayerIndex :"$START_POSITION;
echo "secondPlayerIndex :"$START_POSITION;
echo "NUMBER_OF_PLAYER :" $NUMBER_OF_PLAYER
NOPLAY=0;
LADDER=1;
SNAKE=2;
echo "select noplay,ladder or snake"
WIN_POSTION=30;
echo "winning position is: " $WIN_POSTION
while [ $firstPlayerIndex -le $WIN_POSTION ] && [ $secondPlayerIndex -le $WIN_POSTION ]
do
	echo "first player press enter to roll the die"
	read
	SELECT=$(( $RANDOM%3 ))
	RANDOM_DIE_NUMBER=$(( $RANDOM%6+1 ))
        case $SELECT in
        $NOPLAY)
                firstPlayerIndex=$firstPlayerIndex
		DIE_ROLL_COUNTER=$(( $DIE_ROLL_COUNTER + 1 ))
                echo "(Noplay)position is : " $firstPlayerIndex ;;
        $LADDER)
		if [ $(( $firstPlayerIndex + $RANDOM_DIE_NUMBER )) -gt $WIN_POSTION  ]
		then
                	firstPlayerIndex=$firstPlayerIndex
			DIE_ROLL_COUNTER=$(( $DIE_ROLL_COUNTER + 1 ))
			echo "(Ladder)position is : " $firstPlayerIndex
		else
			DIE_ROLL_COUNTER=$(( $DIE_ROLL_COUNTER + 1 ))
			firstPlayerIndex=$(( $firstPlayerIndex + $RANDOM_DIE_NUMBER ))
                	echo "(ladder) position is : " $firstPlayerIndex
			if [ $firstPlayerIndex -eq $WIN_POSTION ]
			then
				echo "first player win the game reached to last position " $firstPlayerIndex
				echo player took $DIE_ROLL_COUNTER  chances to win the game
				break
			fi
		fi
		 ;;
        $SNAKE)
                firstPlayerIndex=$(( $firstPlayerIndex - $RANDOM_DIE_NUMBER ))
		echo "(snake)position is : " $firstPlayerIndex
		DIE_ROLL_COUNTER=$(( $DIE_ROLL_COUNTER + 1 ))
		if [ $firstPlayerIndex -lt $START_POSITION ]
		then
			echo "firstPlayerindex " $firstPlayerIndex
			echo "firstPlayerindex is less than zero so initialize zero"
			firstPlayerIndex=$START_POSITION
			echo $firstPlayerIndex
		fi
		;;
        esac
	echo "second player press enter to roll the die"
	read
	SELECT2=$(( $RANDOM%3 ))
	RANDOM_DIE_NUMBER2=$(( $RANDOM%6+1 ))
        case $SELECT2 in
        $NOPLAY)
                secondPlayerIndex=$secondPlayerIndex
		DIE_ROLL_COUNTER2=$(( $DIE_ROLL_COUNTER2 + 1 ))
                echo "(Noplay)position is : " $secondPlayerIndex ;;
        $LADDER)
		if [ $(( $secondPlayerIndex + $RANDOM_DIE_NUMBER2 )) -gt $WIN_POSTION  ]
		then
                	secondPlayerIndex=$secondPlayerIndex
			DIE_ROLL_COUNTER2=$(( $DIE_ROLL_COUNTER2 + 1 ))
			echo "(Ladder)position is : " $secondPlayerIndex
		else
			DIE_ROLL_COUNTER2=$(( $DIE_ROLL_COUNTER2 + 1 ))
			secondPlayerIndex=$(( $secondPlayerIndex + $RANDOM_DIE_NUMBER2 ))
                	echo "(ladder) position is : " $secondPlayerIndex
			if [ $secondPlayerIndex -eq $WIN_POSTION ]
			then
				echo "second player win the game reached to last position " $secondPlayerIndex
				echo player took $DIE_ROLL_COUNTER2  chances to win the game
				break
			fi
		fi
		 ;;
        $SNAKE)
                firstPlayerIndex=$(( $secondPlayerIndex - $RANDOM_DIE_NUMBER2 ))
		echo "(snake)position is : " $firstPlayerIndex
		DIE_ROLL_COUNTER2=$(( $DIE_ROLL_COUNTER2 + 1 ))
		if [ $secondPlayerIndex -lt $START_POSITION ]
		then
			echo "secondPlayerindex " $secondPlayerIndex
			echo "secondPlayerindex is less than zero so initialize zero"
			secondPlayerIndex=$START_POSITION
			echo $secondPlayerIndex
		fi
		;;
        esac
done
