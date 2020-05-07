constructGitClone ()
{
  input_file=$1
  destination_directory=$2
  
  #echo "[INFO] $(basename $0) - constructGitClone()"

  if [[ $input_file != *.csv ]]; then
    echo "[ERROR] Please ensure that the external input file is saved as *.csv file extension."
    exit 0
  fi
