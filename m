Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A88E552960
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2019 13:35:15 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KDY7B1114330
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 08:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568986447;
	bh=LPYKDnmFVrXULYj9F98R5KTnMuHlX8d67d8ijAS0gDA=;
	h=From:To:CC:Subject:Date;
	b=uXYf3EEGFxjWmD8egwbvMf0DdKzRiW3004EUxDw2dJeZ+oFhJlvhNIufyEV8IJVpt
	7ZM+ABRQQOc0Tsh5JASG2m7esxcIYyl89CzLF7zMA0KVRX2X37I1W3zg/LkmeGrNZB
	kEsk3dTTAdzWBmchE4ZlbEOTJQthi9PDHcZpriwA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KDY7bs053266
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 08:34:07 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 20 Sep 2019 08:34:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 20 Sep 2019 08:34:07 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KDY6ZB077152;
	Fri, 20 Sep 2019 08:34:06 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Sep 2019 09:16:05 -0400
Message-ID: <1568985365-31665-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/ti2019.03][PATCH] meta-toolchain-arago-qte: add quotes to vars
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
X-List-Received-Date: Fri, 20 Sep 2019 13:35:16 -0000
Content-Type: text/plain

* Add quotes around values which may contain spaces

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago-qte.bb              | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index b03b639..d313939 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -5,7 +5,7 @@ TOOLCHAIN_SUFFIX ?= "-qte-sdk"
 
 require meta-toolchain-arago.bb
 
-PR = "r19"
+PR = "r20"
 
 # There could be qt5, qt4e and qt4x11 providers, but we don't support qt4x11 for now
 QT_DIR_NAME = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'qtopia', d)}"
@@ -19,10 +19,10 @@ toolchain_create_sdk_env_script_append() {
 	echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
 	echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
 	echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
-	echo 'export OE_QMAKE_CC=$CC' >> $script
-	echo 'export OE_QMAKE_CXX=$CXX' >> $script
-	echo 'export OE_QMAKE_LINK=$CXX' >> $script
-	echo 'export OE_QMAKE_AR=$AR' >> $script
+	echo 'export OE_QMAKE_CC="$CC"' >> $script
+	echo 'export OE_QMAKE_CXX="$CXX"' >> $script
+	echo 'export OE_QMAKE_LINK="$CXX"' >> $script
+	echo 'export OE_QMAKE_AR="$AR"' >> $script
 	echo 'export OE_QMAKE_PREFIX_QT=${prefix}' >> $script
 	echo 'export OE_QMAKE_LIBDIR_QT=${libdir}' >> $script
 	echo 'export OE_QMAKE_INCDIR_QT=${includedir}/${QT_DIR_NAME}' >> $script
-- 
2.7.4


