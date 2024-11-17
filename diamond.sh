#!/bin/bash

# Function to print the diamond
print_diamond() {
    letter=$1   # assigns the first input argument
    rows=$(( $(printf "%d" "'$letter") - $(printf "%d" "'A") + 1 )) # rows = ASCII value of letter - A + 1
    
    # Upper part of the diamond (including the middle row)
    for ((i=0; i<rows; i++)); do
        spaces=$((rows - i - 1))
        char=$(printf "\\$(printf "%o" $((65 + i)))") # Convert to corresponding letter
        
        printf "%*s" $((spaces + 1)) # Print leading spaces
        
        if ((i == 0)); then
            echo "$char"
        else
            printf "%s" "$char"
            inner_spaces=$((2 * i - 1))
            printf "%*s" $inner_spaces ""
            echo "$char"
        fi
    done

    # Lower part of the diamond
    for ((i=rows-2; i>=0; i--)); do
        spaces=$((rows - i - 1))
        char=$(printf "\\$(printf "%o" $((65 + i)))") # Convert to corresponding letter
        
        printf "%*s" $((spaces + 1)) # Print leading spaces
        
        if ((i == 0)); then
            echo "$char"
        else
            printf "%s" "$char"
            inner_spaces=$((2 * i - 1))
            printf "%*s" $inner_spaces ""
            echo "$char"
        fi
    done
}

# Read input letter from the user
read -p "Enter a letter (A-Z): " input_letter
print_diamond "$input_letter"

