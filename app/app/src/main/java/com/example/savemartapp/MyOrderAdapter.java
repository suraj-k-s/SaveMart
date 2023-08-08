package com.example.savemartapp;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;

public class MyOrderAdapter extends RecyclerView.Adapter<MyOrderAdapter.MyViewHolder> {

    private String Name[],Image[], Id[], Qty[],Total[];
    private Context context;

    public MyOrderAdapter(Context ct, String name[], String image[], String id[], String qty[],String total[]) {
        context = ct;
        Name = name;

        Image = image;
        Id = id;
        Qty = qty;
        Total=total;
    }
    @NonNull
    @Override
    public MyOrderAdapter.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.my_orders_layout, parent, false);
        return new MyOrderAdapter.MyViewHolder(view);
    }
    @Override
    public void onBindViewHolder(@NonNull MyOrderAdapter.MyViewHolder holder, int position) {
        Picasso.get().load(Image[position]).into(holder.imageView);
        holder.nameText.setText(Name[position]);
        holder.totalPrice.setText(Total[position]);
        holder.qtyText.setText(Qty[position]);

        // Calculate the total price and display it
        int quantity = Integer.parseInt(Qty[position]);
        //double price = Double.parseDouble(Price[position]);
       // double totalPrice = quantity * price;
       // holder.totalPrice.setText(String.format("%.2f", totalPrice)); // Display total price with two decimal places
    }

    @Override
    public int getItemCount() {
        return Name.length;
    }
    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView nameText;

        TextView qtyText;
        TextView totalPrice;
        ImageView imageView;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            nameText = itemView.findViewById(R.id.productName);
            //priceText = itemView.findViewById(R.id.productPrice);
            totalPrice = itemView.findViewById(R.id.productTotal);
            imageView = itemView.findViewById(R.id.productImage);
            qtyText = itemView.findViewById(R.id.productQty);

        }
    }

}

