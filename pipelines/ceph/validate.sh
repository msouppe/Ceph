#!/usr/bin/env bash
# [wf] execute validate.sh stage

function my_function(value1, value2)
{
    var resulting_string = "";

    if (value1 == ""){       
        resulting_string = "But who?";
    }
    
    else if ( value2 == "Wassup_value" ) {
        resulting_string = "Wassup " + value1;
    }
    
    else if ( value2 == "Shit_value" ) {       
        resulting_string = "Shit " + value1;
    }
    
    else if ( value2 == "You're mah fave_value" ) {
        resulting_string = "You're mah fave " + value1;
    }
    
    else if ( value2 == "You're cool" ) {
        resulting_string = "You're cool " + value1;
    }

    else {
        resulting_string = "ERROR HAS OCCURRED";
    }
    return resulting_string;
}