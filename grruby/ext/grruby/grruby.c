#include <ruby.h>
#include <GR.h>
void Init_grruby(){
	VALUE mGRruby=rb_define_module("GRruby");
	rb_define_singleton_method(mGRruby,"setviewport",4)
	rb_define_singleton_method(mGRruby,"setwindow",4)
	rb_define_singleton_method(mGRruby,"setspace",4)
	rb_define_singleton_method(mGRruby,"setmarkersize",1)
	rb_define_singleton_method(mGRruby,"setmarkertype",1)
	rb_define_singleton_method(mGRruby,"setcharheight",1)
	rb_define_singleton_method(mGRruby,"settextalign",2)
	rb_define_singleton_method(mGRruby,"settextfontprec",2)
	rb_define_singleton_method(mGRruby,"axes",7)
	
}


static VALUE setviewport(VALUE self, VALUE xmin, VALUE xmax,VALUE ymin, VALUE ymax){

	xminc=RFLOAT_VALUE(xmin);
	xmaxc=RFLOAT_VALUE(xmax);
	yminc=RFLOAT_VALUE(ymin);
	ymaxc=RFLOAT_VALUE(ymax);
	gr_setviewport(xminc,xmaxc,yminc,ymaxc);
	return Qtrue;

}

static VALUE setwindow(VALUE self, VALUE xmin, VALUE xmax,VALUE ymin, VALUE ymax){

	double xminc=RFLOAT_VALUE(xmin);
	double xmaxc=RFLOAT_VALUE(xmax);
	double yminc=RFLOAT_VALUE(ymin);
	double ymaxc=RFLOAT_VALUE(ymax);
	gr_setwindow(xminc,xmaxc,yminc,ymaxc);
	return Qtrue;

}

static VALUE setspace(VALUE self, VALUE zmin, VALUE zmax,VALUE rotation, VALUE tilt){

	double zminc=RFLOAT_VALUE(zmin);
	double zmaxc=RFLOAT_VALUE(zmax);
	int rotationc=INT2NUM(rotation);
	int tiltc=INT2NUM(tilt);
	gr_setspace(zminc,zmaxc,rotationc,tiltc);
	return Qtrue;

}

static VALUE setmarkersize(VALUE self, VALUE size){

	double sizec= RFLOAT_VALUE(size);
	gr_setmarkersize(sizec);
	return Qtrue;

}

static VALUE setmarkertype(VALUE self, VALUE type){

	int typec=INT2NUM(type);
	gr_setmarkertype(typec);
	return Qtrue;
}

static VALUE setcharheight(VALUE self, VALUE height){

	double heightc= RFLOAT_VALUE(height);
	gr_setcharheight(heightc);
	return Qtrue;
}

static VALUE settextalign(VALUE self, VALUE horizontal, VALUE vertical){

	int horizontalc=INT2NUM(horizontal);
	int verticalc=INT2NUM(vertical);
	gr_settextalign(horizontalc,verticalc);
	return Qtrue;
}

static VALUE settextfontprec(VALUE self, VALUE font, VALUE precision){

	int fontc=INT2NUM(font);
	int precisionc=INT2NUM(precision);
	gr_settextfontprec(fontc,precisionc);
	return Qtrue;

}

static VALUE axes(VALUE self, VALUE x_tick, VALUE y_tick, VALUE x_org, VALUE y_org, VALUE major_x, VALUE major_y, VALUE tick_size){

	double x_tickc=RFLOAT_VALUE(x_tick);
	double y_tickc=RFLOAT_VALUE(y_tick);
	double x_orgc=RFLOAT_VALUE(x_org);
	double y_orgc=RFLOAT_VALUE(y_org);
	int major_xc=INT2NUM(major_x);
	int major_yc=INT2NUM(major_y);
	double tick_sizec=RFLOAT_VALUE(tick_size);
	gr_axes(x_tickc,y_tickc,x_orgc,y_orgc,major_xc,major_yc,tick_sizec)
	return Qtrue;
}