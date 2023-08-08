package com.example.savemartapp;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.lang.reflect.Field;

public class Dashboard extends AppCompatActivity {

    BottomNavigationView bottomNavigationView;
    TextView textAddress,textUsername;
    LinearLayout firstOne;
    RecyclerView recyclerView;

    String name[],id[],image[];
    LinearLayout drop;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dashboard);
        recyclerView = findViewById(R.id.recyclerView);

        CategoryData cd = new CategoryData();
        cd.execute();

        bottomNavigationView = findViewById(R.id.bottomNavigationView);
        bottomNavigationView.setOnNavigationItemSelectedListener(new BottomNavigationView.OnNavigationItemSelectedListener() {

            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                if(item.getItemId()==R.id.menuAccount) {
                    startActivity(new Intent(Dashboard.this, MyProfile.class));
                    return true;
                }
                else if(item.getItemId()==R.id.menuMyCart) {
                    startActivity(new Intent(Dashboard.this, MyCart.class));
                    return true;
                } else if (item.getItemId()==R.id.menuNotification) {
                    startActivity(new Intent(Dashboard.this,Notification.class));
                    return true;
                }else if (item.getItemId()==R.id.menuLogOut) {
                    startActivity(new Intent(Dashboard.this, Logout.class));
                    return true;
                }
                return true;
            }
        });


        drop=findViewById(R.id.drop);
        drop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                showPopupMenu(view);
            }
        });

    }

    private void showPopupMenu(View view){

        PopupMenu popupMenu=new PopupMenu(this,view);
        MenuInflater inflater=popupMenu.getMenuInflater();
        inflater.inflate(R.menu.popup_menu,popupMenu.getMenu());
        popupMenu.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() {

            @Override
            public boolean onMenuItemClick(MenuItem item) {
                int itemId=item.getItemId();
                System.out.println(itemId);
                if (itemId==R.id.fi) {
                    startActivity(new Intent(Dashboard.this, FindItem.class));
                    return true;
                } else if (itemId==R.id.qrc) {
                    startActivity(new Intent(Dashboard.this, ScanQR.class));
                    return true;
                }
                return false;
            }
        });
        popupMenu.show();
    }

    public class CategoryData extends AsyncTask<String,String,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("CategoryData");
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
                id = new String[j.length()];
                name = new String[j.length()];
                image = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    name[i] = jo.getString("name");
                    image[i] = jo.getString("image");
                    id[i] = jo.getString("id");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }


            GridLayoutManager layoutManager = new GridLayoutManager(Dashboard.this, 2); // 2 columns per row
            CategoryAdapter categoryAdapter = new CategoryAdapter(Dashboard.this,name,image,id);
            recyclerView.setAdapter(categoryAdapter);
            recyclerView.setLayoutManager(layoutManager);

            categoryAdapter.setOnItemClickListener(new CategoryAdapter.OnItemClickListener() {
                @Override
                public void onItemClick(String id) {

                    Intent intent = new Intent(Dashboard.this, ProductCart.class);
                    intent.putExtra("category_id", id);
                    startActivity(intent);
                }
            });


        }
    }

}