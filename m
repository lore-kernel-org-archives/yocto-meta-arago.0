Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4FBC021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 06:07:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.16353.1741068406615155497
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 03 Mar 2025 22:06:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tpatCj7l;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52466jJs3515457
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 00:06:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741068405;
	bh=rKFwP/HUFTvLV3T/zawhREQHPcxQbBDNHDXusvawqIE=;
	h=From:To:Subject:Date;
	b=tpatCj7lDw76EuDzp357xzccFXpwuVpuFoMzZVky4lGEv9XkzQae0Gm0r3xOuAvOw
	 a339WccK694POUFh7W8K6s1r3tzvFXawumGAWE812rQiPZ9WmBwVjw/0wQ2exTPiBm
	 ay1bW8d6WB9JiRV6dDKvKtfMFP5Q6u8tqIJnJlg4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52466jvx017768
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 00:06:45 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Mar 2025 00:06:45 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Mar 2025 00:06:45 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52466jU5014702
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 00:06:45 -0600
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] meta-arago-test: Add runtime dependencies for pytesseract
Date: Tue, 4 Mar 2025 00:06:45 -0600
Message-ID: <20250304060645.217310-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Mar 2025 06:07:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15936

From: Antonios Christidis <a-christidis@ti.com>

Pytesseract is a python wrapper for tesseract, so it should depend on it.
The pytesseract script calls the python packaging module, so add it as
well as a dependecy.

This is only for scarthgap branch, as the master recipe for this package
is in meta-openembedded.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
index 91350cd5..0f505f63 100644
--- a/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
+++ b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
@@ -7,6 +7,8 @@ HOMEPAGE = "https://github.com/madmaze/pytesseract"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
+RDEPENDS:${PN}:append = "python3-packaging tesseract"
+
 SRC_URI[sha256sum] = "4bf5f880c99406f52a3cfc2633e42d9dc67615e69d8a509d74867d3baddb5db9"
 
 PYPI_PACKAGE = "pytesseract"
-- 
2.34.1


