Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEEFCA101D
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 22:19:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.36056.1693952352798048936
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 15:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vi54vIq8;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 385MJ8W3004749;
	Tue, 5 Sep 2023 17:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693952348;
	bh=3YC21pa8b5GzX4rGx/LCh8ZDgnbRCUcDNuvEpjuK6L8=;
	h=From:To:CC:Subject:Date;
	b=vi54vIq8mI1TRXG1pG2/aFArf+e8nYmT7qx2/eLpePSGiTDWEZdxffhlHg3norHno
	 YHBDunsa5jVCMCir3KGUmYigDpy2bRCd5n5yXVoCccdTGjL+qwy2AKc4seJag+t+E4
	 J21Jr4FXSRN7xuEDV0RUeNfeIbesKMv+2ubHs9qo=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 385MJ8dV023932
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Sep 2023 17:19:08 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Sep 2023 17:19:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Sep 2023 17:19:08 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 385MJ8oJ031900;
	Tue, 5 Sep 2023 17:19:08 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [meta-arago][kirkstone][PATCH v3] meta-arago-distro: add meta-clang dependency and llvmpipe
Date: Tue, 5 Sep 2023 17:07:39 -0500
Message-ID: <20230905220738.4169104-2-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Sep 2023 22:19:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14887

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

Use Denys' recommendation with a more verbose variable name.

 meta-arago-distro/conf/distro/arago.conf | 7 +++++++
 meta-arago-distro/conf/layer.conf        | 1 +
 2 files changed, 8 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 48f053bb..81faf7bd 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -102,6 +102,13 @@ PACKAGECONFIG:append:pn-piglit = " \
 PACKAGECONFIG:pn-opengl-es-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
 PACKAGECONFIG:pn-vulkan-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
 
+# Use llvmpipe for better performance with software rendering
+# Only available for armv6+ devices
+MESA_GALLIUM_LLVM_PACKAGECONFIG = "gallium-llvm"
+MESA_GALLIUM_LLVM_PACKAGECONFIG:omapl138 = ""
+PACKAGECONFIG:append:pn-mesa = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
+PACKAGECONFIG:append:pn-mesa-pvr = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
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


