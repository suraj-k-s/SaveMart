package com.example.savemartapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.MenuItem;
import android.widget.Toast;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MyOrders extends AppCompatActivity {
    BottomNavigationView bottomNavigationView;
    RecyclerView recyclerView;
    String name[],id[],image[],qty[],total[];
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_orders);
        recyclerView=findViewById(R.id.MyOrders);

        String bookingId = getIntent().getStringExtra("BOOKING_ID");
        Toast.makeText(this, bookingId, Toast.LENGTH_SHORT).show();

        bottomNavigationView=  findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                if(item.getItemId()==R.id.menuHome) {
                    startActivity(new Intent(MyOrders.this, Dashboard.class));
                    return true;
                }
                else if(item.getItemId()==R.id.menuMyCart) {
                    startActivity(new Intent(MyOrders.this, MyCart.class));
                    return true;
                } else if (item.getItemId()==R.id.menuNotification) {
                    startActivity(new Intent(MyOrders.this,Notification.class));
                    return true;
                }else if(item.getItemId()==R.id.menuAccount) {
                    startActivity(new Intent(MyOrders.this, MyCart.class));
                    return true;
                }
                return false;
            }
        });

        ViewItems vi = new ViewItems();
        vi.execute(bookingId);
    }
    public class ViewItems extends AsyncTask<String,String,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("ViewItems");
            wb.addProperty("bookingId",strings[0]);
            wb.addProperty("ip",WebServiceCaller.ip);
            wb.callWebService();

            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            Log.d("TAG", s);

            JSONArray j = null;
            try {
                j = new JSONArray(s);
                name = new String[j.length()];
                //price = new String[j.length()];
                image = new String[j.length()];
                id = new String[j.length()];
                qty = new String[j.length()];
                total = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    name[i] = jo.getString("name");
                    //price[i] = jo.getString("price");
                    image[i] = jo.getString("image");
                    id[i] = jo.getString("id");
                    qty[i] = jo.getString("qty");
                    total[i] = jo.getString("total");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            MyOrderAdapter myorderAdapter = new MyOrderAdapter(MyOrders.this,name,image,id,qty,total);
            recyclerView.setAdapter(myorderAdapter);
            recyclerView.setLayoutManager(new LinearLayoutManager(MyOrders.this));

            //double grandTotalValue = myorderAdapter.calculateGrandTotal();

        }
    }
}