Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1255.1646792004188755692
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 18:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H4N7TAk6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2292DKOj079257;
	Tue, 8 Mar 2022 20:13:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646792000;
	bh=QZ8u0iST68Q5jn7fFUgxxSLtDKon2q9LFPBbhpA9siw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=H4N7TAk6CiLDg0i2n0TWO+uO92EGmx6kmyijd76uTNfaNBu4N5sWnmKDnv59Delpe
	 NYnhGjqUnAgrGn28YtnOsBR8aB25ixq4SsyC/oBEUhABU/++Ze6u0mAm1KCLWk+1Qx
	 ZFVHa5mhx6sLfX6WL/8egxUSrJbZ1M7+SiUZS4jA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2292DKlL100499
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Mar 2022 20:13:20 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Mar 2022 20:13:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Mar 2022 20:13:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2292DK0g042816;
	Tue, 8 Mar 2022 20:13:20 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>, <praneeth@ti.com>,
        <minas@ti.com>, "Hilman, Kevin"
	<khilman@ti.com>,
        "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil"
	<nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master PATCH 5/6] recipes-bsp: Create a k3-bootstrap-initrd package
Date: Tue, 8 Mar 2022 20:13:15 -0600
Message-ID: <20220309021316.28370-6-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220309021316.28370-1-nm@ti.com>
References: <20220309021316.28370-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lets create an k3-bootstrap-initrd package that installs the cpio
generated in the correct locations.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 .../k3-bootstrap-initrd_1.0.bb                | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-arago-distro/recipes-bsp/k3-bootstrap-initrd/k3-bootstrap-initrd_1.0.bb

diff --git a/meta-arago-distro/recipes-bsp/k3-bootstrap-initrd/k3-bootstrap-initrd_1.0.bb b/meta-arago-distro/recipes-bsp/k3-bootstrap-initrd/k3-bootstrap-initrd_1.0.bb
new file mode 100644
index 000000000000..452f88a35346
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/k3-bootstrap-initrd/k3-bootstrap-initrd_1.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Prebuilt initramfs with apps for bootstraping new board"
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

