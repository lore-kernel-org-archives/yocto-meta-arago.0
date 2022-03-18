Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361FBC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 18:40:51 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.13584.1647628850006110891
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 11:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=slTZ1TRS;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IIelVa105262;
	Fri, 18 Mar 2022 13:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647628847;
	bh=EtMeJwVI7bMaFn+iQoyme0qT/g9D5b2SGgVHeRqZcVU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=slTZ1TRSsmm8rL2ScUHilG8xQtAWanzJjBdtgkcCD2SeMQ9AMKYt8ahMjP5OF/lYz
	 nK3+36efgPzMVkPCuNVgnTcwhirAazpRHWj5y2+CTNahQXcGbrQB91O0mLd04E6SVK
	 UJHdxtRFbzJ/rtsZPEjyZGaEejnRY3hvEbNeQm3Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IIeleE024215
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 13:40:47 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 13:40:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 13:40:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IIelqa006937;
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
Subject: [dunfell/master PATCH V3 10/12] recipes-bsp: Create a
 bootstrap-initrd package
Date: Fri, 18 Mar 2022 13:40:43 -0500
Message-ID: <20220318184045.11246-11-nm@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13669

Lets create an bootstrap-initrd package that installs the cpio
generated in the correct locations.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
no changes since V2
V2: https://lore.kernel.org/all/20220318143735.17642-10-nm@ti.com/

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
2.17.1


