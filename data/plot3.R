plotdata <- read.table('household_power_consumption.txt',sep=";",stringsAsFactors=FALSE)

inds = plotdata$V1=='1/2/2007'|plotdata$V1=='2/2/2007'

date = plotdata$V1[inds]
timeofday = plotdata$V2[inds]
act_pow = plotdata$V3[inds]
energy_sub_1 = plotdata$V7[inds]
energy_sub_2 = plotdata$V8[inds]
energy_sub_3 = plotdata$V9[inds]

formdates = as.POSIXct(strptime(paste(date,timeofday),"%d/%m/%Y %H:%M:%S"))

plot(formdates,energy_sub_1,type='l',xlab='',ylab='Energy sub metering')
lines(formdates,energy_sub_2,type='l',xlab='',ylab='Energy sub metering',col='red')
lines(formdates,energy_sub_3,type='l',xlab='',ylab='Energy sub metering',col='blue')
legend('top',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lwd=c(2.5,2.5),col=c('black','red','blue'),bty='n')
dev.copy(png,file='plot3.png')
dev.off()