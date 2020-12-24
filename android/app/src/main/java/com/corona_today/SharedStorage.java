package com.corona_today;

import android.appwidget.AppWidgetManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;

import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class SharedStorage extends ReactContextBaseJavaModule {
    ReactApplicationContext context;

    public SharedStorage(ReactApplicationContext reactContext) {
        super(reactContext);
        context = reactContext;
    }

    @NonNull
    @Override
    public String getName() {
        return "SharedStorage";
    }

    @ReactMethod
    public void set(String message) {
        SharedPreferences.Editor editor = context.getSharedPreferences("DATA", Context.MODE_PRIVATE).edit();
        editor.putString("appData", message);
        editor.commit();
        Intent intent = new Intent(getCurrentActivity().getApplicationContext(),Widget.class);
        intent.setAction(AppWidgetManager.ACTION_APPWIDGET_UPDATE);

        int[] ids = AppWidgetManager.getInstance(getCurrentActivity().getApplicationContext()).getAppWidgetIds(new ComponentName(getCurrentActivity().getApplicationContext(),Widget.class));
        intent.putExtra(AppWidgetManager.EXTRA_APPWIDGET_IDS,ids);
        getCurrentActivity().getApplicationContext().sendBroadcast(intent);
    }
}
