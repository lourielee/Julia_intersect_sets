using DataFrames
#ma
f1="/scratch/microarry_chIP/affy/GSE45140/sets/all_ma.txt"

#chip-bound
f2="/scratch/microarry_chIP/affy/GSE45140/sets/chIP_bound.txt"

#downreg_microarray(ma)
f3="/scratch/microarry_chIP/affy/GSE45140/sets/upreg_ma.txt"

#CGI+
f4="/scratch/microarry_chIP/cgi_sets/cgi_plus_list_mm9_edit.txt"

#CGI-
f5="/scratch/microarry_chIP/cgi_sets/cgi_minus_list_mm9_edit.txt"


function openwrite(file)
         open( file, "w")
end

#Output Files:

out3=openwrite("/scratch/microarry_chIP/affy/GSE45140/output/upreg_plus.txt")
out4=openwrite("/scratch/microarry_chIP/affy/GSE45140/output/upreg_minus.txt")
out7=openwrite("/scratch/microarry_chIP/affy/GSE45140/output/upplus_chIP.txt")
out8=openwrite("/scratch/microarry_chIP/affy/GSE45140/output/upminus_chIP.txt")





data1 = readcsv(f1)
data2 = readcsv(f2)
data3 = readcsv(f3)
data4 = readcsv(f4)
data5 = readcsv(f5)

set1 = Set(data1)
set2 = Set(data2)
set3 = Set(data3)
set4 = Set(data4)
set5 = Set(data5)



chIP_plus = intersect(set2,set4)
chIP_minus = intersect(set2,set5)
up_plus = intersect(set3,set4)
up_minus = intersect(set3,set5)
ma_plus = intersect(set1,set4)
ma_minus = intersect(set1,set5)
upplus_chIP = intersect(up_plus,set2)
upminus_chIP = intersect(up_minus,set2)



print(length(chIP_plus), "\n")
print(length(chIP_minus), "\n")
print(length(up_plus), "\n")
print(length(up_minus), "\n")
print(length(ma_plus), "\n")
print(length(ma_minus), "\n")
print(length(upplus_chIP), "\n")
print(length(upminus_chIP), "\n")





for i in up_plus
    normalize_string(i; stripcc=true)
    write(out3, i, "\n")
end

#push!(values, length(down_plus)


for i in up_minus
    normalize_string(i; stripcc=true)
    write(out4, i, "\n")
end



#push!(values, length(ma_minus)

for i in upplus_chIP
    normalize_string(i; stripcc=true)
    write(out7, i, "\n")
end

#push!(values, length(downplus_chIP))

for i in upminus_chIP
    normalize_string(i; stripcc=true)
    write(out8, i, "\n")
end



#notes, extra, test vals, etc
#print((length(chIP_plus)),"\n", (typeof(s)), "\n")
#write(out_summary, "chIP/CGI+ ", (length(chIP_plus)::Int64), "\n", "chIP/CGI- ", (length(chIP_minus)::Int64), "\n", 
#"MA-downreg/CGI+ ", (length(down_plus)::Int64), "\n", "MA-downreg/CGI- ", (length(down_minus)::Int64), "\n", 
#"MA/CGI+ ", (length(ma_plus)::Int64), "\n", "MA/CGI- ", (length(ma_minus)::Int64), "\n", "MAdown_CGI+/chIP ",
#(length(downplus_chIP)::Int64), "\n", "MAdown_CGI-/chIP ", (length(downminus_chIP)::Int64), "\n") 


#this prints tabs for each character:
#writedlm(out1, chIP_plus)






