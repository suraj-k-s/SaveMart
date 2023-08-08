package com.example.savemartapp;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.AsyncTask;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class FindItem extends AppCompatActivity {

    RecyclerView findView;
    EditText search;
    ImageButton find;

    String capitalizedText="";


    String name[],image[],rack[],price[],stock[];

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_find_item);
        search = findViewById(R.id.editSearch);
        find = findViewById(R.id.imageSearch);
        findView = findViewById(R.id.findItemView);

        capitalizetext ct = new capitalizetext();
        ct.execute(capitalizedText);


        find.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String searchText = search.getText().toString().trim();
                capitalizedText = capitalizeEachWord(searchText);
                capitalizetext ct = new capitalizetext();
                ct.execute(capitalizedText);
            }
        });


    }

    private String capitalizeEachWord(String input) {
        if (TextUtils.isEmpty(input)) {
            return "";
        }

        String[] words = input.split("\\s+");
        StringBuilder capitalizedText = new StringBuilder();

        for (String word : words) {
            if (word.length() > 0) {
                String firstLetter = word.substring(0, 1).toUpperCase();
                String restOfWord = word.substring(1).toLowerCase();
                capitalizedText.append(firstLetter).append(restOfWord).append(" ");
            }
        }

        return capitalizedText.toString().trim();
    }

    public class capitalizetext extends AsyncTask<String,String,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("capitalizetext");
            wb.addProperty("text",strings[0]);
            wb.addProperty("ip",WebServiceCaller.ip);
            wb.callWebService();

            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);


            JSONArray j = null;
            try {
                j = new JSONArray(s);
                name = new String[j.length()];
                price = new String[j.length()];
                image = new String[j.length()];
                stock = new String[j.length()];
                rack = new String[j.length()];
                for (int i = 0; i < j.length(); i++) {
                    JSONObject jo = j.getJSONObject(i);
                    name[i] = jo.getString("name");
                    price[i] = jo.getString("price");
                    image[i] = jo.getString("image");
                    rack[i] = jo.getString("rackno");
                    stock[i] = jo.getString("stock");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
            FindItemAdapter findItemAdapter = new FindItemAdapter(FindItem.this,name,price,image,rack,stock);
            findView.setAdapter(findItemAdapter);
            findView.setLayoutManager(new LinearLayoutManager(FindItem.this));


        }

    }

}