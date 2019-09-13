Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C0A15520DE
	for <meta-arago@arago-project.org>;
	Fri, 13 Sep 2019 14:02:31 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DE1PTQ099096
	for <meta-arago@arago-project.org>; Fri, 13 Sep 2019 09:01:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568383285;
	bh=vdce0YZRAvoz4h325Oygdhz4O/aE5h/AUkEblP5XGYM=;
	h=From:To:CC:Subject:Date;
	b=Z3RgazgURCS+Usf4MtNfpQ4zDNga/3QVS4ikrVq268fZAeVISyvRwc5pPgf+jUsOB
	4U8QYDFlTP56/1i5QqNAk21kkLJF9az/fIalTRm7hok8J2ti7a/OoHS5qXjK403jUV
	MenzPkATlrziWJoVgJgIkVZdAwczkz9EVXN2CADI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DE1P2Z040886
	for <meta-arago@arago-project.org>; Fri, 13 Sep 2019 09:01:25 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 09:01:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 09:01:24 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DE1OPq045346;
	Fri, 13 Sep 2019 09:01:25 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Sep 2019 09:43:15 -0400
Message-ID: <1568382195-29702-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [ti2019.03][PATCH] ti-sci-fw: upgrade to 2019.07a
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
X-List-Received-Date: Fri, 13 Sep 2019 14:02:32 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../{ti-sci-fw_2019.07.bb => ti-sci-fw_2019.07a.bb}          | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.07.bb => ti-sci-fw_2019.07a.bb} (86%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07a.bb
similarity index 86%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07a.bb
index d53e926..60d3fc4 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07a.bb
@@ -14,9 +14,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-SRCREV = "3f7c97c9f923f6fbf1b96dcae1da8620a3bab0b3"
+SRCREV = "fc39e69ec83bfb1c577bcb05cefca4da1172f878"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "38a82e00f84efdf381dba001fff75e8411898e99"
+SRCREV_imggen = "3b4a2007a54db72d8814ecbb2555392863c24935"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
@@ -30,10 +30,10 @@ SRC_URI_append_am65xx-hs-evm = " \
 	http://install.source.dir.local/ti-sci-firmware-am65x-hs-enc.bin;name=hs-enc \
 "
 
-SRC_URI[hs-cert.md5sum] = "e36d9d945b4aa20347470c7c53dbc54a"
-SRC_URI[hs-cert.sha256sum] = "e32182a3b36e5fc9543ca920dafcc2163384e116c88e3c2625399bc1c2ad2f45"
-SRC_URI[hs-enc.md5sum] = "735128f2ac0dafdd44529f243b60a0c6"
-SRC_URI[hs-enc.sha256sum] = "46c2870e133058f68d6b25fd4979a0726b7c6e2a100d48431d47e47db4165c75"
+SRC_URI[hs-cert.md5sum] = "2607900285231ed9e505292d19bd5a22"
+SRC_URI[hs-cert.sha256sum] = "eded0fd276bc25061a95424487653862894b44c13f445a6a7c787f3d1cd758e3"
+SRC_URI[hs-enc.md5sum] = "52ed4f83bdf82e9dc62cb9986b933660"
+SRC_URI[hs-enc.sha256sum] = "51c474c4173b9cf489a7903ffc2d97b7fd6f6a65272cac24047da5d089424832"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


