package com.example.danielrankin.bacon_fortune;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ToggleButton;

public class SMainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

    }

    public void findSizzle(View view) {
        //textView
        TextView baconFeeling = (TextView) findViewById(R.id.textView2);

        //spinner
        Spinner cookSpinner = (Spinner) findViewById(R.id.spinner);
        String cookValue = String.valueOf(cookSpinner.getSelectedItem());

        //editText
        EditText name = (EditText) findViewById(R.id.editText);
        String nameValue = name.getText().toString();

        //toggle button
        ToggleButton toggle = (ToggleButton) findViewById(R.id.togglebutton);
        boolean mood = toggle.isChecked();
        String moodString;
        if(mood) {
            moodString = "fat";
        }
        else {
            moodString="sassy";
        }

        //check boxes
        String checkbox_string = "";
        CheckBox check1 = (CheckBox) findViewById(R.id.checkBox);
        boolean checked1 = check1.isChecked();
        if(checked1){
            checkbox_string += " woodsmoked";
        }

        CheckBox check2 = (CheckBox) findViewById(R.id.checkBox2);
        boolean checked2 = check2.isChecked();
        if(checked2){
            checkbox_string += " black pepper";
        }

        CheckBox check3 = (CheckBox) findViewById(R.id.checkBox3);
        boolean checked3 = check3.isChecked();
        if(checked3){
            checkbox_string += " uncured";
        }



        //set text in textView
        baconFeeling.setText(nameValue + " is a " + moodString + " person" + " that eats " + cookValue + checkbox_string + " bacon");



    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
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
