package com.example.savemartapp;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;

public class FindItemAdapter extends RecyclerView.Adapter<FindItemAdapter.MyViewHolder>{

    private String Name[], Price[], Image[], Rack[], Stock[];
    private Context context;



    public FindItemAdapter(Context ct, String name[], String price[],String image[],String rack[],String stock[]) {
        context = ct;
        Name = name;
        Price= price;
        Image = image;
        Rack = rack;
        Stock = stock;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.find_item_layout, parent, false);
        return new MyViewHolder(view);
    }
    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        Picasso.get().load(Image[position]).into(holder.imageView);
        holder.nameText.setText(Name[position]);
        holder.priceText.setText(Price[position]);
        holder.rackText.setText(Rack[position]);
        holder.stockText.setText(Stock[position]);

    }

    @Override
    public int getItemCount() {
        return Name.length;
    }



    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView nameText,priceText,rackText,stockText;
        ImageView imageView;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            nameText = itemView.findViewById(R.id.productName);
            priceText = itemView.findViewById(R.id.productPrice);
            rackText = itemView.findViewById(R.id.productNo);
            stockText = itemView.findViewById(R.id.productStock);
            imageView = itemView.findViewById(R.id.productImage);

        }
    }
}

