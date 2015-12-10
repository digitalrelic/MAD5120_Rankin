package com.example.danielrankin.rankin_final;

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

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);


    }

    public void makePizza(View view) {
        TextView pizzaOutput = (TextView) findViewById(R.id.textView2);

        Spinner sizeSpinner = (Spinner) findViewById(R.id.spinner);
        String sizeValue = String.valueOf(sizeSpinner.getSelectedItem());

        EditText name = (EditText) findViewById(R.id.editText);
        String nameValue = name.getText().toString();

        //toggle button
        ToggleButton toggle = (ToggleButton) findViewById(R.id.toggleButton);
        boolean sauce = toggle.isChecked();
        String sauceString;
        if(sauce) {
            sauceString = " red sauce";
        }
        else {
            sauceString=" white sauce";
        }

        //check boxes
        String checkbox_string = "";
        CheckBox check1 = (CheckBox) findViewById(R.id.checkBox);
        boolean checked1 = check1.isChecked();
        if(checked1){
            checkbox_string += " bacon,";
        }

        CheckBox check2 = (CheckBox) findViewById(R.id.checkBox2);
        boolean checked2 = check2.isChecked();
        if(checked2){
            checkbox_string += " Canadian bacon,";
        }

        CheckBox check3 = (CheckBox) findViewById(R.id.checkBox3);
        boolean checked3 = check3.isChecked();
        if(checked3){
            checkbox_string += " lamb bacon,";
        }

        CheckBox check4 = (CheckBox) findViewById(R.id.checkBox4);
        boolean checked4 = check4.isChecked();
        if(checked4){
            checkbox_string += " turkey bacon,";
        }


        //radio buttons
        RadioGroup crust = (RadioGroup) findViewById(R.id.crusttype);
        String crusttype;
        int crust_id = crust.getCheckedRadioButtonId();
        switch(crust_id){
            case -1:
                crusttype="hand-tossed";
                break;
            case R.id.radioButton:
                crusttype="thin";
                break;
            case R.id.radioButton2:
                crusttype="thick";
                break;
            default:
                crusttype="hand-tossed";
        }

        //switch
        Switch gluten = (Switch) findViewById(R.id.switch1);
        String glutenString = "";
        boolean glutenSwitch = gluten.isChecked();
        if(glutenSwitch) {
            glutenString = "gluten-free";
        }else{
            glutenString = "";
        }

        pizzaOutput.setText(nameValue + " is a " + sizeValue + " " + crusttype + " crust " + glutenString + " pizza with" + sauceString + ", cheese, " + checkbox_string);

        ImageView pizzaPic = (ImageView)findViewById(R.id.imageView);
        int image;
            if (sizeValue.equals("small")) {
                image = R.drawable.pizza_cheese;
            } else if (sizeValue.equals("medium")) {
                image = R.drawable.pizza_meat;
            } else if (sizeValue.equals("large")) {
                image = R.drawable.pizza_supreme;
            } else if (sizeValue.equals("monster")) {
                image = R.drawable.pizza_veggie;
            } else image = R.drawable.pizza_cheese;
            pizzaPic.setImageResource(image);




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
