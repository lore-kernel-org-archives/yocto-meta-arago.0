Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E45CCFA1A
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 21:41:45 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10721.1762551700619727681
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Nov 2025 13:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=cO7E7ej4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.23, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGTEG6JX4detyOcsjSvtX4u3ocrtsEMv0AxQWVTYKAHPsPeGm14t5DhcNsH5ucwQVgC08jMuMavft54Kex1K0PwBU+tLj4uhQIchwofdQD2CLuBmwAtq8WBSPXAjNuq+yUzlMtEGn29YzT0N1gmVaRI00qmx5TQJBIvjFOWgS6Ry57Lou9LszzhUTcwqn1dODOhV/osAagWxKyDJ7IPC8pgunzpREqNcIyyvursI3LdriKDySBDo6nKGFtdoB9X854cLJAKa2OOxxMcihdRkIetAVZwO5P4uhVQCRqFEGlkW2Qt0wEm/P/+0sVldUSLjwJGobp9WbPHw9iURVCut4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vptHTO6HX1NI81aUxIDUu8lOJaQu6TWx5lVKsEDRRJY=;
 b=H/gy/NB0YLdI0zrTiWGl5fyhw2DWxEkzM4M3kg8Umt1nqwig/NjBVead41DosgWpFMhsY4bmF+yH4cCK+wrVC0AYWvzXBOemjESVlZXuyTNyI1vOnq9F6hrVoegytNku5T9NdGkRpS1/0gpmpJ7aAK5trACV48OPwPUdQ0PchLIqLkRUf9/3auT2SssE79dMWUdSxXGVutEMV3GOBY0e4Hj49n4CN5c99uqr8fzZ/R5cBiB8Ztmr/wqZAbkRLOmyED5KYRorr9IM0FrgE6JJcASr8b7sp1FswphLNEp4oPVuKIdL93Ok58HU3CAz5lABAemigObJFWu7FzFmMEmdxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vptHTO6HX1NI81aUxIDUu8lOJaQu6TWx5lVKsEDRRJY=;
 b=cO7E7ej46/E9PtRHpuSxkJAHqdIotUAXicPzPtgGv5FsOXlsGvouGyay4g8lSGVfbsaoBNndPyAmvLat9JV7jfstEdgZYJxXP/rJWVJPb6jrMt2rQtZZ0qhMICNVFrKlodmyLyr5xmjokQPifkIY57HqIuH0/8H/WJNqH5g917s=
Received: from PH0PR07CA0063.namprd07.prod.outlook.com (2603:10b6:510:f::8) by
 DS0PR10MB7203.namprd10.prod.outlook.com (2603:10b6:8:f5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Fri, 7 Nov 2025 21:41:37 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:510:f:cafe::54) by PH0PR07CA0063.outlook.office365.com
 (2603:10b6:510:f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 21:41:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Fri, 7 Nov 2025 21:41:35 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:41:32 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 7 Nov
 2025 15:41:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 7 Nov 2025 15:41:31 -0600
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A7LfUT53713651;
	Fri, 7 Nov 2025 15:41:31 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 4/5] meta-arago/all: Rename machine from omap-a15 to am57xx
