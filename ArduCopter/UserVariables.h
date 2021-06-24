/// -*- tab-width: 4; Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil -*-

// user defined variables

#ifdef USERHOOK_VARIABLES

#define LOG_SENSORS_MSG 0xF0

struct PACKED log_Sensors {
    LOG_PACKET_HEADER;
    float val1;
    float val2;
    float val3;
    float val4;
    float val5;
    float val6;    
};

#endif  // USERHOOK_VARIABLES


