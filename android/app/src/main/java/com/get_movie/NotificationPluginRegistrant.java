package com.get_movie;

import com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin;

import io.flutter.plugin.common.PluginRegistry;

public class NotificationPluginRegistrant {
    public static void registerWith(PluginRegistry registry) {

        if (alreadyRegisteredWith(registry)) {
            return;
        }
//        FirebaseMessagingPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin"));
//          FlutterLocalNotificationsPlugin.registerWith(registry.registrarFor("com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsPlugin"));


    }


    private static boolean alreadyRegisteredWith(PluginRegistry registry) {
        final String key = NotificationPluginRegistrant.class.getCanonicalName();
        if (registry.hasPlugin(key)) {
            return true;
        }
        registry.registrarFor(key);
        return false;
    }
}