Date: Fri, 7 Nov 2025 15:41:27 -0600
Message-ID: <20251107214128.1491466-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251107214128.1491466-1-afd@ti.com>
References: <20251107214128.1491466-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|DS0PR10MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: f29e21fe-43d2-4228-ede4-08de1e466ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ot36Cj3IwpqtiO5yyb6I7q03bjncyiFXfEB4+Saz90Gm9UtBuUuhgtqeI6Yk?=
 =?us-ascii?Q?sL743ur8QwzTHxbGwPzGiEKCIv2rizPBqHYFDCg4JgovEZnkmHmfFGqReLtA?=
 =?us-ascii?Q?dGmQwKSUVg3R2fbf6gngR3o4MfqFFbw+O45EWJnOv06N4FXYFOQVjz0XYL3D?=
 =?us-ascii?Q?49CxfU3aOKOj0OXROwKl6OGUcE9OJOof+nYQGgXlT+rK37htyjgjfSVkC7YJ?=
 =?us-ascii?Q?yySxsIiACvR6lhkOlx/P0npimPSf7f8/RJ16GAYTq1iSpUlP11n3kKVMrhfu?=
 =?us-ascii?Q?ICLdnQuqviGV4WU/reHbWSTnW7XvMuwFzEbl8mZUcZDTniQ7LcvjIup9nG9S?=
 =?us-ascii?Q?wqxuuaMPWx3HKaZE6zsIdzzQMTX0/pTvchkdngoPmldGS+U//ytQiEoaMvIB?=
 =?us-ascii?Q?Ntq/qkcpql5QCKNktTkV0CkatMsB5x0IBfbNRPVlsjishac96TMXqbbIOQ2V?=
 =?us-ascii?Q?OSdnKNrXudnQVot/F642K+T4aNGrEyK3cscGauwH5YjKG+dLjZx0Xt0OQk7L?=
 =?us-ascii?Q?FRzx5CG0bkXTcqDE2NY6o0GUShuxVZvGtJ6+Cvf5mRr4t4Un7ncgl+LwMEPt?=
 =?us-ascii?Q?uaSRX7FRJTh4kZ6Skkgm97fn216bW3iafhry7aqq3IBvbwgGCge/6IPOe51C?=
 =?us-ascii?Q?0kgJLnFvpem30A1uVtFtznlsuRy+E6uAk8jgvfBTr/yPLN5zcJz21ePKCFFv?=
 =?us-ascii?Q?fXoYLW7BV71lGi3lpo9+HLa4alc8+32ljZ9HzoI+sJnPNldRrA2TjGYUgPAJ?=
 =?us-ascii?Q?yQzlyC8RdmYmZ6vzQD1OOX3h7Awibm5BlyCsWHQnRsWZ8gBXheJXTMgWyMl4?=
 =?us-ascii?Q?6c7Rt/mlxN1QWQQTWfZuzBv6Ksyi1u1V4CveGrqouB+YL1T1e8PTmtO26mR6?=
 =?us-ascii?Q?XdIuUB2LolelfRXXtZ80ZC0xdsSYsXHVZJ3xdusSoz8Mx8ZKml+sq1pOB1yO?=
 =?us-ascii?Q?qUXFzdoPQ3an1ZaOFDP7QYZuBdcUqhChhtwc7rK6rCqDs8IEFWrC49RBbEBI?=
 =?us-ascii?Q?nwC4hrtKbT8jqQekqq7/+7BzxCj530KvLX4JSpzI2yGL/wLnf+3C8x4dWJJ/?=
 =?us-ascii?Q?woitf+FH7bM9tuOq/9PElH2H62UCsQ6MFRtSD5U1XmkH6l1lP5GmmQdV0+YK?=
 =?us-ascii?Q?Yj7LKieZCvUqvcYce1ibu9/pHVKEfMkjI9QvJZ5veKGwLTwu1ll9jTqwVyYD?=
 =?us-ascii?Q?DE6Jj++QWLrrmheOsMBe1BeRWi4uhsQTvgXdb5EyqqH0uDFrGTvZU0xddeJr?=
 =?us-ascii?Q?qh9TUJzRz94r8tN2J36UwXH5BgiWcGlN9JgWyp9q4/S8LpcE1VcLoogkJLJi?=
 =?us-ascii?Q?MT16QJYQdZEaSjnOhb7V+1/KABd/yJSfSGzs9E8/YdrewY5R3mqZkE/Xpgk8?=
 =?us-ascii?Q?LurkzSxL55tD7Z6MfkgTq4qOkIZJMAm2F4iXPWf/9tqloDchhx/vhsvqCqPy?=
 =?us-ascii?Q?lxuORO95qBWKYyUlkylIaOnMcwhJ5i6F8yV+rDSHM0NB4prEL70/xPQjjRP7?=
 =?us-ascii?Q?+YsOgwpBNcw4W9JsmAPm4Dg0F54X1I6sW2mn?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 21:41:35.4292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f29e21fe-43d2-4228-ede4-08de1e466ccf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7203
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Nov 2025 21:41:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16736

