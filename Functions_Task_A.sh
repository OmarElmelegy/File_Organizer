function CreateDirectories () {
    declare FirstChar
    declare Extension
    declare FolderPath
    FolderPath=$1

    # Searching in the current directory
    for File in $FolderPath/*; do
        if [ -d "$File" ]; then
            continue
        fi

        File_Name=$(basename $File)
        FirstChar="${File_Name:0:1}"
        File_Name_No_Ext="${File_Name%.*}"
        
        if [[ "$FirstChar" == "."  || "$File_Name" == "$File_Name_No_Ext" ]]; then
            continue
        fi 
        Extension="${File##*.}"
        if [ -d "$Extension" ]; then
            continue;
        fi
        
        mkdir -p "$FolderPath/$Extension"
    done
    return 0
}


SortIntoDirectories() {
    declare FolderPath
    FolderPath=$1

    declare -a my_array=(
    "element1"
     "element2"
      "element3"
       "element4"
        "element5"
         "element6"
          "element7"
           "element8"
            "element9"
             "element10"
    )
    
    declare -i counter=0
    for directory in "$FolderPath"/*; do
        if [[ -d "$directory" && ! -L "$directory" ]]; then
            
            my_array[$counter]="$directory"
            (( counter++ ))
        fi
    done
    
    
    for File in $FolderPath/*; do
        Extension="${File##*.}"
        if [ -d "$File" ]; then
            continue
        fi
        
        for (( num=0; num<=9; num++ )); do
                if [[ "$FolderPath/$Extension" == "${my_array[$num]}" ]]; then
                    # Move file to directory
                    mv "$File" "${my_array[$num]}/"
                    echo "Moved "$File" to "${my_array[$num]}/" "
                    break  # Exit the loop once a match is found
                fi
        done
    done

    Extension="Misc"
    for File in $FolderPath/*; do
        if [[ -f "$File" ]]; then
            mkdir -p "$FolderPath/$Extension"
            mv "$File" "$FolderPath/$Extension"
        fi
    done
    mv $FolderPath/.[!.]* $FolderPath/Misc 2>/dev/null
    return 0
}