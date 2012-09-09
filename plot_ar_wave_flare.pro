readcol,'data/combined_wave_flare.txt',wavetime,d2p1,wavelat,flaretime,d12p1,flarenoaa,flarelat,flareclass, skip=1,form=strjoin([strarr(23)+'A,','A'],'')
;time_start	lat_hg	time_start	nar	lat_hg	xray_class
wavetime=wavetime+'T'+d2p1
;flaretime=flaretime+'T'+d12p1
;wavelat[where(strtrim(wavelat,2) eq 'S')]=-10000.

readcol,'data/hfc_ar_wave_table.txt',artime,artime2,arnoaa,arlat, skip=1,delim=' ',form='A,A,A,A'
;1ID_AR	2FRC_INFO_ID	3OBSERVATIONS_ID	4OBSERVATIONS_ID_T	5FEAT_DATE	6FEAT_DATE_PREV	7FEAT_X_ARCSEC	8FEAT_Y_ARCSEC	9FEAT_X_PIX	10FEAT_Y_PIX	11FEAT_HG_LONG_DEG	12FEAT_HG_LAT_DEG	13FEAT_CARR_LONG_DEG	14FEAT_CARR_LAT_DEG	15FEAT_AREA_PIX	16FEAT_AREA_MM2	17FEAT_AREA_DEG2	BR_X0_ARCSEC	BR_Y0_ARCSEC	BR_X1_ARCSEC	BR_Y1_ARCSEC	BR_X2_ARCSEC	BR_Y2_ARCSEC	BR_X3_ARCSEC	BR_Y3_ARCSEC	BR_HG_LONG0_DEG	BR_HG_LAT0_DEG	BR_HG_LONG1_DEG	BR_HG_LAT1_DEG	BR_HG_LONG2_DEG	BR_HG_LAT2_DEG	BR_HG_LONG3_DEG	BR_HG_LAT3_DEG	BR_CARR_LONG0_DEG	BR_CARR_LAT0_DEG	BR_CARR_LONG1_DEG	BR_CARR_LAT1_DEG	BR_CARR_LONG2_DEG	BR_CARR_LAT2_DEG	BR_CARR_LONG3_DEG	BR_CARR_LAT3_DEG	BR_X0_PIX	BR_Y0_PIX	BR_X1_PIX	BR_Y1_PIX	BR_X2_PIX	BR_Y2_PIX	BR_X3_PIX	BR_Y3_PIX	FEAT_MAX_INT	FEAT_MIN_INT	FEAT_MEAN_INT	FEAT_MEAN2QSUN	FEAT_MAX_BZ	FEAT_MIN_BZ	FEAT_MEAN_BZ	FEAT_LENGTH_NL	FEAT_LENGTH_SG	FEAT_MAX_GRAD	FEAT_MEAN_GRAD	FEAT_MEDIAN_GRAD	FEAT_RVAL	FEAT_WLSG	CC_X_PIX	CC_Y_PIX	CC_X_ARCSEC	CC_Y_ARCSEC	CC	CC_LENGTH	SNAPSHOT_FN	SNAPSHOT_PATH	FEAT_FILENAME	HELIO_AR_NUMBER	RUN_DATE

readcol,'data/hec_goes_wave_table.txt',flrtime,flrtime2,flrnoaa,flrlat, flrclass, skip=1,form='A,A,A,A,A,A,A'
;time_start	nar	lat_hg	xray_class
flrtime=flrtime+'T'+flrtime2

readcol,'data/hec_wave_table.txt',wvtime,wvtime2,wvlat, skip=1,form='A,A,A,A,A,A,A'
;time_start	nar	lat_hg	xray_class
wvtime=wvtime+'T'+wvtime2

readcol,'data/hfc_filament_table.txt',filtime,filtime2,phenom,fillat, skip=1,form='A,A,A,A,A,A,A'
;DATE_OBS	PHENOM	FEAT_HG_LAT_DEG
filtime=filtime+'T'+filtime2

setcolors,/sys
setplotenv,/xwin
plot,anytim(artime+'T'+artime2)/3600./24./365.+anytim(0)/3600./24./365.+1979.,arlat,ps=1,xtit='Year',ytit='Latitude',color=!white

;get the FLARE/WAVE CATALOG AGAIN... TAKE ONLY SUBSET OF FIELDS

;get filaments for the plot.

;when do filaments disappear?? does a flare happen??

;oplot,anytim(flaretime)/3600./24./365.,flarelat,ps=4,color=!cyan
oplot,anytim(wvtime)/3600./24./365.+anytim(0)/3600./24./365.+1979.,wvlat,ps=1,color=!orange
;oplot,anytim(filtime)/3600./24./365.+anytim(0)/3600./24./365.+1979.,fillat,ps=1,color=!gray
oplot,anytim(flaretime)/3600./24./365.+anytim(0)/3600./24./365.+1979.,flarelat,ps=1,color=!green
oplot,anytim(wavetime)/3600./24./365.+anytim(0)/3600./24./365.+1979.,wavelat,ps=1,color=!red
;oplot,float(xx),float(yy),ps=4,color=!red

window_capture,file='ar_flare_wave_match'

plot,anytim(artime+'T'+artime2)/3600./24./365.+anytim(0)/3600./24./365.+1979.,arlat,ps=1,xtit='Year',ytit='Latitude',color=!white
oplot,anytim(filtime)/3600./24./365.+anytim(0)/3600./24./365.+1979.,fillat,color=!gray,ps=2
oplot,anytim(filtime[where(phenom eq 2)])/3600./24./365.+anytim(0)/3600./24./365.+1979.,fillat[where(phenom eq 2)],color=!yellow,ps=2

;oplot,anytim(flaretime)/3600./24./365.,flarelat,ps=4,color=!cyan
oplot,anytim(wvtime)/3600./24./365.+anytim(0)/3600./24./365.+1979.,wvlat,ps=1,color=!orange
oplot,anytim(flaretime)/3600./24./365.+anytim(0)/3600./24./365.+1979.,flarelat,ps=1,color=!green
oplot,anytim(wavetime)/3600./24./365.+anytim(0)/3600./24./365.+1979.,wavelat,ps=1,color=!red
;oplot,float(xx),float(yy),ps=4,color=!red

window_capture,file='ar_fil_flare_wave_match'


stop



end