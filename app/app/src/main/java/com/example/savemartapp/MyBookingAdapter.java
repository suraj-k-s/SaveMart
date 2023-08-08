package com.example.savemartapp;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;

import org.w3c.dom.Text;

public class MyBookingAdapter extends RecyclerView.Adapter<MyBookingAdapter.MyViewHolder> {

    private String Id[],Date[],Amount[],Address[],Pdate[],Time[],Slot[],Mode[];
    private Context context;

    public MyBookingAdapter(Context ct, String id[],String date[],String amount[],String address[],String pdate[],String time[],String slot[],String mode[]) {
        context = ct;
        Id = id;
        Date = date;
        Amount = amount;
        Address = address;
        Pdate = pdate;
        Time = time;
        Slot = slot;
        Mode = mode;

    }
    @NonNull
    @Override
    public MyBookingAdapter.MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.my_booking_layout, parent, false);
        return new MyBookingAdapter.MyViewHolder(view);
    }
    @Override
    public void onBindViewHolder(@NonNull MyBookingAdapter.MyViewHolder holder, int position) {


        holder.idText.setText(Id[position]);

        holder.dateText.setText(Date[position]);
        holder.pdateText.setText(Pdate[position]);
        holder.timeText.setText(Time[position]);
        holder.slotText.setText(Slot[position]);
        holder.addressText.setText(Address[position]);
        holder.amountText.setText(Amount[position]);

        if(Mode[position].equals("0"))
        {
            holder.modeText.setText("Scan & Book");
            holder.LayoutPdate.setVisibility(View.GONE);
            holder.LayoutAddress.setVisibility(View.GONE);
            holder.LayoutSlot.setVisibility(View.GONE);
            holder.LayoutTime.setVisibility(View.GONE);

        }
        else if(Mode[position].equals("Home Delivery"))
        {
            holder.modeText.setText("Home Delivery");
            holder.LayoutPdate.setVisibility(View.GONE);
            holder.LayoutSlot.setVisibility(View.GONE);
            holder.LayoutTime.setVisibility(View.GONE);
        }
        else if(Mode[position].equals("Pick-up"))
        {
            holder.modeText.setText("Pick-up");
            holder.LayoutAddress.setVisibility(View.GONE);
        }

        holder.viewButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(context, MyOrders.class);
                intent.putExtra("BOOKING_ID", Id[position]);
                context.startActivity(intent);
            }
        });



    }

    @Override
    public int getItemCount() {
        return Id.length;
    }
    public class MyViewHolder extends RecyclerView.ViewHolder {

        TextView idText,dateText,amountText,addressText,pdateText,timeText,slotText,modeText;
        Button viewButton;

        LinearLayout LayoutPdate,LayoutTime,LayoutSlot,LayoutAddress;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            idText = itemView.findViewById(R.id.bookingID);
            dateText = itemView.findViewById(R.id.bookingDate);
            amountText = itemView.findViewById(R.id.bookingAmount);
            addressText = itemView.findViewById(R.id.bookingAddress);
            pdateText = itemView.findViewById(R.id.bookingPdate);
            timeText = itemView.findViewById(R.id.bookingTime);
            slotText = itemView.findViewById(R.id.bookingSlot);
            modeText = itemView.findViewById(R.id.bookingMode);
            viewButton = itemView.findViewById(R.id.bookingView);


            LayoutPdate = itemView.findViewById(R.id.layoutPdate);
            LayoutTime = itemView.findViewById(R.id.layoutTime);
            LayoutSlot = itemView.findViewById(R.id.layoutSlot);
            LayoutAddress = itemView.findViewById(R.id.layoutAddress);




        }
    }


}
