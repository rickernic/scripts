#!/bin/bash

#SBATCH --job-name="combine_files"                   # name of the job submitted
#SBATCH -p short                                        # name of the queue you are submitting to
#SBATCH -N 1                                            # number of nodes in this job
#SBATCH -n 40                                           # number of cores/tasks in this job, you get all 20 cores with 2 threads per core with hyperthreading
#SBATCH -t 24:00:00                                     # time allocated for this job hours:mins:seconds
#SBATCH --mail-user=rickernic@gmail.com              # enter your email address to receive emails
#SBATCH --mail-type=BEGIN,END,FAIL                      # will receive an email when job starts, ends or fails
#SBATCH -o "stdout.%j.%N"                               # standard out %j adds job number to outputfile name and %N adds the node name
#SBATCH -e "stderr.%j.%N"                               # optional but it prints our standard error

# ENTER COMMANDS HERE:

#started 27 April 2017 - thanks Jin for teaching me to swap out the names!

module load python_2
module load parallel

#for x in *L2-1_pe; do y=${x#*X1}; echo "python /software/apps/python_2/gcc/64/2.7.12/bin/interleave-reads.py $x ${x%L2*}L2-2_pe  > ${y%D7*}.combined.fq"; done > interleave-command.sh
cat interleave-command.sh | parallel

for x in *L2-1_se; do y=${x#*X1}; echo "cat $x ${x%L2*}L2-2_se > ${y%D7*}.singles.fq"; done > singles-command.sh
cat singles-command.sh | parallel

#End of file
