# Downloads and unzips the data into outputDIR
# Returns the location of the data
# @Param sourceURL
# @Param outputDIR
# Returns a table containing all raw data

acquire.data <- function (sourceURL, outputDIR) {
    outputZipFile <- file.path(getwd(), "out.zip")
    
    download.file(url = sourceURL, destfile =  outputZipFile);
    unzip(zipfile = outputZipFile, exdir = outputDIR )
    
    # Read the Date column as the Date type on the fly
    setClass('myDate')
    setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
    setClass('myTime')
    setAs("character","myTime", function(from) strptime(from, format="%T") )
    
    # the data needed is for 2007-02-01 and 2007-02-02
    outputPath <- file.path(outputDIR, "household_power_consumption.txt")
    header <- read.table(outputPath, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
    
    # Grep out the dates specified in the assignment and only read those lines. 
    lines <- grep("^1/2/2007|^2/2/2007",readLines(outputPath), value = FALSE)

    data <- read.table( file = outputPath, sep = ";", 
                        header = FALSE,
                        colClasses = c("myDate", "myTime", unlist(rep("numeric", 7))),
                        na.strings = c ("?"),
                        skip = min(lines),
                        nrows = (max(lines) - min(lines) + 1)
                        )
    names(data) <- header
    data
}