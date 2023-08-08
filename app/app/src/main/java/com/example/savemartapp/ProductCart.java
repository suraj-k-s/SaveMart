package com.example.savemartapp;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
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
import android.widget.Toast;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ProductCart extends AppCompatActivity {
    BottomNavigationView bottomNavigationView;

    RecyclerView mainRecycle;

    String id[],name[],price[],image[];
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_cart);

        mainRecycle = findViewById(R.id.mainRecycle);

        Intent i = getIntent();
        String category= i.getStringExtra("category_id");

        CategoryItem ci = new CategoryItem();
        ci.execute(category);


        bottomNavigationView = findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                if(item.getItemId()==R.id.menuHome) {
                    startActivity(new Intent(ProductCart.this, Dashboard.class));
                    return true;
                }
                else if(item.getItemId()==R.id.menuMyCart) {
                    startActivity(new Intent(ProductCart.this, MyCart.class));
                    return true;
                } else if (item.getItemId()==R.id.menuAccount) {
                    startActivity(new Intent(ProductCart.this,MyProfile.class));
                    return true;
                }
                else if (item.getItemId()==R.id.menuNotification) {
                    startActivity(new Intent(ProductCart.this,Notification.class));
                    return true;
                }
                return true;
            }
        });

    }

    public class CategoryItem extends AsyncTask<String,String,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("CategoryItem");
            wb.addProperty("id",strings[0]);
            wb.addProperty("ip",WebServiceCaller.ip);
            wb.callWebService();

            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            Log.d("CategoryProducts", s);
            JSONArray j = null;
            try {
                j = new JSONArray(s);
                id = new String[j.length()];
                name = new String[j.length()];
                image = new String[j.length()];
                price = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    name[i] = jo.getString("name");
                    price[i] = jo.getString("price");
                    image[i] = jo.getString("image");
                    id[i] = jo.getString("id");
                }

                MainAdapter mainAdapter = new MainAdapter(ProductCart.this,name,price,image,id);
                mainRecycle.setAdapter(mainAdapter);
                mainRecycle.setLayoutManager(new LinearLayoutManager(ProductCart.this));
                mainAdapter.setOnItemClickListener(new MainAdapter.OnItemClickListener() {
                    @Override
                    public void onItemClick(String productId) {
                        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
                        String userid = a.getString("id", "");
                        Addtocart addtocart = new Addtocart();
                        addtocart.execute(productId,userid);
                    }
                });
            } catch (JSONException e) {
                e.printStackTrace();

            }
        }
    }
    public class Addtocart extends AsyncTask<String,String,String>{

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("cart");
            wb.addProperty("itemid",strings[0]);
            wb.addProperty("userid",strings[1]);
            wb.callWebService();

            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String a) {
            super.onPostExecute(a);

            Toast.makeText(ProductCart.this, a, Toast.LENGTH_SHORT).show();

        }
    }

}