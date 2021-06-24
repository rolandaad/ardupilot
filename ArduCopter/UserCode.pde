/// -*- tab-width: 4; Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil -*-

#include <AP_I2C_Sensors.h>

AP_I2C_Sensors sensors;

#include <AP_I2C_Sensors.h>

// Write a sensors packet
static void Log_Write_Sensors()
{
    struct log_Sensors pkt = {
        LOG_PACKET_HEADER_INIT(LOG_SENSORS_MSG),
        val1              : sensors.results[0],
        val2              : sensors.results[1],
        val3              : sensors.results[2],
        val4              : sensors.results[3],
        val5              : sensors.results[4],
        val6              : sensors.results[5]
    };
    DataFlash.WriteBlock(&pkt, sizeof(pkt));
}

#ifdef USERHOOK_INIT
void userhook_init()
{
    // put your initialisation code here
    // this will be called once at start-up
    sensors.init();
}
#endif

#ifdef USERHOOK_FASTLOOP
void userhook_FastLoop()
{
    // put your 100Hz code here
}
#endif

#ifdef USERHOOK_50HZLOOP
void userhook_50Hz()
{
    // put your 50Hz code here
}
#endif

#ifdef USERHOOK_MEDIUMLOOP
void userhook_MediumLoop()
{
    // put your 10Hz code here
    if(sensors.healthy){
      sensors.read();
      Log_Write_Sensors();
    }
    else
        sensors.init();    
}
#endif

#ifdef USERHOOK_SLOWLOOP
void userhook_SlowLoop()
{
    // put your 3.3Hz code here
}
#endif

#ifdef USERHOOK_SUPERSLOWLOOP
void userhook_SuperSlowLoop()
{
    // put your 1Hz code here
}
#endif
