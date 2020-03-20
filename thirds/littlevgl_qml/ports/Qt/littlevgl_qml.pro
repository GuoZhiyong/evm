QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TEMPLATE = app
TARGET = littlevgl_qml


INCLUDEPATH += $$PWD/../../../../libevm
INCLUDEPATH += $$PWD/../..
INCLUDEPATH += $$PWD/../../../../native/common
INCLUDEPATH += $$PWD/../../../../native/qml
INCLUDEPATH += $$PWD/../../lvgl
INCLUDEPATH += $$PWD/../../../../lib/include

DEFINES += LV_CONF_INCLUDE_SIMPLE

include($$PWD/lvgl_module.pri)
include($$PWD/lvgl.pri)

# build dir
BuildDir = build

CONFIG(debug, debug|release) {
    DESTDIR = $$PWD/$$BuildDir/debug
    OBJECTS_DIR = $$PWD/$$BuildDir/debug/.obj
    MOC_DIR = $$PWD/$$BuildDir/debug/.moc
    RCC_DIR = $$PWD/$$BuildDir/debug/.rcc
    UI_DIR = $$PWD/$$BuildDir/debug/.ui
} else {
    DESTDIR = $$PWD/$$BuildDir/release
    OBJECTS_DIR = $$PWD/$$BuildDir/release/.obj
    MOC_DIR = $$PWD/$$BuildDir/release/.moc
    RCC_DIR = $$PWD/$$BuildDir/release/.rcc
    UI_DIR = $$PWD/$$BuildDir/release/.ui
}

unix {
    exists($$PWD/../../../../lib/x86_linux/libqml.a) {
        LIBS += $$PWD/../../../../lib/x86_linux/libqml.a
    }
    exists($$OUT_PWD/../../../../libqml/libqml.a) {
        LIBS += $$OUT_PWD/../../../../libqml/libqml.a
    }
}

win32{
    exists($$PWD/../../../../lib/x86_win64/libqml.a) {
        LIBS += $$PWD/../../../../lib/x86_win64/libqml.a
    }
    exists($$OUT_PWD/../../../../libqml/libqml.a) {
        LIBS += $$OUT_PWD/../../../../libqml/libqml.a
    }
}

SOURCES += \
        main.cpp \
        mainwindow.cpp \
        evm_main.c \
        lvgl_main.c

HEADERS += mainwindow.h \
           evm_main.h \
           lvgl_main.h


unix {
    system(bash $$PWD/../sync.sh)
}

win32 {
    system($$PWD/../sync.bat)
}
