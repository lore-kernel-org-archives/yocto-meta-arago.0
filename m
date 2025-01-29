Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED4EC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 00:15:02 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.2173.1738109695646947402
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 16:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pqMBXNIh;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50T0ErPw2048060
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 28 Jan 2025 18:14:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738109693;
	bh=EGVOztnEXQ8uxmnEKAAs2ftmjAfwhCV1UW3cs4j4e88=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pqMBXNIhwwGj3/tiG27gBsuy5s6DcBPlrhdtdOS6FQE4ehAXOdrFLi21Z+0wpOddP
	 AHmtQ1XiBRU1ge3Eu3dK42XHeT4QF4IT81t+ByNvkPmDzep27V9h07Iw7WR7/n6EOp
	 OP6ausRCYtshnS7FVCf5U4k88xjZt8OXfEcqscs0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50T0ErMr005789;
	Tue, 28 Jan 2025 18:14:53 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 Jan 2025 18:14:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 Jan 2025 18:14:52 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50T0Eqe8079301;
	Tue, 28 Jan 2025 18:14:52 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <c-shilwant@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 2/2] meta-arago-test: dynamic layer for qt6 support
Date: Tue, 28 Jan 2025 18:14:48 -0600
Message-ID: <20250129001448.2768568-3-rs@ti.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250129001448.2768568-1-rs@ti.com>
References: <20250129001448.2768568-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Jan 2025 00:15:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15777

From: Randolph Sapp <rs@ti.com>

Add a dynamic layer for Qt6 example applications so we can run a quick
test and see if things are configured correctly.

This is being introduced into test as opposed to the distro layer as
there will soon be automated tests for Qt6, there are no explicit
dependencies for Qt in meta-arago-distro anymore, and the example
applications are currently only necessary for testing.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-test/conf/layer.conf                            | 4 ++++
 .../qt6-layer/recipes-core/packagegroups/ti-test.bbappend  | 7 +++++++
 .../qt6-layer/recipes-qt/qt6/qtbase_%.bbappend             | 3 +++
 3 files changed, 14 insertions(+)
 create mode 100644 meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend
 create mode 100644 meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend

diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/layer.conf
index 1e94c30d..7977a138 100644
--- a/meta-arago-test/conf/layer.conf
+++ b/meta-arago-test/conf/layer.conf
@@ -22,3 +22,7 @@ LAYERDEPENDS_meta-arago-test = " \
     filesystems-layer \
     meta-python \
 "
+
+BBFILES_DYNAMIC += " \
+    qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappend \
+"
diff --git a/meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend b/meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend
new file mode 100644
index 00000000..8d1f95f7
--- /dev/null
+++ b/meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend
@@ -0,0 +1,7 @@
+# Include the examples for Qt6 related tests
+# Include qtwayland for wayland support if the distro enables it
+
+TI_TEST_EXTRAS:append = " \
+    qtbase-examples \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland', '', d)} \
+"
diff --git a/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend b/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend
new file mode 100644
index 00000000..e2799572
--- /dev/null
+++ b/meta-arago-test/dynamic-layers/qt6-layer/recipes-qt/qt6/qtbase_%.bbappend
@@ -0,0 +1,3 @@
+# Include the examples for Qt6 related tests
+
+PACKAGECONFIG:append = " examples"
-- 
2.47.1


