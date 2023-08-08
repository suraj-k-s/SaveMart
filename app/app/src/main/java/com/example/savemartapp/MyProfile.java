package com.example.savemartapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.google.android.material.bottomnavigation.BottomNavigationView;

public class MyProfile extends AppCompatActivity {
    TextView name,email,phone;

    BottomNavigationView bottomNavigationView;
    Button buttonMyOrders;
    Button buttonEditProfile;
    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_profile);
        bottomNavigationView=  findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                if(item.getItemId()==R.id.menuHome) {
                    startActivity(new Intent(MyProfile.this, Dashboard.class));
                    return true;
                }
                else if(item.getItemId()==R.id.menuMyCart) {
                    startActivity(new Intent(MyProfile.this, MyCart.class));
                    return true;
                } else if (item.getItemId()==R.id.menuNotification) {
                    startActivity(new Intent(MyProfile.this,Notification.class));
                    return true;
                }
                return false;
            }
        });

        buttonMyOrders=findViewById(R.id.buttonMyOrders);
        buttonMyOrders.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent=new Intent(MyProfile.this,AllOrders.class);
                startActivity(intent);
            }
        });
        buttonEditProfile=findViewById(R.id.buttonEditProfile);
        buttonEditProfile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent=new Intent(MyProfile.this,EditProfile.class);
                startActivity(intent);
            }
        });

        name = findViewById(R.id.username);
        email = findViewById(R.id.textEmailID);
        phone = findViewById(R.id.textContactNum);

        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        String id = a.getString("id", "");

        myprofile s=new myprofile();
        s.execute(id);
    }
    public class myprofile extends AsyncTask<String, String, String> {
        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("myprofile");
            wb.addProperty("id", strings[0]);

            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            if (!s.equals("[]")) {
                JSONArray j = null;
                try {
                    j = new JSONArray(s);
                    JSONObject jo = j.getJSONObject(0);

                    String Name = jo.getString("name");
                    String Email = jo.getString("email");
                    String Phone = jo.getString("phone");

                    name.setText(Name);
                    email.setText(Email);
                    phone.setText(Phone);

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }


        }

    }

}