Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10498C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 20:46:04 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.21286.1741725958228684489
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 13:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Sz5rU/ox;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BKjuGU1293212
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 15:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741725956;
	bh=+qDpo5mPSOsxQsEhVkBy53heHDnwY3KWzdxjUtaAmh0=;
	h=From:To:CC:Subject:Date;
	b=Sz5rU/oxMxTPU4h92OmsWKDy0Z7eX/GbRzdxcvoqxfiLaedX4g04qjOxZZjL8dTaK
	 aXrNZViesiHV7Djc3BiYYKv+lSeRXgFF9zalEwLR5rXhaY1OOw9Y6K9Juko6uDm8jk
	 UCHnbUSRZuKi7GptXMAxyMRZP/os6t8e/mCJdmPc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52BKjuvE128385
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 15:45:56 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 15:45:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 15:45:56 -0500
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BKjtFj098245;
	Tue, 11 Mar 2025 15:45:56 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH v2] meta-arago-extras: Add recipe for NNShark
Date: Tue, 11 Mar 2025 15:45:55 -0500
Message-ID: <20250311204555.2412775-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 20:46:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15988

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Add spaces around "=" to prevent future warning

 .../recipes-multimedia/nnshark/nnshark_git.bb | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb

diff --git a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
new file mode 100644
index 00000000..505aaa4c
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
@@ -0,0 +1,38 @@
+SUMMARY = "A GStreamer NNstreamer pipelines real-time profiling plugin"
+HOMEPAGE = "https://github.com/nnstreamer/nnshark"
+
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e1caa368743492879002ad032445fa97 \
+                    file://COPYING.LESSER;md5=66c40c88533cd228b5b85936709801c8"
+
+SRC_URI = "git://github.com/nnstreamer/nnshark.git;protocol=https;branch=master;name=nnshark \
+           git://github.com/GStreamer/common.git;protocol=https;branch=master;name=common;subdir=${S}/common \
+"
+
+SRCREV_FORMAT = "default"
+SRCREV_nnshark = "bcee91b23a98c981b87051fe1b2ad545991c4aa2"
+SRCREV_common = "b64f03f6090245624608beb5d2fff335e23a01c0"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "\
+    gtk-doc-native \
+    gstreamer1.0 \
+    gstreamer1.0-plugins-base \
+"
+
+inherit pkgconfig autotools-brokensep
+
+EXTRA_OECONF = " \
+        --disable-graphviz \
+        --disable-gtk-doc \
+"
+
+do_configure:prepend() {
+    sh autogen.sh --noconfigure
+}
+
+FILES:${PN} += "\
+       ${libdir}/gstreamer-1.0/libgstsharktracers.so \
+       ${libdir}/gstreamer-1.0/libgstsharktracers.la \
+"
-- 
2.39.2


