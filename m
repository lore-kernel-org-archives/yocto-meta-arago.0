Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA955C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 17:36:18 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.87330.1753724170222645892
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 10:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ROYOpZmb;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SHa9Ir2810588;
	Mon, 28 Jul 2025 12:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753724169;
	bh=AjMd7q5LZJYwxTKCtmHElzu6hi9cPlu23Y9qRxMesk4=;
	h=From:To:CC:Subject:Date;
	b=ROYOpZmbC01jN/8K8NpgOrjEAds8VHBsitb0pBTJcTlIFbFeGuHIQxBWagemNob5P
	 ENwGo7228331OOdlNCAdS0vmrVmRua5z4BxXdONcsLOSq7CLeoi9v74fqGqk0J3jqD
	 Ye97IV61XbiHdjOpwGeQDkGNQRdeIhWzPCxBDARE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SHa9uF466764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 12:36:09 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 12:36:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 12:36:08 -0500
Received: from ula0226330.lan ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SHa8LQ2426583;
	Mon, 28 Jul 2025 12:36:08 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH] arago.conf: Enable GStreamer based video for kmscube
Date: Mon, 28 Jul 2025 12:36:08 -0500
Message-ID: <20250728173608.575863-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Jul 2025 17:36:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16329

Enable the video playback for kmscube. This is a great way to show off our
video Codecs and how they can interact with our GPU with zero-copy buffer
passing. Enable this here.

While here, since kmscube often runs against the bare KMS/GBM backend,
enable the same support for GStreamer which allows for it to use GBM
EGL contexts.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index ce028587..61041568 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -103,6 +103,9 @@ PACKAGECONFIG:append:pn-openssl = " cryptodev-linux"
 # Enable GST_TRACER logging in gstreamer
 PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks coretracers"
 
+# Enable GBM in gstreamer
+PACKAGECONFIG:append:pn-gstreamer1.0-plugins-base = " gbm"
+
 # Enable kmssink in gstreamer
 PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"
 
@@ -113,6 +116,9 @@ PACKAGECONFIG:append:pn-libcamera = " gst"
 PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
 RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
 
+# Enable gstreamer based video for kmscube
+PACKAGECONFIG:append:pn-kmscube = " gstreamer"
+
 # Configure RAMFS for jailhouse linux-demo
 JH_RAMFS_IMAGE = "tisdk-jailhouse-inmate"
 
-- 
2.39.2


