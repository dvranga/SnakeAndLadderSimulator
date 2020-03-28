# welcome to snake and ladder game simulator
START_POSITION=0;
NUMBER_OF_PLAYER=1;
#player rolls the die to get Random number between 1 to 6
RANDOM_DIE_NUMBER=$(( $RANDOM%6+1 ))
firstPlayerIndex=$START_POSITION;
echo "firstPlayerIndex :"$START_POSITION;
echo "NUMBER_OF_PLAYER :" $NUMBER_OF_PLAYER
NOPLAY=0;
LADDER=1;
SNAKE=2;
echo "select noplay,ladder or snake"
SELECT=$(( $RANDOM%3 ))
	case $SELECT in
	$NOPLAY)
		firstPlayerIndex=$firstPlayerIndex
		echo noplay is selected ;;
	$LADDER)
		firstPlayerIndex=$(( $firstPlayerIndex + $RANDOM_DIE_NUMBER ))
		echo ladder is selected ;;
	$SNAKE)
		firstPlayerIndex=$(( $firstPlayerIndex - $RANDOM_DIE_NUMBER ))
		echo snake is selected ;;
	esac


