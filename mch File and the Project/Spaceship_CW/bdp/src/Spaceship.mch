/* Spaceship
 * Author: Athindu Umayanga
 * IIT ID: 2018580
 * UoW ID: w1742249
 * Creation date: 17/11/2021
 */


/* For further clear and detailed view of the operations, in the ProB tool 
 * set the maximum enabled operations value to about 100. ( Preferences -> Animation preferences -> MAX_OPERATIONS )
 */


/* A brief explanation about the assigned & used
 * SETS, CONSTANTS, PROPERTIES, VARIABLES & INVARIANTS
 * can be found in the report with the Structure diagram.  
 */

MACHINE
    Spaceship

SETS
    MESSAGE = { Moved_Successfully , Move_Failed__Unable_to_Visit_Unkown_Space , Move_Failed__Insufficient_Power , Move_Failed__Asteroid_Collision , Warp_Failed__Unable_to_warp_to_an_Asteroid , Warp_Failed__Unable_to_warp_to_the_same_position , Spaceship_is_docked_at_the_STARBASE , Spaceship_is_not_at_the_STARBASE , Game_WON , Game_LOST , Game_NOT_OVER , Start_a_new_GAME } ;

    STATE = { Game_Won , Game_Lost , Game_not_over }

CONCRETE_CONSTANTS
    SpaceX , SpaceY , Space , Asteroids , FreeSpace , HomeBase , StarBase , MovePower , WarpPower , AsteroidLoss

PROPERTIES
    SpaceX <: NAT1 & SpaceX = 1 .. 12 &
    SpaceY <: NAT1 & SpaceY = 1 .. 7 &
    Space = SpaceX * SpaceY &
    Asteroids <: Space &
    Asteroids = { 3 |-> 2 , 3 |-> 5 , 5 |-> 4 , 6 |-> 7 , 7 |-> 1 , 7 |-> 7 , 7 |-> 5 , 8 |-> 3 , 10 |-> 6 , 11 |-> 2 , 12 |-> 5 } &
    FreeSpace <: Space &
    FreeSpace /\ Asteroids = {} &
    FreeSpace \/ Asteroids = Space &
    HomeBase : FreeSpace & HomeBase = 1 |-> 1 &
    StarBase : FreeSpace & StarBase = 6 |-> 4 &
    MovePower : NAT1 & MovePower = 5 &
    WarpPower : NAT1 & WarpPower = 20 &
    AsteroidLoss : NAT1 & AsteroidLoss = 10



































ABSTRACT_VARIABLES
    xPosition , yPosition , power , noOfCollisions , route , spaceshipCurrentPosition , gameStatus

INVARIANT
    xPosition : SpaceX &
    yPosition : SpaceY &
    xPosition |-> yPosition : FreeSpace &
    power : NAT &
    noOfCollisions : NAT &
    route : seq ( FreeSpace ) &
    spaceshipCurrentPosition : Space &
    gameStatus <: STATE

INITIALISATION
    power := 0 ||
    noOfCollisions := 0 ||
    xPosition := 1 ||
    yPosition := 1 ||
    route := [ HomeBase ] ||
    spaceshipCurrentPosition := HomeBase ||
    gameStatus := {}

