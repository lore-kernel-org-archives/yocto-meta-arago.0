Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CECC3527C
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:37:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.10527.1647614263029534843
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jP794WuB;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbbQd110660;
	Fri, 18 Mar 2022 09:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647614257;
	bh=DC9Cg5sLUnoxXuCvF3lklv0puxsu84cjqnV2avJb5SM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jP794WuBU1JLPmmew2VS+cq60vr2dPFDx68hioLczKW2ID0KRwh6Ugc4Mh7xIEcqu
	 Zx94yksObWtltH3yxkFemOF695vSo/0X9ZyBKUOAuEfVMHJFaQpG+G9wX3DAjZwZh4
	 6xKA1lFzqHdfN5DdTSk4QyS2pk2SNeYP5AaczzNo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IEbbWN007724
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 09:37:37 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 09:37:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 09:37:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbb03025909;
	Fri, 18 Mar 2022 09:37:37 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>,
        praneeth <praneeth@ti.com>, minas <minas@ti.com>,
        "Hilman, Kevin" <khilman@ti.com>, "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V2 10/12] recipes-core: images: Introduce
 tisdk-bootstrap-image
Date: Fri, 18 Mar 2022 09:37:33 -0500
Message-ID: <20220318143735.17642-11-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220318143735.17642-1-nm@ti.com>
References: <20220318143735.17642-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:37:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13650

Lets introduce tisdk-bootstrap-image which now consists of a
completely bootable system with minimal initramfs that can be used
to boot up a system. We also will create a rootfs that matches with
the initramfs to allow users who use mmc and other boot media to have
access to the same debug tools for a new platform bringup

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since v1:
* review comments (s/kernel/kernel-base)

V1: https://lore.kernel.org/all/20220309021316.28370-7-nm@ti.com/
 .../images/tisdk-bootstrap-image.bb           | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
new file mode 100644
index 000000000000..ce7a80c8a56e
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
@@ -0,0 +1,20 @@
+# Arago TI SDK bootstrap image usable for board bringup
+#
+# This image is a complete package containing a rootfs and an initrd
+# with platform test utilities that can be used for new platform
+# bringup activities. Typically one would use the bootstrap initrd
+# till the storage media access is debugged, following which one would
+# switch over to using the storage media of choice with the same content.
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


