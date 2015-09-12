plotdata <- read.table('household_power_consumption.txt',sep=";",stringsAsFactors=FALSE)

inds = plotdata$V1=='1/2/2007'|plotdata$V1=='2/2/2007'

date = plotdata$V1[inds]
timeofday = plotdata$V2[inds]
act_pow = plotdata$V3[inds]
react_pow = plotdata$V4[inds]
voltage = plotdata$V5[inds]
energy_sub_1 = plotdata$V7[inds]
energy_sub_2 = plotdata$V8[inds]
energy_sub_3 = plotdata$V9[inds]

formdates = as.POSIXct(strptime(paste(date,timeofday),"%d/%m/%Y %H:%M:%S"))

par(mfrow=c(2,2),mar = c(4, 4, 2.5, 2.5), oma = c(0, 0, 2, 0))

plot(formdates,act_pow,type='l',xlab='',ylab='Global Active Power')
plot(formdates,voltage,type='l',xlab='datetime',ylab='Voltage')
plot(formdates,energy_sub_1,type='l',xlab='',ylab='Energy sub metering')
lines(formdates,energy_sub_2,type='l',xlab='',ylab='Energy sub metering',col='red')
lines(formdates,energy_sub_3,type='l',xlab='',ylab='Energy sub metering',col='blue')
legend('top',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lwd=c(2.5,2.5),col=c('black','red','blue'),cex=0.5,bty='n')
plot(formdates,react_pow,type='l',xlab='datetime',ylab='Global_reactive_power')
dev.copy(png,file='plot4.png')
dev.off()