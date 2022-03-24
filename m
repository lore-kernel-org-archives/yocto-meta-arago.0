Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96775C4332F
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 13:25:32 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.10759.1648128331161455035
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 06:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=c1StFEL7;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPSgi022731;
	Thu, 24 Mar 2022 08:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648128328;
	bh=RcvwXwyfWzSbnU/L05wtN+Fq+WVEIxqrG0XgfOWXZSs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=c1StFEL7b0AlMr4uGvLcPDE1DlYEkw7fmdHX70ye8I8K3tnGd9uB0xVKVAmmT1C0c
	 8oIYneCkYTvP0Td3zkMkd9Qd2KPwwHdBFzUwTSxYSIZhrMewr7BIk9yw0AAf6W5+Ff
	 E3lQouIjH4iMKslr0FrxjATp4nlAYKB6H1BQUwZ8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ODPSAm016955
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 08:25:28 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 08:25:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 08:25:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ODPSaI007823;
	Thu, 24 Mar 2022 08:25:28 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V6 10/12] recipes-bsp: Create a
 bootstrap-initrd package
Date: Thu, 24 Mar 2022 08:25:24 -0500
Message-ID: <20220324132526.26497-11-nm@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13740

Lets create an bootstrap-initrd package that installs the cpio
generated in the correct locations.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V5: Switch from GPLV2 to MIT

V5: https://lore.kernel.org/all/20220322174808.16341-11-nm@ti.com/

 .../bootstrap-initrd/bootstrap-initrd_1.0.bb  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb

diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
new file mode 100644
index 000000000000..2b21cf5ca9ee
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Prebuilt initramfs with apps for bootstraping new board"
+
+LICENSE = "MIT"
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


