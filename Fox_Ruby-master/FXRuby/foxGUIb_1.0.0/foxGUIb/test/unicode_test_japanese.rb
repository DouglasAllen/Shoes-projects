# source generated by foxGUIb 0.7

class MainWindow
	def initialize( parent)
		construct_widget_tree( parent)
		init if respond_to? 'init'
	end
	
	def construct_widget_tree( parent)
		@topwin=
		FX::MainWindow.new(parent){|w|
			@mainWindow=w
			w.wdg_name='mainWindow'
			w.width=592
			w.shown=true
			w.y=418
			w.height=141
			w.title="Ruby\343\202\275\343\203\274\343\202\271\343\202\263\343\203\274\343\203\211\345\256\214\345\205\250\350\247\243\350\252\254"
			w.vSpacing=7
			w.x=70
			FX::Label.new(@mainWindow){|w|
				@label1=w
				w.wdg_name='label1'
				w.text="Ruby\343\202\275\343\203\274\343\202\271\343\202\263\343\203\274\343\203\211\345\256\214\345\205\250\350\247\243\350\252\254"
				w.font=FX::Font.new.from_s('Tahoma|360|40|5|0|0|0').to_FXFont
				w.width=592
				w.height=62
			}
			FX::TextField.new(@mainWindow){|w|
				@textfield1=w
				w.wdg_name='textfield1'
				w.text="http://i.loveruby.net/ja/rhg/book/"
				w.width=592
				w.y=69
				w.height=19
				w.numColumns=10
				w.layoutHints=1024
			}
			FX::Text.new(@mainWindow){|w|
				@text1=w
				w.wdg_name='text1'
				w.text="$Id: index.html,v 1.6 2004/07/20 23:08:12 aamine Exp $\n\n\343\201\223\343\201\256\346\226\207\346\233\270\343\201\257\346\233\270\347\261\215\343\200\216Ruby\343\202\275\343\203\274\343\202\271\343\202\263\343\203\274\343\203\211\345\256\214\345\205\250\350\247\243\350\252\254\343\200\217\343\201\256HTML\347\211\210\343\201\247\343\201\231\343\200\202\343\201\237\343\201\240\343\201\227\345\210\235\346\240\241\346\256\265\351\232\216\343\201\256\345\216\237\347\250\277\343\202\222\343\203\231\343\203\274\343\202\271\343\201\253\343\201\227\343\201\246\343\201\204\343\202\213\343\201\237\343\202\201\343\200\201\346\233\270\347\261\215\343\201\247\343\201\257\344\277\256\346\255\243\343\201\225\343\202\214\343\201\246\343\201\204\343\202\213\351\226\223\351\201\225\343\201\204\343\201\214\346\256\213\343\201\243\343\201\246\343\201\204\343\202\213\345\240\264\345\220\210\343\201\214\343\201\202\343\202\212\343\201\276\343\201\231\343\200\202\344\272\210\343\202\201\345\276\241\344\272\206\346\211\277\343\201\217\343\201\240\343\201\225\343\201\204\343\200\202\n\n2004-02-16 \343\201\253\345\205\250\347\253\240\343\202\222\345\205\254\351\226\213\343\201\227\343\201\276\343\201\227\343\201\237\343\200\202\n\347\233\256\346\254\241\n\n    * \343\201\276\343\201\210\343\201\214\343\201\215\n    * \345\272\217\347\253\240\n\n\347\254\254 1 \351\203\250\343\200\214\343\202\252\343\203\226\343\202\270\343\202\247\343\202\257\343\203\210\343\200\215\n\n    * \347\254\254 1 \347\253\240\343\200\214Ruby\350\250\200\350\252\236\343\203\237\343\203\213\343\203\236\343\203\240\343\200\215\n    * \347\254\254 2 \347\253\240\343\200\214\343\202\252\343\203\226\343\202\270\343\202\247\343\202\257\343\203\210\343\200\215\n    * \347\254\254 3 \347\253\240\343\200\214\345\220\215\345\211\215\343\201\250\345\220\215\345\211\215\350\241\250\343\200\215\n    * \347\254\254 4 \347\253\240\343\200\214\343\202\257\343\203\251\343\202\271\343\200\215\n    * \347\254\254 5 \347\253\240\343\200\214\343\202\254\343\203\274\343\203\231\343\203\274\343\202\270\343\202\263\343\203\254\343\202\257\343\202\267\343\203\247\343\203\263\343\200\215\n    * \347\254\254 6 \347\253\240\343\200\214\345\244\211\346\225\260\343\201\250\345\256\232\346\225\260\343\200\215\n    * \347\254\254 7 \347\253\240\343\200\214\343\202\273\343\202\255\343\203\245\343\203\252\343\203\206\343\202\243\343\200\215\n\n\347\254\254 2 \351\203\250\343\200\214\346\247\213\346\226\207\350\247\243\346\236\220\343\200\215\n\n    * \347\254\254 8 \347\253\240\343\200\214Ruby\350\250\200\350\252\236\343\201\256\350\251\263\347\264\260\343\200\215\n    * \347\254\254 9 \347\253\240\343\200\214\351\200\237\347\277\222yacc\343\200\215\n    * \347\254\254 10 \347\253\240\343\200\214\343\203\221\343\203\274\343\202\265\343\200\215\n    * \347\254\254 11 \347\253\240\343\200\214\347\212\266\346\205\213\344\273\230\343\201\215\343\202\271\343\202\255\343\203\243\343\203\212\343\200\215\n    * \347\254\254 12 \347\253\240\343\200\214\346\247\213\346\226\207\346\234\250\343\201\256\346\247\213\347\257\211\343\200\215\n\n\347\254\254 3 \351\203\250\343\200\214\350\251\225\344\276\241\343\200\215\n\n    * \347\254\254 13 \347\253\240\343\200\214\350\251\225\344\276\241\345\231\250\343\201\256\346\247\213\351\200\240\343\200\215\n    * \347\254\254 14 \347\253\240\343\200\214\343\202\263\343\203\263\343\203\206\343\202\255\343\202\271\343\203\210\343\200\215\n    * \347\254\254 15 \347\253\240\343\200\214\343\203\241\343\202\275\343\203\203\343\203\211\343\200\215\n    * \347\254\254 16 \347\253\240\343\200\214\343\203\226\343\203\255\343\203\203\343\202\257\343\200\215\n    * \347\254\254 17 \347\253\240\343\200\214\345\213\225\347\232\204\350\251\225\344\276\241\343\200\215\n\n\347\254\254 4 \351\203\250\343\200\214\350\251\225\344\276\241\345\231\250\343\201\256\345\221\250\350\276\272\343\200\215\n\n    * \347\254\254 18 \347\253\240\343\200\214\343\203\255\343\203\274\343\203\211\343\200\215\n    * \347\254\254 19 \347\253\240\343\200\214\343\202\271\343\203\254\343\203\203\343\203\211\343\200\215\n\n    * \347\265\202\347\253\240\n\n\343\203\251\343\202\244\343\202\273\343\203\263\343\202\271\343\201\252\343\201\251\n\n\343\201\223\343\201\256\346\226\207\346\233\270\343\201\257\343\202\252\343\203\263\343\203\251\343\202\244\343\203\263\343\201\276\343\201\237\343\201\257\343\202\252\343\203\225\343\203\251\343\202\244\343\203\263\343\201\247 (\343\203\200\343\202\246\343\203\263\343\203\255\343\203\274\343\203\211\343\201\227\343\201\246)\343\200\201\345\200\213\344\272\272\343\201\256\347\257\204\345\233\262\343\201\247\343\201\224\345\210\251\347\224\250\343\201\217\343\201\240\343\201\225\343\201\204\343\200\202\345\244\211\346\233\264\343\201\212\343\202\210\343\201\263\345\206\215\351\205\215\345\270\203\343\201\257\347\246\201\346\255\242\343\201\247\343\201\231\343\200\202\n\n\343\201\223\343\201\256\346\226\207\346\233\270\343\201\270\343\201\256\343\203\217\343\202\244\343\203\221\343\203\274\343\203\252\343\203\263\343\202\257\343\201\257\343\203\252\343\203\263\343\202\257\345\205\210\343\202\222\345\225\217\343\202\217\343\201\232\345\276\241\350\207\252\347\224\261\343\201\253\343\201\252\343\201\225\343\201\243\343\201\246\343\201\217\343\201\240\343\201\225\343\201\204\343\200\202\345\240\261\345\221\212\343\201\257\344\270\200\345\210\207\344\270\215\350\246\201\343\201\247\343\201\231\343\200\202\n\n\345\276\241\346\204\217\350\246\213\343\203\273\345\276\241\346\204\237\346\203\263\343\203\273\350\252\244\346\256\226\343\201\256\346\214\207\346\221\230\343\201\252\343\201\251\343\201\257 \351\235\222\346\234\250\345\263\260\351\203\216 <aamine@loveruby.net> \343\201\276\343\201\247\343\201\212\351\241\230\343\201\204\343\201\227\343\201\276\343\201\231\343\200\202\n\n\343\200\216Ruby\343\202\275\343\203\274\343\202\271\343\202\263\343\203\274\343\203\211\345\256\214\345\205\250\350\247\243\350\252\254\343\200\217\343\201\257\343\202\244\343\203\263\343\203\227\343\203\254\343\202\271\343\203\200\343\202\244\343\203\254\343\202\257\343\203\210\343\201\247\345\276\241\344\272\210\347\264\204\343\203\273\345\276\241\350\263\274\345\205\245\343\201\204\343\201\237\343\201\240\343\201\221\343\201\276\343\201\231 (\346\233\270\347\261\215\347\264\271\344\273\213\343\203\232\343\203\274\343\202\270\343\201\270\351\243\233\343\201\263\343\201\276\343\201\231)\343\200\202\n\nCopyright (c) 2002-2004 Minero Aoki, All rights reserved."
				w.width=592
				w.y=95
				w.height=46
			}
		}
	end
	attr_reader :topwin
	attr_reader :mainWindow
	attr_reader :label1
	attr_reader :textfield1
	attr_reader :text1
end

#unit test
if __FILE__==$0
	require 'libGUIb16'
	app=FX::App.new
	w=MainWindow.new app
	w.topwin.show(Fox::PLACEMENT_SCREEN)
	app.create
	app.run
end