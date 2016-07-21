#path
path <- "/Users/fatimahe/Documents/Research/Epira/Lab/"

########################## CD4 naive  ################################# 
########################## NanoDrop
Tot_NanoDrop_CD4naive <- read.table(paste(path, "Extraction/NanoDrop_totalRNA/NanoDrop_CD4naive.csv",
                                          sep=""), dec=",", header = T, sep=";",
                                    stringsAsFactors = T)
#Plot samples to see which of the samples do not have proper 260/280 
#NanoDrop values
# The width and height are by default in inches in R. For getting cm, take cm and
#divide by 2.54
path2 <- "/Users/fatimahe/Documents/Research/Epira/Lab/Extraction/Overview_analysis_in_R/Output_from_R_scripts/"
pdf(paste(path2, "Output_overview_extraction/CD4naive/CD4naiveNanoDrop.pdf", sep=""),
    width = 29/2.54, height= 19/2.54)
plot(Tot_NanoDrop_CD4naive$X260_280 ~ 
       row.names(Tot_NanoDrop_CD4naive), xlab= "SampleID", ylab= "260/280", 
     main= "CD4naive NanoDrop")

#Color sample dots if they are above or below a specific threshold
points(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$X260_280< 1.85] ~ 
         row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$X260_280< 1.85],
       col= 2, pch= 20)
points(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$X260_280> 2.2] ~ 
         row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$X260_280> 2.2],
       col= 2, pch= 20)
#Color samples green that have a concentration of less than 20ng/ul
points(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$ng_ul<20] ~ 
         row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$ng_ul<20],
       col= 3, pch= 20)

##Sample names
# Sample names for Samples with 260/280 values below 1.85
#text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$X260_280< 1.85] ~ 
#  row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$X260_280< 1.85],
#  labels= Tot_NanoDrop_CD4naive$SampleID[Tot_NanoDrop_CD4naive$X260_280< 1.85],
#col= 2, cex= 0.7, pos= 1)

# Sample names for Samples with 260/280 values above 2.2
text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$X260_280> 2.2] ~ 
       row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$X260_280> 2.2],
     labels= Tot_NanoDrop_CD4naive$SampleID[Tot_NanoDrop_CD4naive$X260_280> 2.2],
     col= 2, cex= 0.7, pos= 1)

# Sample names for Samples concentration less than 20ng/ul
text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$ng_ul< 20] ~ 
       row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$ng_ul< 20],
     labels= Tot_NanoDrop_CD4naive$SampleID[Tot_NanoDrop_CD4naive$ng_ul< 20],
     col= 2, cex= 0.7, pos= 1)
# Sample names for specific samples
# Sample which has a 260/280 < 1.85 but conc >20ng/ul
text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$X260_280== 1.62] ~ 
       row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$X260_280== 1.62],
     labels= Tot_NanoDrop_CD4naive$SampleID[Tot_NanoDrop_CD4naive$X260_280== 1.62],
     col= 2, cex= 0.7, pos= 1)

## Specific 260/280 values
# 260/280 values for samples with 268/280 values below 1.85
text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$X260_280< 1.85] ~ 
       row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$X260_280< 1.85],
     labels= Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$X260_280< 1.85],
     col= 4, cex= 0.7, pos= 3)

text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$ng_ul== 6.41] ~ 
       row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$ng_ul== 6.41],
     labels= Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$ng_ul== 6.41],
     col= 4, cex= 0.7, pos= 3)
text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$ng_ul== 11.34] ~ 
       row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$ng_ul== 11.34],
     labels= Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$ng_ul== 11.34],
     col= 4, cex= 0.7, pos= 3)

## Concentration for specific samples
# concentration in ng/ul for samples with 260/280 below 1.85
#text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$X260_280< 1.85] ~ 
#       row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$X260_280< 1.85],
#     labels= Tot_NanoDrop_CD4naive$ng_ul[Tot_NanoDrop_CD4naive$X260_280< 1.85],
#     col= 3, cex= 0.7, pos= 2)

# Concentration for samples with Samples concentration less than 20ng/ul
text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$ng_ul< 20] ~ 
       row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$ng_ul< 20],
     labels= Tot_NanoDrop_CD4naive$ng_ul[Tot_NanoDrop_CD4naive$ng_ul< 20],
     col= 3, cex= 0.7, pos= 2)
