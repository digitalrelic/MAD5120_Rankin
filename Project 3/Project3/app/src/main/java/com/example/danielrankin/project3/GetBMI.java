package com.example.danielrankin.project3;

import android.content.Intent;
import android.os.Bundle;
import android.provider.MediaStore;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.RadioGroup;
import android.widget.TextView;

import java.text.DecimalFormat;

public class GetBMI extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_get_bmi);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
    }

    public void calcBMI(View view) {

        //output text
        TextView showBMI = (TextView) findViewById(R.id.bmiText);
        TextView showRec = (TextView) findViewById(R.id.baconrecommendation);



        //check for metric length conversion
        RadioGroup heightUnits = (RadioGroup) findViewById(R.id.radioGroup2);
        int heightID = heightUnits.getCheckedRadioButtonId();
        double heightMultiplier;
        switch (heightID) {
            case -1:
                heightMultiplier = 0.01;
                break;
            case R.id.cm:
                heightMultiplier = 0.01;
                break;
            case R.id.inches:
                heightMultiplier = 0.0254;
                break;
            default:
                heightMultiplier = 0.01;
        }
        //check for metric mass conversion
        RadioGroup weightUnits = (RadioGroup) findViewById(R.id.radioGroup);
        int weightID = weightUnits.getCheckedRadioButtonId();
        double weightMultiplier;
        switch (weightID) {
            case -1:
                weightMultiplier = 1;
                break;
            case R.id.kilos:
                weightMultiplier = 1;
                break;
            case R.id.pounds:
                weightMultiplier = 0.45;
                break;
            default:
                weightMultiplier = 0.45;
        }


        //height
        EditText heightText = (EditText) findViewById(R.id.editHeight);
        float heightValue = Float.valueOf(heightText.getText().toString());
        double convertedHeightValue = heightValue * heightMultiplier;

        //weight
        EditText weightText = (EditText) findViewById(R.id.editWeight);
        float weightValue = Float.valueOf(weightText.getText().toString());
        double convertedWeightValue = weightValue * weightMultiplier;

        //calculate BMI
        double BMI = convertedWeightValue / (convertedHeightValue * convertedHeightValue);
        int i = (int) Math.round(BMI);


        //categorize BMI output and set image
        ImageView baconPicture = (ImageView) findViewById(R.id.imageView);
        String catString = "";
        String baconRec = "";
        int image;
        if (i <= 18) {
            catString = "Underweight";
            image = R.drawable.image01;
            baconRec = "Eat more bacon!";

        } else if (i >= 19 && i <= 24) {
            catString = "Healthy";
            image = R.drawable.image02;
            baconRec = "Keep eating bacon!";

        } else if (i >= 25 && i <= 29) {
            catString = "Overweight";
            image = R.drawable.image03;
            baconRec = "Maybe chill on the bacon.";

        } else if (i >= 30 && i <= 39) {
            catString = "Obese";
            image = R.drawable.image04;
            baconRec = "Put down the bacon.";

        } else if (i >= 40) {
            catString = "Morbidly Obese";
            image = R.drawable.image05;
            baconRec = "Don't even think about bacon.";

        } else image = R.drawable.image01;
        baconPicture.setImageResource(image);



        //prepare for display
        String BMIOutput = Integer.toString(i);
        showBMI.setText("Your BMI is " + BMIOutput + ". You are considered " + catString + ".");
        showRec.setText(baconRec);

        /* debug area
       String heightOutputTest = Double.toString(convertedHeightValue);
       String weightOutputTest = Double.toString(convertedWeightValue);
       showBMI.setText(BMIOutput + " " + weightOutputTest + " " + heightOutputTest);
        end debug area */

    }

    public void showInfo(View view){

        Intent intent = new Intent(this, showInformation_.class);
        startActivity(intent);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_get_bmi, menu);
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
