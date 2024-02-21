Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF219C48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 11:17:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.10635.1708514274352241203
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Feb 2024 03:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OC6vc74m;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41LBHoak098302;
	Wed, 21 Feb 2024 05:17:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708514270;
	bh=bG0juRsctktjzc0pMvj09JLRgKYL/5b35DPhSRzLlmc=;
	h=From:To:CC:Subject:Date;
	b=OC6vc74myhRVZdaQl0SvJhWql8bLPdn/Ky0O/e+3TTse14Ti6vBgMCdzTmuDvRrG/
	 Z05ew+ezOIzHFMQAhUzuq0HIrXv6ZdEOXsY2sqINKFf1+WWH7eD2RrnuNUVenJ4wOX
	 zyiX5byWIMs61+TGpwpYD6hCvKL/qQbmIFwNxuWw=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41LBHoiD009414
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Feb 2024 05:17:50 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Feb 2024 05:17:50 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Feb 2024 05:17:50 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41LBHngM092749;
	Wed, 21 Feb 2024 05:17:49 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>, <khasim@ti.com>
Subject: [kirkstone][PATCH] Add a new initramfs image for jailhouse linux demo
Date: Wed, 21 Feb 2024 16:45:51 +0530
Message-ID: <20240221111551.320945-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Feb 2024 11:17:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15208

Add a new jailhouse-inmate image which will be used as initramfs
for jailhouse linux demo. This image will contain some additional
applications and packages need for OOB demo.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf         |  2 +-
 .../images/tisdk-jailhouse-inmate.bb             | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 2a2b827f..e46ebd26 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -138,7 +138,7 @@ PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
 RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
 
 # Configure RAMFS for jailhouse linux-demo
-JH_RAMFS_IMAGE = "tisdk-tiny-initramfs"
+JH_RAMFS_IMAGE = "tisdk-jailhouse-inmate"
 
 # Enable UI and scripting for perf
 PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
new file mode 100644
index 00000000..57efd009
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-inmate.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Arago TI SDK super minimal base image for jailhouse linux demo"
+
+DESCRIPTION = "Image meant for basic boot of linux inmate for jailhouse\
+This image is derived from tisdk-tiny-initramfs and contains additional\
+packages for OOB demo.\
+"
+
+require recipes-core/images/tisdk-tiny-initramfs.bb
+
+COMPATIBLE_MACHINE = "am62xx|am62pxx"
+
+IMAGE_FSTYPES += "cpio"
+
+PACKAGE_INSTALL += "jailhouse-inmate"
+
+export IMAGE_BASENAME = "tisdk-jailhouse-inmate"
-- 
2.34.1


