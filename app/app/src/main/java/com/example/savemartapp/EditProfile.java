package com.example.savemartapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.MenuItem;
import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.squareup.picasso.Picasso;

import androidx.annotation.Nullable;
import android.graphics.Bitmap;
import android.net.Uri;
import android.provider.MediaStore;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;


public class EditProfile extends AppCompatActivity {

    private Button buttonSave,buttonEditProfile;
    EditText nameE,mailE,phnE;
    String cname,cemail,cphone;
    String ename,eemail,ephone;
    BottomNavigationView bottomNavigationView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_profile);

        nameE=findViewById(R.id.editTextName);
        mailE=findViewById(R.id.editTextTextEmailAddress);
        phnE=findViewById(R.id.editTextPhn);
        bottomNavigationView = findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                if (item.getItemId() == R.id.menuHome) {
                    startActivity(new Intent(EditProfile.this, Dashboard.class));
                    return true;
                } else if (item.getItemId() == R.id.menuMyCart) {
                    startActivity(new Intent(EditProfile.this, MyCart.class));
                    return true;
                } else if (item.getItemId() == R.id.menuNotification) {
                    startActivity(new Intent(EditProfile.this, Notification.class));
                    return true;
                }
                return false;
            }
        });
        buttonSave=findViewById(R.id.buttonSave);


        SharedPreferences a=getSharedPreferences("user",MODE_PRIVATE);
        String id=a.getString("id","");
        myprofile p=new myprofile();
        p.execute(id);
        buttonSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ename=nameE.getText().toString();
                eemail=mailE.getText().toString();
                ephone=phnE.getText().toString();
                EditDetails l=new EditDetails();
               l.execute(id,ename,eemail,ephone);
            }
        });


    }
    public class myprofile extends AsyncTask<String,String ,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("myprofile");

            wb.addProperty("id", strings[0]);

            wb.callWebService();
            return wb.getResponse();
        }

            @Override
            protected void onPostExecute (String s){
                super.onPostExecute(s);

                    JSONArray j = null;
                    Toast.makeText(EditProfile.this,s,Toast.LENGTH_SHORT).show();
                Log.d("Profile",s);
                    try {
                        j = new JSONArray(s);
                        JSONObject jo = j.getJSONObject(0);
                        cname=jo.getString("name");
                        cemail=jo.getString("email");
                        cphone=jo.getString("phone");

                        nameE.setText(cname);
                        mailE.setText(cemail);
                        phnE.setText(cphone);

                    } catch (JSONException e) {
                        e.printStackTrace();
                    }

                }
            }


    public class EditDetails extends AsyncTask<String,String ,String> {

        @Override
        protected String doInBackground(String... params) {
            WebServiceCaller wb = new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("editprofile");

            wb.addProperty("id", params[0]);
            wb.addProperty("name", params[1]);
            wb.addProperty("email", params[2]);
            wb.addProperty("phone", params[3]);

            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String e) {
            super.onPostExecute(e);
            Toast.makeText(EditProfile.this,e,Toast.LENGTH_SHORT).show();
            Log.d("hai",e);
            if (e.equals("Success")) {
                Toast.makeText(getApplicationContext(),"Profile Update Successfull",Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(getApplicationContext(),MyProfile.class);
                startActivity(intent);
            } else {
                Toast.makeText(EditProfile.this, "failed", Toast.LENGTH_SHORT).show();
            }
        }
    }
}