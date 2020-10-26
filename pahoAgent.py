#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import paho.mqtt.client as paho
import time, threading, ssl, random

receivedMessages = []

def on_message(client, userdata, message):
    print("Received operation " + str(message.payload))
    if (message.payload.startswith("510")):
        print("Simulating device restart...")
        publish("s/us", "501,c8y_Restart");
        print("...restarting...")
        time.sleep(1)
        publish("s/us", "503,c8y_Restart");
        print("...done...")

def publish(topic, message, waitForAck = False):
    mid = mqttc.publish(topic, message, 2)[1]
    if (waitForAck):
        while mid not in receivedMessages:
            time.sleep(0.25)

mqttc = paho.Client("ThinEdge2020")
mqttc.on_message = on_message
mqttc.tls_set(ca_certs="CA/ca-root.pem", certfile="device/device-pub.pem", tls_version=ssl.PROTOCOL_TLSv1_2)
mqttc.connect("mqtt.latest.stage.c8y.io", 8883, 60)
mqttc.loop_forever()