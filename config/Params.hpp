// Mission parameter definitions for quick tweaking in the lobby.
// These are lightweight defaults to keep the template drop-in ready.
class TimeOfDay {
    title = "Starting Time of Day";
    values[] = {0,6,12,18};
    texts[]  = {"Midnight","Morning","Noon","Evening"};
    default = 12;
};

class WeatherPreset {
    title = "Weather Preset";
    values[] = {0,1,2};
    texts[]  = {"Clear","Overcast","Stormy"};
    default = 0;
};

class FriendlySide {
    title = "Friendly Faction";
    values[] = {0};
    texts[]  = {"NATO"};
    default = 0;
};

class EnemySide {
    title = "Enemy Faction";
    values[] = {0};
    texts[]  = {"CSAT"};
    default = 0;
};

class IndustryRate {
    title = "Industry Production Rate";
    values[] = {50,100,150};
    texts[]  = {"Slow","Normal","Fast"};
    default = 100;
};

class SideMissionFrequency {
    title = "Side Mission Frequency";
    values[] = {600,900,1200};
    texts[]  = {"Often","Standard","Sparse"};
    default = 900;
};
