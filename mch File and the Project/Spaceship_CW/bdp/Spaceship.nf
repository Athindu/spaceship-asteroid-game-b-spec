Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Spaceship))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Spaceship))==(Machine(Spaceship));
  Level(Machine(Spaceship))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Spaceship)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Spaceship))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Spaceship))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Spaceship))==(?);
  List_Includes(Machine(Spaceship))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Spaceship))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Spaceship))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Spaceship))==(?);
  Context_List_Variables(Machine(Spaceship))==(?);
  Abstract_List_Variables(Machine(Spaceship))==(?);
  Local_List_Variables(Machine(Spaceship))==(gameStatus,spaceshipCurrentPosition,route,noOfCollisions,power,yPosition,xPosition);
  List_Variables(Machine(Spaceship))==(gameStatus,spaceshipCurrentPosition,route,noOfCollisions,power,yPosition,xPosition);
  External_List_Variables(Machine(Spaceship))==(gameStatus,spaceshipCurrentPosition,route,noOfCollisions,power,yPosition,xPosition)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Spaceship))==(?);
  Abstract_List_VisibleVariables(Machine(Spaceship))==(?);
  External_List_VisibleVariables(Machine(Spaceship))==(?);
  Expanded_List_VisibleVariables(Machine(Spaceship))==(?);
  List_VisibleVariables(Machine(Spaceship))==(?);
  Internal_List_VisibleVariables(Machine(Spaceship))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Spaceship))==(btrue);
  Gluing_List_Invariant(Machine(Spaceship))==(btrue);
  Expanded_List_Invariant(Machine(Spaceship))==(btrue);
  Abstract_List_Invariant(Machine(Spaceship))==(btrue);
  Context_List_Invariant(Machine(Spaceship))==(btrue);
  List_Invariant(Machine(Spaceship))==(xPosition: SpaceX & yPosition: SpaceY & xPosition|->yPosition: FreeSpace & power: NAT & noOfCollisions: NAT & route: seq(FreeSpace) & spaceshipCurrentPosition: Space & gameStatus <: STATE)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Spaceship))==(btrue);
  Abstract_List_Assertions(Machine(Spaceship))==(btrue);
  Context_List_Assertions(Machine(Spaceship))==(btrue);
  List_Assertions(Machine(Spaceship))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Spaceship))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Spaceship))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Spaceship))==(power,noOfCollisions,xPosition,yPosition,route,spaceshipCurrentPosition,gameStatus:=0,0,1,1,[HomeBase],HomeBase,{});
  Context_List_Initialisation(Machine(Spaceship))==(skip);
  List_Initialisation(Machine(Spaceship))==(power:=0 || noOfCollisions:=0 || xPosition:=1 || yPosition:=1 || route:=[HomeBase] || spaceshipCurrentPosition:=HomeBase || gameStatus:={})
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Spaceship))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Spaceship))==(btrue);
  List_Constraints(Machine(Spaceship))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Spaceship))==(MoveUp,MoveDown,MoveForward,MoveReverse,EngageWarpDrive,NewGame,MissionStatus,RegionsVisited,DockedAtStarBase,GameStatus);
  List_Operations(Machine(Spaceship))==(MoveUp,MoveDown,MoveForward,MoveReverse,EngageWarpDrive,NewGame,MissionStatus,RegionsVisited,DockedAtStarBase,GameStatus)
