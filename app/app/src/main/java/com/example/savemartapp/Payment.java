package com.example.savemartapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class Payment extends AppCompatActivity {

    TextView amountText;

    Button payButton ;
    


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_payment);

        amountText  = findViewById(R.id.totalAmount);
        payButton  = findViewById(R.id.buttonPay);

        Intent i = getIntent();
        String amount = i.getStringExtra("amount");
        String id = i.getStringExtra("id");
        Toast.makeText(this,  "ID: " + id + ", Amount: " + amount, Toast.LENGTH_SHORT).show();

        amountText.setText(amount);


        payButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                CheckoutPayment cp = new CheckoutPayment();
                cp.execute(id);
            }
        });

    }

    public class CheckoutPayment extends AsyncTask<String,String,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("CheckoutPayment");
            wb.addProperty("id",strings[0]);
            wb.callWebService();

            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);

            Toast.makeText(Payment.this, "Payment Completed", Toast.LENGTH_SHORT).show();
            Intent i=new Intent(Payment.this, Dashboard.class);
            startActivity(i);



        }
    }

}