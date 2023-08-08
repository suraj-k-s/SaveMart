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
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;

public class MainAdapter extends RecyclerView.Adapter<MainAdapter.MyViewHolder>{

    private String Name[], Price[], Image[], Id[];
    private Context context;

    private OnItemClickListener itemClickListener;

    public interface OnItemClickListener {
        void onItemClick(String productId);
    }


    public MainAdapter(Context ct, String name[], String price[],String image[],String id[]) {
        context = ct;
        Name = name;
        Price= price;
        Image = image;
        Id = id;

    }

    public void setOnItemClickListener(OnItemClickListener listener) {
        this.itemClickListener = listener;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.main_layout, parent, false);
        return new MyViewHolder(view);
    }
    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        Picasso.get().load(Image[position]).into(holder.imageView);
        holder.nameText.setText(Name[position]);
        holder.priceText.setText(Price[position]);
    }

    @Override
    public int getItemCount() {
        return Name.length;
    }



    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView nameText,priceText;
        ImageView imageView;

        Button buttonAdd;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            nameText = itemView.findViewById(R.id.productName);
            priceText = itemView.findViewById(R.id.productPrice);
            buttonAdd = itemView.findViewById(R.id.buttonAdd);
            imageView = itemView.findViewById(R.id.imgp1);


            buttonAdd.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    int position = getAdapterPosition();
                    if (position != RecyclerView.NO_POSITION && itemClickListener != null) {
                        itemClickListener.onItemClick(Id[position]);
                    }
                }
            });

        }
    }
}

