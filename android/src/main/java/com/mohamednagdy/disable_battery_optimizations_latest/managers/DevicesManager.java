package com.mohamednagdy.disable_battery_optimizations_latest.managers;

import com.mohamednagdy.disable_battery_optimizations_latest.devices.Asus;
import com.mohamednagdy.disable_battery_optimizations_latest.devices.DeviceAbstract;
import com.mohamednagdy.disable_battery_optimizations_latest.devices.DeviceBase;
import com.mohamednagdy.disable_battery_optimizations_latest.devices.HTC;
import com.mohamednagdy.disable_battery_optimizations_latest.devices.Huawei;
import com.mohamednagdy.disable_battery_optimizations_latest.devices.Letv;
import com.mohamednagdy.disable_battery_optimizations_latest.devices.Meizu;
import com.mohamednagdy.disable_battery_optimizations_latest.devices.OnePlus;
import com.mohamednagdy.disable_battery_optimizations_latest.devices.Oppo;
import com.mohamednagdy.disable_battery_optimizations_latest.devices.Samsung;
import com.mohamednagdy.disable_battery_optimizations_latest.devices.Vivo;
import com.mohamednagdy.disable_battery_optimizations_latest.devices.Xiaomi;
import com.mohamednagdy.disable_battery_optimizations_latest.devices.ZTE;
import com.mohamednagdy.disable_battery_optimizations_latest.utils.LogUtils;
import com.mohamednagdy.disable_battery_optimizations_latest.utils.SystemUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class DevicesManager {

    private static List<DeviceAbstract> deviceBaseList = new ArrayList<>(Arrays.asList(
            new Asus(),
            new Huawei(),
            new Letv(),
            new Meizu(),
            new OnePlus(),
            new Oppo(),
            new Vivo(),
            new HTC(),
            new Samsung(),
            new Xiaomi(),
            new ZTE()));

    public static DeviceBase getDevice(){
        List<DeviceBase> currentDeviceBase =new ArrayList<>();
        for (DeviceBase deviceBase : deviceBaseList) {
            if(deviceBase.isThatRom()){
                currentDeviceBase.add(deviceBase);
            }
        }
        if(currentDeviceBase.size()>1){
            StringBuilder logDevices= new StringBuilder();
            for (DeviceBase deviceBase : currentDeviceBase) {
                logDevices.append(deviceBase.getDeviceManufacturer());
            }
            LogUtils.e(DevicesManager.class.getName(),"MORE THAN ONE CORRESPONDING:"+logDevices+"|"+
                    SystemUtils.getDefaultDebugInformation());
        }

        if (currentDeviceBase.size()>0) {
            return currentDeviceBase.get(0);
        }else {
            return null;
        }
    }
}
