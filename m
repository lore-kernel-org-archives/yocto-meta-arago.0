Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.233.1646782031444847904
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 15:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=p8dMmdNc;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 228NR83h003805;
	Tue, 8 Mar 2022 17:27:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646782028;
	bh=9yaPxI3HoER4oS8lwusN2JQ8Rdel1QtWGEhlGqdT9vQ=;
	h=From:To:CC:Subject:Date;
	b=p8dMmdNccgB/i1L5tAJGLtw/jTitzi+Lwrp/9sLr0IOQkIsaZHItSHWA1gSBhirUl
	 hQvZqkdDEK2MlSsenNWDginpzm68vgKwt4HejlW67RNpntOK6QgpPixtnKabCPoJkm
	 zyjitgcgZK7b0Y4ruYbTsN8AvV6iVxR4SgEVUWX4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 228NR8jt082987
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Mar 2022 17:27:08 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Mar 2022 17:27:07 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Mar 2022 17:27:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 228NR7Hj040301;
	Tue, 8 Mar 2022 17:27:07 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>, <praneeth@ti.com>,
        <minas@ti.com>, "Hilman, Kevin"
	<khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master PATCH V2] recipes-core: images: Add tisdk-thinlinux-image
Date: Tue, 8 Mar 2022 17:27:07 -0600
Message-ID: <20220308232707.3312-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Currently we have tisdk-tiny-image tisdk-base-image and
tisdk-default-image which serve certain purpose for the users.

However, These are either too heavy or too pointed towards validation.

Hence, let us introduce a basic thinlinux image that has the basic
system configured for out of box container usage without changing the
meaning of existing image content definitions.

Signed-off-by: Nishanth Menon <nm@ti.com>
---

Changes since V1:
* Fixed mistake in the output image name

V1: https://lists.yoctoproject.org/g/meta-arago/message/13604

NOTE: we decided to drop the kernel.cfg application from yocto and
should pick the patch up in the kernel. this will allow us to enable the
kernel for more than a single distro.
 .../images/tisdk-thinlinux-image.bb           | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
new file mode 100644
index 00000000..aa732df6
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -0,0 +1,25 @@
+# Arago TI Thin Linux image
+# Minimal bootable image with container to start the next complex system up.
+
+require arago-image.inc
+
+SPLASH = "${@bb.utils.contains('MACHINE_FEATURES','gpu','psplash','',d)}"
+
+# Allow users to tack on additional packages as interesting.
+ARAGO_THIN_IMAGE_EXTRA_INSTALL ?= ""
+
+IMAGE_INSTALL += "\
+    packagegroup-arago-base \
+    packagegroup-arago-console \
+    packagegroup-arago-base-tisdk \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-graphics','',d)} \
+    docker \
+    ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
+"
+
+export IMAGE_BASENAME = "tisdk-thinlinux-image"
+
+# Disable ubi/ubifs as the filesystem requires more space than is
+# available on the HW.
+IMAGE_FSTYPES_remove_keystone = "ubifs ubi"
+IMAGE_FSTYPES_remove_omapl138 = "ubifs ubi"
-- 
2.17.1

