package com.example.savemartapp;

import android.annotation.SuppressLint;
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

public class CategoryAdapter extends RecyclerView.Adapter<CategoryAdapter.MyViewHolder>{

    private String Name[], Image[], Id[];
    private Context context;

    public interface OnItemClickListener {
        void onItemClick(String id);
    }


    private OnItemClickListener itemClickListener;



    public CategoryAdapter(Context ct, String name[], String image[],String id[]) {
        context = ct;
        Name = name;
        Image = image;
        Id = id;

    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.category_layout, parent, false);
        return new MyViewHolder(view);
    }
    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder,int position) {
        Picasso.get().load(Image[position]).into(holder.imageView);
        holder.nameText.setText(Name[position]);
        // Set click listener on the item view
        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (itemClickListener != null) {
                    itemClickListener.onItemClick(Id[position]);
                }
            }
        });
    }

    @Override
    public int getItemCount() {
        return Name.length;
    }


    // Method to set the click listener for the adapter
    public void setOnItemClickListener(OnItemClickListener listener) {
        this.itemClickListener = listener;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {
        TextView nameText;
        ImageView imageView;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            nameText = itemView.findViewById(R.id.textFn);
            imageView = itemView.findViewById(R.id.imageFn);

        }
    }
}

