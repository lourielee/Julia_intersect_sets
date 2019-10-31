#ma
f1="/scratch/microarry_chIP/affy/GSE18990/sets/all_ma.txt"

#chip-bound
f2="/scratch/microarry_chIP/affy/GSE18990/sets/chIP_bound.txt"

#downreg_microarray(ma)
f3="scratch/microarry_chIP/affy/GSE18990/sets/downreg_ma.txt"

#CGI+
f4="scratch/microarry_chIP/cgi_sets/cgi_plus_list_mm9.txt"

#CGI-
f5="scratch/microarry_chIP/cgi_sets/cgi_minus_list_mm9.txt"


#Output Files:

out1="/scratch/microarry_chIP/affy/GSE18990/output/chIP_cgi_plus.txt"
out2="/scratch/microarry_chIP/affy/GSE18990/output/chIP_cgi_minus.txt"
out3="/scratch/microarry_chIP/affy/GSE18990/output/downreg_plus.txt"
out4="/scratch/microarry_chIP/affy/GSE18990/output/downreg_minus.txt"
out5="/scratch/microarry_chIP/affy/GSE18990/output/ma_plus.txt"
out6="/scratch/microarry_chIP/affy/GSE18990/output/ma_minus.txt"
out7="/scratch/microarry_chIP/affy/GSE18990/output/downplus_chIP.txt"
out8="/scratch/microarry_chIP/affy/GSE18990/output/downminus_chIP.txt"
out_summary="/scratch/microarry_chIP/affy/GSE18990/output/summary.txt"






function openwrite(file::IO)
         open( file, "w")
end

function readCSV(file)
         readcsv(file)
end

function defineSet(data::Array{Any,2})
         Set{(ASCIIString)}(data)
end

function intersection(s1::Set{(ASCIIString)}, s2::Set{(ASCIIString)})
dups = intersect(set1,set2)
for i in dups
    normalize_string(i; stripcc=true)
    write(outfile, i, "\n")
end

#writedlm(outfile, dups)




