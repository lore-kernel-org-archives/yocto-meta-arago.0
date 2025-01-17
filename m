Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4643EC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 21:20:03 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.5927.1737148794598542079
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 13:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nZ+KQKUb;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50HLJrMI252483
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 17 Jan 2025 15:19:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737148793;
	bh=i/vAMqIj++VAahgy74KI0MDgp+iJ1rjU03vdlFJyYb4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nZ+KQKUb0+gO/jz1QMgIzPwDtJzsFiOnyu2yGvUo6Ft/wUAnZW1lAKfgszqatNNvo
	 8KPvI5XwHZJyxQMJ3vboJeSci7RMYvGuftR8CSG2dPUfXadx0Lga70RGMcp+7St4IA
	 jRAa1xgRQvk8NsoNq7kOWUpCUZ672Pwm4UvlzR/M=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50HLJrFY075175;
	Fri, 17 Jan 2025 15:19:53 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 15:19:53 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 15:19:53 -0600
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50HLJp5i030757;
	Fri, 17 Jan 2025 15:19:52 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH 5/5] ffmpeg: Remove bbappend to disable x264
Date: Fri, 17 Jan 2025 15:19:51 -0600
Message-ID: <20250117211951.698377-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250117211951.698377-1-afd@ti.com>
References: <20250117211951.698377-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 17 Jan 2025 21:20:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15711

The x264 codec is no longer enabled by default in oe-core, remove the
extra disabling. The x264 codec is not the only codec that makes this
package license flag commercial, so removing that flag after only
disabling one codec is not correct. All potentially troublesome codecs
should be evaluated before setting LICENSE_FLAGS_ACCEPTED to approve
of the license flags.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                 | 9 ++++-----
 .../recipes-multimedia/ffmpeg/ffmpeg_%.bbappend          | 4 ----
 2 files changed, 4 insertions(+), 9 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index baa526a9..85c7ddd1 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -164,11 +164,10 @@ require conf/distro/include/branding-${ARAGO_BRAND}.inc
 # Disable meta-virtualization sanity check and warning
 SKIP_META_VIRT_SANITY_CHECK = "1"
 
-# oe-core uses external libav instead of internal libav for gst-ffmpeg. We
-# disable by default the codecs in libav that causes issues with shipping an
-# Arago based SDK. No need to prevent gst-ffmpeg from being used since we
-# disable troublesome software.
-LICENSE_FLAGS_ACCEPTED = "commercial_gst-ffmpeg commercial_gstreamer1.0-libav commercial_faad2 non-commercial_netperf"
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


