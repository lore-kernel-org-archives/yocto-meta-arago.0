Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858CBC0218C
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 17:52:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.22141.1737481954804567392
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 09:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tHG5o9Xn;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LHqXqs045926
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 11:52:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737481954;
	bh=kF7zKtJyOP8JXIvAoH0jkoyzEOiSsrvItM5sh+e0PuY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tHG5o9XnEzQ/bzQG6YemZAIzuHPORH5wNVRGoowsDdV7f0QpT1dcFF6BWV14uRoV+
	 8K1lWbudfdr2w16ugu4ylmfhtG72beooPYkPoI3YsaZvSIDF5sQEBLN4oKLFVvz8cD
	 b3T41bhRh15lNUzBduCN/2kbJqMQeQ2YhGCtBzvs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50LHqXCX115817
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jan 2025 11:52:33 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 11:52:33 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 11:52:33 -0600
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LHqV9E097709;
	Tue, 21 Jan 2025 11:52:33 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH v2 7/7] ffmpeg: Remove bbappend to disable x264
Date: Tue, 21 Jan 2025 11:52:31 -0600
Message-ID: <20250121175231.27183-7-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250121175231.27183-1-afd@ti.com>
References: <20250121175231.27183-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 17:52:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15726

The x264 codec is no longer enabled by default in oe-core, remove the
extra disabling. The x264 codec is not the only codec that makes this
package license flag commercial, so removing that flag after only
disabling one codec is not correct. All potentially troublesome codecs
should be evaluated before setting LICENSE_FLAGS_ACCEPTED to approve
of the license flags.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Move some LICENSE_FLAGS_ACCEPTED items to previous patch

 meta-arago-distro/conf/distro/arago.conf                 | 9 ++++-----
 .../recipes-multimedia/ffmpeg/ffmpeg_%.bbappend          | 4 ----
 2 files changed, 4 insertions(+), 9 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 033b8fcd..f27a6128 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -163,11 +163,10 @@ require conf/distro/include/branding-${ARAGO_BRAND}.inc
 # Disable meta-virtualization sanity check and warning
 SKIP_META_VIRT_SANITY_CHECK = "1"
 
-# oe-core uses external libav instead of internal libav for gst-ffmpeg. We
-# disable by default the codecs in libav that causes issues with shipping an
-# Arago based SDK. No need to prevent gst-ffmpeg from being used since we
-# disable troublesome software.
-LICENSE_FLAGS_ACCEPTED = "commercial_gstreamer1.0-libav"
+# Codecs in libav and ffmpeg with questionable patent statuses are not
+# included by default. If you enable any of those codecs you should check
+# if the below acceptance flags still work for your software distribution
+LICENSE_FLAGS_ACCEPTED = "commercial_ffmpeg commercial_gstreamer1.0-libav"
 
 # Do not package own copy of perl into devkit, rely on host one
 ASSUME_PROVIDED += "nativesdk-perl"
diff --git a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
deleted file mode 100644
index d2f22d8e..00000000
--- a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-PR:append = ".arago0"
-
-PACKAGECONFIG:remove = "x264"
-LICENSE_FLAGS = ""
-- 
2.39.2


