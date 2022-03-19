Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2767C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 12:33:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.6624.1647693203883015520
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 19 Mar 2022 05:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SHwfnu2u;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXH33040646;
	Sat, 19 Mar 2022 07:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647693197;
	bh=M7uGswby+AHaEDPz5oeE/T7SGf+v+HhWteSmU6vjaoo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SHwfnu2ujffWovgQ3s2Z6RdcQhf8xTWhz8mLanW4qAl1DY3zs3hN2N6c3XdtR6BqI
	 71E44p7zpHCkM1PscCny7MWxMuoJJWWrjl35kAA00fyQcbbjclvnUQQnn0SBlyxufc
	 0KHwJX1bsqEFuiskj2kBKDRtoRfynKRpNCyI6+OU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22JCXH84075130
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Mar 2022 07:33:17 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 19
 Mar 2022 07:33:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 19 Mar 2022 07:33:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22JCXHB0105404;
	Sat, 19 Mar 2022 07:33:17 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V4 10/12] recipes-bsp: Create a
 bootstrap-initrd package
Date: Sat, 19 Mar 2022 07:33:08 -0500
Message-ID: <20220319123310.8546-11-nm@ti.com>
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
 <meta-arago@lists.yoctoproject.org>; Sat, 19 Mar 2022 12:33:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13690

Lets create an bootstrap-initrd package that installs the cpio
generated in the correct locations.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes Since V3: None.

V3: https://lore.kernel.org/all/20220318184045.11246-11-nm@ti.com/

 .../bootstrap-initrd/bootstrap-initrd_1.0.bb  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb

diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
new file mode 100644
index 000000000000..2a53efcd9062
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Prebuilt initramfs with apps for bootstraping new board"
+
+LICENSE = "GPLv2"
+
+CLEANBROKEN = "1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+S = "${WORKDIR}"
+
+BOOSTRAP_IMAGE="tisdk-bootstrap-base-image"
+
+TARGET = "bootstrap-rootfs-${MACHINE}.cpio"
+
+do_install() {
+	install -d ${D}/boot
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/${BOOSTRAP_IMAGE}-${MACHINE}.cpio  ${D}/boot/${TARGET}
+}
+
+FILES_${PN} = "/boot"
+
+do_install[depends] = "${BOOSTRAP_IMAGE}:do_image_complete"
-- 
2.31.1


