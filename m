Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F5AD26D89
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:22:11 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.27])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16643.1767982924752135563
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=U3oPWLQY;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.48.27, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQf/sjYXVBVrXHfVtQ4irxhGUVPBRNooSwuKbH8fTCtLUTpVh/dNiIN54/VzCwfWsTCgo/jj3mAowx7nrpKjb8pUZbnEpZvCZm2cY4xGyi89zvq27r9Cg75fEmr8HOpoBsAxzfQxf5JJjNAimHfayKjOSkhZh6WObMpYXVJGAy2R6tYi1yZu96VIs9qjdumpfTHmMvNz8nOy9DdOxoNrbbIR7XL2NE5N9T5yAfHDhSaOErP4wU26J4+GRQg24MWBB9RfMVlweOvLtjolvrvX6yeruf7LjUVAvh4s77uwZM2en9bCh8FNPnmudBwO/ZFnVHfbUR1ygMeNbkChyrs7OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSWeHCiDqNIQCAyvnIDMQzvLBtoviSqRFXoTzionsqk=;
 b=FsaICZlnnw5hEJxGFi/fKNz4yQg2G+dZ8KpbyI0sNY8dQXputus5DZD13rx5Ej8kPCoNbp/N5echgzyIJ4sgQUdlCq14PnCMO3myFjAqREKh4Athgxr9X7o1Dhr8OcYxYNZpAiQ7jESbbfwxotLba+DVtJV0d0EYY1tEXuGXxoEPQmKjG7EXWWwbLRGGcmeBJb1JP/39RTxspyK5R4cOhRE1nO9byRlw3Z9GdAnY5CRw4Ld9obSg4Ql0607sFwlEVOu7YIkvAvyeAke4CvOo4UhSKuUwRlTv+9UM72vn6ii6+5Mar1ozb1uKKI/oH8f/mxQ1rQko8ny8uC9MbeuqrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSWeHCiDqNIQCAyvnIDMQzvLBtoviSqRFXoTzionsqk=;
 b=U3oPWLQY+jOGOORpqjWYf69HFUXxxRh/Hqmcjxz5gT75CW7DkK5gbmhLF51NPCUPL1vXoRc/MMMnwEYcpzat86KRhOifZexlDLq4EADJuZc9HaJ/VOcHhB85IIL4/pR43BAES/WpanCxQHcTH7XYmS4uRLGnQ/sk4lU/9SUtQOk=
Received: from BL1PR13CA0079.namprd13.prod.outlook.com (2603:10b6:208:2b8::24)
 by SA6PR10MB8183.namprd10.prod.outlook.com (2603:10b6:806:444::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 18:22:02 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:208:2b8:cafe::82) by BL1PR13CA0079.outlook.office365.com
 (2603:10b6:208:2b8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1 via Frontend Transport; Fri, 9
 Jan 2026 18:22:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Fri, 9 Jan 2026 18:22:01 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:22:00 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:22:00 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:22:00 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IM0DY471257;
	Fri, 9 Jan 2026 12:22:00 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1veH7Y-0000000BzAn-2Nd2;
	Fri, 09 Jan 2026 12:22:00 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] ti-core-initramfs: Shrink size of initramfs
Date: Fri, 9 Jan 2026 12:22:00 -0600
Message-ID: <20260109182200.2856750-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|SA6PR10MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: e0979b31-129e-4e88-554a-08de4fabfbd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|36860700013|1800799024|376014|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YqgFiswyT5kSI+uINVIrRZStmQUrsqTYvjHMPC9XBfsE2j9vdoqXq+eaDhAP?=
 =?us-ascii?Q?QV2/7SaUFrNYYB5YT8ITzej5iLUdIHn6kLuGYk9TFoP039Vjeo0eNk+jcJlr?=
 =?us-ascii?Q?p1OaHppBCvRPuTHMqWKneOh3j6jexlQZzuYPnt6jnQxAniUdB624RIe1680v?=
 =?us-ascii?Q?91tRbpr9L2Ef7n+fNPbmAYoItEkq3SNvTJJ3Z07hBDCslHD8WEe5hQDlSNHD?=
 =?us-ascii?Q?bJYMo0xbnQTGnlNaAeLRl0ODuz1tMcqVmhCFVdashOLfJqqflymywLKhGzWl?=
 =?us-ascii?Q?xQ9FVqSoeqzRksRq18cOyVLj+sy5SRGeHR1nsiCeOCw1e3ntu5GxCdBU+OFl?=
 =?us-ascii?Q?RI/MzAyfGJW+eZLS4JAvkFJKopa2YokDJkYI6J57XQ90X7tQq3AQjEPrIXJr?=
 =?us-ascii?Q?3uihQ7XmabwQKzSveHHa10vta5+i73Aekk6QXwBlj14BQNdFhSx3o21vXoZR?=
 =?us-ascii?Q?sUdDSYiOMektlSDSt7YqM+HhC0gye9kL+HQf7udMKkV8Hj4Toslc2kcyudP9?=
 =?us-ascii?Q?VFI3iSv7qMVB0NSXNJFRtKdTSesalz7gcOgV2ef5zK2PYxWqSfzUVkcNAXiW?=
 =?us-ascii?Q?A8/dxQvyLDEJejayAoNJ7PcyC7KWe0Zb+YWdqlXapAStH5G69fXvDULgerfH?=
 =?us-ascii?Q?aSw/GEfPHKgylxLs0izcqRSP+OWaxzsPr95tPJdJzcbNRZETqm6hya09yhVT?=
 =?us-ascii?Q?Ylk31Y3bpbHYqWEhjYOJq3bZCiHSJe6zH2zDs5p4c2yAKz6/OYy47MNYK2Sz?=
 =?us-ascii?Q?U9MQdBMdHfV+WMReHvP+FJEN4SoUWr1Y2ms2XIzw1627WRgzT3te//KOtVfg?=
 =?us-ascii?Q?Yh/oPnZEJIWUQxzzrh7ZS3F1vEZ6T0gDUq1sW9T5H9dVlMXFEkht0p0l37C1?=
 =?us-ascii?Q?kztFfBAc0z7ZOEixROzkU3OUl1q4BiszGhNf6HYU13Uw0yYDAikx1XHvkc2M?=
 =?us-ascii?Q?i94olnESqaPSWlyTCzTOjOGH6viHK4g4hNBUuoaKxwn4mD8vmJ1DnPygVdNx?=
 =?us-ascii?Q?+jXv64FI+F/jeVQBtjU7Ff9mvemAXzwYOnEA/jnGxfPmd4HyQw+/7ay8xuiD?=
 =?us-ascii?Q?MMD3KlAO/ftesX1LD28L0JKrZEegnvPRnL2oXTBHa2/r6r1rGJaQD9vZMvO7?=
 =?us-ascii?Q?aXzEI5SSmpUQzqFNqK6uNqNkba1KV8Pr3OPTExNmtsEgxyQ5tKh/rdbNkfvK?=
 =?us-ascii?Q?pfOwlJPyim7puEwuClVMmVI4a+dkqCtPpGgugHF2cazKyomSkNMaWmt7aciT?=
 =?us-ascii?Q?M+Ir4F9OPZsf4qPJDJAStg1isT1mS5i0H2mfRmnZg+eyjhRUQRwRDdx4WovI?=
 =?us-ascii?Q?kLgs5/bFGVQeLGjBFWQ7hNEav+nxpHrOxuAty2iRG06EJnlIaBMsYHtOHXs/?=
 =?us-ascii?Q?pQFUUFUBgySBz5Hmf8LhaSaXm6lx8Llxitiftx+VSB5i2UUqxOp4KlOTlwDy?=
 =?us-ascii?Q?ts9TmecMaYkkwBWHdlRsUjj2F51BN3O9enczS4IevaqWFIixT8fp7aWrjiAY?=
 =?us-ascii?Q?CU18hlT5XmHNWDtVDRikZXmAhljSxuO+b+YB?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700013)(1800799024)(376014)(7142099003);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:22:01.5009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0979b31-129e-4e88-554a-08de4fabfbd3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8183
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:22:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16943

