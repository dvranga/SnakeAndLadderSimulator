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
echo "NUMBER_OF_PLAYER :" $NUMBER_OF_PLAYER;
playerIndex=$START_POSITION;
NOPLAY=0;
LADDER=1;
SNAKE=2;
echo "select noplay,ladder or snake"
WIN_POSTION=10;
echo "winning position is: " $WIN_POSTION

function game()
{
	echo " player press enter to roll the die"
	read
	SELECT=$(( $RANDOM%3 ))
	RANDOM_DIE_NUMBER=$(( $RANDOM%6+1 ))
        case $SELECT in
        $NOPLAY)
                playerIndex=$playerIndex
		DIE_ROLL_COUNTER=$(( $DIE_ROLL_COUNTER + 1 ))
                echo "(Noplay)position is : " $playerIndex
		 ;;
        $LADDER)
		if [ $(( $playerIndex + $RANDOM_DIE_NUMBER )) -gt $WIN_POSTION  ]
		then
                	playerIndex=$playerIndex
			DIE_ROLL_COUNTER=$(( $DIE_ROLL_COUNTER + 1 ))
			echo "(Ladder)position is : " $playerIndex
		else
			DIE_ROLL_COUNTER=$(( $DIE_ROLL_COUNTER + 1 ))
			playerIndex=$(( $playerIndex + $RANDOM_DIE_NUMBER ))
                	echo "(ladder) position is : " $playerIndex
			if [ $playerIndex -eq $WIN_POSTION ]
			then
				echo " player win the game reached to last position " $playerIndex
				echo "player took" $DIE_ROLL_COUNTER  "chances to win the game"
			fi

		fi
		 ;;
        $SNAKE)
		echo "(snake came )position is : " $playerIndex
                playerIndex=$(( $playerIndex - $RANDOM_DIE_NUMBER ))
		echo "(snake)position go back to : " $playerIndex
		DIE_ROLL_COUNTER=$(( $DIE_ROLL_COUNTER + 1 ))
		if [ $playerIndex -lt $START_POSITION ]
		then
			echo "Playerindex is less than zero so initialize zero"
			playerIndex=$START_POSITION
			echo $playerIndex
		fi
		;;
        esac
};
check=true;
while [ $firstplayerPosition -lt $WINNING_POSITION ] && [ $secondPlayerPosition -lt $WINNING_POSITION ]
do
	if [ $(($DIE_ROLL_COUNTER%2)) -eq 0 ]
	then
		echo firstPlayer turn
		 playerPosition=$firstPlayerPosition
		 game $playerPosition
			if [ $playerIndex -eq $WIN_POSTION ]
			then
				echo "player one won"
				break
			fi
	else
		echo second player turn
		 playerPosition=$secondPlayerPosition
		 game $playerPosition
			if [ $playerIndex -eq $WIN_POSTION ]
			then
				echo "player two won"
				break
			fi
	fi

done
