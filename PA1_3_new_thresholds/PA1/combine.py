import os, sys
import pandas as pd

def get_files(data_path) -> None:
    total_csv = []
    for path, dirnames, filenames in os.walk(data_path):
        for file in filenames:
            if file.endswith(".csv"):
                total_csv.append(os.path.join(path, file))

    return sorted(total_csv)


def process_files(predicted_data_files):
    # print(f"Number of files: {len(predicted_data_files)}")
    PA3_final_all = []        
    for predicted_file in predicted_data_files:
    
        try:
            # some files do not have data or header row.
            PA3_csv = pd.read_csv(predicted_file)
            PA3_final_all.append(PA3_csv)
        
        except pd.errors.EmptyDataError:
            print(f"{predicted_file} has been skipped because header row was not there/ file empty.")
            
    return pd.concat(PA3_final_all)
    

def main(args):
    # python /home/kapmcgil/projects/def-hiroshi/kapmcgil/symlink_projects_beluga/kapmcgil/RASEbiostat/PA1_3_new_thresholds/PA1/job_outputs/data
    assert os.path.isdir(args[1])
    predicted_data_files = get_files(args[1])
    PA1_combined_df = process_files(predicted_data_files)
    PA1_combined_df.to_csv("PA1_combined_df.csv")
    
if __name__ == "__main__":
    args = sys.argv
    main(args)
    
