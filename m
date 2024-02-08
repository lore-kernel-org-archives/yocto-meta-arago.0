Return-Path: <s-adivi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6E5C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 07:38:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.12854.1707377899802428852
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Feb 2024 23:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=snrJzDTJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-adivi@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4187cHqU038021;
	Thu, 8 Feb 2024 01:38:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707377897;
	bh=/bt1j34dg+6rPjr8D+zo//Mc7SNdNxyGeUIfYY278B8=;
	h=From:To:CC:Subject:Date;
	b=snrJzDTJxtpQkyZKC6g1ZGTB28B30gR5AAKXakVvXnGcYjoUC9sellJJ52/zAyZo0
	 feyBSbpZi36Nx/q6jvAbAD6YpTNKfuf1Fo0k6h28WnN7BJIfYc7lfOpbFz5GnkVShn
	 wBSRHDOhutsvXkPmu2gSBrAOrqq24sWErQYb2rQQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4187cHY8089874
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 01:38:17 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 01:38:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 01:38:17 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4187cGOC004679;
	Thu, 8 Feb 2024 01:38:17 -0600
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>
CC: <g-gupta@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>,
        <a-limaye@ti.com>, <s-adivi@ti.com>
Subject: [meta-arago][kirkstone/master][PATCH v2] packagegroup: graphics-sdk-target: Add GLES3 headers
Date: Thu, 8 Feb 2024 13:08:06 +0530
Message-ID: <20240208073806.2072814-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Feb 2024 07:38:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15134

GLES3 headers are missing in the linux-devkit/sysroots since 09.00.
These are needed for cross compiling QT, OpenGLES and other graphics applications.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
v2 : 
* Added target branch in subject
 .../packagegroup-arago-tisdk-graphics-sdk-target.bb              | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index acb06558..6f576a18 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -9,6 +9,7 @@ inherit packagegroup
 RDEPENDS:${PN} = "\
     libegl-dev \
     libdrm-dev \
+    libgles3-mesa-dev \
     wayland-dev \
     weston-dev \
     ${@bb.utils.contains('MACHINE_FEATURES', 'gc320', 'ti-gc320-libs-dev', '', d)} \
-- 
2.34.1


