Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E66ACAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:43:58 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.9383.1759412631446241174
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:43:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cQB0PeVs;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592Dhoxf2841649;
	Thu, 2 Oct 2025 08:43:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759412630;
	bh=ZGXuUXg7Ib6hnMvt/5dncF4baQplTeDrflBw//dew2E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cQB0PeVs5Q+6M1sPkkVLP1a+6XZHajt8Mg9sKN6HJ5auZYHaUfLBbxoOMUXPyq0K7
	 22uuvU3zC7bDZGbmcm1w4Vk/OwdhWchqhSCvEaB6vvfKDRfT1uKgLYYl4rrYV2jb3T
	 Om0rITVLMrmWOu6J/jTnRyYRdE1VSFjKO43Rz7VA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592DhoVr3637677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 2 Oct 2025 08:43:50 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 2
 Oct 2025 08:43:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:43:49 -0500
Received: from ula0226330.lan ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592DhnJH1908767;
	Thu, 2 Oct 2025 08:43:49 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 2/2] meta-arago-extras: hevc-arm-decoder: Remove this recipe
Date: Thu, 2 Oct 2025 08:43:49 -0500
Message-ID: <20251002134349.1818652-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251002134349.1818652-1-afd@ti.com>
References: <20251002134349.1818652-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Oct 2025 13:43:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16667

This was a proprietary HEVC/H.265 decoder for ARM A15 cores. This does
not seem to function anymore and since it was delivered as a binary I
am unable to fix it. Remove this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../hevc-arm-decoder/Testparams.cfg           | 23 ---------
 .../hevc-arm-decoder/hevc-arm-decoder_git.bb  | 51 -------------------
 2 files changed, 74 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder/Testparams.cfg
 delete mode 100644 meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb

diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder/Testparams.cfg b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder/Testparams.cfg
deleted file mode 100644
index 5f018632..00000000
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder/Testparams.cfg
+++ /dev/null
@@ -1,23 +0,0 @@
-# New Input File Format is as follows
-# <ParameterName> = <ParameterValue> # Comment
-################################################################################
-# Parameters
-################################################################################
-#################################### No. of threads ############################
-NumThreads = 2
-################################### Files ######################################
-InputFile   		= /usr/share/ti/video/TearOfSteel-Short-1280x720.265
-OutputFile   		= /usr/share/ti/examples/h265vdec/TearOfSteel-Short-1280x720.yuv
-ReferenceFile   	= /usr/share/ti/video/dummy
-ImageWidth          = 1280  # Image width in Pels
-ImageHeight         = 720   # Image height in Pels
-FramesToDecode      = 50   # Number of frames to be coded
-InputLowDelayMode   = 0     # 0->Entire frame, 1 -> Slice mode (Data sync mode)
-OutputLowDelayMode  = 0     # 0->Entire frame, 1 -> Number of CTU rows (Data sync mode)
-NumCTURows          = 0     # 0->Non-DataSync mode, Non-Zero positive when OutputLowDelayMode is set to Data sync mode
-MetadataType        = 0     # 0->No Metadata, 1-SEI, 2-VUI 3-SEI and VUI
-###################################################################
-# Dynamic Parameters
-###################################################################
-DecodeHeader         = 0    # 0 -> Disable decode Header mode, 1 -> Enable decode Header mode
-
diff --git a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb b/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
deleted file mode 100644
index 995dd6c8..00000000
--- a/meta-arago-extras/recipes-multimedia/hevc-arm-decoder/hevc-arm-decoder_git.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-SUMMARY = "ARM HEVC Decoder with Unit Test Application"
-HOMEPAGE = "https://git.ti.com/processor-sdk/hevc_arm_decoder/"
-LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://Inc/exp_pp_h265decoder.h;beginline=1;endline=27;md5=51a0ae5cca603a21186bf6ff458f3be9"
-PR = "r4"
-
-COMPATIBLE_MACHINE = "dra7xx"
-
-BRANCH = "master"
-
-SRC_URI = "git://git.ti.com/git/processor-sdk/hevc_arm_decode.git;protocol=https;branch=${BRANCH} \
-           file://Testparams.cfg \
-"
-
-SRCREV = "4004c553e672538d0c3b5fa2ea0490ec095d0060"
-
-PV = "01.00.00.01"
-
-do_configure() {
-    sed "s/-lpthread/-pthread/g" -i ${S}/Client/Build/ARM/makefile
-}
-
-do_compile() {
-    cd ${S}/Client/Build/ARM
-    oe_runmake CC="${CC} -fpermissive" LINKER="${CC}"
-}
-
-do_install() {
-    install -d ${D}${libdir}
-    install -m 755 ${S}/Lib/h265vdec_pp_lib.a ${D}${libdir}
-
-    install -d ${D}${includedir}
-    install -m 644 ${S}/Inc/exp_pp_h265decoder.h ${D}${includedir}
-
-    install -d ${D}${bindir}
-    install -m 755 ${S}/Client/Build/ARM/Out/h265vdec_pp ${D}${bindir}
-
-    install -d ${D}${datadir}/ti/examples/h265vdec
-    install -m 644 ${UNPACKDIR}/Testparams.cfg ${D}${datadir}/ti/examples/h265vdec
-
-    install -d ${D}${docdir}/${PN}
-    for doc in ${S}/Docs/*; do
-        install -m 664 ${doc} ${D}${docdir}/${PN}
-    done
-}
-
-FILES:${PN} += "\
-    ${datadir}/ti/*  \
-"
-
-INSANE_SKIP:${PN} += "ldflags"
-- 
2.39.2


