# welcome to snake and ladder game simulator
START_POSITION=0;
NUMBER_OF_PLAYER=1;
DIE_ROLL_COUNTER=0;
#player rolls the die to get Random number between 1 to 6
firstPlayerIndex=$START_POSITION;
echo "firstPlayerIndex :"$START_POSITION;
echo "NUMBER_OF_PLAYER :" $NUMBER_OF_PLAYER
NOPLAY=0;
LADDER=1;
SNAKE=2;
echo "select noplay,ladder or snake"
WIN_POSTION=100;
echo "winning position is: " $WIN_POSTION
while [ $firstPlayerIndex -le $WIN_POSTION ]
do
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
				echo "first player win the game reachec to last position " $firstPlayerIndex
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
done