# Concentration for sample RA5105_B(28_4)
text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$X260_280== 1.62] ~ 
       row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$X260_280== 1.62],
     labels= Tot_NanoDrop_CD4naive$ng_ul[Tot_NanoDrop_CD4naive$X260_280== 1.62],
     col= 3, cex= 0.7, pos= 2)

#legend
legend("topleft", legend= c("Sample with 260/280 < 1.85",
                            "Sample with 260/280 < 1.85 and concentration < 20ng/ul",
                            "260/280 value",
                            "Concentration in ng/ul",
                            "SampleID"), 
       pch= c(20, 20, NA, NA, NA), lty= c(NA, NA, 1, 1,1), 
       col= c(2,3,4,3,2), cex= 0.9, bty= "n", 
       pt.cex= 1.2, x.intersp= 0.5, y.intersp= 0.7 )
dev.off()

#nrow(Tot_NanoDrop_CD4naive)
#Get an overview of the samples included in dataframe (get an indication of
#samples that are missing)
sort(Tot_NanoDrop_CD4naive$SampleID)



########################## 260/280 vs conc
path2 <- "/Users/fatimahe/Documents/Research/Epira/Lab/Extraction/Overview_analysis_in_R/Output_from_R_scripts/"
pdf(paste(path2, "Output_overview_extraction/CD4naive/CD4naive_concVS260_280.pdf", sep=""),
    width = 29/2.54, height= 19/2.54)
plot(Tot_NanoDrop_CD4naive$X260_280, Tot_NanoDrop_CD4naive$ng_ul, 
     ylab= "Concentration in ng/ul", xlab= "NanoDrop 260/280", 
     main= "CD4 memory concentration vs 260/280")

##Sample names
# Sample names for samples with a 260/280 < 1.85

text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$X260_280< 1.85], 
     Tot_NanoDrop_CD4naive$ng_ul[Tot_NanoDrop_CD4naive$X260_280< 1.85], 
     Tot_NanoDrop_CD4naive$SampleID[Tot_NanoDrop_CD4naive$X260_280< 1.85],
     col= 2, cex= 0.7, pos= 1)
dev.off()

########################## BioAnalyzer

Tot_BioAnalyzer_CD4naive <- read.table(paste
                                       (path, "Extraction/Bioanalyzer_totalRNA/BioAnalyzer_CD4naive.csv",
                                       sep=""), dec=".", header = T, sep=";",
                                       stringsAsFactors = F)

#Plot samples to see which of the samples do not have proper RIN value
path2 <- "/Users/fatimahe/Documents/Research/Epira/Lab/Extraction/Overview_analysis_in_R/Output_from_R_scripts/"
pdf(paste(path2, "Output_overview_extraction/CD4naive/CD4naiveBioAnalyzer.pdf", sep=""),
    width = 29/2.54, height= 19/2.54)
plot(Tot_BioAnalyzer_CD4naive$RIN, xlab= "SampleID", 
     ylab= "RIN", main= "CD4naive BioAnalyzer", ylim= c(4, 10.3))

#Color sample dots if they are below a specific threshold
points(Tot_BioAnalyzer_CD4naive$RIN[Tot_BioAnalyzer_CD4naive$RIN< 8.8] ~ 
         row.names(Tot_BioAnalyzer_CD4naive)[Tot_BioAnalyzer_CD4naive$RIN< 8.8],
       col= "pink", pch= 20)

points(Tot_BioAnalyzer_CD4naive$RIN[Tot_BioAnalyzer_CD4naive$RIN< 8.0] ~ 
         row.names(Tot_BioAnalyzer_CD4naive)[Tot_BioAnalyzer_CD4naive$RIN< 8.0],
       col= 2, pch= 20)
#Create Sample Names for pink samples
text(Tot_BioAnalyzer_CD4naive$RIN[Tot_BioAnalyzer_CD4naive$RIN< 8.8] ~ 
       row.names(Tot_BioAnalyzer_CD4naive)[Tot_BioAnalyzer_CD4naive$RIN<8.8],
     labels= Tot_BioAnalyzer_CD4naive$SampleID[Tot_BioAnalyzer_CD4naive$RIN< 8.8],
     col= "pink", cex= 0.7, srt= 80, adj =1.1)
