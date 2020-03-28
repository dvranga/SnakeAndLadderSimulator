# welcome to snake and ladder game simulator
START_POSITION=0;
NUMBER_OF_PLAYER=1;
echo "start position = "$START_POSITION;
echo "number of player= "$NUMBER_OF_PLAYER;
#player rolls the die to get Random number between 1 to 6
RANDOM_DIE_NUMBER=$(( $RANDOM%6+1 ))
echo "random die number=" $RANDOM_DIE_NUMBER
