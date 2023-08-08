package com.example.savemartapp;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.app.DatePickerDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Calendar;

public class PickUp extends AppCompatActivity {
Spinner spinner;
Button pay;
TextView pickupDateTextView;
String[] time={"9-10","11-11:30"};
    String grandTotal;

    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pick_up);

        pickupDateTextView = findViewById(R.id.pickupDate);
        pickupDateTextView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showDatePickerDialog();
            }
        });
        spinner=findViewById(R.id.spinnerlist);

        Intent intent = getIntent();
        grandTotal = intent.getStringExtra("grandTotal");
        SharedPreferences a = getSharedPreferences("user", MODE_PRIVATE);
        String id = a.getString("id", "");

        ArrayAdapter<String> adapter=new ArrayAdapter<String>(PickUp.this, R.layout.time_file,time);
        adapter.setDropDownViewResource(R.layout.time_file);
        spinner.setAdapter(adapter);
        spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                String value=parent.getItemAtPosition(position).toString();
                //Toast.makeText(PickUp.this,value,Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
        pay=findViewById(R.id.pay);
        pay.setOnClickListener(new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            String date=pickupDateTextView.getText().toString();
            String time=spinner.getSelectedItem().toString();
            PickUp.pickupDetails l=new PickUp.pickupDetails();
            l.execute(date,time,id,grandTotal);
        }
    });
    }
    private void showDatePickerDialog() {
        // Get the current date from the TextView if it's not empty
        String currentDate = pickupDateTextView.getText().toString();
        int year, month, day;
        if (!currentDate.isEmpty()) {
            String[] dateParts = currentDate.split("/");
            year = Integer.parseInt(dateParts[2]);
            month = Integer.parseInt(dateParts[1]) - 1; // Month starts from 0 in DatePickerDialog
            day = Integer.parseInt(dateParts[0]);
        } else {
            // Use the current date if the TextView is empty
            Calendar calendar = Calendar.getInstance();
            year = calendar.get(Calendar.YEAR);
            month = calendar.get(Calendar.MONTH);
            day = calendar.get(Calendar.DAY_OF_MONTH);
        }

        // Create a DatePickerDialog to show the date picker
        DatePickerDialog datePickerDialog = new DatePickerDialog(
                this,
                new DatePickerDialog.OnDateSetListener() {
                    @Override
                    public void onDateSet(DatePicker view, int year, int month, int dayOfMonth) {
                        // Handle the selected date
                        String selectedDate = dayOfMonth + "/" + (month + 1) + "/" + year;
                        pickupDateTextView.setText(selectedDate);
                    }
                },
                year, month, day
        );

        // Show the DatePickerDialog
        datePickerDialog.show();
    }
    public class pickupDetails extends AsyncTask<String,String,String> {

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("PickupCheckout");
            wb.addProperty("date",strings[0]);
            wb.addProperty("time",strings[1]);
            wb.addProperty("id",strings[2]);
            wb.addProperty("total",strings[3]);
            wb.callWebService();
            return wb.getResponse();
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            Intent i=new Intent(PickUp.this, Payment.class);
            i.putExtra("id",s.trim());
            i.putExtra("amount",grandTotal);
            startActivity(i);
        }
    }
}