#Create Sample Names for red samples
text(Tot_BioAnalyzer_CD4naive$RIN[Tot_BioAnalyzer_CD4naive$RIN< 8.0] ~ 
       row.names(Tot_BioAnalyzer_CD4naive)[Tot_BioAnalyzer_CD4naive$RIN<8.0],
     labels= Tot_BioAnalyzer_CD4naive$SampleID[Tot_BioAnalyzer_CD4naive$RIN< 8.0],
     col= 2, cex= 0.7, srt= 80, adj =1.1)
#Create RIN values for samples with RIN < 8.8
text(Tot_BioAnalyzer_CD4naive$RIN[Tot_BioAnalyzer_CD4naive$RIN< 8.8] ~ 
       row.names(Tot_BioAnalyzer_CD4naive)[Tot_BioAnalyzer_CD4naive$RIN<8.8],
     labels= Tot_BioAnalyzer_CD4naive$RIN[Tot_BioAnalyzer_CD4naive$RIN< 8.8],
     col= "blue", cex= 0.7, pos= 3)
#Legend
legend(x= 25, y= 4.5, legend= c("Sample with RIN < 8.8",
                                "Sample with RIN < 8",
                                "RIN value"), 
       pch= c(20, 20, NA), lty= c(NA, NA, 1), 
       col= c("pink",2,4), cex= 0.9, bty= "n", 
       pt.cex= 1.2, x.intersp= 0.5, y.intersp= 0.7 )

dev.off()



sort(Tot_BioAnalyzer_CD4naive$SampleID)


########################## CD4 memeory  ################################# 
########################## NanoDrop

Tot_NanoDrop_CD4mem <- read.table(paste(path, "Extraction/NanoDrop_totalRNA/NanoDrop_CD4mem.csv",
                                        sep=""), dec=",", header = T, sep=";",
                                  stringsAsFactors = T)


#Plot samples to see which of the samples do not have proper 260/280 
#NanoDrop values
# The width and height are by default in inches in R. For getting cm, take cm and
#divide by 2.54
path2 <- "/Users/fatimahe/Documents/Research/Epira/Lab/Extraction/Overview_analysis_in_R/Output_from_R_scripts/"
pdf(paste(path2, "Output_overview_extraction/CD4memory/CD4memoryNanoDrop.pdf", sep=""),
    width = 29/2.54, height= 19/2.54)

plot(Tot_NanoDrop_CD4mem$X260_280 ~ 
       row.names(Tot_NanoDrop_CD4mem), xlab= "SampleID", ylab= "260/280", 
     main= "CD4memory NanoDrop")

#Color sample dots if they are below a specific threshold
points(Tot_NanoDrop_CD4mem$X260_280[Tot_NanoDrop_CD4mem$X260_280< 1.85] ~ 
         row.names(Tot_NanoDrop_CD4mem)[Tot_NanoDrop_CD4mem$X260_280< 1.85],
       col= 2, pch= 20)

#Color samples green that have a concentration of less than 20ng/ul
points(Tot_NanoDrop_CD4mem$X260_280[Tot_NanoDrop_CD4mem$ng_ul<20] ~ 
         row.names(Tot_NanoDrop_CD4mem)[Tot_NanoDrop_CD4mem$ng_ul<20],
       col= 3, pch= 20)

##Sample names
# Sample names for samples with a 260/280 < 1.85
text(Tot_NanoDrop_CD4mem$X260_280[Tot_NanoDrop_CD4mem$X260_280< 1.85] ~ 
       row.names(Tot_NanoDrop_CD4mem)[Tot_NanoDrop_CD4mem$X260_280< 1.85],
     labels= Tot_NanoDrop_CD4mem$SampleID[Tot_NanoDrop_CD4mem$X260_280< 1.85],
     col= 2, cex= 0.7, pos= 1)

