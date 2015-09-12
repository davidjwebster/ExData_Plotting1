plotdata <- read.table('household_power_consumption.txt',sep=";",stringsAsFactors=FALSE)

inds = plotdata$V1=='1/2/2007'|plotdata$V1=='2/2/2007'

act_pow = plotdata$V3[inds]

hist(as.numeric(act_pow),main='Global Active Power',xlab='Global Active Power (kilowatts)',ylab='Frequency',col='red')
dev.copy(png,file='plot1.png')
dev.off()

