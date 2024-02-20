#!/bin/bash

original_dir=$(pwd)

if [ $# -eq 0 ]; then
    echo "Usage: $0 <folder_path>"
    exit 1
fi

folder_path="$1"
excel_script_path="/mnt/nfs/incisive2/CERTH-curation/excel_anonymization/Anonymazation_Excel_Data"
dicom_script_path=""
ids_script_path=""

# Check if a virtual environment should be activated
if [ "$2" == "--venv" ]; then
    source venv/bin/activate
fi 

# Run the excel anonymazation script
cd "$excel_script_path" || exit
python3 "$excel_script_path/anonymize.py" $folder_path
cd "$original_dir" || exit

# # Check the exit status of the first script
# if [ $? -eq 0 ]; then
#     # Run the second Python script if the first one succeeded
#     python3 "$folder_path/anon_image.py" "$folder_path"

#     # Check the exit status of the second script
#     if [ $? -eq 0 ]; then
#         # Run the third Python script if the second one succeeded
#         python3 "$folder_path/script3.py" "$folder_path"
#     else
#         echo "Error: script2.py failed"
#     fi
# else
#     echo "Error: script1.py failed"
# fi

if [ "$2" == "--venv" ]; then
    deactivate
fi