## 260/280 values
# 260/280 values for samples with 260/280 values below 1.85
text(Tot_NanoDrop_CD4mem$X260_280[Tot_NanoDrop_CD4mem$X260_280< 1.85] ~ 
       row.names(Tot_NanoDrop_CD4mem)[Tot_NanoDrop_CD4mem$X260_280< 1.85],
     labels= Tot_NanoDrop_CD4mem$X260_280[Tot_NanoDrop_CD4mem$X260_280< 1.85],
     col= 4, cex= 0.7, pos= 3)

## Concentration for specific samples
# concentration in ng/ul for samples with 260/280 below 1.85
text(Tot_NanoDrop_CD4mem$X260_280[Tot_NanoDrop_CD4mem$X260_280< 1.85] ~ 
       row.names(Tot_NanoDrop_CD4mem)[Tot_NanoDrop_CD4mem$X260_280< 1.85],
     labels= Tot_NanoDrop_CD4mem$ng_ul[Tot_NanoDrop_CD4mem$X260_280< 1.85],
     col= 3, cex= 0.7, pos= 2)


#legend
legend("bottomleft", legend= c("Sample with 260/280 < 1.85",
                               "Sample with 260/280 < 1.85 and concentration < 20ng/ul",
                               "260/280 value",
                               "Concentration in ng/ul",
                               "SampleID"), 
       pch= c(20, 20, NA, NA, NA), lty= c(NA, NA, 1, 1,1), 
       col= c(2,3,4,3,2), cex= 0.9, bty= "n", 
       pt.cex= 1.2, x.intersp= 0.5, y.intersp= 0.7 )
dev.off()




########################## 260/280 vs conc
path2 <- "/Users/fatimahe/Documents/Research/Epira/Lab/Extraction/Overview_analysis_in_R/Output_from_R_scripts/"
pdf(paste(path2, "Output_overview_extraction/CD4memory/CD4memory_concVS260_280.pdf", sep=""),
    width = 29/2.54, height= 19/2.54)
plot(Tot_NanoDrop_CD4mem$X260_280, Tot_NanoDrop_CD4mem$ng_ul, 
     ylab= "Concentration in ng/ul", xlab= "NanoDrop 260/280", 
     main= "CD4 memory concentration vs 260/280")

##Sample names
# Sample names for samples with a 260/280 < 1.85

text(Tot_NanoDrop_CD4mem$X260_280[Tot_NanoDrop_CD4mem$X260_280< 1.85], 
     Tot_NanoDrop_CD4mem$ng_ul[Tot_NanoDrop_CD4mem$X260_280< 1.85], 
     Tot_NanoDrop_CD4mem$SampleID[Tot_NanoDrop_CD4mem$X260_280< 1.85],
     col= 2, cex= 0.7, pos= 1)


#with(Tot_NanoDrop_CD4mem[Tot_NanoDrop_CD4mem$X260_280< 1.85,],
#  text(X260_280, ng_ul, SampleID, col= 2, cex= 0.7, pos= 1))

dev.off()





########################## BioAnalyzer
Tot_BioAnalyzer_CD4mem <- read.table(paste
                                     (path, "Extraction/Bioanalyzer_totalRNA/BioAnalyzer_CD4mem.csv",
                                     sep=""), dec=".", header = T, sep=";",
                                     stringsAsFactors = F)

#Plot samples to see which of the samples do not have proper RIN value
path2 <- "/Users/fatimahe/Documents/Research/Epira/Lab/Extraction/Overview_analysis_in_R/Output_from_R_scripts/"
pdf(paste(path2, "Output_overview_extraction/CD4memory/CD4memoryBioAnalyzer.pdf", sep=""),
    width = 29/2.54, height= 19/2.54)
plot(Tot_BioAnalyzer_CD4mem$RIN, xlab= "SampleID", 
     ylab= "RIN", main= "CD4memory BioAnalyzer", ylim= c(4, 10.3))

#Color sample dots if they are below a specific threshold
points(Tot_BioAnalyzer_CD4mem$RIN[Tot_BioAnalyzer_CD4mem$RIN< 8.8] ~ 
         row.names(Tot_BioAnalyzer_CD4mem)[Tot_BioAnalyzer_CD4mem$RIN< 8.8],
       col= "pink", pch= 20)