END
&
THEORY ListInputX IS
  List_Input(Machine(Spaceship),MoveUp)==(?);
  List_Input(Machine(Spaceship),MoveDown)==(?);
  List_Input(Machine(Spaceship),MoveForward)==(?);
  List_Input(Machine(Spaceship),MoveReverse)==(?);
  List_Input(Machine(Spaceship),EngageWarpDrive)==(newXPosition,newYPosition);
  List_Input(Machine(Spaceship),NewGame)==(initialPower);
  List_Input(Machine(Spaceship),MissionStatus)==(?);
  List_Input(Machine(Spaceship),RegionsVisited)==(?);
  List_Input(Machine(Spaceship),DockedAtStarBase)==(?);
  List_Input(Machine(Spaceship),GameStatus)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Spaceship),MoveUp)==(message);
  List_Output(Machine(Spaceship),MoveDown)==(message);
  List_Output(Machine(Spaceship),MoveForward)==(message);
  List_Output(Machine(Spaceship),MoveReverse)==(message);
  List_Output(Machine(Spaceship),EngageWarpDrive)==(message);
  List_Output(Machine(Spaceship),NewGame)==(message);
  List_Output(Machine(Spaceship),MissionStatus)==(currentPosition,currentPower,collisionCount);
  List_Output(Machine(Spaceship),RegionsVisited)==(currentRoute);
  List_Output(Machine(Spaceship),DockedAtStarBase)==(message);
  List_Output(Machine(Spaceship),GameStatus)==(message)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Spaceship),MoveUp)==(message <-- MoveUp);
  List_Header(Machine(Spaceship),MoveDown)==(message <-- MoveDown);
  List_Header(Machine(Spaceship),MoveForward)==(message <-- MoveForward);
  List_Header(Machine(Spaceship),MoveReverse)==(message <-- MoveReverse);
  List_Header(Machine(Spaceship),EngageWarpDrive)==(message <-- EngageWarpDrive(newXPosition,newYPosition));
  List_Header(Machine(Spaceship),NewGame)==(message <-- NewGame(initialPower));
  List_Header(Machine(Spaceship),MissionStatus)==(currentPosition,currentPower,collisionCount <-- MissionStatus);
  List_Header(Machine(Spaceship),RegionsVisited)==(currentRoute <-- RegionsVisited);
  List_Header(Machine(Spaceship),DockedAtStarBase)==(message <-- DockedAtStarBase);
  List_Header(Machine(Spaceship),GameStatus)==(message <-- GameStatus)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Spaceship),MoveUp)==(message: MESSAGE & not(xPosition|->yPosition = StarBase or power<MovePower));
  List_Precondition(Machine(Spaceship),MoveDown)==(message: MESSAGE & not(xPosition|->yPosition = StarBase or power<MovePower));
  List_Precondition(Machine(Spaceship),MoveForward)==(message: MESSAGE & not(xPosition|->yPosition = StarBase or power<MovePower));
  List_Precondition(Machine(Spaceship),MoveReverse)==(message: MESSAGE & not(xPosition|->yPosition = StarBase or power<MovePower));
  List_Precondition(Machine(Spaceship),EngageWarpDrive)==(message: MESSAGE & newXPosition: NAT1 & newYPosition: NAT1 & not(xPosition|->yPosition = StarBase or power<MovePower));
  List_Precondition(Machine(Spaceship),NewGame)==(message: MESSAGE & initialPower: NAT & initialPower = 100);
  List_Precondition(Machine(Spaceship),MissionStatus)==(btrue);
  List_Precondition(Machine(Spaceship),RegionsVisited)==(btrue);
  List_Precondition(Machine(Spaceship),DockedAtStarBase)==(message: MESSAGE);
  List_Precondition(Machine(Spaceship),GameStatus)==(message: MESSAGE & not(spaceshipCurrentPosition = HomeBase))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Spaceship),GameStatus)==(message: MESSAGE & not(spaceshipCurrentPosition = HomeBase) | spaceshipCurrentPosition = StarBase ==> message:=Game_WON [] not(spaceshipCurrentPosition = StarBase) ==> (power<MovePower ==> message:=Game_LOST [] not(power<MovePower) ==> message:=Game_NOT_OVER));
  Expanded_List_Substitution(Machine(Spaceship),DockedAtStarBase)==(message: MESSAGE | spaceshipCurrentPosition = StarBase ==> message:=Spaceship_is_docked_at_the_STARBASE [] not(spaceshipCurrentPosition = StarBase) ==> message:=Spaceship_is_not_at_the_STARBASE);
  Expanded_List_Substitution(Machine(Spaceship),RegionsVisited)==(btrue | currentRoute:=route);
  Expanded_List_Substitution(Machine(Spaceship),MissionStatus)==(btrue | currentPosition,currentPower,collisionCount:=spaceshipCurrentPosition,power,noOfCollisions);
  Expanded_List_Substitution(Machine(Spaceship),NewGame)==(message: MESSAGE & initialPower: NAT & initialPower = 100 | power,noOfCollisions,xPosition,yPosition,route,spaceshipCurrentPosition,gameStatus,message:=initialPower,0,1,1,[HomeBase],HomeBase,{Game_not_over},Start_a_new_GAME);
  Expanded_List_Substitution(Machine(Spaceship),EngageWarpDrive)==(message: MESSAGE & newXPosition: NAT1 & newYPosition: NAT1 & not(xPosition|->yPosition = StarBase or power<MovePower) | power>=WarpPower ==> (newXPosition|->newYPosition: Space ==> (newXPosition = xPosition & newYPosition = yPosition ==> message:=Warp_Failed__Unable_to_warp_to_the_same_position [] not(newXPosition = xPosition & newYPosition = yPosition) ==> (newXPosition|->newYPosition: Asteroids ==> message:=Warp_Failed__Unable_to_warp_to_an_Asteroid [] not(newXPosition|->newYPosition: Asteroids) ==> (xPosition,yPosition,route,spaceshipCurrentPosition:=newXPosition,newYPosition,route<-(newXPosition|->newYPosition),newXPosition|->newYPosition || (newXPosition|->newYPosition = StarBase ==> power,message,gameStatus:=power-WarpPower,Game_WON,{Game_Won} [] not(newXPosition|->newYPosition = StarBase) ==> (power-WarpPower>0 ==> power,message,gameStatus:=power-WarpPower,Moved_Successfully,{Game_not_over} [] not(power-WarpPower>0) ==> (power-WarpPower = 0 ==> power,message,gameStatus:=0,Game_LOST,{Game_Lost} [] not(power-WarpPower = 0) ==> skip)))))) [] not(newXPosition|->newYPosition: Space) ==> message:=Move_Failed__Unable_to_Visit_Unkown_Space) [] not(power>=WarpPower) ==> message:=Move_Failed__Insufficient_Power);
  Expanded_List_Substitution(Machine(Spaceship),MoveReverse)==(message: MESSAGE & not(xPosition|->yPosition = StarBase or power<MovePower) | xPosition-1|->yPosition: Space ==> (xPosition-1|->yPosition: Asteroids ==> (noOfCollisions:=noOfCollisions+1 || (power-AsteroidLoss>0 ==> power,message,gameStatus:=power-AsteroidLoss,Move_Failed__Asteroid_Collision,{Game_not_over} [] not(power-AsteroidLoss>0) ==> power,message,gameStatus:=0,Game_LOST,{Game_Lost})) [] not(xPosition-1|->yPosition: Asteroids) ==> (xPosition,route,spaceshipCurrentPosition:=xPosition-1,route<-(xPosition-1|->yPosition),xPosition-1|->yPosition || (xPosition-1|->yPosition = StarBase ==> power,message,gameStatus:=power-MovePower,Game_WON,{Game_Won} [] not(xPosition-1|->yPosition = StarBase) ==> (power-MovePower>0 ==> power,message,gameStatus:=power-MovePower,Moved_Successfully,{Game_not_over} [] not(power-MovePower>0) ==> (power-MovePower = 0 ==> power,message,gameStatus:=0,Game_LOST,{Game_Lost} [] not(power-MovePower = 0) ==> skip))))) [] not(xPosition-1|->yPosition: Space) ==> message:=Move_Failed__Unable_to_Visit_Unkown_Space);
  Expanded_List_Substitution(Machine(Spaceship),MoveForward)==(message: MESSAGE & not(xPosition|->yPosition = StarBase or power<MovePower) | xPosition+1|->yPosition: Space ==> (xPosition+1|->yPosition: Asteroids ==> (noOfCollisions:=noOfCollisions+1 || (power-AsteroidLoss>0 ==> power,message,gameStatus:=power-AsteroidLoss,Move_Failed__Asteroid_Collision,{Game_not_over} [] not(power-AsteroidLoss>0) ==> power,message,gameStatus:=0,Game_LOST,{Game_Lost})) [] not(xPosition+1|->yPosition: Asteroids) ==> (xPosition,route,spaceshipCurrentPosition:=xPosition+1,route<-(xPosition+1|->yPosition),xPosition+1|->yPosition || (power-MovePower>0 ==> power,message,gameStatus:=power-MovePower,Moved_Successfully,{Game_not_over} [] not(power-MovePower>0) ==> (power-MovePower = 0 ==> power,message,gameStatus:=0,Game_LOST,{Game_Lost} [] not(power-MovePower = 0) ==> skip)))) [] not(xPosition+1|->yPosition: Space) ==> message:=Move_Failed__Unable_to_Visit_Unkown_Space);
  Expanded_List_Substitution(Machine(Spaceship),MoveDown)==(message: MESSAGE & not(xPosition|->yPosition = StarBase or power<MovePower) | xPosition|->yPosition-1: Space ==> (xPosition|->yPosition-1: Asteroids ==> (noOfCollisions:=noOfCollisions+1 || (power-AsteroidLoss>0 ==> power,message,gameStatus:=power-AsteroidLoss,Move_Failed__Asteroid_Collision,{Game_not_over} [] not(power-AsteroidLoss>0) ==> power,message,gameStatus:=0,Game_LOST,{Game_Lost})) [] not(xPosition|->yPosition-1: Asteroids) ==> (yPosition,route,spaceshipCurrentPosition:=yPosition-1,route<-(xPosition|->yPosition-1),xPosition|->yPosition-1 || (xPosition|->yPosition-1 = StarBase ==> power,message,gameStatus:=power-MovePower,Game_WON,{Game_Won} [] not(xPosition|->yPosition-1 = StarBase) ==> (power-MovePower>0 ==> power,message,gameStatus:=power-MovePower,Moved_Successfully,{Game_not_over} [] not(power-MovePower>0) ==> (power-MovePower = 0 ==> power,message,gameStatus:=0,Game_LOST,{Game_Lost} [] not(power-MovePower = 0) ==> skip))))) [] not(xPosition|->yPosition-1: Space) ==> message:=Move_Failed__Unable_to_Visit_Unkown_Space);
  Expanded_List_Substitution(Machine(Spaceship),MoveUp)==(message: MESSAGE & not(xPosition|->yPosition = StarBase or power<MovePower) | xPosition|->yPosition+1: Space ==> (xPosition|->yPosition+1: Asteroids ==> (noOfCollisions:=noOfCollisions+1 || (power-AsteroidLoss>0 ==> power,message,gameStatus:=power-AsteroidLoss,Move_Failed__Asteroid_Collision,{Game_not_over} [] not(power-AsteroidLoss>0) ==> power,message,gameStatus:=0,Game_LOST,{Game_Lost})) [] not(xPosition|->yPosition+1: Asteroids) ==> (yPosition,route,spaceshipCurrentPosition:=yPosition+1,route<-(xPosition|->yPosition+1),xPosition|->yPosition+1 || (xPosition|->yPosition+1 = StarBase ==> power,message,gameStatus:=power-MovePower,Game_WON,{Game_Won} [] not(xPosition|->yPosition+1 = StarBase) ==> (power-MovePower>0 ==> power,message,gameStatus:=power-MovePower,Moved_Successfully,{Game_not_over} [] not(power-MovePower>0) ==> (power-MovePower = 0 ==> power,message,gameStatus:=0,Game_LOST,{Game_Lost} [] not(power-MovePower = 0) ==> skip))))) [] not(xPosition|->yPosition+1: Space) ==> message:=Move_Failed__Unable_to_Visit_Unkown_Space);
  List_Substitution(Machine(Spaceship),MoveUp)==(IF xPosition|->yPosition+1: Space THEN IF xPosition|->yPosition+1: Asteroids THEN noOfCollisions:=noOfCollisions+1 || IF power-AsteroidLoss>0 THEN power:=power-AsteroidLoss || message:=Move_Failed__Asteroid_Collision || gameStatus:={Game_not_over} ELSE power:=0 || message:=Game_LOST || gameStatus:={Game_Lost} END ELSE yPosition:=yPosition+1 || route:=route<-(xPosition|->yPosition+1) || spaceshipCurrentPosition:=xPosition|->yPosition+1 || IF xPosition|->yPosition+1 = StarBase THEN power:=power-MovePower || message:=Game_WON || gameStatus:={Game_Won} ELSIF power-MovePower>0 THEN power:=power-MovePower || message:=Moved_Successfully || gameStatus:={Game_not_over} ELSIF power-MovePower = 0 THEN power:=0 || message:=Game_LOST || gameStatus:={Game_Lost} END END ELSE message:=Move_Failed__Unable_to_Visit_Unkown_Space END);
  List_Substitution(Machine(Spaceship),MoveDown)==(IF xPosition|->yPosition-1: Space THEN IF xPosition|->yPosition-1: Asteroids THEN noOfCollisions:=noOfCollisions+1 || IF power-AsteroidLoss>0 THEN power:=power-AsteroidLoss || message:=Move_Failed__Asteroid_Collision || gameStatus:={Game_not_over} ELSE power:=0 || message:=Game_LOST || gameStatus:={Game_Lost} END ELSE yPosition:=yPosition-1 || route:=route<-(xPosition|->yPosition-1) || spaceshipCurrentPosition:=xPosition|->yPosition-1 || IF xPosition|->yPosition-1 = StarBase THEN power:=power-MovePower || message:=Game_WON || gameStatus:={Game_Won} ELSIF power-MovePower>0 THEN power:=power-MovePower || message:=Moved_Successfully || gameStatus:={Game_not_over} ELSIF power-MovePower = 0 THEN power:=0 || message:=Game_LOST || gameStatus:={Game_Lost} END END ELSE message:=Move_Failed__Unable_to_Visit_Unkown_Space END);
  List_Substitution(Machine(Spaceship),MoveForward)==(IF xPosition+1|->yPosition: Space THEN IF xPosition+1|->yPosition: Asteroids THEN noOfCollisions:=noOfCollisions+1 || IF power-AsteroidLoss>0 THEN power:=power-AsteroidLoss || message:=Move_Failed__Asteroid_Collision || gameStatus:={Game_not_over} ELSE power:=0 || message:=Game_LOST || gameStatus:={Game_Lost} END ELSE xPosition:=xPosition+1 || route:=route<-(xPosition+1|->yPosition) || spaceshipCurrentPosition:=xPosition+1|->yPosition || IF power-MovePower>0 THEN power:=power-MovePower || message:=Moved_Successfully || gameStatus:={Game_not_over} ELSIF power-MovePower = 0 THEN power:=0 || message:=Game_LOST || gameStatus:={Game_Lost} END END ELSE message:=Move_Failed__Unable_to_Visit_Unkown_Space END);
  List_Substitution(Machine(Spaceship),MoveReverse)==(IF xPosition-1|->yPosition: Space THEN IF xPosition-1|->yPosition: Asteroids THEN noOfCollisions:=noOfCollisions+1 || IF power-AsteroidLoss>0 THEN power:=power-AsteroidLoss || message:=Move_Failed__Asteroid_Collision || gameStatus:={Game_not_over} ELSE power:=0 || message:=Game_LOST || gameStatus:={Game_Lost} END ELSE xPosition:=xPosition-1 || route:=route<-(xPosition-1|->yPosition) || spaceshipCurrentPosition:=xPosition-1|->yPosition || IF xPosition-1|->yPosition = StarBase THEN power:=power-MovePower || message:=Game_WON || gameStatus:={Game_Won} ELSIF power-MovePower>0 THEN power:=power-MovePower || message:=Moved_Successfully || gameStatus:={Game_not_over} ELSIF power-MovePower = 0 THEN power:=0 || message:=Game_LOST || gameStatus:={Game_Lost} END END ELSE message:=Move_Failed__Unable_to_Visit_Unkown_Space END);
  List_Substitution(Machine(Spaceship),EngageWarpDrive)==(IF power>=WarpPower THEN IF newXPosition|->newYPosition: Space THEN IF newXPosition = xPosition & newYPosition = yPosition THEN message:=Warp_Failed__Unable_to_warp_to_the_same_position ELSE IF newXPosition|->newYPosition: Asteroids THEN message:=Warp_Failed__Unable_to_warp_to_an_Asteroid ELSE xPosition:=newXPosition || yPosition:=newYPosition || route:=route<-(newXPosition|->newYPosition) || spaceshipCurrentPosition:=newXPosition|->newYPosition || IF newXPosition|->newYPosition = StarBase THEN power:=power-WarpPower || message:=Game_WON || gameStatus:={Game_Won} ELSIF power-WarpPower>0 THEN power:=power-WarpPower || message:=Moved_Successfully || gameStatus:={Game_not_over} ELSIF power-WarpPower = 0 THEN power:=0 || message:=Game_LOST || gameStatus:={Game_Lost} END END END ELSE message:=Move_Failed__Unable_to_Visit_Unkown_Space END ELSE message:=Move_Failed__Insufficient_Power END);
  List_Substitution(Machine(Spaceship),NewGame)==(power:=initialPower || noOfCollisions:=0 || xPosition:=1 || yPosition:=1 || route:=[HomeBase] || spaceshipCurrentPosition:=HomeBase || gameStatus:={Game_not_over} || message:=Start_a_new_GAME);
  List_Substitution(Machine(Spaceship),MissionStatus)==(currentPosition:=spaceshipCurrentPosition || currentPower:=power || collisionCount:=noOfCollisions);
  List_Substitution(Machine(Spaceship),RegionsVisited)==(currentRoute:=route);
  List_Substitution(Machine(Spaceship),DockedAtStarBase)==(IF spaceshipCurrentPosition = StarBase THEN message:=Spaceship_is_docked_at_the_STARBASE ELSE message:=Spaceship_is_not_at_the_STARBASE END);
  List_Substitution(Machine(Spaceship),GameStatus)==(IF spaceshipCurrentPosition = StarBase THEN message:=Game_WON ELSIF power<MovePower THEN message:=Game_LOST ELSE message:=Game_NOT_OVER END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Spaceship))==(SpaceX,SpaceY,Space,Asteroids,FreeSpace,HomeBase,StarBase,MovePower,WarpPower,AsteroidLoss);
  Inherited_List_Constants(Machine(Spaceship))==(?);
  List_Constants(Machine(Spaceship))==(SpaceX,SpaceY,Space,Asteroids,FreeSpace,HomeBase,StarBase,MovePower,WarpPower,AsteroidLoss)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Spaceship),MESSAGE)==({Moved_Successfully,Move_Failed__Unable_to_Visit_Unkown_Space,Move_Failed__Insufficient_Power,Move_Failed__Asteroid_Collision,Warp_Failed__Unable_to_warp_to_an_Asteroid,Warp_Failed__Unable_to_warp_to_the_same_position,Spaceship_is_docked_at_the_STARBASE,Spaceship_is_not_at_the_STARBASE,Game_WON,Game_LOST,Game_NOT_OVER,Start_a_new_GAME});
  Context_List_Enumerated(Machine(Spaceship))==(?);
  Context_List_Defered(Machine(Spaceship))==(?);
  Context_List_Sets(Machine(Spaceship))==(?);
  List_Valuable_Sets(Machine(Spaceship))==(?);
  Inherited_List_Enumerated(Machine(Spaceship))==(?);
  Inherited_List_Defered(Machine(Spaceship))==(?);
  Inherited_List_Sets(Machine(Spaceship))==(?);
  List_Enumerated(Machine(Spaceship))==(MESSAGE,STATE);
  List_Defered(Machine(Spaceship))==(?);
  List_Sets(Machine(Spaceship))==(MESSAGE,STATE);
  Set_Definition(Machine(Spaceship),STATE)==({Game_Won,Game_Lost,Game_not_over})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Spaceship))==(?);
  Expanded_List_HiddenConstants(Machine(Spaceship))==(?);
  List_HiddenConstants(Machine(Spaceship))==(?);
  External_List_HiddenConstants(Machine(Spaceship))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Spaceship))==(btrue);
  Context_List_Properties(Machine(Spaceship))==(btrue);
  Inherited_List_Properties(Machine(Spaceship))==(btrue);
  List_Properties(Machine(Spaceship))==(SpaceX <: NAT1 & SpaceX = 1..12 & SpaceY <: NAT1 & SpaceY = 1..7 & Space = SpaceX*SpaceY & Asteroids <: Space & Asteroids = {3|->2,3|->5,5|->4,6|->7,7|->1,7|->7,7|->5,8|->3,10|->6,11|->2,12|->5} & FreeSpace <: Space & FreeSpace/\Asteroids = {} & FreeSpace\/Asteroids = Space & HomeBase: FreeSpace & HomeBase = 1|->1 & StarBase: FreeSpace & StarBase = 6|->4 & MovePower: NAT1 & MovePower = 5 & WarpPower: NAT1 & WarpPower = 20 & AsteroidLoss: NAT1 & AsteroidLoss = 10 & MESSAGE: FIN(INTEGER) & not(MESSAGE = {}) & STATE: FIN(INTEGER) & not(STATE = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Spaceship),MoveUp)==(?);
  List_ANY_Var(Machine(Spaceship),MoveDown)==(?);
  List_ANY_Var(Machine(Spaceship),MoveForward)==(?);
  List_ANY_Var(Machine(Spaceship),MoveReverse)==(?);
  List_ANY_Var(Machine(Spaceship),EngageWarpDrive)==(?);
  List_ANY_Var(Machine(Spaceship),NewGame)==(?);
  List_ANY_Var(Machine(Spaceship),MissionStatus)==(?);
  List_ANY_Var(Machine(Spaceship),RegionsVisited)==(?);
  List_ANY_Var(Machine(Spaceship),DockedAtStarBase)==(?);
  List_ANY_Var(Machine(Spaceship),GameStatus)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Spaceship)) == (SpaceX,SpaceY,Space,Asteroids,FreeSpace,HomeBase,StarBase,MovePower,WarpPower,AsteroidLoss,MESSAGE,STATE,Moved_Successfully,Move_Failed__Unable_to_Visit_Unkown_Space,Move_Failed__Insufficient_Power,Move_Failed__Asteroid_Collision,Warp_Failed__Unable_to_warp_to_an_Asteroid,Warp_Failed__Unable_to_warp_to_the_same_position,Spaceship_is_docked_at_the_STARBASE,Spaceship_is_not_at_the_STARBASE,Game_WON,Game_LOST,Game_NOT_OVER,Start_a_new_GAME,Game_Won,Game_Lost,Game_not_over | ? | gameStatus,spaceshipCurrentPosition,route,noOfCollisions,power,yPosition,xPosition | ? | MoveUp,MoveDown,MoveForward,MoveReverse,EngageWarpDrive,NewGame,MissionStatus,RegionsVisited,DockedAtStarBase,GameStatus | ? | ? | ? | Spaceship);
  List_Of_HiddenCst_Ids(Machine(Spaceship)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Spaceship)) == (SpaceX,SpaceY,Space,Asteroids,FreeSpace,HomeBase,StarBase,MovePower,WarpPower,AsteroidLoss);
  List_Of_VisibleVar_Ids(Machine(Spaceship)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Spaceship)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Spaceship)) == (Type(MESSAGE) == Cst(SetOf(etype(MESSAGE,0,11)));Type(STATE) == Cst(SetOf(etype(STATE,0,2))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Spaceship)) == (Type(Moved_Successfully) == Cst(etype(MESSAGE,0,11));Type(Move_Failed__Unable_to_Visit_Unkown_Space) == Cst(etype(MESSAGE,0,11));Type(Move_Failed__Insufficient_Power) == Cst(etype(MESSAGE,0,11));Type(Move_Failed__Asteroid_Collision) == Cst(etype(MESSAGE,0,11));Type(Warp_Failed__Unable_to_warp_to_an_Asteroid) == Cst(etype(MESSAGE,0,11));Type(Warp_Failed__Unable_to_warp_to_the_same_position) == Cst(etype(MESSAGE,0,11));Type(Spaceship_is_docked_at_the_STARBASE) == Cst(etype(MESSAGE,0,11));Type(Spaceship_is_not_at_the_STARBASE) == Cst(etype(MESSAGE,0,11));Type(Game_WON) == Cst(etype(MESSAGE,0,11));Type(Game_LOST) == Cst(etype(MESSAGE,0,11));Type(Game_NOT_OVER) == Cst(etype(MESSAGE,0,11));Type(Start_a_new_GAME) == Cst(etype(MESSAGE,0,11));Type(Game_Won) == Cst(etype(STATE,0,2));Type(Game_Lost) == Cst(etype(STATE,0,2));Type(Game_not_over) == Cst(etype(STATE,0,2));Type(SpaceX) == Cst(SetOf(btype(INTEGER,"[SpaceX","]SpaceX")));Type(SpaceY) == Cst(SetOf(btype(INTEGER,"[SpaceY","]SpaceY")));Type(Space) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(Asteroids) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(FreeSpace) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(HomeBase) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(StarBase) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(MovePower) == Cst(btype(INTEGER,?,?));Type(WarpPower) == Cst(btype(INTEGER,?,?));Type(AsteroidLoss) == Cst(btype(INTEGER,?,?)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Spaceship)) == (Type(gameStatus) == Mvl(SetOf(etype(STATE,?,?)));Type(spaceshipCurrentPosition) == Mvl(btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(route) == Mvl(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))));Type(noOfCollisions) == Mvl(btype(INTEGER,?,?));Type(power) == Mvl(btype(INTEGER,?,?));Type(yPosition) == Mvl(btype(INTEGER,?,?));Type(xPosition) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Spaceship)) == (Type(GameStatus) == Cst(etype(MESSAGE,?,?),No_type);Type(DockedAtStarBase) == Cst(etype(MESSAGE,?,?),No_type);Type(RegionsVisited) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(MissionStatus) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(NewGame) == Cst(etype(MESSAGE,?,?),btype(INTEGER,?,?));Type(EngageWarpDrive) == Cst(etype(MESSAGE,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(MoveReverse) == Cst(etype(MESSAGE,?,?),No_type);Type(MoveForward) == Cst(etype(MESSAGE,?,?),No_type);Type(MoveDown) == Cst(etype(MESSAGE,?,?),No_type);Type(MoveUp) == Cst(etype(MESSAGE,?,?),No_type));
  Observers(Machine(Spaceship)) == (Type(GameStatus) == Cst(etype(MESSAGE,?,?),No_type);Type(DockedAtStarBase) == Cst(etype(MESSAGE,?,?),No_type);Type(RegionsVisited) == Cst(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))),No_type);Type(MissionStatus) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
