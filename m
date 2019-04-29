Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0251052987
	for <meta-arago@arago-project.org>;
	Mon, 29 Apr 2019 15:38:43 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3TFcHo0045152
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 10:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556552297;
	bh=b0JAS6qvf6lyrtI9bj3PDvK7FnYtbr9btJyY+7SEFaU=;
	h=From:To:Subject:Date;
	b=SkdtMur/ngX1NrohskhYw1dVAagJIdR2wGRH2WNtctt2ftpXP4dfsdCJ16LT2VXAu
	3FAFn3YbQPw+D+ZEYIrK5MO5m6Y96blc+kZc7C2loIUi3eRClqqWw9jylyDwGB1HTQ
	/267nfrwyY46EDjtcC1kEKBHklxlXW2+kL6jOVs4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3TFcHGV025180
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 10:38:17 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Apr 2019 10:38:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Apr 2019 10:38:17 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3TFcH9o047688
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 10:38:17 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 29 Apr 2019 11:38:13 -0400
Message-ID: <20190429153813.40921-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] qtbase: removed unused patches
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
X-List-Received-Date: Mon, 29 Apr 2019 15:38:45 -0000
Content-Type: text/plain

From: Eric Ruei <a0850410@UDA0850410>

Note: This patch has been revised and implemented at meta-qt.

Signed-off-by: Eric Ruei <a0850410@UDA0850410>
---
 recipes-qt/qt5/qtbase_%.bbappend | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/recipes-qt/qt5/qtbase_%.bbappend b/recipes-qt/qt5/qtbase_%.bbappend
index c2ab944..e469528 100644
--- a/recipes-qt/qt5/qtbase_%.bbappend
+++ b/recipes-qt/qt5/qtbase_%.bbappend
@@ -1,21 +1,9 @@
-PR_append = ".tisdk5.5"
+PR_append = ".tisdk5.6"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 GLES_EXTRA_DEPS = "libdrm ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'wayland', '', d)}"
 
-# kms packageconfig requires virtual/mesa
-#
-# Seems that there is a patch missing on morty which exists for both krogoth and
-# master. (63f018e5a795e30f913ead00e840ad3263cb0edf)
-#
-# Implement the patch here
-PACKAGECONFIG[kms] = "-kms,-no-kms,drm virtual/egl"
-PACKAGECONFIG += "kms"
-
-PACKAGECONFIG[gbm] = "-gbm,-no-gbm,drm virtual/egl"
-PACKAGECONFIG += "gbm"
-
 QT_NOSGX_PATCHES = "\
     file://0001-calculator-Add-exit-button-for-non-window-environmen.patch \
     file://0002-animatedtiles-Add-exit-button-for-non-window-environ.patch \
-- 
2.17.1


