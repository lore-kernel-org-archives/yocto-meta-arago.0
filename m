Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 17FFE52972
	for <meta-arago@arago-project.org>;
	Wed, 13 Nov 2013 14:40:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rADEegJS005617;
	Wed, 13 Nov 2013 08:40:42 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rADEegH9004822;
	Wed, 13 Nov 2013 08:40:42 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 13 Nov 2013 08:40:42 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 6/6] meta-toolchain-arago-qte: update to
	support Qt4 and Qt5 SDK
Thread-Index: AQHO32GxnGTALr6BvEWx1zpWYnRaLpojPd5A
Date: Wed, 13 Nov 2013 14:40:41 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101598158C0@DLEE11.ent.ti.com>
References: <1384231333-26952-1-git-send-email-denis@denix.org>
	<1384231333-26952-7-git-send-email-denis@denix.org>
In-Reply-To: <1384231333-26952-7-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 6/6] meta-toolchain-arago-qte: update to	support Qt4 and Qt5 SDK
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
X-List-Received-Date: Wed, 13 Nov 2013 14:40:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, November 11, 2013 10:42 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 6/6] meta-toolchain-arago-qte: update
>to support Qt4 and Qt5 SDK
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-core/meta/meta-toolchain-arago-qte.bb  | 31
>+++++++++++++---------
> 1 file changed, 19 insertions(+), 12 deletions(-)
>
>diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-
>arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-
>arago-qte.bb
>index 6fcf4b4..960b99b 100644
>--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-
>qte.bb
>+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-
>qte.bb
>@@ -1,15 +1,20 @@
> # Qt Embedded toolchain
> TOOLCHAIN_HOST_TASK ?=3D "nativesdk-packagegroup-arago-qte-
>toolchain-host"
>-TOOLCHAIN_TARGET_TASK ?=3D "packagegroup-arago-qte-toolchain-
>target"
>+TOOLCHAIN_TARGET_TASK ?=3D "${@base_conditional('QT_PROVIDER',
>'qt5', 'packagegroup-arago-qt5-toolchain-target', 'packagegroup-
>arago-qte-toolchain-target', d)}"
> TOOLCHAIN_SUFFIX ?=3D "-qte-sdk"
>
> require meta-toolchain-arago.bb
>
>-PR =3D "r15"
>+PR =3D "r16"
>
>-QT_DIR_NAME =3D "qtopia"
>+# There could be qt5, qt4e and qt4x11 providers, but we don't
>support qt4x11 for now
>+QT_DIR_NAME =3D "${@base_conditional('QT_PROVIDER', 'qt5', 'qt5',
>'qtopia', d)}"
>+QT_BIN_PREFIX =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>"${QT_DIR_NAME}/", '', d)}"
>+QT_BIN_SUFFIX =3D "${@base_conditional('QT_PROVIDER', 'qt5', '',
>'4', d)}"
>+QT_MKSPECS_LOCATION =3D "${@base_conditional('QT_PROVIDER', 'qt5',
>"${libdir}", "${datadir}", d)}"
>
> toolchain_create_sdk_env_script_append() {
>+	echo 'export
>PATH=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_DIR_NAME}:$PATH' >>
>$script
> 	echo 'export OE_QMAKE_CFLAGS=3D"$CFLAGS"' >> $script
> 	echo 'export OE_QMAKE_CXXFLAGS=3D"$CXXFLAGS"' >> $script
> 	echo 'export OE_QMAKE_LDFLAGS=3D"$LDFLAGS"' >> $script
>@@ -19,15 +24,17 @@ toolchain_create_sdk_env_script_append() {
> 	echo 'export OE_QMAKE_AR=3D$AR' >> $script
> 	echo 'export OE_QMAKE_LIBDIR_QT=3D$SDK_PATH_TARGET${libdir}'
>>> $script
> 	echo 'export
>OE_QMAKE_INCDIR_QT=3D$SDK_PATH_TARGET${includedir}/${QT_DIR_NAME}'
>>> $script
>-	echo 'export
>OE_QMAKE_MOC=3D$SDK_PATH_NATIVE${bindir_nativesdk}/moc4' >> $script
>-	echo 'export
>OE_QMAKE_UIC=3D$SDK_PATH_NATIVE${bindir_nativesdk}/uic4' >> $script
>-	echo 'export
>OE_QMAKE_UIC3=3D$SDK_PATH_NATIVE${bindir_nativesdk}/uic34' >>
>$script
>-	echo 'export
>OE_QMAKE_RCC=3D$SDK_PATH_NATIVE${bindir_nativesdk}/rcc4' >> $script
>-	echo 'export
>OE_QMAKE_QDBUSCPP2XML=3D$SDK_PATH_NATIVE${bindir_nativesdk}/qdbuscpp
>2xml4' >> $script
>-	echo 'export
>OE_QMAKE_QDBUSXML2CPP=3D$SDK_PATH_NATIVE${bindir_nativesdk}/qdbusxml
>2cpp4' >> $script
>-	echo 'export
>OE_QMAKE_QT_CONFIG=3D$SDK_PATH_TARGET${datadir}/${QT_DIR_NAME}/mkspe
>cs/qconfig.pri' >> $script
>+	echo 'export
>OE_QMAKE_MOC=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}m
>oc${QT_BIN_SUFFIX}' >> $script
>+	echo 'export
>OE_QMAKE_UIC=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}u
>ic${QT_BIN_SUFFIX}' >> $script
>+	echo 'export
>OE_QMAKE_UIC3=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}
>uic3${QT_BIN_SUFFIX}' >> $script
>+	echo 'export
>OE_QMAKE_RCC=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}r
>cc${QT_BIN_SUFFIX}' >> $script
>+	echo 'export
>OE_QMAKE_QDBUSCPP2XML=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN
>_PREFIX}qdbuscpp2xml${QT_BIN_SUFFIX}' >> $script
>+	echo 'export
>OE_QMAKE_QDBUSXML2CPP=3D$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN
>_PREFIX}qdbusxml2cpp${QT_BIN_SUFFIX}' >> $script
>+	echo 'export
>OE_QMAKE_QT_CONFIG=3D$SDK_PATH_TARGET${QT_MKSPECS_LOCATION}/${QT_DIR
>_NAME}/mkspecs/qconfig.pri' >> $script
> 	echo 'export OE_QMAKE_STRIP=3D"echo"' >> $script
>-	echo 'export
>QMAKESPEC=3D$SDK_PATH_TARGET${datadir}/${QT_DIR_NAME}/mkspecs/linux-
>g++' >> $script
>+	echo 'export
>QMAKESPEC=3D$SDK_PATH_TARGET${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mk
>specs/linux-g++' >> $script
>+	echo 'export QMAKE_DEFAULT_LIBDIRS=3D${QT_QMAKE_LIBDIR_QT}' >>
>$script
>+	echo 'export QMAKE_DEFAULT_INCDIRS=3D${QT_QMAKE_INCDIR_QT}' >>
>$script
>
> 	#Adds qt.conf file that points qmake to properly locate Qt
>library and header files.
> 	#This enables Qt Creator to work properly
>@@ -41,5 +48,5 @@ toolchain_create_sdk_env_script_append() {
>
> 	# make a symbolic link to mkspecs for compatibility with
>Nokia's SDK
> 	# and QTCreator
>-	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf
>usr/share/${QT_DIR_NAME}/mkspecs mkspecs;)
>+	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf
>.${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
> }
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

