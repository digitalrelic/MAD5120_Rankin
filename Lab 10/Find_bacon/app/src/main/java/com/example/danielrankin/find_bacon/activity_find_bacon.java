package com.example.danielrankin.find_bacon;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.Spinner;

public class activity_find_bacon extends AppCompatActivity {


    private BaconShop myBaconShop = new BaconShop();

    public void findBacon(View view) {
        Spinner crowdSpinner = (Spinner) findViewById(R.id.spinner);
        String crowd = String.valueOf(crowdSpinner.getSelectedItem());
        myBaconShop.setBaconShop(crowd);
        String suggestedBaconShop = myBaconShop.getBaconShop();
        String suggestedBaconShopURL = myBaconShop.getBaconShopURL();
        System.out.println(suggestedBaconShop);
        System.out.println(suggestedBaconShopURL);

        Intent intent = new Intent(this, get_bacon.class);

        intent.putExtra("baconShop", suggestedBaconShop);
        intent.putExtra("baconShopURL", suggestedBaconShopURL);
        startActivity(intent);



    }




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_activity_find_bacon);



    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_activity_find_bacon, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