points(Tot_BioAnalyzer_CD4mem$RIN[Tot_BioAnalyzer_CD4mem$RIN< 8.0] ~ 
         row.names(Tot_BioAnalyzer_CD4mem)[Tot_BioAnalyzer_CD4mem$RIN< 8.0],
       col= 2, pch= 20)
#Create Sample Names for pink samples
text(Tot_BioAnalyzer_CD4mem$RIN[Tot_BioAnalyzer_CD4mem$RIN< 8.8] ~ 
       row.names(Tot_BioAnalyzer_CD4mem)[Tot_BioAnalyzer_CD4mem$RIN<8.8],
     labels= Tot_BioAnalyzer_CD4mem$SampleID[Tot_BioAnalyzer_CD4mem$RIN< 8.8],
     col= "pink", cex= 0.7, srt= 80, adj =1.1)
#Create Sample Names for red samples
text(Tot_BioAnalyzer_CD4mem$RIN[Tot_BioAnalyzer_CD4mem$RIN< 8.0] ~ 
       row.names(Tot_BioAnalyzer_CD4mem)[Tot_BioAnalyzer_CD4mem$RIN<8.0],
     labels= Tot_BioAnalyzer_CD4mem$SampleID[Tot_BioAnalyzer_CD4mem$RIN< 8.0],
     col= 2, cex= 0.7, srt= 80, adj =1.1)
#Create RIN values for samples with RIN < 8.8
text(Tot_BioAnalyzer_CD4mem$RIN[Tot_BioAnalyzer_CD4mem$RIN< 8.8] ~ 
       row.names(Tot_BioAnalyzer_CD4mem)[Tot_BioAnalyzer_CD4mem$RIN<8.8],
     labels= Tot_BioAnalyzer_CD4mem$RIN[Tot_BioAnalyzer_CD4mem$RIN< 8.8],
     col= "blue", cex= 0.7, pos= 3)
#Legend
legend(x= 45, y=4.5, legend= c("Sample with RIN < 8.8",
                               "Sample with RIN < 8",
                               "RIN value"), 
       pch= c(20, 20, NA), lty= c(NA, NA, 1), 
       col= c("pink",2,4), cex= 0.9, bty= "n", 
       pt.cex= 1.2, x.intersp= 0.5, y.intersp= 0.7 )

dev.off()





########################## CD19  ################################# 
########################## NanoDrop
Tot_NanoDrop_CD19 <- read.table(paste(path, "Extraction/NanoDrop_totalRNA/NanoDrop_CD19.csv",
                                      sep=""), dec=",", header = T, sep=";",
                                stringsAsFactors = T)
#Plot samples to see which of the samples do not have proper 260/280 
#NanoDrop values
# The width and height are by default in inches in R. For getting cm, take cm and
#divide by 2.54
path2 <- "/Users/fatimahe/Documents/Research/Epira/Lab/Extraction/Overview_analysis_in_R/Output_from_R_scripts/"
pdf(paste(path2, "Output_overview_extraction/CD19/CD19NanoDrop.pdf", sep=""),
    width = 29/2.54, height= 19/2.54)
plot(Tot_NanoDrop_CD19$X260_280 ~ 
       row.names(Tot_NanoDrop_CD19), xlab= "SampleID", ylab= "260/280", 
     main= "CD19 NanoDrop", ylim= c(1,3.5))

#Color sample dots if they are above or below a specific threshold
points(Tot_NanoDrop_CD19$X260_280[Tot_NanoDrop_CD19$X260_280< 1.85] ~ 
         row.names(Tot_NanoDrop_CD19)[Tot_NanoDrop_CD19$X260_280< 1.85],
       col= 2, pch= 20)
points(Tot_NanoDrop_CD19$X260_280[Tot_NanoDrop_CD19$X260_280> 2.2] ~ 
         row.names(Tot_NanoDrop_CD19)[Tot_NanoDrop_CD19$X260_280> 2.2],
       col= 2, pch= 20)
#Color samples green that have a concentration of less than 20ng/ul
points(Tot_NanoDrop_CD19$X260_280[Tot_NanoDrop_CD19$ng_ul<20] ~ 
         row.names(Tot_NanoDrop_CD19)[Tot_NanoDrop_CD19$ng_ul<20],
       col= 3, pch= 20)

