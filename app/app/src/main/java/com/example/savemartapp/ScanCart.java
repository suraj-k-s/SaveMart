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
import android.widget.TextView;
import android.widget.Toast;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ScanCart extends AppCompatActivity implements ScanCartAdapter.QuantityUpdateListener ,ScanCartAdapter.ItemDeleteListener{

    String name[],id[],price[],image[],qty[];
    Button pay;
    String total;
    TextView grandTotal;
    RecyclerView recyclerView;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_scan_cart);

        recyclerView=findViewById(R.id.scanCart);
        grandTotal=findViewById(R.id.grandTotal);

        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        String id = a.getString("id", "");

        CartItems ci = new CartItems();
        ci.execute(id);

        pay=findViewById(R.id.buttonSCheckout);
        pay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                total = grandTotal.getText().toString();

                Checkout co = new Checkout();
                co.execute(total,id);
            }
        });

    }

    @Override
    public void onItemDeleted(String itemId) {
        DeleteItem di = new DeleteItem();
        di.execute(itemId);
    }

    @Override
    public void onQuantityUpdated(String itemId, String newQuantity) {
        UpdateQuantity uq = new UpdateQuantity();
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
            CartItems ci = new CartItems();
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

    public class Checkout extends AsyncTask<String,String,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("Checkout");
            wb.addProperty("total",strings[0]);
            wb.addProperty("id",strings[1]);
            wb.callWebService();

            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            if (!s.equals("")) {

                Intent i=new Intent(ScanCart.this, Payment.class);
                i.putExtra("id",s.trim());
                i.putExtra("amount",total);
                startActivity(i);

            }
            else
            {
                Toast.makeText(ScanCart.this, "Something Wrong", Toast.LENGTH_SHORT).show();
            }



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
                ScanCartAdapter scanCartAdapter = new ScanCartAdapter(ScanCart.this,name,price,image,id,qty,ScanCart.this,ScanCart.this,grandTotal);
                recyclerView.setAdapter(scanCartAdapter);
                recyclerView.setLayoutManager(new LinearLayoutManager(ScanCart.this));

            double grandTotalValue = scanCartAdapter.calculateGrandTotal();
            grandTotal.setText(String.format("%.2f", grandTotalValue));
        }
    }
}