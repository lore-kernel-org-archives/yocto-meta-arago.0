Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B80CA0EE6
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 19:32:17 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.19937.1755286327618850026
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 15 Aug 2025 12:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=as/qW6dr;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57FJW5gP2668539;
	Fri, 15 Aug 2025 14:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755286325;
	bh=bDRp3gMh8LD67hkFksdpYXfBCLu1TkF4rCqSK+nSl90=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=as/qW6drc6LZD1hUiXhTA5A+ZzaWCTP+iZOUj8XVRMh9eNM025l9i6tzTee1xw88X
	 BkFQM7oVZT5ojfqLSMED6adkSg9yYWPmeAyLDJhjjQH153XWZwlpWeLS2nqo0AuNmI
	 5POJSL6RDis4qDHl5jshWDg573pSUXtUgTUqY6GA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57FJW5Q92118177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 15 Aug 2025 14:32:05 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 15
 Aug 2025 14:32:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 15 Aug 2025 14:32:04 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57FJW4oc1745525;
	Fri, 15 Aug 2025 14:32:04 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <a-christidis@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH 1/2] piglit: fix FILESEXTRAPATHS variable
Date: Fri, 15 Aug 2025 14:31:55 -0500
Message-ID: <20250815193156.1982216-2-rs@ti.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815193156.1982216-1-rs@ti.com>
References: <20250815193156.1982216-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 15 Aug 2025 19:32:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16478

From: Randolph Sapp <rs@ti.com>

Explicitly set the package name in the FILESEXTRAPATHS variable used in
piglit-ti.inc.

Using prepend forces early variable evaluation of the PN variable.
Apparently this is so early in the process that it is still using the
default value of "defaultpkgname".

Fixes: e7280032 ("piglit: Wrap the bbappend in a compliant manner")
Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-test/recipes-graphics/piglit/piglit-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-graphics/piglit/piglit-ti.inc b/meta-arago-test/recipes-graphics/piglit/piglit-ti.inc
index fb533533..73df681e 100644
--- a/meta-arago-test/recipes-graphics/piglit/piglit-ti.inc
+++ b/meta-arago-test/recipes-graphics/piglit/piglit-ti.inc
@@ -1,7 +1,7 @@
 # add a config to point piglit at the default install location for deqp tests
 # if they are selected
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/piglit:"
 
 PACKAGECONFIG[deqp-gles] = ",,,opengl-es-cts"
 PACKAGECONFIG[deqp-vk] = ",,,vulkan-cts"
-- 
2.50.1


