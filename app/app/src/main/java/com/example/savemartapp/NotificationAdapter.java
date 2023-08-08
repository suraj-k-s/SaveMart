package com.example.savemartapp;

import android.content.Context;
import android.view.ViewGroup;
import androidx.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.TextView;

import androidx.annotation.NonNull;

import androidx.recyclerview.widget.RecyclerView;

public class NotificationAdapter extends RecyclerView.Adapter<NotificationAdapter.MyViewHolder> {

    private String  title[], content[], date[];
    private Context context;

    public NotificationAdapter(Context ct, String[] Title, String[] Date, String[] Content) {
        context = ct;
        title = Title;
        date = Date;
        content = Content;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.notification_layout, parent, false);
        return new MyViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {

        holder.TitleText.setText(title[position]);
        holder.DateText.setText(date[position]);
        holder.ContentText.setText(content[position]);

    }

    @Override
    public int getItemCount() {
        return content.length;
    }

    public class MyViewHolder extends RecyclerView.ViewHolder {

        TextView TitleText;
        TextView DateText;
        TextView ContentText;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);

            TitleText = itemView.findViewById(R.id.title);
            DateText = itemView.findViewById(R.id.date);
            ContentText = itemView.findViewById(R.id.content);

        }
    }
}