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

public class ScanCartAdapter extends RecyclerView.Adapter<ScanCartAdapter.MyViewHolder>{

        private String Name[], Price[], Image[], Id[], Qty[];
        private Context context;

    private TextView grandTotalTextView;

    public double calculateGrandTotal() {
        double grandTotal = 0;
        for (int i = 0; i < Qty.length; i++) {
            int quantity = Integer.parseInt(Qty[i]);
            double price = Double.parseDouble(Price[i]);
            double itemTotal = quantity * price;
            grandTotal += itemTotal;
        }
        return grandTotal;
    }

    private QuantityUpdateListener quantityUpdateListener;
    private ItemDeleteListener itemDeleteListener;

        public ScanCartAdapter(Context ct, String name[], String price[],String image[],String id[],String qty[],QuantityUpdateListener listener, ItemDeleteListener deleteListener,TextView grandTotalTextView) {
            context = ct;
            Name = name;
            Price= price;
            Image = image;
            Id = id;
            Qty = qty;
            quantityUpdateListener = listener;
            itemDeleteListener = deleteListener;
            this.grandTotalTextView = grandTotalTextView;

        }

        @NonNull
        @Override
        public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            LayoutInflater inflater = LayoutInflater.from(context);
            View view = inflater.inflate(R.layout.scan_cart_layout, parent, false);
            return new MyViewHolder(view);
        }
        @Override
        public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
            Picasso.get().load(Image[position]).into(holder.imageView);
            holder.nameText.setText(Name[position]);
            holder.priceText.setText(Price[position]);
            holder.qtyText.setText(Qty[position]);

            // Calculate the total price and display it
            int quantity = Integer.parseInt(Qty[position]);
            double price = Double.parseDouble(Price[position]);
            double totalPrice = quantity * price;
            holder.totalPrice.setText(String.format("%.2f", totalPrice)); // Display total price with two decimal places
        }

        @Override
        public int getItemCount() {
            return Name.length;
        }



    public class MyViewHolder extends RecyclerView.ViewHolder {
            TextView nameText,priceText,qtyText,totalPrice;
            ImageView imageView;

            ImageView deleteButton;
            Button decrementButton,incrementButton;

            public MyViewHolder(@NonNull View itemView) {
                super(itemView);
                nameText = itemView.findViewById(R.id.productName);
                priceText = itemView.findViewById(R.id.productPrice);
                totalPrice = itemView.findViewById(R.id.productRePrice);
                imageView = itemView.findViewById(R.id.productImage);
                deleteButton = itemView.findViewById(R.id.productDelete);
                decrementButton = itemView.findViewById(R.id.decrement);
                incrementButton = itemView.findViewById(R.id.increment);
                qtyText = itemView.findViewById(R.id.displayQty);

                decrementButton.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (position != RecyclerView.NO_POSITION) {
                            int quantity = Integer.parseInt(Qty[position]);
                            if (quantity > 1) {
                                quantity--;
                                Qty[position] = String.valueOf(quantity);
                                notifyDataSetChanged();
                                if (quantityUpdateListener != null) {
                                    quantityUpdateListener.onQuantityUpdated(Id[position], String.valueOf(quantity));
                                }
                                updateGrandTotal();
                            }
                        }
                    }
                });

                deleteButton.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (position != RecyclerView.NO_POSITION) {
                            String itemId = Id[position];
                            if (itemDeleteListener != null) {
                                itemDeleteListener.onItemDeleted(itemId);
                            }
                            updateGrandTotal();
                        }
                    }
                });



                incrementButton.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (position != RecyclerView.NO_POSITION) {
                            int quantity = Integer.parseInt(Qty[position]);
                            quantity++;
                            Qty[position] = String.valueOf(quantity);
                            notifyDataSetChanged();
                            if (quantityUpdateListener != null) {
                                quantityUpdateListener.onQuantityUpdated(Id[position], String.valueOf(quantity));
                            }
                            updateGrandTotal();
                        }
                    }
                });
            }
        }

    public interface QuantityUpdateListener {
        void onQuantityUpdated(String itemId, String newQuantity);
    }
    public interface ItemDeleteListener {
        void onItemDeleted(String itemId);
    }
    private void updateGrandTotal() {
        double grandTotal = calculateGrandTotal();
        grandTotalTextView.setText(String.format("%.2f", grandTotal));
    }
    }

