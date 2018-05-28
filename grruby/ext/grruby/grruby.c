#include <ruby.h>
#include <gr.h>



static VALUE setviewport(VALUE self, VALUE xmin, VALUE xmax,VALUE ymin, VALUE ymax){

	double xminc=NUM2DBL(xmin);
	double xmaxc=NUM2DBL(xmax);
	double yminc=NUM2DBL(ymin);
	double ymaxc=NUM2DBL(ymax);
	gr_setviewport(xminc,xmaxc,yminc,ymaxc);
	return Qtrue;

}

static VALUE setwindow(VALUE self, VALUE xmin, VALUE xmax,VALUE ymin, VALUE ymax){

	double xminc=NUM2DBL(xmin);
	double xmaxc=NUM2DBL(xmax);
	double yminc=NUM2DBL(ymin);
	double ymaxc=NUM2DBL(ymax);
	gr_setwindow(xminc,xmaxc,yminc,ymaxc);
	return Qtrue;

}

static VALUE setspace(VALUE self, VALUE zmin, VALUE zmax,VALUE rotation, VALUE tilt){

	double zminc=NUM2DBL(zmin);
	double zmaxc=NUM2DBL(zmax);
	int rotationc=NUM2INT(rotation);
	int tiltc=NUM2INT(tilt);
	gr_setspace(zminc,zmaxc,rotationc,tiltc);
	return Qtrue;

}

static VALUE setmarkersize(VALUE self, VALUE size){

	double sizec= NUM2DBL(size);
	gr_setmarkersize(sizec);
	return Qtrue;

}

static VALUE setmarkertype(VALUE self, VALUE type){

	int typec=NUM2INT(type);
	gr_setmarkertype(typec);
	return Qtrue;
}

static VALUE setcharheight(VALUE self, VALUE height){

	double heightc= NUM2DBL(height);
	gr_setcharheight(heightc);
	return Qtrue;
}

static VALUE settextalign(VALUE self, VALUE horizontal, VALUE vertical){

	int horizontalc=NUM2INT(horizontal);
	int verticalc=NUM2INT(vertical);
	gr_settextalign(horizontalc,verticalc);
	return Qtrue;
}

static VALUE settextfontprec(VALUE self, VALUE font, VALUE precision){

	int fontc=NUM2INT(font);
	int precisionc=NUM2INT(precision);
	gr_settextfontprec(fontc,precisionc);
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

static VALUE updatews(){

	gr_updatews();
	return Qtrue;
}

static VALUE text(VALUE self,VALUE x, VALUE y, VALUE string){

	double xc=NUM2DBL(x);
	double yc=NUM2DBL(y);
	char *stringc=StringValueCStr(string);
	gr_text(xc,yc,stringc);
	return Qtrue;
}


void Init_grruby(){
	VALUE mGRruby=rb_define_module("GRruby");
	rb_define_singleton_method(mGRruby,"setviewport",setviewport,4);
	rb_define_singleton_method(mGRruby,"setwindow",setwindow,4);
	rb_define_singleton_method(mGRruby,"setspace",setspace,4);
	rb_define_singleton_method(mGRruby,"setmarkersize",setmarkersize,1);
	rb_define_singleton_method(mGRruby,"setmarkertype",setmarkertype,1);
	rb_define_singleton_method(mGRruby,"setcharheight",setcharheight,1);
	rb_define_singleton_method(mGRruby,"settextalign",settextalign,2);
	rb_define_singleton_method(mGRruby,"settextfontprec",settextfontprec,2);
	rb_define_singleton_method(mGRruby,"axes",axes,7);
	rb_define_singleton_method(mGRruby,"updatews",updatews,0);
	rb_define_singleton_method(mGRruby,"text",text,3);
}