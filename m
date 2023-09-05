Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDA3CA100A
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 20:19:25 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.32798.1693945162189990684
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 13:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qXq5ZBcC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 385KJJCD111670;
	Tue, 5 Sep 2023 15:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693945159;
	bh=fwM9x7P5hQrGpvecBtRrCR7kmHKa4yJNEKv4lhQqjgc=;
	h=From:To:CC:Subject:Date;
	b=qXq5ZBcCm1RK09r5bECREvxX8Gc0hU8PoyUwmjehKnOgD27MMJyshnPM7PnD6xYlf
	 x/bMRRVBcIlDs2uGQSdvZHBWhj6gMkLxMPurS+KvGJbDHVUNZX8Hq7LDa2+SnwpxlK
	 SaHmQ6cq2Lj/wCcDfsxVcpQKjcPoovdzB0iCz0e0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 385KJJFU110052
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Sep 2023 15:19:19 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Sep 2023 15:19:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Sep 2023 15:19:18 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 385KJIAH001482;
	Tue, 5 Sep 2023 15:19:18 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [meta-arago][kirkstone][PATCH v2] meta-arago-distro: add meta-clang dependency and llvmpipe
Date: Tue, 5 Sep 2023 15:18:53 -0500
Message-ID: <20230905201852.4056578-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Sep 2023 20:19:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14884

From: Randolph Sapp <rs@ti.com>

Devices that must use software rendering should use llvmpipe over the
default softpipe. There are significant performance improvements
associated with this change for devices like AM62A which lack a GPU.

This, unfortunately is only available on armv6+ devices so we'll
conditionally drop this for the omapl138 device. (I'd switch this
directly based on platform architecture but this doesn't appear to work
correctly for PACKAGECONFIG strings in the distro.conf)

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 7 +++++++
 meta-arago-distro/conf/layer.conf        | 1 +
 2 files changed, 8 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 48f053bb..b029360b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -102,6 +102,13 @@ PACKAGECONFIG:append:pn-piglit = " \
 PACKAGECONFIG:pn-opengl-es-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
 PACKAGECONFIG:pn-vulkan-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
 
+# Use llvmpipe for better performance with software rendering
+# Only available for armv6+ devices
+PACKAGECONFIG:append:pn-mesa = " gallium-llvm"
+PACKAGECONFIG:remove:pn-mesa:omapl138 = " gallium-llvm"
+PACKAGECONFIG:append:pn-mesa-pvr = " gallium-llvm"
+PACKAGECONFIG:remove:pn-mesa-pvr:omapl138 = " gallium-llvm"
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


