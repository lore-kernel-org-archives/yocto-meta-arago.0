Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5238DC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:37:43 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.10317.1647614262120921058
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=crD/9Swr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbcdI037444;
	Fri, 18 Mar 2022 09:37:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647614258;
	bh=Z4exA8Dc3UVtLy0oMsLBacC6K+i7oEv1Z+TmHm3i9X4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=crD/9Swrf1z+Lahn2rbz1N+hSQ3WPGa0vBDdEhy5NpAAyFY43ivxksvoLK5R/3GqT
	 dDC3P4L7/swsfb4BT27KdCQ2aI31AGB8eeuxcwwDwXiNu6R4kND9Jno3lnaDMOgoIi
	 9pjq3TM1rxESIBhrQSEjzZDGCZD84pK3oW69Ax7o=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IEbcSv013348
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 09:37:38 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 09:37:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 09:37:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbb8q094340;
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
Subject: [dunfell/master PATCH V2 08/12] recipes-core: images: Add a basic
 bootstrap base image
Date: Fri, 18 Mar 2022 09:37:31 -0500
Message-ID: <20220318143735.17642-9-nm@ti.com>
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
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:37:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13648

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
Changes since v1:
* review comments incorporated.

V1: https://lore.kernel.org/all/20220309021316.28370-5-nm@ti.com/

 .../images/tisdk-bootstrap-base-image.bb      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
new file mode 100644
index 000000000000..59cfaef1e642
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
@@ -0,0 +1,21 @@
+# Arago TI SDK bootstrap base image for initramfs
+#
+# Image meant for basic system verification of linux kernel. Intended as
+# basic test system, this image does not package the kernel in the
+# standard /boot folder in rootfs. Instead, it provides a base
+# rootfs with enough basic board bringup utilities allowing kernel to be
+# deployed elsewhere (tftp/separate boot partition/jtag log etc..) and
+# maybe used for basic platform bringup (bootstrap) activities.
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


