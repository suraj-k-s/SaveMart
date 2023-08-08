package com.example.savemartapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.NotificationCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.annotation.SuppressLint;
import android.app.NotificationManager;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Notification extends AppCompatActivity {
    Button button;
    String date[],title[],content[];
    RecyclerView recyclerView;
    BottomNavigationView bottomNavigationView;
    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_notification);
        bottomNavigationView=  findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                if(item.getItemId()==R.id.menuHome) {
                    startActivity(new Intent(Notification.this, Dashboard.class));
                    return true;
                }
                else if(item.getItemId()==R.id.menuMyCart) {
                    startActivity(new Intent(Notification.this, MyCart.class));
                    return true;
                } else if (item.getItemId()==R.id.menuAccount) {
                    startActivity(new Intent(Notification.this,MyProfile.class));
                    return true;
                }
                return false;
            }
        });

        recyclerView=findViewById(R.id.notificationRecycle);
        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        String id = a.getString("id", "");
        GetNotification gn = new GetNotification();
        gn.execute(id);

    }
    public class GetNotification extends AsyncTask<String, String, String> {
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("Notification");
            wb.addProperty("id",strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }
        @Override
        protected void onPostExecute(String s) {
            Log.d("TAG", s);
            super.onPostExecute(s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                date = new String[j.length()];
                title = new String[j.length()];
                content = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    date[i] = jo.getString("date");
                    title[i] = jo.getString("title");
                    content[i] = jo.getString("content");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            NotificationAdapter notificationAdapter = new NotificationAdapter(Notification.this,title,date,content);
            recyclerView.setAdapter(notificationAdapter);
            recyclerView.setLayoutManager(new LinearLayoutManager(Notification.this));
        }


    }
}