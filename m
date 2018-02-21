Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 174CA52983
	for <meta-arago@arago-project.org>;
	Wed, 21 Feb 2018 23:12:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1LNCKva022801
	for <meta-arago@arago-project.org>; Wed, 21 Feb 2018 17:12:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519254740;
	bh=8u1vHMkc0xAx4Iz1eZZs9OWphR2eI74RetE3Z1LWZ7I=;
	h=From:To:Subject:Date;
	b=xkIxpMnxP/X7IqUJ85nX5piJm42ET/mmzIqdp8DPFGgGtFgWrI3eIdNHHt0EOR9gq
	y24pqt3vnr3Slud+1Nwi30OFsl6y8RNkYSniO+8WbPyCGH4Mkd4kYOxPg02pGZ6pZf
	pdwE74wcl7qvfSsfzlhtOqKdt5zcU/WPpb8NcZhs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1LNCKQ8009808
	for <meta-arago@arago-project.org>; Wed, 21 Feb 2018 17:12:20 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Feb 2018 17:12:20 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Feb 2018 17:12:20 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1LNCKwx011430
	for <meta-arago@arago-project.org>; Wed, 21 Feb 2018 17:12:20 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Feb 2018 18:12:01 -0500
Message-ID: <1519254721-4087-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] ti-tisdk-makefile: add am571x-idk-pps.dtb am572x-idk-pps.dtb to KERNEL_DEVICETREE list
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
X-List-Received-Date: Wed, 21 Feb 2018 23:12:47 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index 51e5b6e..e609aae 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk50"
+PR_append = ".tisdk51"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -62,6 +62,8 @@ KERNEL_DEVICETREE_append_am57xx-evm = " \
     am572x-idk-lcd-osd101t2045-jh.dtb \
     am572x-idk-lcd-osd101t2587-jh.dtb \
     am574x-idk-jailhouse.dtb \
+    am571x-idk-pps.dtb \
+    am572x-idk-pps.dtb \
 "
 
 
-- 
1.9.1


