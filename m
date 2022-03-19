Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113D6C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 12:33:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.6563.1647693200759343916
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 19 Mar 2022 05:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UwEuuMye;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXH8v061164;
	Sat, 19 Mar 2022 07:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647693197;
	bh=JKk/ZIh/29f4dxHnu0VHU0fcoeztfEXS9DSbsjs7/Qs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UwEuuMyeS+7rucQiejxOk0FmXqWANxWP3hAWme1WkIdjpWbi/cDS9YE2Le3St5jKp
	 m4wbo4nI8ytvGQQOstyh3UvDm38PyNoq6ppqOaKUL8OeRWm+ohJQ7yJa6ZWtAJIoxG
	 OsLr/5eNFgtqxZDRnVli0IOc2bKmZzkrcgFOGKyY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22JCXHod010000
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Mar 2022 07:33:17 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 19
 Mar 2022 07:33:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 19 Mar 2022 07:33:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXHwM028920;
	Sat, 19 Mar 2022 07:33:17 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V4 09/12] recipes-core: images: Add a basic
 bootstrap base image
Date: Sat, 19 Mar 2022 07:33:07 -0500
Message-ID: <20220319123310.8546-10-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220319123310.8546-1-nm@ti.com>
References: <20220319123310.8546-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 19 Mar 2022 12:33:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13682

Since we do not wish to modify the tiny-image from anything but really
tiny, lets use that infrastructure and add the bootstrap package group
to create initramfs (not exactly a completely usable system) which can
be used for basic board bringup.

This generates cpio around 36-40MB which should be usually fine for
even smaller systems (Ofcourse, this is much larger than tiny-image
which is around 6MB size). The packages are organized per size to
allow easier customization if desired.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes Since V3: None.

V3: https://lore.kernel.org/all/20220318184045.11246-10-nm@ti.com/

 .../images/tisdk-bootstrap-base-image.bb      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
new file mode 100644
index 000000000000..8b7f10c9f343
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Arago TI SDK bootstrap base image for initramfs"
+
+DESCRIPTION = "Image meant for basic system verification of linux kernel.\
+ Intended as basic test system, this image does not package the kernel\
+ in the standard /boot folder in rootfs. Instead, it provides a base\
+ rootfs with enough basic board bringup utilities allowing kernel to be\
+ deployed elsewhere (tftp/separate boot partition/jtag log etc..) and\
+ maybe used for basic platform bringup (bootstrap) activities.\
+"
+
+require arago-tiny-image.inc
+
+IMAGE_FSTYPES += "cpio cpio.xz"
+
+ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL ?= ""
+
+IMAGE_INSTALL += " \
+	packagegroup-arago-bootstrap \
+	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
+"
+
+export IMAGE_BASENAME = "tisdk-bootstrap-base-image"
-- 
2.31.1


