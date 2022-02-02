Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2191.1643826393790378139
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 10:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oNUfyxRA;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 212IQW2i079774;
	Wed, 2 Feb 2022 12:26:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643826392;
	bh=6S3dq+R++QmQv7nEno4AiPPQ1Tmdcy2Ugm2gzwHLU4s=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oNUfyxRAIDB31seogsF0FhFKzQnYzXh7UKCfYTVFE0d7osZKN4lzZYDFxI17vp2cA
	 YB4ApUFHQUY6H/Zo9N360S4hz7GjsSznwuaTEoa3dn52ZYpSzSu9pYdg4wB0wtR3xr
	 uLZWvpqp/ildx8zCnEHJWjU48top88JDG6ZjIyYs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 212IQW1P122845
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 12:26:32 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 12:26:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 12:26:31 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 212IQVsk026173;
	Wed, 2 Feb 2022 12:26:31 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nFKKt-0007Ye-Ny; Wed, 02 Feb 2022 12:26:31 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 10/12] cnm-wave-fw: Fix name of firmware for j721s2
Date: Wed, 2 Feb 2022 12:26:28 -0600
Message-ID: <20220202182630.28943-11-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202182630.28943-1-reatmon@ti.com>
References: <20220202182630.28943-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update the name of the firmware for j721s2 as the file
was renamed.  Also, fix a typo in the variable name.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 6a36d733..3dd0f4f4 100644
--- a/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0"
 
 PV = "${CNM_WAVE521_FW_VERSION}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 CLEANBROKEN = "1"
 
@@ -18,10 +18,11 @@ COMPATIBLE_MACHINE = "j7"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git"
-TARGET_WAVE215C = "wave521c_codec_fw.bin"
+TARGET_WAVE521C = "wave521c_codec_fw.bin"
+TARGET_WAVE521C_j721s2-evm = "wave521c_j721s2_codec_fw.bin"
 
-ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] = "${base_libdir}/firmware/${TARGET_WAVE215C}"
-ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGET_WAVE215C}"
+ALTERNATIVE_LINK_NAME[wave521c_codec_fw.bin] = "${base_libdir}/firmware/${TARGET_WAVE521C}"
+ALTERNATIVE_TARGET[wave521c_codec_fw.bin] = "${base_libdir}/firmware/cnm/${TARGET_WAVE521C}"
 ALTERNATIVE_PRIORITY = "10"
 
 # Set up names for the firmwares
@@ -30,7 +31,7 @@ ALTERNATIVE_${PN}_j7 = "\
 
 do_install() {
 	install -d ${D}${base_libdir}/firmware/cnm
-	install -m 0644 ${S}/cnm/${TARGET_WAVE215C} ${D}${base_libdir}/firmware/cnm/${TARGET_WAVE215C}
+	install -m 0644 ${S}/cnm/${TARGET_WAVE521C} ${D}${base_libdir}/firmware/cnm/${TARGET_WAVE521C}
 }
 
 # make sure that lib/firmware, and all its contents are part of the package
-- 
2.17.1

