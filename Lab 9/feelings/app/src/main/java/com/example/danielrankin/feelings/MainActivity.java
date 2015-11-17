package com.example.danielrankin.feelings;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {
    public void findMood(View view) {
        TextView feeling = (TextView) findViewById(R.id.feelingText);
        Spinner moodSpinner = (Spinner) findViewById(R.id.spinner);
        String moodValue = String.valueOf(moodSpinner.getSelectedItem());


        EditText name = (EditText) findViewById(R.id.name_editText);
        String nameValue = name.getText().toString();



        //toggle Button
        ToggleButton toggle = (ToggleButton) findViewById(R.id.energyToggle);
        boolean energy = toggle.isChecked();
        String energyString;
        if (energy) {
            energyString = "positive";
        }else{
            energyString="negative";
        }

        //update Text View
        feeling.setText(nameValue + " is a" + energyString + " person");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }
}