The "omap-a15" is a bit of a legacy holdover and is confusing.
This causes issues with mixed usage of 'dra7xx' and 'omap-a15'.
For example all EVM using the AM57xx SoC family include dra7x.inc
so both are always defined, then we use 'omap-a15' in several
places where we really mean just 'am57xx'. 'dra7xx' can't be
filtered for as needed like in the case of PRU.

AM57x is arguably the real superset device and DRA7x support
is being removed, so rename all uses of the combined 'omap-a15'
to 'am57xx'.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/images/tisdk-core-bundle.inc             | 3 +--
 .../packagegroups/packagegroup-arago-bootstrap.bb         | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb  | 2 +-
 .../packagegroup-arago-tisdk-addons-sdk-target.bb         | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons.bb      | 8 ++++----
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb  | 2 +-
 meta-arago-distro/recipes-core/packagegroups/ti-world.bb  | 2 +-
 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb            | 2 +-
 meta-arago-test/recipes-core/packagegroups/ti-test.bb     | 2 +-
 meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb | 2 +-
 10 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc b/=
meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
index 200ccf52..2e3a3072 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/tisdk-core-bundle.inc
@@ -7,7 +7,7 @@ IMAGE_NAME_SUFFIX =3D ""
=20
 inherit tisdk-bundle
=20
-COMPATIBLE_MACHINE =3D "omapl138|ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE =3D "omapl138|ti33x|ti43x|am57xx|k3"
=20
 # List of packages to remove from the host package.  This is usually due t=
o
 # licensing issues and unneeded dependencies.
@@ -18,7 +18,6 @@ TOOLCHAIN_CLEANUP_PACKAGES =3D "libgnutls-dev libgnutls-e=
xtra26 libgnutls-openssl2
 # picking up DTB files for devices with no DTB support.
 DTB_FILTER =3D "unknown"
 DTB_FILTER:ti33x =3D "am335x"
-DTB_FILTER:dra7xx =3D "dra7"
 DTB_FILTER:am57xx =3D "am57xx"
 DTB_FILTER:ti43x =3D "am43"
 DTB_FILTER:omapl138 =3D "da850"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-bootstrap.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-bootstrap.bb
index 3c05895a..a1b9636d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boots=
trap.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-boots=
trap.bb
@@ -42,7 +42,7 @@ UTILS:append:ti43x =3D " \
     omapconf \
 "
=20
-UTILS:append:omap-a15 =3D " \
+UTILS:append:am57xx =3D " \
     omapconf \
 "
=20
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-=
gst.bb
index 2a4bc0eb..f309dc4a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.b=
b
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.b=
b
@@ -19,7 +19,7 @@ GSTREAMER_DEPS =3D " \
 GSTREAMER_DEPS:append:arago =3D " gstreamer1.0-libav"
=20
 GSTREAMER_ACCEL_MM =3D ""
-#GSTREAMER_ACCEL_MM:omap-a15 =3D "${@bb.utils.contains('MACHINE_FEATURES',=
 'mmip', "gstreamer1.0-plugins-ducati", '', d)}"
+#GSTREAMER_ACCEL_MM:am57xx =3D "${@bb.utils.contains('MACHINE_FEATURES', '=
mmip', "gstreamer1.0-plugins-ducati", '', d)}"
 #GSTREAMER_ACCEL_MM:append:dra7xx =3D "${@bb.utils.contains('MACHINE_FEATU=
RES', 'mmip', " gstreamer1.0-plugins-vpe", '', d)}"
=20
 RDEPENDS:${PN} =3D "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups=
/packagegroup-arago-tisdk-addons-sdk-target.bb
index 9f5e189e..95be18ba 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-addons-sdk-target.bb
@@ -38,7 +38,7 @@ IPCDEV =3D " \
 	ti-ipc-staticdev \
 "
