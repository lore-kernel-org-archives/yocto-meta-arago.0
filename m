Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CC8EB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 13:09:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.16514.1688562578349561155
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 06:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ACoCA7yB;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-luthra@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 365D9ZLm123349;
	Wed, 5 Jul 2023 08:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688562575;
	bh=pMcb7LVNjd2o4ZIldARbC5kTa6CD31XAITnAV9qp7C0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ACoCA7yB4PeHB6Ye1Bb4wnJ2z6NeyncWlJCoJRqKox9LgC3tiBGtmvrRk+ahF99yK
	 dhNr3ZrY0trrOG+onCYAbj6i9GgZEMZyUg4IYHlQXOGk+FsaKS3RAu07uWPorKSJ1s
	 pPAQ0b5OekSrOZWeGNZUcdZD4Kn3Hdj5AH1KORM4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 365D9Zns024598
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Jul 2023 08:09:35 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 08:09:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Jul 2023 08:09:35 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 365D9YtQ026515;
	Wed, 5 Jul 2023 08:09:35 -0500
From: Jai Luthra <j-luthra@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Gyan
 Gupta <g-gupta@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        Chirag
 Shilwant <c-shilwant@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Jai Luthra
	<j-luthra@ti.com>
Subject: [master/kirkstone][PATCH 2/3] libcamera: Add support for TI CSI-RX
Date: Wed, 5 Jul 2023 18:39:27 +0530
Message-ID: <20230705130928.1201894-2-j-luthra@ti.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705130928.1201894-1-j-luthra@ti.com>
References: <20230705130928.1201894-1-j-luthra@ti.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2327; i=j-luthra@ti.com; h=from:subject; bh=p7WU0bpMCSyzC30gtNpXUOAsQapMGDH0R2O5bbnVHfk=; b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBkpWteC/vWmH/oGGZXPbH4YirokszOiMIv62EzU zVWu8KSzSaJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZKVrXgAKCRBD3pH5JJpx RSlQD/sHh7nWGmPC6KfPBhDFNZw9vcGrX/FKQKoY8naEWEaN/VOcvB1QFHpXxsuiBfiSx0zYW5t vCi0mV4f4h5pfaTlwRjIoydK/faYHH11qJi/aaM3Dkw7Y+8S6jnasUCnuINxjeYYbyDDlNFsq/L oT3avh6rfRTugILD5+Rx7/UOiXOCYe3u5Z1smc9FeuN1oNJyZtr7gfnrAQx9bJsooDQqyYJbt/N 8LBbm3d6FULBgILHfakyJpjjiNCFbGYxpp7LxisZKhin00yUQcRBzUxFyfT2rZrTeRq4Ntsbe+J cnDPJnojsXdpjuH0JWE0Y0p4YYmYy21qnxDhuPqV31LAFouSZJX8TpO9RMoVwLtHBbj7E5Iqfnz 9ux4hpyXf0wr6BWqWOW3X7WgveAaGHysEmazID+WaEWFSHgxv9TQwAnzab16tZodFjzfd1l72fT 8mfS9TXutTrStpJ3h+HKPewF+OGHEfZl13vWvE2rB6d1xKccyFBtm7DxThVfsskcdMQWRIbzc1I 5XfXbswbe0CM1c7y66G2Rqx3TnRhJgjzuNe4dNGLUVj9FEY8zOaE7rzvMXpkvI0D9TkM0hOL9wI pzp9AsPD3V/geTI5gk40tLJFF4Mkh0ndREfQyo7LtD/ajulSwyOWAnQV50KVUdXl4AZg9uUIYGg 0eG3SqBco2hyABQ!
 ==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp; fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Jul 2023 13:09:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14749

TI's CSI-RX driver is not yet upstream, so the libcamera simple pipeline
does not recognize it.

Apply a patch to the simple pipeline so that it can recognize the media
entity for TI's CSI-RX driver.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 .../0001-simple-Support-TI-CSI-RX.patch       | 26 +++++++++++++++++++
 .../libcamera/libcamera_0.0.5.bb              |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch

diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
new file mode 100644
index 00000000..66b94863
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
@@ -0,0 +1,26 @@
+From 2a82bce49ce4098ac17b4a654a9db5f2dee56415 Mon Sep 17 00:00:00 2001
+From: Jai Luthra <j-luthra@ti.com>
+Date: Thu, 23 Mar 2023 11:38:46 +0530
+Subject: [PATCH] simple: Support TI CSI-RX
+
+Signed-off-by: Jai Luthra <j-luthra@ti.com>
+---
+ src/libcamera/pipeline/simple/simple.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libcamera/pipeline/simple/simple.cpp b/src/libcamera/pipeline/simple/simple.cpp
+index e1f8b989..520405a1 100644
+--- a/src/libcamera/pipeline/simple/simple.cpp
++++ b/src/libcamera/pipeline/simple/simple.cpp
+@@ -194,6 +194,8 @@ static const SimplePipelineInfo supportedDevices[] = {
+ 	{ "mxc-isi", {} },
+ 	{ "qcom-camss", {} },
+ 	{ "sun6i-csi", {} },
++	{ "j721e-csi2rx", {} },
++
+ };
+ 
+ } /* namespace */
+-- 
+2.41.0
+
diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
index 6ad376f2..b2eb5fac 100644
--- a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
+++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
+        file://0001-simple-Support-TI-CSI-RX.patch \
 "
 
 SRCREV = "fb44403f1c5571549ac128c21daee9761eb9249c"
-- 
2.41.0


