Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1256.1646792004560564392
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 18:13:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ET4po+ZT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2292DKqC093634;
	Tue, 8 Mar 2022 20:13:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646792000;
	bh=kbjmv0eM4CIivri6K2QC66rJ6PgkL5G3tGDe41LEl7o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ET4po+ZTNjYqBqSXRNRGicEbxxVI5bK5hu03P/86Uf1CCrQh9GMTH8nCtS0HKLzIH
	 /wHjd84TK23e9KEoL4NyZCx+k+gSjYMQt0IKHIQLuMAgw0TapedfNq+wQ6c/l0zLvx
	 d2ji4uabV1wclOPYQVeVn4S75I4rxLV6vhZJYIUc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2292DKlK100499
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Mar 2022 20:13:20 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Mar 2022 20:13:20 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Mar 2022 20:13:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2292DKDJ024437;
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
Subject: [dunfell/master PATCH 4/6] recipes-core: images: Add a basic bootstrap base image
Date: Tue, 8 Mar 2022 20:13:14 -0600
Message-ID: <20220309021316.28370-5-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220309021316.28370-1-nm@ti.com>
References: <20220309021316.28370-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since we do not wish to modify the tiny-image from anything but really
tiny, lets use that infrastructure and add the bootstrap package group
to create initramfs (not exactly a completely usable system) which can
be used for basic board bringup.

This generates cpio around 36-40MB which should be usually fine for
even smaller systems (Ofcourse, this is much larger than tiny-image
which is around 6MB size). The packages are organized per size to
allow easier customization if desired.

This image follows the Bring Your Own Kernel model from
tisdk-tiny-image.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 .../images/tisdk-bootstrap-base-image.bb      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
new file mode 100644
index 000000000000..a18f39602286
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
@@ -0,0 +1,20 @@
+# Arago TI SDK bootstrap base image for initramfs
+# This will not get a completely usable image since kernel will be missing
+# intent for this image is to build as basic a system with enough basic
+# Board bringup utilities that can then be used for additions as needed.
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
+# We do not need kernel Image, dtbs and modules in the initrd
+deltask do_packagedata
+
+export IMAGE_BASENAME = "tisdk-bootstrap-base-image"
-- 
2.31.1

