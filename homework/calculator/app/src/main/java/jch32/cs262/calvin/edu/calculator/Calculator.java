package jch32.cs262.calvin.edu.calculator;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

public class Calculator extends AppCompatActivity {

    private EditText    value1ET;
    private EditText    value2ET;
    private Spinner     operator_spinner;
    private TextView    final_valueTV;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calculator);
        Spinner spinner = findViewById(R.id.spinner);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this, R.array.operators, android.R.layout.simple_spinner_item);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);
        value1ET = findViewById(R.id.value_1_entry);
        value2ET = findViewById(R.id.value_2_entry);
        final_valueTV = findViewById(R.id.final_value_view);
        operator_spinner = spinner;
    }

    public void calculate(View view) {

        String value1 = value1ET.getText().toString();
        String value2 = value2ET.getText().toString();
        String op = operator_spinner.getSelectedItem().toString();
        String error = "Error";

        double show = -1.0;

        double val1 = Double.parseDouble(value1);
        double val2 = Double.parseDouble(value2);

        if (op.equals("+")) {
            show = (val1 + val2);
        } else {
            if (op.equals("-")) {
                show = (val1 - val2);
            } else {
                if (op.equals("*")) {
                    show = (val1 * val2);
                } else {
                    if (op.equals("/")) {
                        if (val2 == 0) {
                            final_valueTV.setText(error);
                        } else {
                            show = (val1 / val2);
                        }
                    }
                }
            }
        }
        final_valueTV.setText(Double.toString(show));
    }
}
