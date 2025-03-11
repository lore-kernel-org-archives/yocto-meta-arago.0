Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3812C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 14:37:51 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.10573.1741703867537219529
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 07:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yZ5ryTW9;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BEbjGS740353
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 09:37:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741703865;
	bh=LMFfLw0yOjLSuv8ds/DR2dskKlbVISwHOnfh17tHZ7Q=;
	h=From:To:CC:Subject:Date;
	b=yZ5ryTW9+4ZO9R/p5kqVjolaKz8zDvhEi8EyGs3st8/AO45BFVQbAOTy2ea4wooQU
	 3KtXTrseTumBIZEyMM8q27QLgRkSWR2jRS57soCZ695Uuq9sx/pBfCUU/jEzl69q8/
	 J5QeI3qdL3YuxtbANMbN+EHX0ni/db+YUWfGPCaw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52BEbjQu008515
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 09:37:45 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 09:37:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 09:37:45 -0500
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BEbidT085996;
	Tue, 11 Mar 2025 09:37:45 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] meta-arago-extras: Add recipe for NNShark
Date: Tue, 11 Mar 2025 09:37:44 -0500
Message-ID: <20250311143744.102671-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 14:37:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15969

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-multimedia/nnshark/nnshark_git.bb | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb

diff --git a/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb b/meta-arago-extras/recipes-multimedia/nnshark/nnshark_git.bb
new file mode 100644
index 00000000..1a3d8ad5
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
+SRCREV_FORMAT="default"
+SRCREV_nnshark="bcee91b23a98c981b87051fe1b2ad545991c4aa2"
+SRCREV_common="b64f03f6090245624608beb5d2fff335e23a01c0"
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


