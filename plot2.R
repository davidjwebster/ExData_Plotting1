plotdata <- read.table('household_power_consumption.txt',sep=";",stringsAsFactors=FALSE)

inds = plotdata$V1=='1/2/2007'|plotdata$V1=='2/2/2007'

date = plotdata$V1[inds]
timeofday = plotdata$V2[inds]
act_pow = plotdata$V3[inds]

plot(as.POSIXct(strptime(paste(date,timeofday), "%d/%m/%Y %H:%M:%S")),act_pow,type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.copy(png,file='plot2.png')
dev.off()
