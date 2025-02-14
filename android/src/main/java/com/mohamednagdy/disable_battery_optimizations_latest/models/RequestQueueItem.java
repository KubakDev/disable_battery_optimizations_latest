package com.mohamednagdy.disable_battery_optimizations_latest.models;

import com.mohamednagdy.disable_battery_optimizations_latest.managers.KillerManager;

public class RequestQueueItem {

    private String title;
    private String body;
    private KillerManager.Actions action;

    public RequestQueueItem(String title, String body, KillerManager.Actions action) {
        this.title = title;
        this.body = body;
        this.action = action;
    }

    public String getTitle() {
        return title;
    }

    public String getBody() {
        return body;
    }

    public KillerManager.Actions getAction() {
        return action;
    }
}
