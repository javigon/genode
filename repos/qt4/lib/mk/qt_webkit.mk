include $(REP_DIR)/lib/import/import-qt_webkit.mk

SHARED_LIB = yes

# additional defines for the Genode version
CC_OPT += -DSQLITE_NO_SYNC=1 -DSQLITE_THREADSAFE=0

# enable C++ functions that use C99 math functions (disabled by default in the Genode tool chain)
CC_CXX_OPT += -D_GLIBCXX_USE_C99_MATH

# use default warning level to avoid noise when compiling contrib code
CC_WARN = -Wno-deprecated-declarations

CC_OPT_sqlite3 +=  -Wno-int-to-pointer-cast -Wno-pointer-to-int-cast

# some parts of the library are not C++11 compatible
CC_CXX_OPT_STD =

include $(REP_DIR)/lib/mk/qt_webkit_generated.inc

include $(REP_DIR)/lib/mk/qt.inc

LIBS += qt_webcore qt_jscore qt_network qt_core libc libm

vpath %.qrc $(REP_DIR)/contrib/$(QT4)/src/3rdparty/webkit/Source/WebCore
vpath %.qrc $(REP_DIR)/contrib/$(QT4)/src/3rdparty/webkit/Source/WebCore/inspector/front-end