OPERATIONS

    /* 10 operations were implemented to carry out all the required tasks from the game.
     * (4 Movements, Warp Jump, New Game/Reset Game, Mission Status, Visited Regions, Docked at Starbase or not, Game Status ) 
    */


    //Spaceship Move Up Operation
    message <-- MoveUp =
    PRE
        message : MESSAGE & not ( ( xPosition |-> yPosition = StarBase ) or ( power < MovePower ) )
    THEN
        IF ( xPosition |-> yPosition + 1 : Space )
        THEN
            IF ( xPosition |-> yPosition + 1 : Asteroids )
            THEN
                /* Increase the count of collisions and identify the status of the game from the
                *  remaining power after the collision
                */

                noOfCollisions := noOfCollisions + 1 ||
                IF ( power - AsteroidLoss > 0 )
                THEN
                    power := power - AsteroidLoss ||
                    message := Move_Failed__Asteroid_Collision ||
                    gameStatus := { Game_not_over }
                ELSE
                    power := 0 ||
                    message := Game_LOST ||
                    gameStatus := { Game_Lost }
                END
            ELSE
                /* Change the position of the spaceship according to the move ( UP -> y+1 ) &
                *  identify the the game status from the remaining power after the move.
                */

                yPosition := yPosition + 1 ||
                route := route <- ( xPosition |-> yPosition + 1 ) ||
                spaceshipCurrentPosition := ( xPosition |-> yPosition + 1 ) ||

                IF ( xPosition |-> yPosition + 1 = StarBase )
                THEN
                    power := power - MovePower ||
                    message := Game_WON ||
                    gameStatus := { Game_Won }
                ELSIF ( power - MovePower > 0 )
                THEN
                    power := power - MovePower ||
                    message := Moved_Successfully ||
                    gameStatus := { Game_not_over }
                ELSIF ( power - MovePower = 0 )
                THEN
                    power := 0 ||
                    message := Game_LOST ||
                    gameStatus := { Game_Lost }
                END
            END
        ELSE
            message := Move_Failed__Unable_to_Visit_Unkown_Space
        END
    END ;

    /* Same logic used in MoveUp operation was used when implementing the other 3 movements (Down, Forward, Reverse).
     * Operations will be modified according to the specific movement. (E.g: Down - y-1, Forward - x+1, Reverse - x-1 )
    */

    //Spaceship Move Down Operation
    message <-- MoveDown =
    PRE
        message : MESSAGE & not ( ( xPosition |-> yPosition = StarBase ) or ( power < MovePower ) )
    THEN
        IF ( xPosition |-> yPosition - 1 : Space )
        THEN
            IF ( xPosition |-> yPosition - 1 : Asteroids )
            THEN
                noOfCollisions := noOfCollisions + 1 ||
                IF ( power - AsteroidLoss > 0 )
                THEN
                    power := power - AsteroidLoss ||
                    message := Move_Failed__Asteroid_Collision ||
                    gameStatus := { Game_not_over }
                ELSE
                    power := 0 ||
                    message := Game_LOST ||
                    gameStatus := { Game_Lost }
                END
            ELSE
                yPosition := yPosition - 1 ||
                route := route <- ( xPosition |-> yPosition - 1 ) ||
                spaceshipCurrentPosition := ( xPosition |-> yPosition - 1 ) ||

                IF ( xPosition |-> yPosition - 1 = StarBase )
                THEN
                    power := power - MovePower ||
                    message := Game_WON ||
                    gameStatus := { Game_Won }
                ELSIF ( power - MovePower > 0 )
                THEN
                    power := power - MovePower ||
                    message := Moved_Successfully ||
                    gameStatus := { Game_not_over }
                ELSIF ( power - MovePower = 0 )
                THEN
                    power := 0 ||
                    message := Game_LOST ||
                    gameStatus := { Game_Lost }
                END
            END
        ELSE
            message := Move_Failed__Unable_to_Visit_Unkown_Space
        END
    END ;


    //Spaceship Move Forward Operation
    message <-- MoveForward =
    PRE
        message : MESSAGE & not ( ( xPosition |-> yPosition = StarBase ) or ( power < MovePower ) )
    THEN
        IF ( xPosition + 1 |-> yPosition : Space )
        THEN
            IF ( xPosition + 1 |-> yPosition : Asteroids )
            THEN
                noOfCollisions := noOfCollisions + 1 ||
                IF ( power - AsteroidLoss > 0 )
                THEN
                    power := power - AsteroidLoss ||
                    message := Move_Failed__Asteroid_Collision ||
                    gameStatus := { Game_not_over }
                ELSE
                    power := 0 ||
                    message := Game_LOST ||
                    gameStatus := { Game_Lost }
                END
            ELSE
                xPosition := xPosition + 1 ||
                route := route <- ( xPosition + 1 |-> yPosition ) ||
                spaceshipCurrentPosition := ( xPosition + 1 |-> yPosition ) ||

                IF ( power - MovePower > 0 )
                THEN
                    power := power - MovePower ||
                    message := Moved_Successfully ||
                    gameStatus := { Game_not_over }
                ELSIF ( power - MovePower = 0 )
                THEN
                    power := 0 ||
                    message := Game_LOST ||
                    gameStatus := { Game_Lost }
                END
            END
        ELSE
            message := Move_Failed__Unable_to_Visit_Unkown_Space
        END
    END ;


    //Spaceship Move Reverse Operation
    message <-- MoveReverse =
    PRE
        message : MESSAGE & not ( ( xPosition |-> yPosition = StarBase ) or ( power < MovePower ) )
    THEN
        IF ( xPosition - 1 |-> yPosition : Space )
        THEN
            IF ( xPosition - 1 |-> yPosition : Asteroids )
            THEN
                noOfCollisions := noOfCollisions + 1 ||
                IF ( power - AsteroidLoss > 0 )
                THEN
                    power := power - AsteroidLoss ||
                    message := Move_Failed__Asteroid_Collision ||
                    gameStatus := { Game_not_over }
                ELSE
                    power := 0 ||
                    message := Game_LOST ||
                    gameStatus := { Game_Lost }
                END
            ELSE
                xPosition := xPosition - 1 ||
                route := route <- ( xPosition - 1 |-> yPosition ) ||
                spaceshipCurrentPosition := ( xPosition - 1 |-> yPosition ) ||

                IF ( xPosition - 1 |-> yPosition = StarBase )
                THEN
                    power := power - MovePower ||
                    message := Game_WON ||
                    gameStatus := { Game_Won }
                ELSIF ( power - MovePower > 0 )
                THEN
                    power := power - MovePower ||
                    message := Moved_Successfully ||
                    gameStatus := { Game_not_over }
                ELSIF ( power - MovePower = 0 )
                THEN
                    power := 0 ||
                    message := Game_LOST ||
                    gameStatus := { Game_Lost }
                END
            END
        ELSE
            message := Move_Failed__Unable_to_Visit_Unkown_Space
        END
    END ;


    //Spaceship Warp drive operation
    message <-- EngageWarpDrive ( newXPosition , newYPosition ) =
    PRE
        message : MESSAGE & newXPosition : NAT1 & newYPosition : NAT1 & not ( ( xPosition |-> yPosition = StarBase ) or ( power < MovePower ) )
    THEN
        IF ( power >= WarpPower )
        THEN
            IF ( newXPosition |-> newYPosition : Space )
            THEN
                IF ( newXPosition = xPosition & newYPosition = yPosition )          //Avoiding the Wrap jump to the same position
                THEN
                    message := Warp_Failed__Unable_to_warp_to_the_same_position
                ELSE
                    IF ( newXPosition |-> newYPosition : Asteroids )                //Avoiding the Wrap jump to an asteroid
                    THEN
                        message := Warp_Failed__Unable_to_warp_to_an_Asteroid
                    ELSE

                        /* Change the position of the Spaceship to the warp jumped coordinate &
                        *  identify the game status according to the coordinate (StarBase) & the remaining power.
                        */

                        xPosition := newXPosition ||
                        yPosition := newYPosition ||
                        route := route <- ( newXPosition |-> newYPosition ) ||
                        spaceshipCurrentPosition := ( newXPosition |-> newYPosition ) ||

                        IF ( newXPosition |-> newYPosition = StarBase )
                        THEN
                            power := power - WarpPower ||
                            message := Game_WON ||
                            gameStatus := { Game_Won }
                        ELSIF ( power - WarpPower > 0 )
                        THEN
                            power := power - WarpPower ||
                            message := Moved_Successfully ||
                            gameStatus := { Game_not_over }
                        ELSIF ( power - WarpPower = 0 )
                        THEN
                            power := 0 ||
                            message := Game_LOST ||
                            gameStatus := { Game_Lost }
                        END
                    END
                END
            ELSE
                message := Move_Failed__Unable_to_Visit_Unkown_Space
            END
        ELSE
            message := Move_Failed__Insufficient_Power
        END
    END ;


    /* New Game operation : Passing the initial power (100 Points) to the operation & 
    *                       resetting all the variables to the initial stage
    */
    message <-- NewGame ( initialPower ) =
    PRE
        message : MESSAGE & initialPower : NAT & initialPower = 100
    THEN
        power := initialPower ||
        noOfCollisions := 0 ||
        xPosition := 1 ||
        yPosition := 1 ||
        route := [ HomeBase ] ||
        spaceshipCurrentPosition := HomeBase ||
        gameStatus := { Game_not_over } ||
        message := Start_a_new_GAME
    END ;


    /* Mission Status operation : Find the Current position, power and no. of collisions of the Spaceship
    */
    currentPosition , currentPower , collisionCount <-- MissionStatus =
    BEGIN
        currentPosition := spaceshipCurrentPosition ||
        currentPower := power ||
        collisionCount := noOfCollisions
    END ;


    /* Regions visited operation : Find the region/path the spaceship followed from start to the end
    */
    currentRoute <-- RegionsVisited =
    BEGIN
        currentRoute := route
    END ;


    /* Docked at star base operation : Find whether the Spaceship travelled to Starbase or not
    */
    message <-- DockedAtStarBase =
    PRE
        message : MESSAGE
    THEN
        IF ( spaceshipCurrentPosition = StarBase )
        THEN
            message := Spaceship_is_docked_at_the_STARBASE
        ELSE
            message := Spaceship_is_not_at_the_STARBASE
        END
    END ;


    /* Game Status operation : Find the state of the game according to the Spaceship position & the power
    */
    message <-- GameStatus =
    PRE
        message : MESSAGE & not ( spaceshipCurrentPosition = HomeBase )
    THEN
        IF ( spaceshipCurrentPosition = StarBase )
        THEN
            message := Game_WON
        ELSIF ( power < MovePower )
        THEN
            message := Game_LOST
        ELSE
            message := Game_NOT_OVER
        END
    END


END
