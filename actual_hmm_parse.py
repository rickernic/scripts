#hmm parsing program

file1=open("/Users/nicolericker/Documents/USDA/DARTE-QM/Resfams-full.hmm")


#checked using hmm_lines=file1.readlines()
#print(hmm_lines[0:5])
#result = ['HMMER3/b [3.0 | March 2010]\n', 'NAME\tAcetyltransf_4\n', 'ACC\tRF0013\n', 'DESC\tPF13420.1 Acetyltransferase (GNAT) domain [ARO:3000000]\n', 'LENG  155\n']

#note: we want the name to be the file name
#then we want everything from HMMER3 to // to be put in the file


temp = []
for line in file1:
    temp.append(line)
    if (line.rstrip("\n") == "//"):
            name=temp[1]
            split_name=name.split("\t")
            print(split_name)
            filename=split_name[1].rstrip("\n")
            output=open("/Users/nicolericker/Documents/USDA/DARTE-QM/ResFam_hmm/" + str(filename) + ".hmm", "w")
            for x in temp:
                output.write(x)
                temp=[]    
            output.close()
    
print("Finished!")
      

    


