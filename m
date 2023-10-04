Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A123E8FDC3
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 01:15:04 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9114.1696382097203149469
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 18:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=p4HhXjx3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3941Es76004327;
	Tue, 3 Oct 2023 20:14:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696382094;
	bh=KGNSqcGAFZgZ+juqA4zw9rPtVR7P2QF0UReffszCb4s=;
	h=From:To:Subject:Date;
	b=p4HhXjx3EDTsYEUx6VbUp1AiM7yTYRadwKRtmBUd2OEDnyiauPUdcyMdjCLR9frYl
	 TDFOywNEF8kIX7kD/NNprusW7JKDCzPim/iHnVssVYYVdXXAAfNbLn/E5TB69GvxNB
	 p7huAcRUdEnt64t2UCnHzqXmMYifOQALyUiE2rhc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3941Esa3105484
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Oct 2023 20:14:54 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Oct 2023 20:14:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Oct 2023 20:14:54 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3941EsCQ006977;
	Tue, 3 Oct 2023 20:14:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qnqTW-0007OP-13; Tue, 03 Oct 2023 20:14:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v2] conf: Temporarily disable meta-clang
Date: Tue, 3 Oct 2023 20:14:53 -0500
Message-ID: <20231004011453.28378-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Oct 2023 01:15:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14915

We are seeing a performance issue on am335x related to the meta-clang
layer.  We need to temporarily disable the layer so that we can make a
release  while we track down the source of the issue.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Remove trailing / on commented out line.

 meta-arago-distro/conf/distro/arago.conf | 8 ++++----
 meta-arago-distro/conf/layer.conf        | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index d49cacbe..8232ca27 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -103,10 +103,10 @@ PACKAGECONFIG:pn-vulkan-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland"
 
 # Use llvmpipe for better performance with software rendering
 # Only available for armv6+ devices
-MESA_GALLIUM_LLVM_PACKAGECONFIG = "gallium-llvm"
-MESA_GALLIUM_LLVM_PACKAGECONFIG:omapl138 = ""
-PACKAGECONFIG:append:pn-mesa = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
-PACKAGECONFIG:append:pn-mesa-pvr = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
+#MESA_GALLIUM_LLVM_PACKAGECONFIG = "gallium-llvm"
+#MESA_GALLIUM_LLVM_PACKAGECONFIG:omapl138 = ""
+#PACKAGECONFIG:append:pn-mesa = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
+#PACKAGECONFIG:append:pn-mesa-pvr = " ${MESA_GALLIUM_LLVM_PACKAGECONFIG}"
 
 # Enable encryption support in open62541
 PACKAGECONFIG:append:pn-open62541 = " encrypt"
diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 02d5beaa..ca56a0c9 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -19,8 +19,8 @@ LAYERDEPENDS_meta-arago-distro = " \
     meta-python \
     qt5-layer \
     meta-arago-extras \
-    clang-layer \
 "
+# clang-layer
 
 LAYERRECOMMENDS_meta-arago-distro = " \
     browser-layer \
-- 
2.17.1


