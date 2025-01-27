Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE73C02188
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 17:01:04 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.781.1737997260587794823
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 09:01:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SVWO7r+s;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50RH0xiV1863494
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Mon, 27 Jan 2025 11:00:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737997259;
	bh=a9+roeX35pmlQ13+b4tri+9U2GMJpOuowm9+JRePL6k=;
	h=From:To:Subject:Date;
	b=SVWO7r+sW5GRvbMXQvE0vES/bmOBvgPTaXVDVAiObQv75tUbtEIJSaKxpL0UlhJPr
	 TWiNdG5GT1koaWc8DzQgEZp7dY8VNZMQsPWfuI45C54Td22ytmXpugo4OFaGQem5Yi
	 JBLqHVqGs4cBDO76X7UyW4uutnTnz4N7j2+n6Yv0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50RH0xxj030857
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 27 Jan 2025 11:00:59 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Jan 2025 11:00:59 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Jan 2025 11:00:59 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50RH0xCv126938
	for <meta-arago@lists.yoctoproject.org>; Mon, 27 Jan 2025 11:00:59 -0600
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>
Subject: [PATCH][scarthgap/master] meta-arago-test: Add recipe for pytesseract
Date: Mon, 27 Jan 2025 11:00:59 -0600
Message-ID: <20250127170059.1525548-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 27 Jan 2025 17:01:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15766

From: Antonios Christidis <a-christidis@ti.com>

Recipe builds the python module pytessereact, version 0.3.13.

The module is a wrapper for Google's Tesseract-OCR engine.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../python3-pytesseract/pytesseract_0.3.13.bb      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb

diff --git a/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
new file mode 100644
index 00000000..ff2814f8
--- /dev/null
+++ b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Python-tesseract is an optical character recognition (OCR) tool for python. That is, it will recognize and "read" the text embedded in images."
+
+HOMEPAGE = "https://github.com/madmaze/pytesseract"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[md5sum] = "73f9645e59b437f064d05882b95832ce"
+
+PYPI_PACKAGE = "pytesseract"
+
+inherit pypi setuptools3 
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


