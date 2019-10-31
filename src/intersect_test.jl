f1= "/scratch/microarry_chIP/affy/GSE18990/sets/al.txt"

f2="/scratch/microarry_chIP/affy/GSE18990/sets/outputlist.txt"


#outfiles:

out_sum = "/scratch/microarry_chIP/affy/GSE18990/output/GSE18990_summary.txt"

out_chIP_cgi_plus = "/scratch/microarry_chIP/affy/GSE18990/output/chIP_cgi_plus.txt"

out_chIP_cgi_minus = "/scratch/microarry_chIP/affy/GSE18990/output/chIP_cgi_minus.txt"

out_downreg_cgi_plus = "/scratch/microarry_chIP/affy/GSE18990/output/downreg_cgi_plus.txt"

out_downreg_cgi_minus = "/scratch/microarry_chIP/affy/GSE18990/output/downreg_cgi_minus.txt"

out_ma_cgi_plus = "/scratch/microarry_chIP/affy/GSE18990/output/all_ma_cgi_plus.txt"

out_ma_cgi_minus = "/scratch/microarry_chIP/affy/GSE18990/output/all_ma_cgi_minus.txt"

out_chIP_cgiplusdown = "/scratch/microarry_chIP/affy/GSE18990/output/chIP_cgiPlusDownreg.txt"

out_chIP_cgiminusdown = "/scratch/microarry_chIP/affy/GSE18990/output/chIP_cgiMinusDownreg.txt"

#data1 = readCSV(f1)
#data2 = readCSV(f2)


f = open(f1)
lines = readlines(f)
fnum = length(lines) 
infiles = Array(ASCIIString, fnum)

function populate(n, array::Array{ASCIIString})
	 while n > 0
	       s = string("file", n)
	       array[n] = s
	       num = num -1	 
	 end
end


function populate(n, array::Array{ASCIIString})
         while n > 0
               s = string("file", n)
               array[n] = s
               num = num -1
         end
end



populate(infiles, fnum)
 
for l in lines
    openwrite(l)
end

      	 


function openwrite(files::Array{Union(ASCIIString,UTF8String),1}, array::{ASCIIString})
	 i = 1
	 for k in files
	     array[i] = open(j, "w")
	     i += i
	 end
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
