#include <mosquitto.h>
#include <iostream>

#define TOPIC_I "uss"
#define TOPIC_O "led"
#define TOPIC_D "distance"

void on_connect(struct mosquitto* mosq, void* obj, int rc)
{
    std::cout << "ID: " << * (int*) obj << std::endl;
    if (rc)
    {
        std::cout << "Error with result code: " << rc << std::endl;
        return; 
    }
    mosquitto_subscribe(mosq, NULL, TOPIC_I, 0);
}

void on_message(struct mosquitto* mosq, void* obj, const struct mosquitto_message* msg)
{
    char* load = (char*) msg->payload;
    std::string dist_st(load);
    int distance = 0;

    try
    {
        distance = std::stoi(dist_st);
        std::cout << "Distance " << msg->topic << ": ";
        std::cout << distance << std::endl;
    }
    catch(const std::exception& e)
    {
        std::cerr << e.what() << std::endl;
    }
    if (distance > 12)
    {
        mosquitto_publish(mosq, NULL, TOPIC_O, 1, "0", 0, false); 
    }
    
    if (distance > 6 && distance < 12)
    {
        
        mosquitto_publish(mosq, NULL, TOPIC_O, 1, "1", 0, false);
    }
    else if (distance <= 6)
    {
        mosquitto_publish(mosq, NULL, TOPIC_O, 1, "2", 0, false);
    }
    std::string ds_o = std::to_string(distance);
    const char* msg_o_c = ds_o.c_str();
    int lenght = ds_o.length();
    mosquitto_publish(mosq, NULL, TOPIC_D, lenght, msg_o_c, 0, false);
}

int main()
{
    int rc, id = 12;
    mosquitto_lib_init();
    struct mosquitto* mosq;
    mosq = mosquitto_new(TOPIC_I, true, &id);
    mosquitto_connect_callback_set(mosq, on_connect);
    mosquitto_message_callback_set(mosq, on_message);

    rc = mosquitto_connect(mosq, "localhost", 1883, 10);

    if (rc)
    {
        std::cout << "not connected " << std::endl;
        return -1;
    }

    mosquitto_loop_start(mosq);
    std::cout << "press any key to stop ";
    getchar();
    mosquitto_loop_stop(mosq, true);

    mosquitto_disconnect(mosq);
    mosquitto_destroy(mosq);
    mosquitto_lib_cleanup();

    return 0;
}
