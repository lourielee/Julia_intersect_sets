using DataFrames
#ma
f1="/scratch/microarry_chIP/affy/GSE45140/sets/all_ma.txt"

#chip-bound
f2="/scratch/microarry_chIP/affy/GSE45140/sets/chIP_bound.txt"

#downreg_microarray(ma)
f3="/scratch/microarry_chIP/affy/GSE45140/sets/downreg_ma.txt"

#CGI+
f4="/scratch/microarry_chIP/cgi_sets/cgi_plus_list_mm9_edit.txt"

#CGI-
f5="/scratch/microarry_chIP/cgi_sets/cgi_minus_list_mm9_edit.txt"


function openwrite(file)
         open( file, "w")
end

#Output Files:

out1=openwrite("/scratch/microarry_chIP/affy/GSE45140/output/chIP_cgi_plus.txt")
out2=openwrite("/scratch/microarry_chIP/affy/GSE45140/output/chIP_cgi_minus.txt")
out3=openwrite("/scratch/microarry_chIP/affy/GSE45140/output/downreg_plus.txt")
out4=openwrite("/scratch/microarry_chIP/affy/GSE45140/output/downreg_minus.txt")
out5=openwrite("/scratch/microarry_chIP/affy/GSE45140/output/ma_plus.txt")
out6=openwrite("/scratch/microarry_chIP/affy/GSE45140/output/ma_minus.txt")
out7=openwrite("/scratch/microarry_chIP/affy/GSE45140/output/downplus_chIP.txt")
out8=openwrite("/scratch/microarry_chIP/affy/GSE45140/output/downminus_chIP.txt")
out_summary=openwrite("/scratch/microarry_chIP/affy/GSE45140/output/summary.txt")




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
down_plus = intersect(set3,set4)
down_minus = intersect(set3,set5)
ma_plus = intersect(set1,set4)
ma_minus = intersect(set1,set5)
downplus_chIP = intersect(down_plus,set2)
downminus_chIP = intersect(down_minus,set2)



print(length(chIP_plus), "\n")
print(length(chIP_minus), "\n")
print(length(down_plus), "\n")
print(length(down_minus), "\n")
print(length(ma_plus), "\n")
print(length(ma_minus), "\n")
print(length(downplus_chIP), "\n")
print(length(downminus_chIP), "\n")



for i in chIP_plus
    normalize_string(i; stripcc=true)
    write(out1, i, "\n")
end



for i in chIP_minus
    normalize_string(i; stripcc=true)
    write(out2, i, "\n")
end



for i in down_plus
    normalize_string(i; stripcc=true)
    write(out3, i, "\n")
end



for i in down_minus
    normalize_string(i; stripcc=true)
    write(out4, i, "\n")
end



for i in ma_plus
    normalize_string(i; stripcc=true)
    write(out5, i, "\n")
end



for i in ma_minus
    normalize_string(i; stripcc=true)
    write(out6, i, "\n")
end



for i in downplus_chIP
    normalize_string(i; stripcc=true)
    write(out7, i, "\n")
end



for i in downminus_chIP
    normalize_string(i; stripcc=true)
    write(out8, i, "\n")
end



for i in values
    write(out_summary, i, "\n")
end











