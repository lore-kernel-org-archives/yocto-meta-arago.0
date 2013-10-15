Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3E2E552A66
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2013 18:56:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9FIusgq002494
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2013 13:56:54 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9FIus5Q013804
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2013 13:56:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 15 Oct 2013 13:56:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9FIusJ4022433;
	Tue, 15 Oct 2013 13:56:54 -0500
Date: Tue, 15 Oct 2013 14:56:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20131015185653.GN25798@edge>
References: <1381807317-3759-1-git-send-email-denis@denix.org>
	<1381807317-3759-4-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED101597B1E92@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101597B1E92@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/5] qt-tstat: update recipe to be Qt4 and Qt5	compatible
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Oct 2013 18:56:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

So, should I push these patches in? They don't change the fact that Qt4 is 
still the default setting...


On Tue, Oct 15, 2013 at 03:47:32PM +0000, Maupin, Chase wrote:
> Acked-by: Chase Maupin <chase.maupin@ti.com>
> 
> 
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Monday, October 14, 2013 10:22 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 4/5] qt-tstat: update recipe to be
> >Qt4 and Qt5 compatible
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Uses qt-provider class to build against either Qt4 or Qt5
> >depending on global
> >distro variable QT_PROVIDER.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > ...ui-with-QtWidgets-per-Qt5-migration-guide.patch | 232
> >+++++++++++++++++++++
> > ...mAscii-toAscii-with-fromLatin1-toLatin1-p.patch |  71 +++++++
> > .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |  11 +-
> > 3 files changed, 311 insertions(+), 3 deletions(-)
> > create mode 100644 meta-arago-extras/recipes-qt/qt-apps/qt-
> >tstat/0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-
> >guide.patch
> > create mode 100644 meta-arago-extras/recipes-qt/qt-apps/qt-
> >tstat/0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-
> >p.patch
> >
> >diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0002-
> >Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch b/meta-
> >arago-extras/recipes-qt/qt-apps/qt-tstat/0002-Replace-QtGui-with-
> >QtWidgets-per-Qt5-migration-guide.patch
> >new file mode 100644
> >index 0000000..d9bbba9
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0002-Replace-
> >QtGui-with-QtWidgets-per-Qt5-migration-guide.patch
> >@@ -0,0 +1,232 @@
> >+From 90f70d188b5893fd86aab4f90ac96c9a69ae4e88 Mon Sep 17 00:00:00
> >2001
> >+From: Denys Dmytriyenko <denys@ti.com>
> >+Date: Mon, 14 Oct 2013 18:35:30 -0400
> >+Subject: [PATCH] Replace QtGui with QtWidgets per Qt5 migration
> >guide
> >+
> >+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >+---
> >+ awayscreen.h          | 2 +-
> >+ keyboard/keyboard.cpp | 2 +-
> >+ keyboard/keyboard.h   | 2 +-
> >+ main.cpp              | 2 +-
> >+ mainwindow.cpp        | 2 +-
> >+ mainwindow.h          | 2 +-
> >+ optionswidget.h       | 2 +-
> >+ schedulepoint.cpp     | 2 +-
> >+ schedulepoint.h       | 2 +-
> >+ schedulescreen.h      | 2 +-
> >+ settingscreen.cpp     | 2 +-
> >+ settingscreen.h       | 2 +-
> >+ thermostatdemo.h      | 2 +-
> >+ thermostatwidget.h    | 2 +-
> >+ weatherdatawidget.cpp | 2 +-
> >+ weatherwidget.h       | 2 +-
> >+ 16 files changed, 16 insertions(+), 16 deletions(-)
> >+
> >+diff --git a/awayscreen.h b/awayscreen.h
> >+index 2a2b040..b8827b9 100644
> >+--- a/awayscreen.h
> >++++ b/awayscreen.h
> >+@@ -1,7 +1,7 @@
> >+ #ifndef AWAYSCREEN_H
> >+ #define AWAYSCREEN_H
> >+
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+
> >+ class GlobalSettings;
> >+
> >+diff --git a/keyboard/keyboard.cpp b/keyboard/keyboard.cpp
> >+index 9261031..0d14530 100644
> >+--- a/keyboard/keyboard.cpp
> >++++ b/keyboard/keyboard.cpp
> >+@@ -37,7 +37,7 @@
> >+
> >+ #include "keyboard.h"
> >+ #include "ui_keyboard.h"
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+
> >+ Keyboard::Keyboard(QWidget *parent) :
> >+     QWidget(parent),
> >+diff --git a/keyboard/keyboard.h b/keyboard/keyboard.h
> >+index 2d5c584..960915c 100644
> >+--- a/keyboard/keyboard.h
> >++++ b/keyboard/keyboard.h
> >+@@ -2,7 +2,7 @@
> >+ #define KEYBOARD_H
> >+
> >+ #include <QWidget>
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+ namespace Ui {
> >+ class Keyboard;
> >+ }
> >+diff --git a/main.cpp b/main.cpp
> >+index 18234c9..8e0df39 100644
> >+--- a/main.cpp
> >++++ b/main.cpp
> >+@@ -1,4 +1,4 @@
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+
> >+ #include "mainwindow.h"
> >+ #include "weatherwidget.h"
> >+diff --git a/mainwindow.cpp b/mainwindow.cpp
> >+index b3f8994..d8a0a57 100644
> >+--- a/mainwindow.cpp
> >++++ b/mainwindow.cpp
> >+@@ -9,7 +9,7 @@
> >+ #include "weatherdata.h"
> >+ #include "utilities.h"
> >+
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+
> >+ #include <QtDebug>
> >+
> >+diff --git a/mainwindow.h b/mainwindow.h
> >+index f59d992..1d46fba 100644
> >+--- a/mainwindow.h
> >++++ b/mainwindow.h
> >+@@ -1,7 +1,7 @@
> >+ #ifndef MAINWINDOW_H
> >+ #define MAINWINDOW_H
> >+
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+ #include "webdata.h"
> >+
> >+
> >+diff --git a/optionswidget.h b/optionswidget.h
> >+index b321280..c797ac2 100644
> >+--- a/optionswidget.h
> >++++ b/optionswidget.h
> >+@@ -1,7 +1,7 @@
> >+ #ifndef OPTIONSWIDGET_H
> >+ #define OPTIONSWIDGET_H
> >+
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+ #include "awayscreen.h"
> >+ #include "schedulescreen.h"
> >+ #include "settingscreen.h"
> >+diff --git a/schedulepoint.cpp b/schedulepoint.cpp
> >+index cdaba40..99c7b18 100644
> >+--- a/schedulepoint.cpp
> >++++ b/schedulepoint.cpp
> >+@@ -4,7 +4,7 @@
> >+ #include "globalsettings.h"
> >+ #include "utilities.h"
> >+
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+
> >+
> >+ #define MAXTEMP 100
> >+diff --git a/schedulepoint.h b/schedulepoint.h
> >+index 1f6d662..38d6acd 100644
> >+--- a/schedulepoint.h
> >++++ b/schedulepoint.h
> >+@@ -1,7 +1,7 @@
> >+ #ifndef SCHEDULEPOINT_H
> >+ #define SCHEDULEPOINT_H
> >+
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+ #include <QApplication>
> >+ #include <QColor>
> >+ #include <QGraphicsItem>
> >+diff --git a/schedulescreen.h b/schedulescreen.h
> >+index 9bc0897..c424a3f 100644
> >+--- a/schedulescreen.h
> >++++ b/schedulescreen.h
> >+@@ -1,7 +1,7 @@
> >+ #ifndef SCHEDULESCREEN_H
> >+ #define SCHEDULESCREEN_H
> >+
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+ #include "schedulepoint.h"
> >+
> >+ class GlobalSettings;
> >+diff --git a/settingscreen.cpp b/settingscreen.cpp
> >+index 2f19ae4..62b73b1 100644
> >+--- a/settingscreen.cpp
> >++++ b/settingscreen.cpp
> >+@@ -4,7 +4,7 @@
> >+ #include "qkeyboardlineedit.h"
> >+ #include "webdataengine/openweathermapdataengine.h"
> >+
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+
> >+ #define MAXIMUM_CONTENT_HEIGHT 450
> >+ #define MAXIMUM_CONTENT_WIDTH 800
> >+diff --git a/settingscreen.h b/settingscreen.h
> >+index 4edf175..172dbe2 100644
> >+--- a/settingscreen.h
> >++++ b/settingscreen.h
> >+@@ -1,7 +1,7 @@
> >+ #ifndef SETTINGSCREEN_H
> >+ #define SETTINGSCREEN_H
> >+
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+
> >+ class GlobalSettings;
> >+ class QKeyboardLineEdit;
> >+diff --git a/thermostatdemo.h b/thermostatdemo.h
> >+index 7223f0a..ca7b27e 100644
> >+--- a/thermostatdemo.h
> >++++ b/thermostatdemo.h
> >+@@ -1,7 +1,7 @@
> >+ #ifndef THERMOSTATDEMO_H
> >+ #define THERMOSTATDEMO_H
> >+
> >+-#include <QtGui/QMainWindow>
> >++#include <QtWidgets/QMainWindow>
> >+
> >+ class ThermostatDemo : public QMainWindow
> >+ {
> >+diff --git a/thermostatwidget.h b/thermostatwidget.h
> >+index ba8199b..bbe97ef 100644
> >+--- a/thermostatwidget.h
> >++++ b/thermostatwidget.h
> >+@@ -1,7 +1,7 @@
> >+ #ifndef THERMOSTATWIDGET_H
> >+ #define THERMOSTATWIDGET_H
> >+
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+
> >+ class GlobalSettings;
> >+
> >+diff --git a/weatherdatawidget.cpp b/weatherdatawidget.cpp
> >+index 33e8185..20e8fe8 100644
> >+--- a/weatherdatawidget.cpp
> >++++ b/weatherdatawidget.cpp
> >+@@ -1,6 +1,6 @@
> >+ #include "weatherdatawidget.h"
> >+
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+ #include "globalsettings.h"
> >+ #include "weatherdata.h"
> >+ #include "utilities.h"
> >+diff --git a/weatherwidget.h b/weatherwidget.h
> >+index bffb368..40a7916 100644
> >+--- a/weatherwidget.h
> >++++ b/weatherwidget.h
> >+@@ -1,7 +1,7 @@
> >+ #ifndef WEATHERWIDGET_H
> >+ #define WEATHERWIDGET_H
> >+
> >+-#include <QtGui>
> >++#include <QtWidgets>
> >+
> >+ #include <QtSvg/QSvgWidget>
> >+
> >+--
> >+1.8.3.2
> >+
> >diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0003-
> >Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch b/meta-
> >arago-extras/recipes-qt/qt-apps/qt-tstat/0003-Replace-fromAscii-
> >toAscii-with-fromLatin1-toLatin1-p.patch
> >new file mode 100644
> >index 0000000..28d2bee
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat/0003-Replace-
> >fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch
> >@@ -0,0 +1,71 @@
> >+From 3be273cead085ac9cf45bc59236f6d6ef18dc349 Mon Sep 17 00:00:00
> >2001
> >+From: Denys Dmytriyenko <denys@ti.com>
> >+Date: Mon, 14 Oct 2013 18:39:27 -0400
> >+Subject: [PATCH] Replace fromAscii()/toAscii() with
> >fromLatin1()/toLatin1()
> >+ per Qt5 migration guide
> >+
> >+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >+---
> >+ remoteaccessmanager.cpp                    | 10 +++++-----
> >+ webdataengine/openweathermapdataengine.cpp |  2 +-
> >+ 2 files changed, 6 insertions(+), 6 deletions(-)
> >+
> >+diff --git a/remoteaccessmanager.cpp b/remoteaccessmanager.cpp
> >+index 5eebdef..5a6c547 100644
> >+--- a/remoteaccessmanager.cpp
> >++++ b/remoteaccessmanager.cpp
> >+@@ -103,7 +103,7 @@ void
> >RemoteAccessManager::processIncomingConnection()
> >+         }
> >+         else if(requestParser[1].contains(".jpg") ||
> >requestParser[1].contains(".png"))
> >+         {
> >+-            QFile
> >imageFile(":"+QString::fromAscii(requestParser[1]));
> >++            QFile
> >imageFile(":"+QString::fromLatin1(requestParser[1]));
> >+
> >+             if(!imageFile.open(QFile::ReadOnly))
> >+                 ba = "HTTP/1.1 404 NOT FOUND";
> >+@@ -119,7 +119,7 @@ void
> >RemoteAccessManager::processIncomingConnection()
> >+         }
> >+         else if(requestParser[1].contains(".js"))
> >+         {
> >+-            QFile
> >jsFile(":"+QString::fromAscii(requestParser[1]));
> >++            QFile
> >jsFile(":"+QString::fromLatin1(requestParser[1]));
> >+
> >+             if(!jsFile.open(QFile::ReadOnly))
> >+                 ba = "HTTP/1.1 404 NOT FOUND";
> >+@@ -135,7 +135,7 @@ void
> >RemoteAccessManager::processIncomingConnection()
> >+         }
> >+         else if(requestParser[1].contains(".css"))
> >+         {
> >+-            QFile
> >cssFile(":"+QString::fromAscii(requestParser[1]));
> >++            QFile
> >cssFile(":"+QString::fromLatin1(requestParser[1]));
> >+
> >+             if(!cssFile.open(QFile::ReadOnly))
> >+                 ba = "HTTP/1.1 404 NOT FOUND";
> >+@@ -213,9 +213,9 @@ QByteArray
> >RemoteAccessManager::hashToJSONByteArray(QHash<QString, QVariant>
> >has
> >+     {
> >+         it.next();
> >+         if(it.value().type() == QVariant::Hash)
> >+-
> >jsonByteArray+="\""+it.key().toAscii()+"\""+QByteArray::fromRawDat
> >a(":",1)+""+hashToJSONByteArray(it.value().toHash())+",";
> >++
> >jsonByteArray+="\""+it.key().toLatin1()+"\""+QByteArray::fromRawDa
> >ta(":",1)+""+hashToJSONByteArray(it.value().toHash())+",";
> >+         else
> >+-            jsonByteArray +=
> >"\""+it.key().toAscii()+"\""+QByteArray::fromRawData(":",1)+"\""+i
> >t.value().toByteArray()+"\""+QByteArray::fromRawData(",",1);
> >++            jsonByteArray +=
> >"\""+it.key().toLatin1()+"\""+QByteArray::fromRawData(":",1)+"\""+
> >it.value().toByteArray()+"\""+QByteArray::fromRawData(",",1);
> >+     }
> >+
> >+     jsonByteArray = jsonByteArray.left(jsonByteArray.size()-1);
> >+diff --git a/webdataengine/openweathermapdataengine.cpp
> >b/webdataengine/openweathermapdataengine.cpp
> >+index 0286dd5..de39f48 100644
> >+--- a/webdataengine/openweathermapdataengine.cpp
> >++++ b/webdataengine/openweathermapdataengine.cpp
> >+@@ -67,7 +67,7 @@ void
> >OpenWeatherMapDataEngine::responseReceived()
> >+         QByteArray data = m_reply->readAll();
> >+         //qDebug() << data;
> >+
> >+-        m_cityId =
> >parseCityInformation(QString::fromAscii(data));
> >++        m_cityId =
> >parseCityInformation(QString::fromLatin1(data));
> >+         //docs say do not delete in the slot so well pass it off
> >to the event loop
> >+         m_reply->deleteLater();
> >+         if(m_cityId == -1)
> >+--
> >+1.8.3.2
> >+
> >diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> >b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> >index 198ef1f..8035537 100644
> >--- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> >+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
> >@@ -10,7 +10,11 @@ LIC_FILES_CHKSUM =
> >"file://LICENSE;md5=93a105adb99011afa5baee932b560714 \
> >
> > require recipes-core/matrix/matrix-gui-paths.inc
> >
> >-PR = "r4"
> >+inherit qt-provider
> >+
> >+PR = "r5"
> >+
> >+DEPENDS += "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
> >
> > BRANCH ?= "master"
> > SRCREV = "27e033a0ac59928cc3acbb45f4d9bc2101fcf024"
> >@@ -20,9 +24,10 @@ SRC_URI = " \
> > 	file://0001-Update-Makefile.build-for-when-build-dir-is-not-
> >the-.patch \
> > "
> >
> >-S = "${WORKDIR}/git/"
> >+SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5',
> >'file://0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-
> >guide.patch \
> >+	file://0003-Replace-fromAscii-toAscii-with-fromLatin1-
> >toLatin1-p.patch', '', d)}"
> >
> >-inherit qt4e
> >+S = "${WORKDIR}/git/"
> >
> > # use the make targets already created in the Makefile.build
> >files
> > do_install() {
> >--
> >1.8.3.2
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

