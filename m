Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87320C43217
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:25:32 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.10760.1648128331229321005
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 06:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nuyeZMxi;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPSqV011822;
	Thu, 24 Mar 2022 08:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648128328;
	bh=Q3ZE6ANPQF9Nl8en/b+SetvI9sVC9y36eAs40cNdZK8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nuyeZMxinp1Ae4wq4Qc2Is0H72XkNWTpr3ALv+5K+Chn8v9U1qD3JZx4v6OI0gLvw
	 2UwXeeH5Qb5lAVl2lV839AXLARV6DTBX2/bGZn5ph5Q+LOaVSAHp2cMiBXmpitHKXm
	 tUn5X8Jx4vssgUG3vN5sTOKSjFFEOkkokiLxm7bk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ODPSGY016956
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 08:25:28 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 08:25:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 08:25:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPSXM114562;
	Thu, 24 Mar 2022 08:25:28 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V6 11/12] recipes-core: images: Introduce
 tisdk-bootstrap-image
Date: Thu, 24 Mar 2022 08:25:25 -0500
Message-ID: <20220324132526.26497-12-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220324132526.26497-1-nm@ti.com>
References: <20220324132526.26497-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 24 Mar 2022 13:25:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13741

Lets introduce tisdk-bootstrap-image which now consists of a
completely bootable system with minimal initramfs that can be used
to boot up a system. We also will create a rootfs that matches with
the initramfs to allow users who use mmc and other boot media to have
access to the same debug tools for a new platform bringup

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V5: None

V5: https://lore.kernel.org/all/20220322174808.16341-12-nm@ti.com/

 .../images/tisdk-bootstrap-image.bb           | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
new file mode 100644
index 000000000000..b41f09fb0ec7
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Arago TI SDK bootstrap image usable for board bringup"
+
+DESCRIPTION = "This image is a complete package containing a rootfs\
+ and an initrd with platform test utilities that can be used for new\
+ platform bringup activities. Typically one would use the bootstrap\
+ initrd till the storage media access is debugged, following which one\
+ would switch over to using the storage media of choice with the same\
+ content.\
+"
+
+require arago-tiny-image.inc
+
+ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL ?= ""
+
+IMAGE_INSTALL += " \
+	packagegroup-arago-bootstrap \
+	kernel-base \
+	bootstrap-initrd \
+	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
+"
+
+export IMAGE_BASENAME = "tisdk-bootstrap-image"
-- 
2.31.1


