#trim names


file5=open("/Users/nicolericker/Documents/DARTE-QM/meta_subB2_top100_IDs.txt")
file6=open("/Users/nicolericker/Documents/DARTE-QM/meta_subB2_top100_IDs_fixed.txt","w")

for line in file5:
    append_name=line.replace("\n", ".1" + "\n")
    #ID=no_funnel + "\n"
    file6.write(append_name)

file6.close()

    
