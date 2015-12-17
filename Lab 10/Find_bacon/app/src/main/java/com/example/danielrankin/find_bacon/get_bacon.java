package com.example.danielrankin.find_bacon;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.TextView;

public class get_bacon extends AppCompatActivity {

    private String baconShop;
    private String baconShopURL;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_get_bacon);

        Intent intent = getIntent();
        baconShop = intent.getStringExtra("baconShop");
        baconShopURL = intent.getStringExtra("baconShopURL");



        TextView recommendText = (TextView) findViewById(R.id.textView3);
        TextView urlText = (TextView) findViewById(R.id.textView4);
        recommendText.setText("Eat bacon from " + baconShop);
        urlText.setText("Learn more at " + baconShopURL);

    }



    }