=20
-EXTRA_PACKAGES:append:omap-a15 =3D " ${IPCDEV}"
+EXTRA_PACKAGES:append:am57xx =3D " ${IPCDEV}"
 EXTRA_PACKAGES:append:omapl138 =3D " ${IPCDEV}"
=20
 RDEPENDS:${PN} =3D "\
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-addons.bb
index 58fffd26..67f3de16 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-addons.bb
@@ -42,7 +42,7 @@ UTILS:append:ti43x =3D " mmc-utils \
                        pru-icss \
 "
=20
-UTILS:append:omap-a15 =3D " mmc-utils \
+UTILS:append:am57xx =3D " mmc-utils \
                           switch-config \
                           libdrm-omap \
                           stream-openmp \
@@ -72,8 +72,8 @@ UTILS:append:j721e =3D " pru-icss"
=20
 UTILS:append:omapl138 =3D " ti-ipc-rtos-fw"
=20
-UTILS:append:dra7xx =3D " \
-                        ${UTILS_DSP} \
+UTILS:append:am57xx =3D " \
+    ${UTILS_DSP} \
 "
=20
 EXTRA_PACKAGES =3D " \
@@ -86,7 +86,7 @@ EXTRA_PACKAGES:omapl138 =3D " \
     protobuf \
 "
=20
-EXTRA_PACKAGES:append:omap-a15 =3D " ti-ipc-examples-linux"
+EXTRA_PACKAGES:append:am57xx =3D " ti-ipc-examples-linux"
=20
 RDEPENDS:${PN} =3D "\
     ${UTILS} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-tisdk-multimedia.bb
index 6eb49b46..54690317 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-multimedia.bb
@@ -26,7 +26,7 @@ MULTIMEDIA:append:dra7xx =3D " \
=20
 ACCEL_MM =3D ""
=20
-ACCEL_MM:append:omap-a15 =3D " \
+ACCEL_MM:append:am57xx =3D " \
     ipumm-fw \
 "
=20
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/met=
a-arago-distro/recipes-core/packagegroups/ti-world.bb
index 64af6d93..25642831 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -8,7 +8,7 @@ inherit packagegroup
 INSANE_SKIP:${PN} +=3D "dev-deps"
=20
 CHROMIUM =3D ""
-CHROMIUM:append:omap-a15 =3D "\
+CHROMIUM:append:am57xx =3D "\
     chromium-ozone-wayland \
 "
 CHROMIUM:append:k3 =3D "\
diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tes=
ts_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc32=
0-tests_5.0.11.p7.bb
index c2076099..936e61e8 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.=
11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.=
11.p7.bb
@@ -3,7 +3,7 @@ SUMMARY =3D "Test application for GC320 2D API"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://dra7x-sdk-ti-gc320-tests_manifest.html;md5=3D=
22a001855467f373c47f45de5330e3c9"
=20
-COMPATIBLE_MACHINE =3D "omap-a15"
+COMPATIBLE_MACHINE =3D "am57xx"
=20
 DEPENDS =3D "ti-gc320-libs"
=20
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index cb779123..f47cebe1 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -115,7 +115,7 @@ TI_TEST_TI_TOOLS:append:ti43x =3D " \
     switch-config \
 "
=20
-TI_TEST_TI_TOOLS:append:omap-a15 =3D " \
+TI_TEST_TI_TOOLS:append:am57xx =3D " \
     omapconf \
     pru-icss \
     switch-config \
diff --git a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb b/me=
ta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
index 53fd3e12..84226dd8 100644
--- a/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
+++ b/meta-arago-test/recipes-devtools/omapconf/omapconf_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D205c83c4e2242a76=
5acb923fc766e914"
=20
 PV =3D "1.75+git"
=20
-COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15"
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|am57xx"
=20
 BRANCH ?=3D "master"
 SRCREV =3D "ff07b6992bacb1e1586c72b7d2be469caee4a347"
--=20
2.39.2


