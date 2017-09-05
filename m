Return-Path: <manishalocal@uda0393239>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 710E0529AF
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 17:09:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85H9TIs014159
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504631369;
	bh=+5ZouJRgJ8Z/yVwvVv7q4XxhcIZi8vSaQMvfhEnA0Iw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lwTaEcqrce19O0yuGvfKXRUc3aYTpBSxWRha0xU4BKmjkF5lx3H39em0jWLi9i2A8
	hvsNdp9Is0dhmajTwUCxz/A3MIHaWjDNn24ok78oT3cd5eGHBJalVPBVaKc1ueJhoq
	+GK4ajO9IGBjzKldEBdLBj+A1cSJhvoUL1DyMKlc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85H9Tom010550
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:09:29 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 12:09:29 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 12:09:29 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85H9Tt5016192;
	Tue, 5 Sep 2017 12:09:29 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dpHLs-0003Y2-TO; Tue, 05 Sep 2017 12:09:28 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Sep 2017 12:09:25 -0500
Message-ID: <20170905170926.13566-7-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170905170926.13566-1-manisha.agrawal@ti.com>
References: <20170905170926.13566-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v4 7/8] tisdk-rootfs-image: add evse-hmi packagegroup
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
X-List-Received-Date: Tue, 05 Sep 2017 17:09:29 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-core/images/tisdk-rootfs-image.bbappend | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/recipes-core/images/tisdk-rootfs-image.bbappend b/recipes-core/images/tisdk-rootfs-image.bbappend
index d4b08cc..7346c0d 100644
--- a/recipes-core/images/tisdk-rootfs-image.bbappend
+++ b/recipes-core/images/tisdk-rootfs-image.bbappend
@@ -1,4 +1,15 @@
 PR_append = ".tisdk4"
 
-IMAGE_INSTALL_append_ti43x = " packagegroup-arago-tisdk-graphics"
-IMAGE_INSTALL_append_ti33x = " packagegroup-arago-tisdk-graphics"
+IMAGE_INSTALL_append_ti43x = " \
+	packagegroup-arago-tisdk-graphics \
+        packagegroup-arago-tisdk-hmi \
+"
+IMAGE_INSTALL_append_ti33x = " \
+  	packagegroup-arago-tisdk-graphics \
+        packagegroup-arago-tisdk-hmi \
+"
+
+
+IMAGE_INSTALL_append_omap-a15 = " \
+  	packagegroup-arago-tisdk-hmi \
+"
-- 
2.13.0


