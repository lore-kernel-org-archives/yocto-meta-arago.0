Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D026C30658
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 16:58:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1497.1719593881608686489
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 28 Jun 2024 09:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=x+bNiJDW;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45SGvw7k025887;
	Fri, 28 Jun 2024 11:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719593878;
	bh=iIUxGocURoXbc4meUERO43QlOBHSbV/cT/qyM5Z40gI=;
	h=From:To:CC:Subject:Date;
	b=x+bNiJDWISXZtNLe+tmuitbTi0Cuezyv+kHjeVPk2Y7HR0sBXV6pgecdP5Lwhum3I
	 Ylegg4HNG+ubF3Yzf4wNLsuUdiXkLnsfOl2PU/G9d/LUWDD5X5+h5nsxjomqklb/yk
	 s88hfhRIM0vJJI+y1OBxocATp9nQo49t6i0vV8es=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45SGvwnp109522
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 28 Jun 2024 11:57:58 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Jun 2024 11:57:58 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Jun 2024 11:57:57 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45SGvwg3103639;
	Fri, 28 Jun 2024 11:57:58 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCHv2] vulkan-cts: remove workaround for createMeshShaderMiscTestsEXT
Date: Fri, 28 Jun 2024 11:55:55 -0500
Message-ID: <20240628165554.2970385-2-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 28 Jun 2024 16:58:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15419

From: Randolph Sapp <rs@ti.com>

This change has been introduced into meta-openembedded scarthgap as of
commit: 30c7e5b94f3cdcac3fb46900c54423c976fdafe8

This reverts commit 0aeecfdf013d4b374414897a72a07d5d4ffacd2b.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2: s/952ea2bab1a0d444d48372e88328a9d78ef4e3f8/30c7e5b94f3cdcac3fb46900c54423c976fdafe8/g

Wrong upstream commit hash.

 .../recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend      | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend

diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend b/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend
deleted file mode 100644
index 7af2057f..00000000
--- a/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-# Workaround an optimization bug that breaks createMeshShaderMiscTestsEXT
-OECMAKE_CXX_FLAGS:remove:toolchain-gcc:aarch64 = "-O2"
-- 
2.45.1


