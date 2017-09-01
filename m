Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id F197B52A8A
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 21:17:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81LHkBV020029
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504300666;
	bh=2eQZ6QMp/0fvK5ZP1VYe6a/8vTCEk0a83mlG0HE0gtQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=E5loWVZOCw4ZMW1CYv3Zahg4ObmGOa40CTtgAMJ50fCrViQ0g8lPT2x9ch6LgABT8
	wRtCxw8NFE86ETVZFUjkj5gZPN99Glw+utQRMaX/oO3ePWhYfkVl+cmq/9fzP48Cpk
	oawQ/da83ApJeIFM2TLIHBXh5Tlc6OxYB+yQfPIw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LHjwO004610
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:17:45 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 16:17:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 16:17:45 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LHjV8027467;
	Fri, 1 Sep 2017 16:17:45 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dntJx-0006tk-Jq; Fri, 01 Sep 2017 16:17:45 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 16:17:41 -0500
Message-ID: <20170901211741.26451-7-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901211741.26451-1-manisha.agrawal@ti.com>
References: <20170901211741.26451-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v3 7/7] tisdk-rootfs-image: add evse-hmi packagegroup
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
X-List-Received-Date: Fri, 01 Sep 2017 21:17:46 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-core/images/tisdk-rootfs-image.bbappend | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/recipes-core/images/tisdk-rootfs-image.bbappend b/recipes-core/images/tisdk-rootfs-image.bbappend
index d4b08cc..e97ce61 100644
--- a/recipes-core/images/tisdk-rootfs-image.bbappend
+++ b/recipes-core/images/tisdk-rootfs-image.bbappend
@@ -1,4 +1,15 @@
 PR_append = ".tisdk4"
 
-IMAGE_INSTALL_append_ti43x = " packagegroup-arago-tisdk-graphics"
-IMAGE_INSTALL_append_ti33x = " packagegroup-arago-tisdk-graphics"
+IMAGE_INSTALL_append_ti43x = " 
+	packagegroup-arago-tisdk-graphics \
+        packagegroup-arago-tisdk-hmi \
+"
+IMAGE_INSTALL_append_ti33x = " 
+  	packagegroup-arago-tisdk-graphics \
+        packagegroup-arago-tisdk-hmi \
+"
+
+
+IMAGE_INSTALL_append_omap-a15 = " 
+  	packagegroup-arago-tisdk-hmi \
+"
-- 
2.13.0


