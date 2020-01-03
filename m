Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8470152A39
	for <meta-arago@arago-project.org>;
	Fri,  3 Jan 2020 18:58:53 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 003IvAAK031040
	for <meta-arago@arago-project.org>; Fri, 3 Jan 2020 12:57:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578077830;
	bh=FxDSBzUbzqamyMRc5aQU/c/pzvljz1mQdGyg/pa0xj8=;
	h=From:To:CC:Subject:Date;
	b=a93VWiJFSyR1TVzR7x2iJNeAtTsv4Vlptml7TssmZT7oxOVxhIryQ4YL/5L/2mNsm
	KN7HTcp1y3PNomh6S7mT2ZIfQK78mItShgQeG0am7tbKXqA4Hkah24J1pyFAGItX1h
	pJ2eBA3WesRjTKRRoUMVEr7Mm4GPvsP4ezDNggPM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 003IvA3r117855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 3 Jan 2020 12:57:10 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 3 Jan 2020 12:57:10 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 3 Jan 2020 12:57:10 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 003Iv9er001693;
	Fri, 3 Jan 2020 12:57:10 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Jan 2020 18:37:52 +0000
Message-ID: <20200103183752.29919-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] ti-sci-fw: update to 2019.10a
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
X-List-Received-Date: Fri, 03 Jan 2020 18:58:53 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{ti-sci-fw_2019.10.bb => ti-sci-fw_2019.10a.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.10.bb => ti-sci-fw_2019.10a.bb} (95%)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.10.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.10a.bb
similarity index 95%
rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.10.bb
rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.10a.bb
index be57ddb2..c20239b9 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.10.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.10a.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
 
 CLEANBROKEN = "1"
-PR = "r1"
+PR = "r0"
 
 COMPATIBLE_MACHINE = "k3"
 
@@ -15,9 +15,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 TI_SECURE_DEV_PKG ?= ""
 export TI_SECURE_DEV_PKG
 
-SRCREV = "1707a289d55d91ca0dc22a12eb7745914858e2d1"
+SRCREV = "299211f4ed0641f4653d0b7b69ff5a85c42a0268"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "d42023032b2e7d5487aa28cdbd04addfc4d372ff"
+SRCREV_imggen = "fa5f6d7d289b53d74ae14394678b32f5932b658b"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1


