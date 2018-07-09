Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7187B529AE
	for <meta-arago@arago-project.org>;
	Mon,  9 Jul 2018 16:12:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w69GClfg055568
	for <meta-arago@arago-project.org>; Mon, 9 Jul 2018 11:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531152767;
	bh=Bo2G1o4zVOHJa/GAdm/N65mUgUdcyEPQfujMiidJjcY=;
	h=From:To:CC:Subject:Date;
	b=JL2GWeMf9W3E9GMYlyezf6aWZnlO8wcllpnzjHjyWG5WzmX+phgIkyNeAc/YEyxaW
	xza0UaISmcGco5ljqBXICnYoASWkmPHy8OH3Ej5jJ9gPFwPqHgTe9YQuNJA7irdSki
	0HJRRv41TiIeopsu55AUAE9yIrMxiOJDnoH1Xc/Y=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w69GClBK021393
	for <meta-arago@arago-project.org>; Mon, 9 Jul 2018 11:12:47 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 9 Jul 2018 11:12:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 9 Jul 2018 11:12:47 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w69GChot030270;
	Mon, 9 Jul 2018 11:12:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Jul 2018 12:01:18 -0400
Message-ID: <1531152078-7592-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [ti2018.01/rocko/master][PATCH] meta-toolchain-arago-qte: update qt.conf
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
X-List-Received-Date: Mon, 09 Jul 2018 16:12:54 -0000
Content-Type: text/plain

* The qt.conf now supports/requires the sysroot option.
* Update relevant paths accordingly.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index 9aa29ca..fdca2c3 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -23,8 +23,9 @@ toolchain_create_sdk_env_script_append() {
 	echo 'export OE_QMAKE_CXX=$CXX' >> $script
 	echo 'export OE_QMAKE_LINK=$CXX' >> $script
 	echo 'export OE_QMAKE_AR=$AR' >> $script
-	echo 'export OE_QMAKE_LIBDIR_QT=$SDK_PATH_TARGET${libdir}' >> $script
-	echo 'export OE_QMAKE_INCDIR_QT=$SDK_PATH_TARGET${includedir}/${QT_DIR_NAME}' >> $script
+	echo 'export OE_QMAKE_PREFIX_QT=${prefix}' >> $script
+	echo 'export OE_QMAKE_LIBDIR_QT=${libdir}' >> $script
+	echo 'export OE_QMAKE_INCDIR_QT=${includedir}/${QT_DIR_NAME}' >> $script
 	echo 'export OE_QMAKE_HOST_BINDIR_QT=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}' >> $script
 	echo 'export OE_QMAKE_MOC=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}moc${QT_BIN_SUFFIX}' >> $script
 	echo 'export OE_QMAKE_UIC=$SDK_PATH_NATIVE${bindir_nativesdk}/${QT_BIN_PREFIX}uic${QT_BIN_SUFFIX}' >> $script
@@ -44,11 +45,12 @@ toolchain_create_sdk_env_script_append() {
 	qt_conf="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/${QT_BIN_PREFIX}qt.conf"
 	touch $qt_conf
 	echo '[Paths]' >> $qt_conf
-	echo 'Prefix = $(SDK_PATH_TARGET)' >> $qt_conf
+	echo 'Prefix = $(OE_QMAKE_PREFIX_QT)' >> $qt_conf
 	echo 'Libraries = $(OE_QMAKE_LIBDIR_QT)' >> $qt_conf
 	echo 'Headers = $(OE_QMAKE_INCDIR_QT)' >> $qt_conf
 	echo 'HostPrefix = $(SDK_PATH_NATIVE)' >> $qt_conf
 	echo 'HostBinaries = $(OE_QMAKE_HOST_BINDIR_QT)' >> $qt_conf
+	echo 'Sysroot = $(SDK_PATH_TARGET)' >> $qt_conf
 
 	# make a symbolic link to mkspecs for compatibility with Qt SDK and QTCreator
 	(cd ${SDK_OUTPUT}/${SDKTARGETSYSROOT}; ln -sf .${QT_MKSPECS_LOCATION}/${QT_DIR_NAME}/mkspecs mkspecs;)
-- 
2.7.4


