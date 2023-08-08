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

public class HomeDelivery extends AppCompatActivity {
Button buttonPay;
EditText DeliveryAddress;
String Address,bid;
    String grandTotal;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home_delivery);
        Intent intent = getIntent();
        grandTotal = intent.getStringExtra("grandTotal");
        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        String id = a.getString("id", "");

        DeliveryAddress=findViewById(R.id.textHomeDelivery);
        buttonPay=findViewById(R.id.buttonPay);
        buttonPay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Address=DeliveryAddress.getText().toString();
                DeliveryDetails l=new DeliveryDetails();
                l.execute(Address,id,grandTotal);
            }
        });
    }
    public class DeliveryDetails extends AsyncTask<String,String,String>{

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("HomeCheckout");
            wb.addProperty("total",strings[2]);
            wb.addProperty("id",strings[1]);
            wb.addProperty("address",strings[0]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Intent i=new Intent(HomeDelivery.this, Payment.class);
            i.putExtra("id",s.trim());
            i.putExtra("amount",grandTotal);
            startActivity(i);
        }
    }
}