##Sample names
# Sample names for Samples with 260/280 values below 1.85
#text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$X260_280< 1.85] ~ 
#  row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$X260_280< 1.85],
#  labels= Tot_NanoDrop_CD4naive$SampleID[Tot_NanoDrop_CD4naive$X260_280< 1.85],
#col= 2, cex= 0.7, pos= 1)

# Sample names for Samples with 260/280 values above 2.2
text(Tot_NanoDrop_CD19$X260_280[Tot_NanoDrop_CD19$X260_280> 2.2] ~ 
       row.names(Tot_NanoDrop_CD19)[Tot_NanoDrop_CD19$X260_280> 2.2],
     labels= Tot_NanoDrop_CD19$SampleID[Tot_NanoDrop_CD19$X260_280> 2.2],
     col= 2, cex= 0.7, srt= 80, adj =1.1)

# Sample names with a 260/280 < 1.85 
text(Tot_NanoDrop_CD19$X260_280[Tot_NanoDrop_CD19$X260_280< 1.85] ~ 
       row.names(Tot_NanoDrop_CD19)[Tot_NanoDrop_CD19$X260_280< 1.85],
     labels= Tot_NanoDrop_CD19$SampleID[Tot_NanoDrop_CD19$X260_280< 1.85],
     col= 2, cex= 0.7, srt= 80, adj =1.1)

## Specific 260/280 values
# 260/280 values for samples with 268/280 values below 1.85
text(Tot_NanoDrop_CD19$X260_280[Tot_NanoDrop_CD19$X260_280< 1.85] ~ 
       row.names(Tot_NanoDrop_CD19)[Tot_NanoDrop_CD19$X260_280< 1.85],
     labels= Tot_NanoDrop_CD19$X260_280[Tot_NanoDrop_CD19$X260_280< 1.85],
     col= 4, cex= 0.7, pos= 3)

text(Tot_NanoDrop_CD19$X260_280[Tot_NanoDrop_CD19$SampleID== "RA5509_B"] ~ 
       row.names(Tot_NanoDrop_CD19)[Tot_NanoDrop_CD19$SampleID== "RA5509_B"],
     labels= Tot_NanoDrop_CD19$X260_280[Tot_NanoDrop_CD19$SampleID== "RA5509_B"],
     col= 4, cex= 0.7, pos= 3)


## Concentration for specific samples
concentration in ng/ul for samples with 260/280 below 1.85
text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$X260_280< 1.85] ~ 
       row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$X260_280< 1.85],
     labels= Tot_NanoDrop_CD4naive$ng_ul[Tot_NanoDrop_CD4naive$X260_280< 1.85],
     col= 3, cex= 0.7, pos= 2)

# Concentration for samples with Samples concentration less than 20ng/ul
text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$ng_ul< 20] ~ 
       row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$ng_ul< 20],
     labels= Tot_NanoDrop_CD4naive$ng_ul[Tot_NanoDrop_CD4naive$ng_ul< 20],
     col= 3, cex= 0.7, pos= 2)
# Concentration for sample RA5105_B(28_4)
text(Tot_NanoDrop_CD4naive$X260_280[Tot_NanoDrop_CD4naive$X260_280== 1.62] ~ 
       row.names(Tot_NanoDrop_CD4naive)[Tot_NanoDrop_CD4naive$X260_280== 1.62],
     labels= Tot_NanoDrop_CD4naive$ng_ul[Tot_NanoDrop_CD4naive$X260_280== 1.62],
     col= 3, cex= 0.7, pos= 2)

#legend
legend("topleft", legend= c("Sample with 260/280 < 1.85",
                            "Sample with 260/280 < 1.85 and concentration < 20ng/ul",
                            "260/280 value",
                            "Concentration in ng/ul",
                            "SampleID"), 
       pch= c(20, 20, NA, NA, NA), lty= c(NA, NA, 1, 1,1), 
       col= c(2,3,4,3,2), cex= 0.9, bty= "n", 
       pt.cex= 1.2, x.intersp= 0.5, y.intersp= 0.7 )
dev.off()










