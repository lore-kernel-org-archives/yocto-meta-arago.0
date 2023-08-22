Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D28EE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 01:29:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8000.1692667779098088280
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 18:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fyJhhnAC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37M1TYh0084311;
	Mon, 21 Aug 2023 20:29:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692667774;
	bh=bJAvBbx8zgFmGV1Bm/xYICUE2pyVHfk8dsOlVU3UxCc=;
	h=From:To:CC:Subject:Date;
	b=fyJhhnACfzV4TmU+6eY6jzYyCmLZSBgAgabzEHB0S8n/xirweLzHMCqZnXLqTaWeF
	 o1lioiEU78CBDxk6YOj482Y5jC/GMeLSdkc+VsvMKiVKYzatrmb7reZCxB03TGx1FC
	 RceRNznP/0loU4t/eTsWWffUBYU/kFU3Y23WhbY4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37M1TY4L037152
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Aug 2023 20:29:34 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Aug 2023 20:29:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Aug 2023 20:29:34 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37M1TYwO016768;
	Mon, 21 Aug 2023 20:29:34 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <k-bhargav@ti.com>, <detheridge@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone][PATCH] meta-arago-distro: add meta-clang dependency and llvmpipe
Date: Mon, 21 Aug 2023 20:29:15 -0500
Message-ID: <20230822012914.3184998-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Aug 2023 01:29:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14860

From: Randolph Sapp <rs@ti.com>

Devices that must use software rendering should use llvmpipe over the
default softpipe. There are significant performance improvements
associated with this change for devices like AM62A which lack a GPU.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 4 ++++
 meta-arago-distro/conf/layer.conf        | 1 +
 2 files changed, 5 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 48f053bb..ffa10cfa 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -102,6 +102,10 @@ PACKAGECONFIG:append:pn-piglit = " \
 PACKAGECONFIG:pn-opengl-es-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
 PACKAGECONFIG:pn-vulkan-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
 
+# Use llvmpipe for better performance with software rendering
+PACKAGECONFIG:append:pn-mesa = "gallium-llvm"
+PACKAGECONFIG:append:pn-mesa-pvr = "gallium-llvm"
+
 # Enable encryption support in open62541
 PACKAGECONFIG:append:pn-open62541 = " encrypt"
 
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 5de46fc9..02d5beaa 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -19,6 +19,7 @@ LAYERDEPENDS_meta-arago-distro = " \
     meta-python \
     qt5-layer \
     meta-arago-extras \
+    clang-layer \
 "
 
 LAYERRECOMMENDS_meta-arago-distro = " \
-- 
2.41.0


