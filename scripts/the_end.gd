extends ColorRect

@onready var timeLabel = $HBoxContainer/Value/Time;
var damageDealt = 0;
@onready var damageDealtLabel = $"HBoxContainer/Value/Damage dealt";
var damageTaken = 0;
@onready var damageTakenLabel = $"HBoxContainer/Value/Damage taken";
var levelUpPointsCollected = 0;
var outOf = 8;
@onready var levelUpPointsCollectedLabel = $"HBoxContainer/Value/Level up points collected";
var timesDied = 0;
@onready var timesDiedLabel = $"HBoxContainer/Value/Times died";
var maxDummyDPS = 0;
@onready var maxDummyDPSLabel = $"HBoxContainer/Value/Max dummy DPS";

func enable_menu():
	visible = true;
	var ticksInSeconds = Time.get_ticks_msec()/1000;
	if ticksInSeconds < 60:
		timeLabel.text = str(ticksInSeconds, "s");
	else:
		var minutes:int = int(ticksInSeconds/60);
		var secs:int = ticksInSeconds - minutes*60;
		timeLabel.text = "%dm %02ds"%[minutes,secs];
	
	levelUpPointsCollected = $"../LevelUp".totalUpgradePoints;
	
	damageDealtLabel.text = str(int(damageDealt),"dmg");
	damageTakenLabel.text = str(int(damageTaken),"dmg");
	levelUpPointsCollectedLabel.text = str(levelUpPointsCollected, " out of ", outOf);
	timesDiedLabel.text = str(timesDied);
	maxDummyDPSLabel.text = str(maxDummyDPS,"dps");
	 