License-Update: Moving away from packagegroup-core-boot.bb removed the
LICENSE setting.  Just adding it back in.

It looks like we were modelling this initramfs off of the wrong example
from poky.  This setup produces a much smaller initramfs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add missing License-Udate.

 .../packagegroup-ti-core-initramfs.bb         | 12 ++++---
 .../recipes-ti/initramfs/ti-core-initramfs.bb | 33 +++++++++----------
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramf=
s.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index 86b69aff..c759808c 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -1,16 +1,18 @@
 SUMMARY =3D "Minimal initramfs for boot requirements"
=20
-require recipes-core/packagegroups/packagegroup-core-boot.bb
+LICENSE =3D "MIT"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+inherit packagegroup
=20
 TI_INITRAMFS_KERNEL_MODULES ?=3D ""
=20
 RDEPENDS:${PN} +=3D "\
     ${TI_INITRAMFS_KERNEL_MODULES} \
+    ${VIRTUAL-RUNTIME_base-utils} \
+    base-passwd \
     initramfs-framework-base \
     initramfs-module-udev \
     initramfs-module-nfsrootfs \
-    nfs-utils \
-    nfs-utils-client \
 "
-
-RDEPENDS:${PN}:remove =3D "grub-efi kernel"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-t=
i-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
index 1a102d82..223fef7a 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
@@ -7,29 +7,26 @@ DESCRIPTION =3D "Image meant to probe boot essential modu=
les\
=20
 LICENSE =3D "MIT"
=20
-inherit core-image
-
-IMAGE_NAME =3D "ti-core-initramfs"
-
-IMAGE_NAME_SUFFIX =3D ""
+INITRAMFS_FSTYPES =3D "cpio cpio.xz"
=20
-IMAGE_FEATURES:remove =3D "package-management"
+INITRAMFS_MAXSIZE =3D "65536"
=20
-INITRAMFS_FSTYPES =3D "cpio cpio.xz"
+IMAGE_NAME =3D "ti-core-initramfs"
=20
-IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
+export IMAGE_BASENAME =3D "${IMAGE_NAME}"
=20
 PACKAGE_INSTALL =3D "packagegroup-ti-core-initramfs"
=20
-export IMAGE_BASENAME =3D "${IMAGE_NAME}"
+# Ensure the initramfs only contains the bare minimum
+IMAGE_FEATURES =3D ""
+IMAGE_LINGUAS =3D ""
=20
-IMAGE_OVERHEAD_FACTOR =3D "1.1"
+# on the kernel image.
+PACKAGE_EXCLUDE =3D "kernel-image-*"
+
+IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
+IMAGE_NAME_SUFFIX ?=3D ""
+IMAGE_ROOTFS_SIZE =3D "8192"
+IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
=20
-# To further reduce the size of the rootfs, remove the /boot directory fro=
m
-# the final image this is usually done by adding RDEPENDS_kernel-base =3D =
""
-# in the configuration file. In our case we can't use this method. Instead=
 we
-# just wipe out the content of "/boot" before creating the image.
-ROOTFS_POSTPROCESS_COMMAND +=3D "empty_boot_dir; "
-empty_boot_dir () {
-	rm -rf ${IMAGE_ROOTFS}/boot/*
-}
+inherit image
--=20
2.43.0


