Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.8787.1646750803573754455
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 06:46:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VXPU10pI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 228EkgNQ117953;
	Tue, 8 Mar 2022 08:46:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646750802;
	bh=2pfzcDiPJjphlvWtnxUsGRx492Uww5liKV81fXGtv74=;
	h=From:To:CC:Subject:Date;
	b=VXPU10pIRAvDN2W3XgpuKsU+E/+uyLdkoLHIS0JCfbihOHHGl1tTluxIPEoAhyj+9
	 oqawuPw97UvzSR3U5BImebZRravFsqlRnNXKMKMZr2ECAffm6oZss9G18zZltNHlgn
	 126+1VM6CrBbuqBLSWNNPe0TQlq8OhtDROkFpJDc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 228EkgQx122573
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Mar 2022 08:46:42 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Mar 2022 08:46:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Mar 2022 08:46:41 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 228EkfrD115099;
	Tue, 8 Mar 2022 08:46:41 -0600
From: "Nishanth Menon" <nm@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>, <praneeth@ti.com>,
        <minas@ti.com>, "Hilman, Kevin"
	<khilman@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master PATCH] recipes-core: images: Add tisdk-thinlinux-image
Date: Tue, 8 Mar 2022 08:46:37 -0600
Message-ID: <20220308144637.19732-1-nm@ti.com>
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

NOTE:
https://git.yoctoproject.org/meta-arago/commit/?h=dunfell&id=18b28d0b3a2c1ac3ea6e6149496140a2110e7729
https://git.yoctoproject.org/meta-arago/commit/?h=dunfell&id=55b210e146a5dfcb1a1eca5cad6ea8fab79a5099
https://git.yoctoproject.org/meta-arago/commit/?h=dunfell&id=189de1b80876af739dde88315f5da5b59bc084e1

Now introduces a regression in the sense that 8.1 release that used to
support docker out of box (in base,default images) unfortunately do not
anymore. Instead users need to mandatorily use a packagefeed to get
docker enabled.

This image configuration helps restore that image support.

 .../images/tisdk-thinlinux-image.bb           | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
new file mode 100644
index 00000000..c60efb5d
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
+export IMAGE_BASENAME = "tisdk-thin-image"
+
+# Disable ubi/ubifs as the filesystem requires more space than is
+# available on the HW.
+IMAGE_FSTYPES_remove_keystone = "ubifs ubi"
+IMAGE_FSTYPES_remove_omapl138 = "ubifs ubi"
-- 
2.17.1

