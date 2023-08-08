package com.example.savemartapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;

import com.google.android.material.bottomnavigation.BottomNavigationView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class MyCart extends AppCompatActivity implements MyCartAdapter.QuantityUpdateListener ,MyCartAdapter.ItemDeleteListener{
    BottomNavigationView bottomNavigationView;
    Button buttonCheckout;
    String name[],id[],price[],image[],qty[];
    String total;
    TextView grandTotal;
    RecyclerView recyclerView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_cart);
        bottomNavigationView=  findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                if(item.getItemId()==R.id.menuAccount) {
                    startActivity(new Intent(MyCart.this, MyProfile.class));
                    return true;
                }
                else if(item.getItemId()==R.id.menuHome) {
                    startActivity(new Intent(MyCart.this, Dashboard.class));
                    return true;
                } else if (item.getItemId()==R.id.menuNotification) {
                    startActivity(new Intent(MyCart.this,Notification.class));
                    return true;
                }
                return false;
            }
        });

        recyclerView=findViewById(R.id.myCart);
        grandTotal=findViewById(R.id.grandTotal);

        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        String id = a.getString("id", "");

        CartItems ci = new CartItems();
        ci.execute(id);

        buttonCheckout=findViewById(R.id.buttonCheckout);
        buttonCheckout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String total = grandTotal.getText().toString();
                Intent intent=new Intent(MyCart.this,Delivery.class);
                intent.putExtra("grandTotal",total);
                startActivity(intent);
            }
        });

    }
    @Override
    public void onItemDeleted(String itemId) {
        MyCart.DeleteItem di = new MyCart.DeleteItem();
        di.execute(itemId);
    }
    @Override
    public void onQuantityUpdated(String itemId, String newQuantity) {
        MyCart.UpdateQuantity uq = new MyCart.UpdateQuantity();
        uq.execute(newQuantity,itemId);
    }
    public class DeleteItem extends AsyncTask<String,String,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("DeleteItem");
            wb.addProperty("id",strings[0]);
            wb.callWebService();

            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            MyCart.CartItems ci = new MyCart.CartItems();
            ci.execute(id);
        }
    }

    public class UpdateQuantity extends AsyncTask<String,String,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("UpdateQuantity");
            wb.addProperty("qty",strings[0]);
            wb.addProperty("id",strings[1]);
            wb.callWebService();

            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

        }
    }
    public class CartItems extends AsyncTask<String,String,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("CartItems");
            wb.addProperty("userid",strings[0]);
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
                price = new String[j.length()];
                image = new String[j.length()];
                id = new String[j.length()];
                qty = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    name[i] = jo.getString("name");
                    price[i] = jo.getString("price");
                    image[i] = jo.getString("image");
                    id[i] = jo.getString("id");
                    qty[i] = jo.getString("qty");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            MyCartAdapter myCartAdapter = new MyCartAdapter(MyCart.this,name,price,image,id,qty,MyCart.this,MyCart.this,grandTotal);
            recyclerView.setAdapter(myCartAdapter);
            recyclerView.setLayoutManager(new LinearLayoutManager(MyCart.this));

            double grandTotalValue = myCartAdapter.calculateGrandTotal();
            grandTotal.setText(String.format("%.2f", grandTotalValue));
        }
    }

}