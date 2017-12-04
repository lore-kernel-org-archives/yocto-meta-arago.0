Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 6073A52A40
	for <meta-arago@arago-project.org>;
	Mon,  4 Dec 2017 23:17:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB4NGxQV030475
	for <meta-arago@arago-project.org>; Mon, 4 Dec 2017 17:16:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512429419;
	bh=Tpu/BiVfJgvuoZRYqfmJKELSgWBv4Cbrm+SX5oPB3Ak=;
	h=From:To:Subject:Date;
	b=AwbxWzh1RqlZ0h0aMdl5a3892DJMWSJg9fjVFVh6RB5g63rpV2OXeonyhK8QtcRAM
	OGTacmCAWmm9jKVGw+Nq2BM3HlGByRGX5tewvh2t0CCJtmgZeZZ7Byc5wj1X+zBZL8
	QnSamsagMVyg9tUheHck/s8eeyhPVh7LTg1wGq7k=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4NGsKR006011
	for <meta-arago@arago-project.org>; Mon, 4 Dec 2017 17:16:54 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 4 Dec 2017 17:16:54 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 4 Dec 2017 17:16:54 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4NGrr5005732
	for <meta-arago@arago-project.org>; Mon, 4 Dec 2017 17:16:54 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 4 Dec 2017 18:16:38 -0500
Message-ID: <1512429398-11919-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] ti-xsgx-ddk-um: enable script xorg as executable
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
X-List-Received-Date: Mon, 04 Dec 2017 23:17:11 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
index 8bdf4bd..96cbb0e 100644
--- a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
+++ b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
@@ -33,7 +33,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r2"
+PR = "r3"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-xsgx-ddk-um-linux"
 
 DEPENDS += "udev"
@@ -56,7 +56,7 @@ S = "${WORKDIR}/git"
 
 do_install () {
     oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
-    install -m 0644 ${WORKDIR}/xorg ${D}${sysconfdir}/init.d/
+    install -m 0755 ${WORKDIR}/xorg ${D}${sysconfdir}/init.d/
 }
 
 SYSROOT_DIRS_append = "/usr/local"
-- 
1.9.1


