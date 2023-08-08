package com.example.savemartapp;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import de.hdodenhof.circleimageview.CircleImageView;
import android.graphics.Bitmap;
import android.provider.MediaStore;
import android.widget.Toast;

import androidx.annotation.Nullable;

import org.json.JSONException;

import java.io.IOException;
import java.util.regex.Pattern;

public class Registration extends AppCompatActivity {
    private Button button;
    private TextView photo;
    String Name,Phone,Email,Password,CPassword;
    EditText name;
    EditText phone;
    EditText email;
    EditText password;
    EditText confirmPassword;
    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registration);

        //photo = findViewById(R.id.photo);
        button = findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent in = new Intent(Registration.this, Login.class);
                startActivity(in);
            }
        });
        name=findViewById(R.id.editTextName);
        phone=findViewById(R.id.editTextPhone);
        email=findViewById(R.id.editEmail);
        password=findViewById(R.id.editTextTextPassword);
        confirmPassword=findViewById(R.id.editTextTextPassword2);

        button=findViewById(R.id.button);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (validateForm()) {

                    // Perform registration logic here
                    // For simplicity, we'll just show a toast indicating successful registration
                    Toast.makeText(Registration.this, "Registration successful!", Toast.LENGTH_SHORT).show();
                    RegDetails r=new RegDetails();
                    r.execute(Name,Phone,Email,Password);
                }else{
                    Toast.makeText(Registration.this, "Registration failed!", Toast.LENGTH_SHORT).show();
                }


            }
        });
    }
    private boolean validateForm(){
        Name=name.getText().toString();
        Phone=phone.getText().toString();
        Email=email.getText().toString();
        Password=password.getText().toString();
        CPassword=confirmPassword.getText().toString();

        // Check if any field is empty
        if (Name.isEmpty() || Phone.isEmpty() || Email.isEmpty() || Password.isEmpty() || CPassword.isEmpty()) {
            Toast.makeText(this, "Please fill in all fields.", Toast.LENGTH_SHORT).show();
            return false;
        }

        // Check if the email address is valid
        if (!isValidEmail(String.valueOf(Email))) {
            Toast.makeText(this, "Please enter a valid email address.", Toast.LENGTH_SHORT).show();

            return false;
        }
        if (!isValidPhoneNumber(Phone)) {
            Toast.makeText(this, "Please enter a valid phone number.", Toast.LENGTH_SHORT).show();

            return false;
        }
        if (!isValidPassword(Phone)) {
            Toast.makeText(this, "Please enter a password that match the constraints.", Toast.LENGTH_SHORT).show();

            return false;
        }


        // Check if the password and confirm password match
        if (!Password.equals(CPassword)) {
            Toast.makeText(this, "Passwords do not match.", Toast.LENGTH_SHORT).show();
            return false;
        }

        // You can add more specific validation rules here if needed
        // For example, check if the contact number is a valid phone number.

        return true;
    }
    private boolean isValidEmail(String email) {
        String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
        Pattern pattern = Pattern.compile(emailRegex);
        return pattern.matcher(email).matches();
    }
    public boolean isValidPhoneNumber(String phoneNumber) {
        String phonePattern = "^[0-9]{10}$";
        return phoneNumber.matches(phonePattern);
    }
    public boolean isValidPassword(String password) {
        String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$";
        return password.matches(passwordPattern);
    }

    public class RegDetails extends AsyncTask<String,String,String>{

        @Override
        protected String doInBackground(String... strings) {
            WebServiceCaller wb=new WebServiceCaller(getApplicationContext());
            wb.setSoapObject("registration");

            wb.addProperty("name",strings[0]);
            wb.addProperty("phone",strings[1]);
            wb.addProperty("email",strings[2]);
            wb.addProperty("password",strings[3]);

            wb.callWebService();
            return wb.getResponse();

        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            if(!s.equals("[]")){
               // Toast.makeText(Registration.this,"success",Toast.LENGTH_SHORT).show();
                Intent i=new Intent(Registration.this,Login.class);
                startActivity(i);
            }else{
                Toast.makeText(Registration.this,"failed",Toast.LENGTH_SHORT).show();
            }
        }
    }
}