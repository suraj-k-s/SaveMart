package com.example.savemartapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class Login extends AppCompatActivity {
    private Button signinButton,signUp;
    String Email, Password;
    String id , name;
    EditText emailT,passwordT;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_login);

        emailT=findViewById(R.id.username);
        passwordT=findViewById(R.id.password);
        signinButton=findViewById(R.id.signIn);
        signinButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Email=emailT.getText().toString();
                Password=passwordT.getText().toString();

                Email = "example@example.com";
                Password = "Abc@12";

                LoginDetails l=new LoginDetails();
                l.execute(Email,Password);
            }
        });
    signUp=findViewById(R.id.signUp);
    signUp.setOnClickListener(new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            Intent i=new Intent(Login.this, Registration.class);
            startActivity(i);
        }
    });
    }

    public class LoginDetails extends AsyncTask<String,String,String>{

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("login");

            wb.addProperty("email",strings[0]);
            wb.addProperty("password",strings[1]);
            wb.callWebService();
            return wb.getResponse();
        }


        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            if(!s.equals("[]")){
                JSONArray j=null;
                try{
                    j=new JSONArray(s);
                    JSONObject jo=j.getJSONObject(0);
                    id=jo.getString("id");
                    name=jo.getString("name");
                    Toast.makeText(Login.this,"success",Toast.LENGTH_SHORT).show();
                    SharedPreferences.Editor sh=getSharedPreferences("user",MODE_PRIVATE).edit();
                    sh.putString("id",id);
                    sh.putString("name",name);
                    sh.apply();
                }catch (JSONException e){
                    e.printStackTrace();
                }
                Intent intent=new Intent(Login.this,Dashboard.class);
                startActivity(intent);
            }else{
                Toast.makeText(Login.this,"failed",Toast.LENGTH_SHORT).show();
            }
        }
    }
}