package com.example.savemartapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class Delivery extends AppCompatActivity {

    Button home,pick;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_delivery);

        Intent intent = getIntent();
        String grandTotal = intent.getStringExtra("grandTotal");

        home=findViewById(R.id.buttonHomeDelivery);
        home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Delivery.this,HomeDelivery.class);
                i.putExtra("grandTotal",grandTotal);
                startActivity(i);
            }
        });

        pick=findViewById(R.id.buttonPickUp);
        pick.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i=new Intent(Delivery.this,PickUp.class);
                i.putExtra("grandTotal",grandTotal);
                startActivity(i);
            }
        });
    }
}