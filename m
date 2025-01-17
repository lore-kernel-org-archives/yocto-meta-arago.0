Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C244C02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 19:04:12 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.2869.1737140645768975315
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 11:04:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ndAn/zLK;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50HJ44ge240137
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 13:04:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737140644;
	bh=sJmjaaYkBuX+POH7Wb0i6tVlXrNsU3+ZIGqX6SX/GsU=;
	h=From:To:CC:Subject:Date;
	b=ndAn/zLKgbtthxNMM4fS4dnaOqFtY1T8bAKJAmFNHMZZ8kfUyrRoEtDdmLMOp2g0E
	 LQ/RUV+BHfXZYcQB5rTsAHeRRBKvcICNi2Ua2vy7cyjvTCkfJ3Hs4llIoLhCDyPiIv
	 d3ym17JUC6nDSnAfKsccHQlTIeVq0CG1gi7Uk3L4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50HJ44An039504
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jan 2025 13:04:04 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 13:04:04 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 13:04:04 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50HJ43eK024103;
	Fri, 17 Jan 2025 13:04:03 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] amsdk-av-files: Remove this recipe
Date: Fri, 17 Jan 2025 13:04:02 -0600
Message-ID: <20250117190402.686979-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Jan 2025 19:04:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15706

These video files were used in a couple demos for multimedia decoders.
They add +50MB at minimum to images that include them and ~200MB of
git download to build. They are unused now so remove this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../packagegroup-arago-tisdk-multimedia.bb    |  1 -
 .../amsdk-av-files/amsdk-av-files_1.4.bb      | 42 -------------------
 2 files changed, 43 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index c6e39aa1..6a1b25b6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -7,7 +7,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 MULTIMEDIA = " \
-    amsdk-av-files \
     ffmpeg \
     libcamera \
     libcamera-gst \
diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
deleted file mode 100644
index 7267668b..00000000
--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION = "AMSDK multimedia support files"
-HOMEPAGE = "https://git.ti.com/processor-sdk/amsdk-av-files/"
-LICENSE = "CC-BY-NC-ND-3.0 & CC-BY-3.0"
-SECTION = "multimedia"
-LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=fe154d291c69c51495a5bb4a456403b5"
-PR = "r2"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-VIDEO_FILES = "video_480p "
-
-VIDEO_FILES:append:ti33x       = "video_wvga \
-                                  video_wqvga"
-VIDEO_FILES:append:ti43x       = "video_wqvga"
-VIDEO_FILES:append:dra7xx      = "video_wvga \
-                                  video_1080p \
-                                  video_720p \
-                                  video_yuv"
-VIDEO_FILES:append:k3          = "video_720p"
-
-BRANCH = "master"
-
-SRC_URI = "git://git.ti.com/git/processor-sdk/amsdk-av-files.git;protocol=https;branch=${BRANCH}"
-SRCREV = "1b73009090265328ebaf1b6c880dfeccae5a8f19"
-
-S = "${WORKDIR}/git"
-
-do_compile() {
-    :
-}
-
-do_install() {
-    install -d ${D}${datadir}/ti \
-       ${D}${datadir}/ti/audio \
-       ${D}${datadir}/ti/video
-    install -m 0644 ${S}/audio/* ${D}${datadir}/ti/audio/
-    for file in ${VIDEO_FILES}; do
-	install -m 0644 ${S}/${file}/* ${D}${datadir}/ti/video/
-    done
-}
-
-FILES:${PN} += "${datadir}/ti/*"
-- 
2.39.2


