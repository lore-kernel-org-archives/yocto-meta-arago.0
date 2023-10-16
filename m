Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631A0CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 18:27:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.135055.1697480853607903192
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 11:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nLNe1TyG;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39GIRU7d085289;
	Mon, 16 Oct 2023 13:27:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697480850;
	bh=bWhuaUgOHfQO1JMU63pqFWPOEda1HlBOkbcTsJMP31U=;
	h=From:To:CC:Subject:Date;
	b=nLNe1TyGlKpbIB9xZDxW2U5uomFAL0FPZGrYiBF4m1gW19eTt1LexPA2CM87/VJFS
	 U4H1fQz85j/TWjhiJbixl7Mv09kVuV8p0/7fXhOi2+blWsKBm41s2cPQHnKzWkQWvI
	 MSEz6Nfqo3g44vfT1KqceMftBP6JuTK/KMMiq8nI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39GIRU5R082272
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Oct 2023 13:27:30 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 13:27:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 13:27:30 -0500
Received: from ula0226330.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39GIRUMN123785;
	Mon, 16 Oct 2023 13:27:30 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] pinmux-utility: Remove this package
Date: Mon, 16 Oct 2023 13:27:30 -0500
Message-ID: <20231016182730.20576-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Oct 2023 18:27:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14935

No images include this and the source is long gone anyway, remove this.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../pinmux-utility/pinmux-utility/LICENSE     | 30 ----------------
 .../pinmux-utility_1.0.1076.3.bb              | 34 -------------------
 .../pinmux-utility/pinmux-utility_2.5.2.0.bb  | 24 -------------
 3 files changed, 88 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility/LICENSE
 delete mode 100644 meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.5.2.0.bb

diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility/LICENSE b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility/LICENSE
deleted file mode 100644
index 32f2b0af..00000000
--- a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility/LICENSE
+++ /dev/null
@@ -1,30 +0,0 @@
-This distribution contains contributions or derivatives under copyright
-as follows:
-Copyright (c) 2010, Texas Instruments Incorporated
-All rights reserved.
-Redistribution and use in source and binary forms, with or without
-modification, are permitted provided that the following conditions are
-met:
-- Redistributions of source code must retain the above copyright notice,
-  this list of conditions and the following disclaimer.
-- Redistributions in binary form must reproduce the above copyright
-  notice, this list of conditions and the following disclaimer in the
-  documentation and/or other materials provided with the distribution.
-- Neither the name of Texas Instruments nor the names of its
-  contributors may be used to endorse or promote products derived
-  from this software without specific prior written permission.
-THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS
-AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
-WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
-PARTICULAR PURPOSE ARE DISCLAIMED.
-IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
-BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
-NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
-SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb
deleted file mode 100644
index 0a326a95..00000000
--- a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_1.0.1076.3.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "Texas Instruments Pinmux Utility"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2b328fcf0477d688d8b85f7310f9e6b9"
-COMPATIBLE_MACHINE = "omapl138"
-
-PR = "r0"
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/461/4210/Pin_Setup_AM18xx_01_00_1076_03.zip;name=base;subdir=${P}"
-
-# Temporarily add LICENSE file here since zip files don't contain any license information. This file was grabbed
-# from the License Agreement screen when installing pinmux-utility_2.3.1.0. No license information exist for this
-# version of the pinmux utility.
-SRC_URI += "file://LICENSE"
-
-SRC_URI[base.md5sum] = "5a4eb834bde44c662aaf669882adbfe6"
-SRC_URI[base.sha256sum] = "6701ca0e91761b9eb80b0097fbb2e2ce2cd8e0bcdc0bd18c34cd0221d9d450d0"
-
-S = "${WORKDIR}/${P}"
-
-do_unpack_extra() {
-    mv ${WORKDIR}/LICENSE ${WORKDIR}/${P}
-}
-
-addtask unpack_extra after do_unpack before do_patch
-
-installdir = "host-tools/pinmux_utils/windows"
-
-do_install() {
-    install -d ${D}/${installdir}
-    cp -rf ${S}/bin ${D}/${installdir}/
-    cp -rf ${S}/configurations ${D}/${installdir}/
-}
-
-FILES:${PN} += "${installdir}/*"
diff --git a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.5.2.0.bb b/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.5.2.0.bb
deleted file mode 100644
index 75b5b360..00000000
--- a/meta-arago-extras/recipes-devtools/pinmux-utility/pinmux-utility_2.5.2.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Texas Instruments Pinmux Utility"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d69a4aafe4f7b66d5f9c60d6875ebd52"
-COMPATIBLE_MACHINE = "am335x-evm"
-
-PR = "r0"
-
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1019/6393/PinMuxUtility_v2_05_02_00.zip;name=base;subdir=${P}"
-
-SRC_URI[base.md5sum] = "5a5cb5e9a5361fcb244a4b685872fe6b"
-SRC_URI[base.sha256sum] = "93b8dfd726dd614aad9c2b0bb9ffc0abbd47e1c2900c3f411be7433c6d04fd2a"
-
-S = "${WORKDIR}/${P}"
-
-installdir = "host-tools/pinmux_utils/windows"
-
-do_install() {
-    install -d ${D}/${installdir}
-    install ${S}/Pin_Mux_Utility.msi ${D}/${installdir}
-    install ${S}/setup.exe ${D}/${installdir}
-    install ${S}/Release_Notes.txt ${D}/${installdir}
-}
-
-FILES:${PN} += "${installdir}/*"
-- 
2.39.2


