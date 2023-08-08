package com.example.savemartapp;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.Toast;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class ScanQR extends AppCompatActivity {
    BottomNavigationView bottomNavigationView;
    ImageButton qrCodeScannerButton,cart;
    TextView textqrcode;
    String ProductId="";
    ImageView image;
    TextView name,price;
    Button buttonSAdd;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_scan_qr);

        image=findViewById(R.id.img);
        name=findViewById(R.id.iname);
        price=findViewById(R.id.iprice);

        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        String id = a.getString("id", "");

        openScanner();

        qrCodeScannerButton=findViewById(R.id.qrCodeScannerButton);
        textqrcode=findViewById(R.id.textqrcode);
        qrCodeScannerButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openScanner();
            }
        });

        buttonSAdd=findViewById(R.id.buttonSAdd);

        buttonSAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                addtocart a=new addtocart();
                a.execute(ProductId,id);
            }
        });


        buttonSAdd.setVisibility(View.INVISIBLE);
        ViewTreeObserver observer=textqrcode.getViewTreeObserver();
        observer.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                if(textqrcode != null && textqrcode.getVisibility() == View.VISIBLE){
                    buttonSAdd.setVisibility(View.VISIBLE);
                    textqrcode.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
            }
        });

        cart=findViewById(R.id.buttonOut);
        cart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(ScanQR.this, ScanCart.class);
                startActivity(i);
            }
        });

    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {

        IntentResult intentResult=IntentIntegrator.parseActivityResult(requestCode,resultCode,data);
        if(intentResult!=null){
            String contents=intentResult.getContents();
            if(contents!=null){
                String id=intentResult.getContents();
                JSONObject jsonObject = null;
                String idValue = null;
                try {
                    jsonObject = new JSONObject(id);
                    idValue = jsonObject.getString("id");
                } catch (JSONException e) {
                    throw new RuntimeException(e);
                }
                ProductId=idValue;
                scanitem s = new scanitem();
                s.execute(idValue);
            }
        }else{
            super.onActivityResult(requestCode, resultCode, data);
        }
    }
    public class scanitem extends AsyncTask<String,String,String>{

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("scan");
            wb.addProperty("itemid",strings[0]);
            wb.addProperty("ip",WebServiceCaller.ip);
            wb.callWebService();

            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            JSONArray j=null;
            try {
                j = new JSONArray(s);
                JSONObject jo=j.getJSONObject(0);
                String Iname = jo.getString("itemname");
                String Iimage = jo.getString("itemimg");
                String Iamount = jo.getString("itemamnt");

                name.setText(Iname);
                price.setText(Iamount);
                Picasso.get().load(Iimage).into(image);

            } catch (Exception e) {
                e.printStackTrace();
            }


        }
    }

    public void openScanner()
    {
        IntentIntegrator intentIntegrator=new IntentIntegrator(ScanQR.this);
        intentIntegrator.setOrientationLocked(true);
        intentIntegrator.setPrompt("Scan a QR code");
        intentIntegrator.setDesiredBarcodeFormats(IntentIntegrator.QR_CODE);
        intentIntegrator.initiateScan();
    }

    public class addtocart extends AsyncTask<String,String,String>{

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

            Toast.makeText(ScanQR.this, a, Toast.LENGTH_SHORT).show();

        }
    }
}