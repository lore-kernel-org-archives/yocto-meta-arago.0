Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8110AC3527A
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 18:40:51 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.13585.1647628850012703624
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 11:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Oscrud0a;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IIelNx101187;
	Fri, 18 Mar 2022 13:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647628847;
	bh=pmM6Lm2KAcLRSfz8cC22pCAxL8syyhVCHvmit0fIR5Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Oscrud0aAmIeFT9Dj5jbPEPXh5mxGNGSl6+96zM2hlEoZfGgRZO/mWlKGI73SBQPg
	 9j1tpxQ3PWr4VnsuNtetH3JTOZcn37YWlijq9lQw0ajX62BDXmKTAE9I8/rmKSufJd
	 vt6LpLZoxCu+3v9OcFkHA9l/cIxwoSnvPXBsBNEY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IIelXd108932
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 13:40:47 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 13:40:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 13:40:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IIelo6008767;
	Fri, 18 Mar 2022 13:40:47 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>,
        praneeth <praneeth@ti.com>, minas <minas@ti.com>,
        "Hilman, Kevin" <khilman@ti.com>, "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V3 11/12] recipes-core: images: Introduce
 tisdk-bootstrap-image
Date: Fri, 18 Mar 2022 13:40:44 -0500
Message-ID: <20220318184045.11246-12-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220318184045.11246-1-nm@ti.com>
References: <20220318184045.11246-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 18:40:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13670

Lets introduce tisdk-bootstrap-image which now consists of a
completely bootable system with minimal initramfs that can be used
to boot up a system. We also will create a rootfs that matches with
the initramfs to allow users who use mmc and other boot media to have
access to the same debug tools for a new platform bringup

Signed-off-by: Nishanth Menon <nm@ti.com>
---
no changes since V2
V2: https://lore.kernel.org/all/20220318143735.17642-11-nm@ti.com/

 .../images/tisdk-bootstrap-image.bb           | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-image.bb
new file mode 100644
index 000000000000..685916ca3f6a
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
+	kernel \
+	bootstrap-initrd \
+	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
+"
+
+export IMAGE_BASENAME = "tisdk-bootstrap-image"
-- 
2.17.1


