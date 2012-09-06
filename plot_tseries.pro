;Plot the solar cycle variability time-series obtained from SQL queries 
;to the HEC and HFC
;Writted - Paul Higgins - 2012-09-06
pro plot_tseries

readcol,'data/flare_goes_sxr_by_mo_yr.txt',yr,mo,num,skip=1

plot,yr+mo/12.,num

readcol,'data/flare_goes_sxr_noaa_match_by_mo_yr.txt',yr1,mo1,num1,skip=1

plot,yr+mo/12.,smooth(num,13,/edge),color=150,xtit='year',ytit='# flares matched to noaa'
oplot,yr1+mo1/12.,smooth(num1,13,/edge)

readcol,'data/flare_goes_sxr_noaa_match_class_by_mo_yr.txt',yr2,mo2,num2,skip=1

plot,yr+mo/12.,smooth(num,13,/edge),color=150,xtit='year',ytit='# flares matched to noaa',xran=[1996,2013]
oplot,yr2+mo2/12.,smooth(num2,13,/edge),thick=1
oplot,yr1+mo1/12.,smooth(num1,13,/edge),col=!red
vline,2011.+11./12.
vline,2012.

readcol,'data/ssn.csv',yr3,mo3,num3,skip=1
plot,yr+mo/12.,smooth(num,13,/edge),color=150,xtit='year',ytit='# flares matched to noaa',xran=[1996,2013]
oplot,yr2+mo2/12.,smooth(num2,13,/edge),thick=1
oplot,yr1+mo1/12.,smooth(num1,13,/edge),col=!red
oplot,yr3+mo3/12.,smooth(num3,13,/edge)/max(smooth(num3,13,/edge))*200.,col=!cyan

readcol,'data/arn.csv',yr4,mo4,num4,skip=1
plot,yr+mo/12.,smooth(num,13,/edge),color=150,xtit='year',ytit='# flares matched to noaa',xran=[1996,2013]
oplot,yr2+mo2/12.,smooth(num2,13,/edge),thick=1
oplot,yr1+mo1/12.,smooth(num1,13,/edge),col=!red
oplot,yr4+mo4/12.,smooth(num4,13,/edge)/max(smooth(num4,13,/edge))*130.,col=!cyan,ps=-1
readcol,'data/arn_bgd.csv',yr5,mo5,num5,skip=1
oplot,yr5+mo5/12.,smooth(num5,13,/edge)/max(smooth(num5,13,/edge))*100.,col=!orange,ps=-1
readcol,'data/arn_bg.csv',yr6,mo6,num6,skip=1
oplot,yr6+mo6/12.,(num6)/max((num6))*100.,col=!green,ps=-1

;tt=yr6+mo6/12.
;nhist=histogram(tt,bin=1./12.,locat=tthist)
;oplot,yr6+mo6/12.,(num6)/max((num6))*100.,col=!green,ps=-1


end