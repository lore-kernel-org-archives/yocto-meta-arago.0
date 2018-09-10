Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 1071A52985
	for <meta-arago@arago-project.org>;
	Mon, 10 Sep 2018 18:11:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8AIBLOR003823
	for <meta-arago@arago-project.org>; Mon, 10 Sep 2018 13:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536603081;
	bh=hha0uxwn0myREnvAYW32nuIEU7aaEkpbG0Ni8ubDkyE=;
	h=From:To:CC:Subject:Date;
	b=SXXsJwlIdSIzMMJXZ1jp1FX593h1h/vjlJpYOJw1nclkpGBNDMT/PEsj6xc+9HLvg
	3KFeAryW8CzqBju5ncC7hBqIQGrrG+U1KFNuXAQMfZAGFKKaQAd2Na3pk2yNSrXgyB
	5BW9jKXPMWNEs37ez/v6fb5gGMSAbU6p0A0zVpis=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AIBKw3026777
	for <meta-arago@arago-project.org>; Mon, 10 Sep 2018 13:11:20 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 10 Sep 2018 13:11:20 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 10 Sep 2018 13:11:21 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AIBK9p015837;
	Mon, 10 Sep 2018 13:11:20 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Sep 2018 14:11:17 -0400
Message-ID: <1536603077-4525-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] pru-adc: install the arm binary with pru-adc added for the naming
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
X-List-Received-Date: Mon, 10 Sep 2018 18:11:30 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-apps/pru-adc/pru-adc_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-apps/pru-adc/pru-adc_git.bb b/recipes-apps/pru-adc/pru-adc_git.bb
index 5525e48..86148da 100644
--- a/recipes-apps/pru-adc/pru-adc_git.bb
+++ b/recipes-apps/pru-adc/pru-adc_git.bb
@@ -1,4 +1,4 @@
-UMMARY = "PRU Multi-channel ADC Interface Reference Design"
+SUMMARY = "PRU Multi-channel ADC Interface Reference Design"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PRUMulti-channelADCInterfaceReferen_manifest.html;md5=1302c86d3951a0d1254e1805158ccf2e"
 
@@ -9,7 +9,7 @@ inherit update-alternatives
 COMPATIBLE_MACHINE = "am335x-evm"
 
 PV = "1.0"
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/apps/tida01555.git;protocol=git;branch=${BRANCH}"
@@ -32,8 +32,9 @@ do_install() {
     install -m 0644 PRU_ADS8688_Interface/gen/PRU_ADS8688_Interface.out ${D}${base_libdir}/firmware/pru
 # install binary and scripts
     install -d ${D}${bindir}
-    install -m 755 ARM_User_Space_App/gen/ARM_User_Space_App.out ${D}${bindir}
+    install -m 755 ARM_User_Space_App/gen/ARM_User_Space_App.out ${D}${bindir}/pru-adc-arm-app.out
     install -m 755 run.sh ${D}${bindir}/run-pru-adc.sh
+    sed -i 's|./ARM_User_Space_App.out|/usr/bin/pru-adc-arm-app.out|g' ${D}${bindir}/run-pru-adc.sh
 }
 
 FILES_${PN} += "${base_libdir}/firmware"
-- 
1.9.1


