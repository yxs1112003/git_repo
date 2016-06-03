package com.Observe;

import java.util.Observable;
import java.util.Observer;

public class Watcher implements Observer {

    public Watcher(Observable o) {
        o.addObserver(this);
    }

    @Override
    public void update(Observable o, Object arg) {
        System.out.println("状态发送改变:" + ((Watched) o).getData());
    }

}

