#include <ruby.h>
#include <gr.h>

double* rb_ar_2_dbl_ar(VALUE);
int* rb_ar_2_int_ar(VALUE);
static VALUE opengks(VALUE);
static VALUE closegks(VALUE);
static VALUE inqdspsize(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE openws(VALUE,VALUE,VALUE,VALUE);
static VALUE closews(VALUE,VALUE);
static VALUE activatews(VALUE,VALUE);
static VALUE deactivatews(VALUE,VALUE);
static VALUE clearws(VALUE);
static VALUE updatews(VALUE);
static VALUE polyline(VALUE,VALUE,VALUE);
static VALUE polymarker(VALUE,VALUE,VALUE);
static VALUE text(VALUE,VALUE,VALUE,VALUE);
static VALUE inqtext(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE fillarea(VALUE,VALUE,VALUE);
static VALUE cellarray(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE gdp(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE spline(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE gridit(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE setlinetype(VALUE,VALUE);
static VALUE inqlinetype(VALUE,VALUE);
static VALUE setlinewidth(VALUE,VALUE);
static VALUE inqlinewidth(VALUE,VALUE);
static VALUE setlinecolorind(VALUE,VALUE);
static VALUE inqlinecolorind(VALUE,VALUE);
static VALUE setmarkertype(VALUE,VALUE);
static VALUE inqmarkertype(VALUE,VALUE);
static VALUE setmarkersize(VALUE,VALUE);
static VALUE setmarkercolorind(VALUE,VALUE);
static VALUE inqmarkercolorind(VALUE,VALUE);
static VALUE settextfontprec(VALUE,VALUE,VALUE);
static VALUE setcharexpan(VALUE,VALUE);
static VALUE setcharspace(VALUE,VALUE);
static VALUE settextcolorind(VALUE,VALUE);
static VALUE setcharheight(VALUE,VALUE);
static VALUE setcharup(VALUE,VALUE,VALUE);
static VALUE settextpath(VALUE,VALUE);
static VALUE settextalign(VALUE,VALUE,VALUE);
static VALUE setfillintstyle(VALUE,VALUE);
static VALUE setfillstyle(VALUE,VALUE);
static VALUE setfillcolorind(VALUE,VALUE);
static VALUE setcolorrep(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE setwindow(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE inqwindow(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE setviewport(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE inqviewport(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE selntran(VALUE,VALUE);
static VALUE setclip(VALUE,VALUE);
static VALUE setwswindow(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE setwsviewport(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE createseg(VALUE,VALUE);
static VALUE copysegws(VALUE,VALUE);
static VALUE redrawsegws(VALUE);
static VALUE setsegtran(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE closeseg(VALUE);
static VALUE emergencyclosegks(VALUE);
static VALUE updategks(VALUE);
static VALUE setspace(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE inqspace(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE setscale(VALUE,VALUE);
static VALUE inqscale(VALUE,VALUE);
static VALUE textext(VALUE,VALUE,VALUE,VALUE);
static VALUE inqtextext(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE axes(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE axeslbl(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE grid(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE grid3d(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE verrorbars(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE herrorbars(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE polyline3d(VALUE,VALUE,VALUE,VALUE);
static VALUE polymarker3d(VALUE,VALUE,VALUE,VALUE);
static VALUE axes3d(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE titles3d(VALUE,VALUE,VALUE,VALUE);
static VALUE surface(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE contour(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE tricontour(VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE hexbin(VALUE,VALUE,VALUE,VALUE,VALUE);
static VALUE setcolormap(VALUE,VALUE);
static VALUE inqcolormap(VALUE,VALUE);
static VALUE colorbar(VALUE);
static VALUE inqcolor(VALUE,VALUE,VALUE);
static VALUE inqcolorfromrgb(VALUE,VALUE,VALUE,VALUE);


void Init_grruby(){
	VALUE mGRruby=rb_define_module("GRruby");

	rb_define_singleton_method(mGRruby,"opengks",opengks,0);
	rb_define_singleton_method(mGRruby,"closegks",closegks,0);
	rb_define_singleton_method(mGRruby,"inqdspsize",inqdspsize,4);
	rb_define_singleton_method(mGRruby,"openws",openws,3);
	rb_define_singleton_method(mGRruby,"closews",closews,1);
	rb_define_singleton_method(mGRruby,"activatews",activatews,1);
	rb_define_singleton_method(mGRruby,"deactivatews",deactivatews,1);
	rb_define_singleton_method(mGRruby,"clearws",clearws,0);
	rb_define_singleton_method(mGRruby,"updatews",updatews,0);
	rb_define_singleton_method(mGRruby,"polyline",polyline,2);
	rb_define_singleton_method(mGRruby,"polymarker",polymarker,2);
	rb_define_singleton_method(mGRruby,"text",text,3);
	rb_define_singleton_method(mGRruby,"inqtext",inqtext,5);
	rb_define_singleton_method(mGRruby,"fillarea",fillarea,2);	
	rb_define_singleton_method(mGRruby,"cellarray",cellarray,11);
	rb_define_singleton_method(mGRruby,"gdp",gdp,6);
	rb_define_singleton_method(mGRruby,"spline",spline,5);
	rb_define_singleton_method(mGRruby,"gridit",gridit,9);
	rb_define_singleton_method(mGRruby,"setlinetype",setlinetype,1);
	rb_define_singleton_method(mGRruby,"inqlinetype",inqlinetype,1);
	rb_define_singleton_method(mGRruby,"setlinewidth",setlinewidth,1);
	rb_define_singleton_method(mGRruby,"inqlinewidth",inqlinewidth,1);
	rb_define_singleton_method(mGRruby,"setlinecolorind",setlinecolorind,1);
	rb_define_singleton_method(mGRruby,"inqlinecolorind",inqlinecolorind,1);
	rb_define_singleton_method(mGRruby,"setmarkertype",setmarkertype,1);
	rb_define_singleton_method(mGRruby,"inqmarkertype",inqmarkertype,1);
	rb_define_singleton_method(mGRruby,"setmarkersize",setmarkersize,1);
	rb_define_singleton_method(mGRruby,"setmarkercolorind",setmarkercolorind,1);
	rb_define_singleton_method(mGRruby,"inqmarkercolorind",inqmarkercolorind,1);
	rb_define_singleton_method(mGRruby,"settextfontprec",settextfontprec,2);
	rb_define_singleton_method(mGRruby,"setcharexpan",setcharexpan,1);
	rb_define_singleton_method(mGRruby,"setcharspace",setcharspace,1);
	rb_define_singleton_method(mGRruby,"settextcolorind",settextcolorind,1);
	rb_define_singleton_method(mGRruby,"setcharheight",setcharheight,1);
	rb_define_singleton_method(mGRruby,"setcharup",setcharup,2);
	rb_define_singleton_method(mGRruby,"settextpath",settextpath,1);
	rb_define_singleton_method(mGRruby,"settextalign",settextalign,2);
	rb_define_singleton_method(mGRruby,"setfillintstyle",setfillintstyle,1);
	rb_define_singleton_method(mGRruby,"setfillstyle",setfillstyle,1);
	rb_define_singleton_method(mGRruby,"setfillcolorind",setfillcolorind,1);
	rb_define_singleton_method(mGRruby,"setcolorrep",setcolorrep,4);
	rb_define_singleton_method(mGRruby,"setwindow",setwindow,4);
	rb_define_singleton_method(mGRruby,"inqwindow",inqwindow,4);
	rb_define_singleton_method(mGRruby,"setviewport",setviewport,4);
	rb_define_singleton_method(mGRruby,"inqviewport",inqviewport,4);
	rb_define_singleton_method(mGRruby,"selntran",selntran,1);
	rb_define_singleton_method(mGRruby,"setclip",setclip,1);
	rb_define_singleton_method(mGRruby,"setwswindow",setwswindow,4);
	rb_define_singleton_method(mGRruby,"setwsviewport",setwsviewport,4);
	rb_define_singleton_method(mGRruby,"createseg",createseg,1);
	rb_define_singleton_method(mGRruby,"copysegws",copysegws,1);
	rb_define_singleton_method(mGRruby,"redrawsegws",redrawsegws,0);
	rb_define_singleton_method(mGRruby,"setsegtran",setsegtran,8);
	rb_define_singleton_method(mGRruby,"closeseg",closeseg,0);
	rb_define_singleton_method(mGRruby,"emergencyclosegks",emergencyclosegks,0);
	rb_define_singleton_method(mGRruby,"updategks",updategks,0);
	rb_define_singleton_method(mGRruby,"setspace",setspace,4);
	rb_define_singleton_method(mGRruby,"inqspace",inqspace,4);
	rb_define_singleton_method(mGRruby,"setscale",setscale,1);
	rb_define_singleton_method(mGRruby,"inqscale",inqscale,1);
	rb_define_singleton_method(mGRruby,"textext",textext,3);
	rb_define_singleton_method(mGRruby,"inqtextext",inqtextext,5);
	rb_define_singleton_method(mGRruby,"axes",axes,7);
	//rb_define_singleton_method(mGRruby,"axeslbl",axeslbl,8);
	rb_define_singleton_method(mGRruby,"grid",grid,6);
	rb_define_singleton_method(mGRruby,"grid3d",grid3d,9);
	rb_define_singleton_method(mGRruby,"verrorbars",verrorbars,4);
	rb_define_singleton_method(mGRruby,"herrorbars",herrorbars,4);
	rb_define_singleton_method(mGRruby,"polyline3d",polyline3d,3);
	rb_define_singleton_method(mGRruby,"polymarker3d",polymarker3d,3);
	rb_define_singleton_method(mGRruby,"axes3d",axes3d,10);
	rb_define_singleton_method(mGRruby,"titles3d",titles3d,3);
	rb_define_singleton_method(mGRruby,"surface",surface,4);
	rb_define_singleton_method(mGRruby,"contour",contour,5);
	rb_define_singleton_method(mGRruby,"tricontour",tricontour,6);
	rb_define_singleton_method(mGRruby,"hexbin",hexbin,4);
	rb_define_singleton_method(mGRruby,"setcolormap",setcolormap,1);
	rb_define_singleton_method(mGRruby,"inqcolormap",inqcolormap,1);
	rb_define_singleton_method(mGRruby,"colorbar",colorbar,0);
	rb_define_singleton_method(mGRruby,"inqcolor",inqcolor,2);
	rb_define_singleton_method(mGRruby,"inqcolorfromrgb",inqcolorfromrgb,3);
	
}


double* rb_ar_2_dbl_ar(VALUE ar){
	long ar_size=RARRAY_LEN(ar);
	double *arc = (double *)malloc(ar_size * sizeof(double));
	int i;
	for (i=0; i<ar_size; i++){
        arc[i] = NUM2DBL(rb_ary_entry(ar, i));
    }
    return arc; 
}

int* rb_ar_2_int_ar(VALUE ar){
	long ar_size=RARRAY_LEN(ar);
	int *arc = (int *)malloc(ar_size * sizeof(int));
	int i;
	for (i=0; i<ar_size; i++){
        arc[i] = NUM2INT(rb_ary_entry(ar, i));
    }
    return arc; 
}


static VALUE opengks(VALUE self){
	gr_opengks();
	return Qtrue;
}

static VALUE closegks(VALUE self){
	gr_closegks();
	return Qtrue;
}

static VALUE inqdspsize(VALUE self,VALUE a,VALUE b,VALUE c,VALUE d){
	double *ac = rb_ar_2_dbl_ar(a);
    double *bc = rb_ar_2_dbl_ar(b); 
    int *cc = rb_ar_2_int_ar(c);
    int *dc = rb_ar_2_int_ar(d);
    gr_inqdspsize(ac,bc,cc,dc);
	return Qtrue;
}

static VALUE openws(VALUE self,VALUE ws_id,VALUE connection, VALUE type){
	int ws_idc=NUM2INT(ws_id);
	char *connectionc=StringValueCStr(connection);
	int typec=NUM2INT(type);
	gr_openws(ws_idc,connectionc,typec);
	return Qtrue;
}


static VALUE closews(VALUE self,VALUE ws_id){
	int ws_idc=NUM2INT(ws_id);
	gr_closews(ws_idc);
	return Qtrue;
}

static VALUE activatews(VALUE self,VALUE ws_id){
	int ws_idc=NUM2INT(ws_id);
	gr_activatews(ws_idc);
	return Qtrue;
}

static VALUE deactivatews(VALUE self,VALUE ws_id){
	int ws_idc=NUM2INT(ws_id);
	gr_deactivatews(ws_idc);
	return Qtrue;
}

static VALUE clearws(VALUE self){
	gr_clearws();
	return Qtrue;
}

static VALUE updatews(VALUE self){
	gr_updatews();
	return Qtrue;
}

static VALUE polyline(VALUE self,VALUE x, VALUE y){
	int x_size = RARRAY_LEN(x);
	int y_size = RARRAY_LEN(y);
   	int size = (x_size <= y_size)?x_size:y_size;
    double *xc = rb_ar_2_dbl_ar(x);
    double *yc = rb_ar_2_dbl_ar(y); 
    gr_polyline(size,xc,yc);
    return Qtrue;
}

static VALUE polymarker(VALUE self,VALUE x, VALUE y){
	int x_size = RARRAY_LEN(x);
	int y_size = RARRAY_LEN(y);
   	int size = (x_size <= y_size)?x_size:y_size;
    double *xc = rb_ar_2_dbl_ar(x);
    double *yc = rb_ar_2_dbl_ar(y); 
    gr_polymarker(size,xc,yc);
    return Qtrue;

}

static VALUE text(VALUE self,VALUE x, VALUE y, VALUE string){
	double xc=NUM2DBL(x);
	double yc=NUM2DBL(y);
	char *stringc=StringValueCStr(string);
	gr_text(xc,yc,stringc);
	return Qtrue;
}

static VALUE inqtext(VALUE self,VALUE a,VALUE b,VALUE c,VALUE d,VALUE e){
	double ac = NUM2DBL(a);
	double bc = NUM2DBL(b);
	char *cc = StringValueCStr(c);
	double *dc = rb_ar_2_dbl_ar(d);
	double *ec = rb_ar_2_dbl_ar(e);
	gr_inqtext(ac,bc,cc,dc,ec);
	return Qtrue;
}

static VALUE fillarea(VALUE self,VALUE x, VALUE y){
	int x_size = RARRAY_LEN(x);
	int y_size = RARRAY_LEN(y);
   	int size = (x_size <= y_size)?x_size:y_size;
    double *xc = rb_ar_2_dbl_ar(x);
    double *yc = rb_ar_2_dbl_ar(y); 
    gr_fillarea(size,xc,yc);
    return Qtrue;
}

static VALUE cellarray(VALUE self,VALUE xmin,VALUE xmax,VALUE ymin,VALUE ymax,VALUE dimx,VALUE dimy,VALUE scol,VALUE srow,VALUE ncol,VALUE nrow,VALUE color){
	double xminc = NUM2DBL(xmin);
	double xmaxc = NUM2DBL(xmax);
	double yminc = NUM2DBL(ymin);
	double ymaxc = NUM2DBL(ymax);
	int dimxc = NUM2INT(dimx);
	int dimyc = NUM2INT(dimy);
	int scolc = NUM2INT(scol);
	int srowc = NUM2INT(srow);
	int ncolc = NUM2INT(ncol);
	int nrowc = NUM2INT(nrow);
	int *colorc = rb_ar_2_int_ar(color);
	gr_cellarray(xminc,xmaxc,yminc,ymaxc,dimxc,dimyc,scolc,srowc,ncolc,nrowc,colorc);
	return Qtrue;
}

static VALUE gdp(VALUE self,VALUE a,VALUE b,VALUE c,VALUE d,VALUE e,VALUE f){
	int ac = NUM2INT(a);
	double *bc = rb_ar_2_dbl_ar(b);
	double *cc = rb_ar_2_dbl_ar(c);
	int dc = NUM2INT(d);
	int ec = NUM2INT(e);
	int *fc = rb_ar_2_int_ar(f);
	gr_gdp(ac,bc,cc,dc,ec,fc);
	return Qtrue;
}

static VALUE spline(VALUE self,VALUE n,VALUE px,VALUE py,VALUE m,VALUE method){
	int nc = NUM2INT(n);
	double *pxc = rb_ar_2_dbl_ar(px);
	double *pyc = rb_ar_2_dbl_ar(py);
	int mc = NUM2INT(m);
	int methodc = NUM2INT(method);
	gr_spline(nc,pxc,pyc,mc,methodc);
	return Qtrue;
}

static VALUE gridit(VALUE self,VALUE a,VALUE b,VALUE c,VALUE d,VALUE e,VALUE f,VALUE g,VALUE h,VALUE i){
	int ac = NUM2INT(a);
	double *bc = rb_ar_2_dbl_ar(b);
	double *cc = rb_ar_2_dbl_ar(c);
	double *dc = rb_ar_2_dbl_ar(d);
	int ec = NUM2INT(e);
	int fc = NUM2INT(f);
	double *gc = rb_ar_2_dbl_ar(g);
	double *hc = rb_ar_2_dbl_ar(h);
	double *ic = rb_ar_2_dbl_ar(i);
	gr_gridit(ac,bc,cc,dc,ec,fc,gc,hc,ic);
	return Qtrue;
	//Can be optimised for Ruby
}

static VALUE setlinetype(VALUE self,VALUE type){
	int typec = NUM2INT(type);
	gr_setlinetype(typec);
	return Qtrue;
}

static VALUE inqlinetype(VALUE self,VALUE a){
	int *ac = rb_ar_2_int_ar(a);
	gr_inqlinetype(ac);
	return Qtrue;
}

static VALUE setlinewidth(VALUE self,VALUE width){
	double widthc = NUM2DBL(width);
	gr_setlinewidth(widthc);
	return Qtrue;
}

static VALUE inqlinewidth(VALUE self,VALUE a){
	double *ac = rb_ar_2_dbl_ar(a);
	gr_inqlinewidth(ac);
	return Qtrue;
}

static VALUE setlinecolorind(VALUE self,VALUE color){
	int colorc = NUM2INT(color);
	gr_setlinecolorind(colorc);
	return Qtrue;
}

static VALUE inqlinecolorind(VALUE self,VALUE a){
	int *ac = rb_ar_2_int_ar(a);
	gr_inqlinecolorind(ac);
	return Qtrue;
}

static VALUE setmarkertype(VALUE self, VALUE type){
	int typec = NUM2INT(type);
	gr_setmarkertype(typec);
	return Qtrue;
}

static VALUE inqmarkertype(VALUE self,VALUE a){
	int *ac = rb_ar_2_int_ar(a);
	gr_inqmarkertype(ac);
	return Qtrue;
}


static VALUE setmarkersize(VALUE self, VALUE size){
	double sizec = NUM2DBL(size);
	gr_setmarkersize(sizec);
	return Qtrue;
}

static VALUE setmarkercolorind(VALUE self,VALUE color){
	double colorc = NUM2INT(color);
	gr_setmarkercolorind(colorc);
	return Qtrue;
}

static VALUE inqmarkercolorind(VALUE self,VALUE a){
	int *ac = rb_ar_2_int_ar(a);
	gr_inqmarkercolorind(ac);
	return Qtrue;
}

static VALUE settextfontprec(VALUE self, VALUE font, VALUE precision){
	int fontc = NUM2INT(font);
	int precisionc = NUM2INT(precision);
	gr_settextfontprec(fontc,precisionc);
	return Qtrue;
}

static VALUE setcharexpan(VALUE self,VALUE factor){
	double factorc = NUM2DBL(factor);
	gr_setcharexpan(factorc);
	return Qtrue;
}

static VALUE setcharspace(VALUE self,VALUE a){
	double ac = NUM2DBL(a);
	gr_setcharspace(ac);
	return Qtrue;
}

static VALUE settextcolorind(VALUE self,VALUE color){
	int colorc = NUM2INT(color);
	gr_settextcolorind(colorc);
	return Qtrue;
}

static VALUE setcharheight(VALUE self, VALUE height){
	double heightc= NUM2DBL(height);
	gr_setcharheight(heightc);
	return Qtrue;
}

static VALUE setcharup(VALUE self,VALUE ux,VALUE uy){
	double uxc = NUM2DBL(ux);
	double uyc = NUM2DBL(uy);
	gr_setcharup(uxc,uyc);
	return Qtrue;
}

static VALUE settextpath(VALUE self,VALUE path){
	int pathc = NUM2INT(path);
	gr_settextpath(pathc);
	return Qtrue;
}

static VALUE settextalign(VALUE self, VALUE horizontal, VALUE vertical){
	int horizontalc=NUM2INT(horizontal);
	int verticalc=NUM2INT(vertical);
	gr_settextalign(horizontalc,verticalc);
	return Qtrue;
}


static VALUE setfillintstyle(VALUE self,VALUE style){
	int stylec = NUM2INT(style);
	gr_setfillintstyle(stylec);
	return Qtrue;
}

static VALUE setfillstyle(VALUE self,VALUE index){
	int indexc = NUM2INT(index);
	gr_setfillstyle(indexc);
	return Qtrue;
}

static VALUE setfillcolorind(VALUE self,VALUE color){
	int colorc = NUM2INT(color);
	gr_setfillcolorind(colorc);
	return Qtrue;
}

static VALUE setcolorrep(VALUE self,VALUE index,VALUE red,VALUE green,VALUE blue){
	int indexc = NUM2INT(index);
	double redc = NUM2DBL(red);
	double greenc = NUM2DBL(green);
	double bluec = NUM2DBL(blue);
	gr_setcolorrep(index,red,green,blue);
	return Qtrue;
}

static VALUE setwindow(VALUE self, VALUE xmin, VALUE xmax,VALUE ymin, VALUE ymax){
	double xminc = NUM2DBL(xmin);
	double xmaxc = NUM2DBL(xmax);
	double yminc = NUM2DBL(ymin);
	double ymaxc = NUM2DBL(ymax);
	gr_setwindow(xminc,xmaxc,yminc,ymaxc);
	return Qtrue;
}

static VALUE inqwindow(VALUE self,VALUE a,VALUE b,VALUE c,VALUE d){
	double *ac = rb_ar_2_dbl_ar(a);
	double *bc = rb_ar_2_dbl_ar(b);
	double *cc = rb_ar_2_dbl_ar(c);
	double *dc = rb_ar_2_dbl_ar(d);
	gr_inqwindow(ac,bc,cc,dc);
	return Qtrue;
}

static VALUE setviewport(VALUE self, VALUE xmin, VALUE xmax,VALUE ymin, VALUE ymax){
	double xminc = NUM2DBL(xmin);
	double xmaxc = NUM2DBL(xmax);
	double yminc = NUM2DBL(ymin);
	double ymaxc = NUM2DBL(ymax);
	gr_setviewport(xminc,xmaxc,yminc,ymaxc);
	return Qtrue;
}

static VALUE inqviewport(VALUE self,VALUE a,VALUE b,VALUE c,VALUE d){
	double *ac = rb_ar_2_dbl_ar(a);
	double *bc = rb_ar_2_dbl_ar(b);
	double *cc = rb_ar_2_dbl_ar(c);
	double *dc = rb_ar_2_dbl_ar(d);
	gr_inqviewport(ac,bc,cc,dc);
	return Qtrue;
}

static VALUE selntran(VALUE self,VALUE transform){
	int transformc = NUM2INT(transform);
	gr_selntran(transformc);
	return Qtrue;
}

static VALUE setclip(VALUE self,VALUE indicator){
	int indicatorc = NUM2INT(indicator);
	gr_setclip(indicatorc);
	return Qtrue;
}

static VALUE setwswindow(VALUE self,VALUE xmin,VALUE xmax,VALUE ymin,VALUE ymax){
	double xminc = NUM2DBL(xmin);
	double xmaxc = NUM2DBL(xmax);
	double yminc = NUM2DBL(ymin);
	double ymaxc = NUM2DBL(ymax);
	gr_setwswindow(xminc,xmaxc,yminc,ymaxc);
	return Qtrue;
}

static VALUE setwsviewport(VALUE self,VALUE xmin,VALUE xmax,VALUE ymin,VALUE ymax){
	double xminc = NUM2DBL(xmin);
	double xmaxc = NUM2DBL(xmax);
	double yminc = NUM2DBL(ymin);
	double ymaxc = NUM2DBL(ymax);
	gr_setwsviewport(xminc,xmaxc,yminc,ymaxc);
	return Qtrue;
}

static VALUE createseg(VALUE self,VALUE a){
	int ac = NUM2INT(a);
	gr_createseg(ac);
	return Qtrue;
}

static VALUE copysegws(VALUE self,VALUE a){
	int ac = NUM2INT(a);
	gr_copysegws(ac);
	return Qtrue;
}

static VALUE redrawsegws(VALUE self){
	gr_redrawsegws();
	return Qtrue;
}

static VALUE setsegtran(VALUE self,VALUE a,VALUE b,VALUE c,VALUE d,VALUE e,VALUE f,VALUE g,VALUE h){
	int ac = NUM2INT(a);
	double bc = NUM2DBL(b);
	double cc = NUM2DBL(c);
	double dc = NUM2DBL(d);
	double ec = NUM2DBL(e);
	double fc = NUM2DBL(f);
	double gc = NUM2DBL(g);
	double hc = NUM2DBL(h);
	gr_setsegtran(a,b,c,d,e,f,g,h);
	return Qtrue;
}

static VALUE closeseg(VALUE self){
	gr_closeseg();
	return Qtrue;
}

static VALUE emergencyclosegks(VALUE self){
	gr_emergencyclosegks();
	return Qtrue;
}

static VALUE updategks(VALUE self){
	gr_updategks();
	return Qtrue;
}

static VALUE setspace(VALUE self, VALUE zmin, VALUE zmax,VALUE rotation, VALUE tilt){
	double zminc = NUM2DBL(zmin);
	double zmaxc = NUM2DBL(zmax);
	int rotationc = NUM2INT(rotation);
	int tiltc = NUM2INT(tilt);
	gr_setspace(zminc,zmaxc,rotationc,tiltc);
	return Qtrue;
}

static VALUE inqspace(VALUE self,VALUE a,VALUE b,VALUE c,VALUE d){
	double *ac = rb_ar_2_dbl_ar(a);
	double *bc = rb_ar_2_dbl_ar(b);
	int *cc = rb_ar_2_int_ar(c);
	int *dc = rb_ar_2_int_ar(d);
	gr_inqspace(ac,bc,cc,dc);
	return Qtrue;
}

static VALUE setscale(VALUE self,VALUE options){
	int optionsc = NUM2INT(options);
	gr_setscale(optionsc);
	return Qtrue;
}

static VALUE inqscale(VALUE self,VALUE a){
	int *ac = rb_ar_2_int_ar(a);
	gr_inqscale(ac);
	return Qtrue;
}

static VALUE textext(VALUE self,VALUE x, VALUE y, VALUE string){
	double xc=NUM2DBL(x);
	double yc=NUM2DBL(y);
	char *stringc=StringValueCStr(string);
	gr_textext(xc,yc,stringc);
	return Qtrue;
}

static VALUE inqtextext(VALUE self,VALUE a,VALUE b,VALUE c,VALUE d,VALUE e){
	double ac = NUM2DBL(a);
	double bc = NUM2DBL(b);
	char *cc = StringValueCStr(c);
	double *dc = rb_ar_2_dbl_ar(d);
	double *ec = rb_ar_2_dbl_ar(e);
	gr_inqtextext(ac,bc,cc,dc,ec);
	return Qtrue;
}

static VALUE axes(VALUE self, VALUE x_tick, VALUE y_tick, VALUE x_org, VALUE y_org, VALUE major_x, VALUE major_y, VALUE tick_size){
	double x_tickc=NUM2DBL(x_tick);
	double y_tickc=NUM2DBL(y_tick);
	double x_orgc=NUM2DBL(x_org);
	double y_orgc=NUM2DBL(y_org);
	int major_xc=NUM2INT(major_x);
	int major_yc=NUM2INT(major_y);
	double tick_sizec=NUM2DBL(tick_size);
	gr_axes(x_tickc,y_tickc,x_orgc,y_orgc,major_xc,major_yc,tick_sizec);
	return Qtrue;
}

/* figure this one
static VALUE axeslbl(VALUE self,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE,VALUE){
	return Qtrue;
}
*/

static VALUE grid(VALUE self,VALUE x_tick,VALUE y_tick,VALUE x_org,VALUE y_org,VALUE major_x,VALUE major_y){
	double x_tickc = NUM2DBL(x_tick);
	double y_tickc = NUM2DBL(y_tick);
	double x_orgc = NUM2DBL(x_org);
	double y_orgc = NUM2DBL(y_org);
	int major_xc=NUM2INT(major_x);
	int major_yc=NUM2INT(major_y);
	gr_grid(x_tickc,y_tickc,x_orgc,y_orgc,major_xc,major_yc);
	return Qtrue;
}

static VALUE grid3d(VALUE self,VALUE x_tick,VALUE y_tick,VALUE z_tick,VALUE x_org,VALUE y_org,VALUE z_org,VALUE major_x,VALUE major_y,VALUE major_z){
	double x_tickc = NUM2DBL(x_tick);
	double y_tickc = NUM2DBL(y_tick);
	double z_tickc = NUM2DBL(z_tick);
	double x_orgc = NUM2DBL(x_org);
	double y_orgc = NUM2DBL(y_org);
	double z_orgc = NUM2DBL(z_org);
	int major_xc=NUM2INT(major_x);
	int major_yc=NUM2INT(major_y);
	int major_zc=NUM2INT(major_z);
	gr_grid3d(x_tickc,y_tickc,z_tickc,x_orgc,y_orgc,z_orgc,major_xc,major_yc,major_zc);
	return Qtrue;
}

static VALUE verrorbars(VALUE self,VALUE px,VALUE py,VALUE e1,VALUE e2){
	int x_size = RARRAY_LEN(px);
	int y_size = RARRAY_LEN(py);
	int size = (x_size <= y_size)?x_size:y_size;
	double *pxc = rb_ar_2_dbl_ar(px);
	double *pyc = rb_ar_2_dbl_ar(py);
	double *e1c = rb_ar_2_dbl_ar(e1);
	double *e2c = rb_ar_2_dbl_ar(e2);
	gr_verrorbars(size,pxc,pyc,e1c,e2c);
	return Qtrue;
}

static VALUE herrorbars(VALUE self,VALUE px,VALUE py,VALUE e1,VALUE e2){
	int x_size = RARRAY_LEN(px);
	int y_size = RARRAY_LEN(py);
	int size = (x_size <= y_size)?x_size:y_size;
	double *pxc = rb_ar_2_dbl_ar(px);
	double *pyc = rb_ar_2_dbl_ar(py);
	double *e1c = rb_ar_2_dbl_ar(e1);
	double *e2c = rb_ar_2_dbl_ar(e2);
	gr_herrorbars(size,pxc,pyc,e1c,e2c);
	return Qtrue;
}

static VALUE polyline3d(VALUE self,VALUE px,VALUE py,VALUE pz){
	int x_size = RARRAY_LEN(px);
	int y_size = RARRAY_LEN(py);
	int z_size = RARRAY_LEN(pz);
   	int size = (x_size <= y_size)?x_size:y_size;
   	size = (size <= z_size)?size:z_size;
    double *xc = rb_ar_2_dbl_ar(px);
    double *yc = rb_ar_2_dbl_ar(py); 
    double *zc = rb_ar_2_dbl_ar(pz); 
    gr_polyline3d(size,xc,yc,zc);
	return Qtrue;
}

static VALUE polymarker3d(VALUE self,VALUE px,VALUE py,VALUE pz){
	int x_size = RARRAY_LEN(px);
	int y_size = RARRAY_LEN(py);
	int z_size = RARRAY_LEN(pz);
   	int size = (x_size <= y_size)?x_size:y_size;
   	size = (size <= z_size)?size:z_size;
    double *xc = rb_ar_2_dbl_ar(px);
    double *yc = rb_ar_2_dbl_ar(py); 
    double *zc = rb_ar_2_dbl_ar(pz); 
    gr_polymarker3d(size,xc,yc,zc);
	return Qtrue;
}

static VALUE axes3d(VALUE self,VALUE x_tick,VALUE y_tick,VALUE z_tick,VALUE x_org,VALUE y_org,VALUE z_org,VALUE major_x,VALUE major_y,VALUE major_z,VALUE tick_size){
	double x_tickc = NUM2DBL(x_tick);
	double y_tickc = NUM2DBL(y_tick);
	double z_tickc = NUM2DBL(z_tick);
	double x_orgc = NUM2DBL(x_org);
	double y_orgc = NUM2DBL(y_org);
	double z_orgc = NUM2DBL(z_org);
	int major_xc = NUM2INT(major_x);
	int major_yc = NUM2INT(major_y);
	int major_zc = NUM2INT(major_z);
	double tick_sizec = NUM2DBL(tick_size);
	gr_axes3d(x_tickc,y_tickc,z_tickc,x_orgc,y_orgc,z_orgc,major_xc,major_yc,major_zc,tick_sizec);
	return Qtrue;
}

static VALUE titles3d(VALUE self,VALUE x_title,VALUE y_title,VALUE z_title){
	char *x_titlec = StringValueCStr(x_title);
	char *y_titlec = StringValueCStr(y_title);
	char *z_titlec = StringValueCStr(z_title);
	gr_titles3d(x_titlec,y_titlec,z_titlec);
	return Qtrue;
}

static VALUE surface(VALUE self,VALUE px,VALUE py,VALUE pz,VALUE option){
	int nxc = RARRAY_LEN(px);
	int nyc = RARRAY_LEN(py);
	double *pxc = rb_ar_2_dbl_ar(px);
	double *pyc = rb_ar_2_dbl_ar(py);
	double *pzc = rb_ar_2_dbl_ar(pz);
	int optionc =  NUM2INT(option);
	gr_surface(nxc,nyc,pxc,pyc,pzc,optionc);
	return Qtrue;
}

static VALUE contour(VALUE self,VALUE px,VALUE py,VALUE ph,VALUE pz,VALUE major_h){
	int nxc = RARRAY_LEN(px);
	int nyc = RARRAY_LEN(py);
	int nhc = RARRAY_LEN(ph);
	double *pxc = rb_ar_2_dbl_ar(px);
	double *pyc = rb_ar_2_dbl_ar(py);
	double *phc = rb_ar_2_dbl_ar(ph);
	double *pzc = rb_ar_2_dbl_ar(pz);
	int major_hc =  NUM2INT(major_h);
	gr_contour(nxc,nyc,nhc,pxc,pyc,phc,pzc,major_hc);
	return Qtrue;
}

static VALUE tricontour(VALUE self,VALUE npoints,VALUE x,VALUE y,VALUE z,VALUE nlevels,VALUE levels){
	int npointsc = NUM2INT(npoints);
	double *xc = rb_ar_2_dbl_ar(x);
	double *yc = rb_ar_2_dbl_ar(y);
	double *zc = rb_ar_2_dbl_ar(z);
	int nlevelsc = NUM2INT(nlevels);
	double *levelsc = rb_ar_2_dbl_ar(levels);
	gr_tricontour(npointsc,xc,yc,zc,nlevelsc,levelsc);
	return Qtrue;
}

static VALUE hexbin(VALUE self,VALUE a,VALUE b,VALUE c,VALUE d){
	int ac = NUM2INT(a);
	double* bc = rb_ar_2_dbl_ar(b);
	double* cc = rb_ar_2_dbl_ar(c);
	int dc = NUM2INT(d);
	gr_hexbin(ac,bc,cc,dc);
	return Qtrue;
}

static VALUE setcolormap(VALUE self,VALUE a){
	int ac = NUM2INT(a);
	gr_setcolormap(ac);
	return Qtrue;
}

static VALUE inqcolormap(VALUE self,VALUE a){
	int *ac = rb_ar_2_int_ar(a);
	gr_inqcolormap(ac);
	return Qtrue;
}

static VALUE colorbar(VALUE self){
	gr_colorbar();
	return Qtrue;
}

static VALUE inqcolor(VALUE self,VALUE a,VALUE b){
	int ac = NUM2INT(a);
	int *bc = rb_ar_2_int_ar(b);
	gr_inqcolor(ac,bc);
	return Qtrue;
}

static VALUE inqcolorfromrgb(VALUE self,VALUE a,VALUE b,VALUE c){
	double ac = NUM2DBL(a);
	double bc = NUM2DBL(b);
	double cc = NUM2DBL(c);
	gr_inqcolorfromrgb(ac,bc,cc);
	return Qtrue;
}
