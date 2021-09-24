list visitors;
string sound_key_1 = "";
string sound_key_2 = "";
float volume = 1.0;
float delay_start = 15;
float delay_between_sounds = 10;

default
{
    state_entry()
    {
        llSetTimerEvent(60*60);
    }
    
    timer()
    {
        visitors = [];
    }
    
    collision_start(integer num)
    {
        key user = llDetectedKey(0);
        integer index = llListFindList(visitors, [user]);
        if(index == -1){
            visitors += [user];
            state play_sounds;
        }
    }
}

state play_sounds
{
    state_entry()
    {
        llSleep(delay_start);
        llPlaySound(sound_key_1, volume);
        llSleep(delay_between_sounds);
        llPlaySound(sound_key_2, volume);
        llSleep(delay_between_sounds);
        state default;
    }
}