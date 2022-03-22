Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8226C43217
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:48:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.13452.1647971299470245402
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 10:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=t7I/0LTH;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MHmBlG123134;
	Tue, 22 Mar 2022 12:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647971291;
	bh=u1NbJnzLqvG1SHqIb6H5pRCs+dYxhykcvcgTi7Z8wOY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=t7I/0LTHWEKQD+qK2F6zS58q8uX8m+AC0PEpIbA+DX3tu709xvD7oXrxMPLbKnxJt
	 +NWmvtAcCTPfNSP2sS3izdnpX/8APp6BgP3rmM1mr/JU/UZIAS9kg17vlpH04lOiun
	 L4bGe6GYeHvimGQMBnWG24bjDYCjMBbiODYzuSgg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MHmB5V025029
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 12:48:11 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 12:48:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 12:48:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MHmAH2032024;
	Tue, 22 Mar 2022 12:48:10 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <d-gerlach@ti.com>, <j-humphreys@ti.com>, <khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [master/dunfell PATCH V5 10/12] recipes-bsp: Create a
 bootstrap-initrd package
Date: Tue, 22 Mar 2022 12:48:06 -0500
Message-ID: <20220322174808.16341-11-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220322174808.16341-1-nm@ti.com>
References: <20220322174808.16341-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 17:48:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13699

Lets create an bootstrap-initrd package that installs the cpio
generated in the correct locations.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V4: None

V4: https://lore.kernel.org/yocto-meta-arago/20220319123310.8546-11-nm@ti.com/

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


