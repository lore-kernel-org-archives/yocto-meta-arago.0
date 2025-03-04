Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CAFC021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 20:54:08 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.33397.1741121639228468277
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 04 Mar 2025 12:53:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HCAEY1O7;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 524Krw6C3082133
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 14:53:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741121638;
	bh=2jf0JZyCLQNqdwo0gLS2OvXx+e40kdq6dlUIhqFp50w=;
	h=From:To:Subject:Date;
	b=HCAEY1O7ub1K2PtfxD2tzqCBf799ZgLf1P56qif6g5jW5vhT0Nge4VVdNBj7n6cV5
	 iMiTrjjm/2wI7O28sJ1v/MbtgJQCbVtZX5Qgmrli3ckabvm+7+6AWtAaWpRkueig2R
	 ONgIE3pzxs6+O4xbWGSTD7c5w9QuViI3gJfdPxIo=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 524Krwqg022164
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 4 Mar 2025 14:53:58 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Mar 2025 14:53:58 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Mar 2025 14:53:58 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 524KrwV9118521;
	Tue, 4 Mar 2025 14:53:58 -0600
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH v2] pytesseract: Add runtime dependencies
Date: Tue, 4 Mar 2025 14:53:58 -0600
Message-ID: <20250304205358.268668-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 04 Mar 2025 20:54:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15938

From: Antonios Christidis <a-christidis@ti.com>

Pytesseract is a python wrapper for tesseract, so it should depend on it.
The pytesseract script calls the python packaging module, so add it as
well as a dependecy.

This is only for scarthgap branch, as the master recipe for this package
is in meta-openembedded.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---

v2: 
- Updated subject to start off with recipe name that is changed 

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


