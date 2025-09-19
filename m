Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E637FCAC5A8
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 19:18:50 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.4782.1758309530400040721
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 12:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Nf7R16Ll;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58JJInq6781581
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 14:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758309529;
	bh=OU5YdwcNVA3zYDU1kzpz2pfubVEmFabkzcFU/Hh/dJw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Nf7R16LlfJ1/rD0zGfBNNnoAgIJGvQoRnei5F2IxPPLm0MmKikB5gULGT39J+/6JP
	 /RI2GuaIaJoPl+D0gqq1NWKHttaE1EjYIUMb8zmkyKO9mut23/6SoWK8wSWWgPcoEt
	 1xKtry0dVe0VLmZTQTg+H0tPMUJT+fjapCo8rxeA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58JJInaL2551933
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 14:18:49 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 19
 Sep 2025 14:18:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Sep 2025 14:18:49 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58JJInaw3063676;
	Fri, 19 Sep 2025 14:18:49 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH v2 1/2] libsdl2: Add tests package
Date: Fri, 19 Sep 2025 14:18:48 -0500
Message-ID: <20250919191849.2622310-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250919191849.2622310-1-a-christidis@ti.com>
References: <20250919191849.2622310-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 19:18:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16601

From: Antonios Christidis <a-christidis@ti.com>

The software provides tests, configure cmake to build and install them.
Package the tests in -tests package.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v2:
- Fix files not being packaged within sdk. Create custom task specific 
  to class-nativesdk

 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc     | 6 ++++++
 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend | 4 ++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
 create mode 100644 meta-arago-test/recipes-graphics/libsdl2/libsdl2_%.bbappend

diff --git a/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
new file mode 100644
index 00000000..f33ff909
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/libsdl2/libsdl2-ti.inc
@@ -0,0 +1,6 @@
+EXTRA_OECMAKE:append = " -DSDL_TESTS=ON \
+                         -DSDL_INSTALL_TESTS=ON \
+                       "
+PACKAGE_BEFORE_PN = "${PN}-tests"
+FILES:${PN}-tests += "${libexecdir} ${datadir}/installed-tests/SDL2"
+FILES:${PN}-tests:class-nativesdk += "${libexecdir} ${datadir}/installed-tests/SDL2"
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


