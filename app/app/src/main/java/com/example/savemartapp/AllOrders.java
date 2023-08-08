package com.example.savemartapp;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AllOrders extends AppCompatActivity {
    Button view;

    RecyclerView bookingView;

    String id[],date[],amount[],address[],pdate[],time[],slot[],mode[];

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_all_orders);

        bookingView=findViewById(R.id.rviewAllOrders);

        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        String id = a.getString("id", "");

         ViewBooking vb = new ViewBooking();
         vb.execute(id);

    }

    public class ViewBooking extends AsyncTask<String,String,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("ViewBooking");
            wb.addProperty("id",strings[0]);
            wb.callWebService();

            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);



            JSONArray j = null;
            try {
                j = new JSONArray(s);
                id = new String[j.length()];
                date = new String[j.length()];
                amount = new String[j.length()];
                address = new String[j.length()];
                pdate = new String[j.length()];
                time = new String[j.length()];
                slot = new String[j.length()];
                mode = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    id[i] = jo.getString("id");
                    date[i] = jo.getString("date");
                    amount[i] = jo.getString("amount");
                    address[i] = jo.getString("address");
                    pdate[i] = jo.getString("pdate");
                    time[i] = jo.getString("time");
                    slot[i] = jo.getString("slot");
                    mode[i] = jo.getString("mode");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            MyBookingAdapter myBookingAdapter = new MyBookingAdapter(AllOrders.this,id,date,amount,address,pdate,time,slot,mode);
            bookingView.setAdapter(myBookingAdapter);
            bookingView.setLayoutManager(new LinearLayoutManager(AllOrders.this));

        }
    }

}
