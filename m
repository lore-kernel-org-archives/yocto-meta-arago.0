Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A5ECAC5A9
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 22:08:36 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.36379.1758146907382979987
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 15:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oF0ZU5Sf;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HM8Q5I348980
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 17:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758146906;
	bh=DbUNEnu9TlOCOnOGXnn5b8mIIoB4QXQDxs0XjyWxe+E=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=oF0ZU5SffqE31B+2RDP6EJ/ycwdvrT4AHORv4SsrzUdeaV5sE6hVGi9BbutqV6Jpm
	 fky39RQsRm+IObDq/UUJujcrOg2UabeS792LpErfOc4yKQVyNx1uKiH3fdvu6R3BYE
	 eicnDUE6T9LIfwb0RKCnBSSLUlzKBArZt0wBv6TE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HM8QUY2666258
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 17:08:26 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 17:08:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 17:08:26 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HM8QoA4055207;
	Wed, 17 Sep 2025 17:08:26 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH v1 1/2] libsdl2: Add tests package
Date: Wed, 17 Sep 2025 17:08:25 -0500
Message-ID: <20250917220826.2078836-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917220826.2078836-1-a-christidis@ti.com>
References: <20250917220826.2078836-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 17 Sep 2025 22:08:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16586

From: Antonios Christidis <a-christidis@ti.com>

The software provides tests, configure cmake to build and install them.
Package the tests in -tests package.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc     | 5 +++++
 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 ++++
 2 files changed, 9 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend

diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
new file mode 100644
index 00000000..12e06295
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
@@ -0,0 +1,5 @@
+EXTRA_OECMAKE:append = " -DSDL_TESTS=ON \
+                         -DSDL_INSTALL_TESTS=ON \
+                       "
+PACKAGE_BEFORE_PN = "${PN}-tests"
+FILES:${PN}-tests += "${libexecdir} /usr/share/installed-tests/SDL2"
diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
new file mode 100644
index 00000000..385aa801
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend
@@ -0,0 +1,4 @@
+LIBSDL2_TI = ""
+LIBSDL2_TI:ti-soc = "libsdl2-ti.inc"
+
+require ${LIBSDL2_TI}
-- 
2.34.1


