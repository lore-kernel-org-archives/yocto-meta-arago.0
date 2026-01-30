Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EADE6BF2F
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 16:43:11 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14927.1769791381941068913
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 08:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VY7FQLG3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.20, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3sf7NlNV9S0Vz8+Nl4guhcRVcMn5wjiq40i+OGIkGxHjmPV+RQF3p406RYgc6YuGgqYuP8ioFEE0FD437P7PrX6+tFT2o/3pGoQDeJ+kWHaIqtdj51PQiYb4RQdVZFUGLqVq6e25Mo4l07AU4ClTq4pgRuqushiFUHINDQZmB8J980a1oQFyn2KBUjY1SQjn4xlyBznYpEuFObNBqBw/WVQWT5WVi0FAUVS/WUcDQZQx6GHYTbnAURoVsWudKKUKrnQMw/vGqrQhj5GbJ6G1ttd+FFsb30+J85+AQICWANp/3Bv9Zy0TyFNDVgm0/it+j8Uzf3G3poNHO2FWboegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NgTywc6gtSmr+Rpz3nNuEcsMGoX6SSDtSA9UiW/vJ4=;
 b=BCX+u2lZLVM41veVLD1qJPpl7ujjJ3UNODiDdWPvpOOO+biZdzFcK7wO8h/wQRq93ouiA/+ekOzqdAA7y5Q20H8e53tHTGY17rv0wtaeArnCfk8Nc6MvPW2aeamjPW0a2X0jPHhmIJ3bySKvCFO3ClOeeae+VMslGKzgZh/ZmdNvPkGuHTehHmG8DMYSVe9o4YG/SOrR7hyIZpBOzzQ3oHdUo/oBRAEBiWcf1WvQgmucPHw4BjNrebCAIVqKoF7xovEpKBoTMUoEjQ1fPBoyX6s2Ba90OQ261vSG+E+h5scJKSMBzUwpZNopAV18lVQwiRU8tKgNu88uVF+jyuO4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NgTywc6gtSmr+Rpz3nNuEcsMGoX6SSDtSA9UiW/vJ4=;
 b=VY7FQLG3+zI9Cgk1OddTHX/0Awr5v+9GpIigXt77vmt4X3QO1RfTYjt0bnQ18JVnbACEmZ8PJq0Q7hpggGWsVCtcxMiQXrVeUapSahE5yqWg/iRQ3Dvbo3CWHk7ys+KXRHSgnXy3ztYj24KAaxBBUIcOb/wy9LJrs6gnnq79iLA=
Received: from BYAPR11CA0072.namprd11.prod.outlook.com (2603:10b6:a03:80::49)
 by PH7PR10MB6131.namprd10.prod.outlook.com (2603:10b6:510:1f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Fri, 30 Jan
 2026 16:42:58 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::57) by BYAPR11CA0072.outlook.office365.com
 (2603:10b6:a03:80::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.12 via Frontend Transport; Fri,
 30 Jan 2026 16:42:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 16:42:58 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 10:42:57 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 10:42:56 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 10:42:56 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UGgu101610487;
	Fri, 30 Jan 2026 10:42:56 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 2/2] meta-arago-distro: Remove tisdk name from Arago packagegroups
Date: Fri, 30 Jan 2026 10:42:53 -0600
Message-ID: <20260130164253.1601744-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260130164253.1601744-1-afd@ti.com>
References: <20260130164253.1601744-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|PH7PR10MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: d96bf327-c260-4b3a-b8c2-08de601ea001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gd0iem8qxDyBaOFss+xkflxsVYye9LrjHS93wtrX7+ePmwSP7swLHwpWO1mc?=
 =?us-ascii?Q?IFU7cS9SmXUxNK/Ak0qZ41krcQzECz/dcudvl5LbdQiOj4vkfLPaUn2tu11O?=
 =?us-ascii?Q?ld/PyJgVYn8o1v7O1OYpUezK1LSvh9Yglyoia2SETf40Wb+lr3lWuA4SpI+g?=
 =?us-ascii?Q?5s91ZyXwfIU28qOGdoEsqzmpwecDvBlK83+13SnsIrBcDrfF/ImMxkjzK6Vy?=
 =?us-ascii?Q?aEM/0WRsYyH8yAhg0PkIAvXC13cDKd8b/fC6IsfYK3UFFpkQ7+pNG07hAjGz?=
 =?us-ascii?Q?hXS3Qm8h9VuXFLJD5XS3PCoy9I9Ij9HglCCR8iwUtKTHGXZz0e8I4wokvv4n?=
 =?us-ascii?Q?JfFg6oXTjGyFGdv7lq9sLncTn7KOZvswN7edvEpJ+wobUegla98+nSnw4ipu?=
 =?us-ascii?Q?Rc/oqaNDaSchkwduAUY7W9xlwNtfKUto79xE0u/v9cKOIM0qtBtX7hItO9fH?=
 =?us-ascii?Q?GPJQfur8u3WMSYnfQIrTFbZKl77yCVKfZgOrfePOYiV5Hi+c82YeCT6EiEmC?=
 =?us-ascii?Q?TUYO1vriH3I3OjtlnYHeUeTq4Vj0RYvrio1MsOcI5CfCfUsoZNVSx3rBb7Mh?=
 =?us-ascii?Q?En4nvbwCevJZiz8x0bxHMzlezFrwpiGgbqgnmv0nPhEdcAUE/f53CBWrszN1?=
 =?us-ascii?Q?g1kqZu+pb9n7E/mumUQiEJxeG7GrwgKDphUvbbTeElHwSRow6DOjTWfCV8/F?=
 =?us-ascii?Q?AWZb1zzEP0D4uajM4WkLjDQv51oeKalFaUWrrb4jImXowk5mxDdXWc6u68Gq?=
 =?us-ascii?Q?O5uytz7z50YVr2DaXLQ3aRObl0AfxtV4Yfktzek8D1+iDed5nmZB1Xmul4vO?=
 =?us-ascii?Q?NgBGPtcChgf88XCCgQBPdcWysJ/86K8FVEKWK/A7p/RcNkdvUukhXZZ8197e?=
 =?us-ascii?Q?jdN7l3i85Alq7tqdD5/AjE8SiOFJzOKb22e0IFVPVyl/C6dc3SN7LDSkjN//?=
 =?us-ascii?Q?Xy82bzRUiQ8MUtFcQ76fDXMzcRh/Ck4E8ZPmj4elf2bl4yD7JdpoqgxDXWqE?=
 =?us-ascii?Q?9NCPTlxuep23PZV0ZIGqPDpLiOnqe3AmpcChQRfEZ++3Fdu77dMQNw1AL8w+?=
 =?us-ascii?Q?bCZnz04oBZUVkJwvW5VIbclv3epqe53bf3LyoQg/4TLHHuwfslEp2WGaWaTe?=
 =?us-ascii?Q?1nsIvyAl2PEU07wtaqOFhsm518DZHWRlgdUNsrPKarCKw35+KanSeLhdoBiS?=
 =?us-ascii?Q?doQ/oF4F+01BL1YqNq3uyjFltuVILDCqpQ3yS/uqrXYqMiSTTifVhjfypuRP?=
 =?us-ascii?Q?7irkbZ/pj4i5kCfGuYS21NIvKeK5rHUDIM2LtqBAeIst4NhUFB4391enE8hT?=
 =?us-ascii?Q?ouMMEFpzZ0eM33fv0Te/rm8N+Ln+pYjj5FHWDKYVqReTW2L/UNuaaVIFhqDS?=
 =?us-ascii?Q?w2ZL3y7dCt1r+SkukHoJ7stPj0WZAOz4Uqhrg+c1JeCCe3rKc7oKDUKBFjVM?=
 =?us-ascii?Q?teB5LItVbkJInGE4EEjia9mKgpP40HcAdqF0Ouyn/cwrzVn7TWy6fgL5u12K?=
 =?us-ascii?Q?JTk+tqWqltcIQFTBXTbOXV8pU1kFA9CxzAbpqjtCWp6qj8jsycFL6xxCItrn?=
 =?us-ascii?Q?Tb5Dodbo0laOr8pawDw/Hifr66Ehx9p1Y2bONTKmUYuV5jDF0R+/sez4kY/h?=
 =?us-ascii?Q?UnhfQihASrTdy7dcuj+PoEhyG3aREAuDTY1JdtGylXYGnvEkkM+UBhHDa0FN?=
 =?us-ascii?Q?A8Y29Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8PIQgtUpdwSmySUJwb6ycHm4bnbY/OvTqTQozZUhUT+JoXZhuQEw1hvHb86rw0eFCyNhf1wMF07G7zoNl84PfAWvJ0wQWRZoC0jrM0j9/rG6/JtY54CmUr+sH3LD3D/sW83MLXg2UPu+/VgaM5h2ya8WISS4XQPxEf2kzrlGAP7gYlX/ACJ6GOdH32vI+1Mn/+C+14cvITrwY9VLXwANmKdda6kwafwbcFeEwwgVb+bhUg0Qk4IY19DbMl9SJ6wZypEE2qn7eXSnhERYSb+/eJ8uFflG8cX6Lu18Fra0r4r4lzetsuY5juDPSo0aH6qemeMoB9r0iI+3iR2Q0Gjc7bZp22tyUmh7ufUp1SLyRN5yiQggLdqYM0iGqV5ns838UbYhVHlp47NaC4Ud/l6vvS4AyGCedGjpD3aLAhD31AObF/iiJJvAnwaywKtY+zON
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 16:42:58.1660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d96bf327-c260-4b3a-b8c2-08de601ea001
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6131
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 16:43:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17053

These packagegroups are all "arago" packagegroups, the tisdk in the
name is a leftover from when the TI Core SDK was generated directly
from Arago. Some packagegroups already do not have this in their names
but many still do, update the names to be uniformly "arago".

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-core/images/arago-default-image.bb   | 16 ++++++++--------
 .../recipes-core/images/arago-thinlinux-image.bb |  6 +++---
 ...b =3D> packagegroup-arago-addons-sdk-target.bb} |  0
 ...dk-addons.bb =3D> packagegroup-arago-addons.bb} |  0
 ...ackagegroup-arago-connectivity-sdk-target.bb} |  0
 ...ity.bb =3D> packagegroup-arago-connectivity.bb} |  0
 ...b =3D> packagegroup-arago-crypto-sdk-target.bb} |  0
 ...dk-crypto.bb =3D> packagegroup-arago-crypto.bb} |  0
 ...=3D> packagegroup-arago-graphics-sdk-target.bb} |  0
 ...raphics.bb =3D> packagegroup-arago-graphics.bb} |  0
 ...t.bb =3D> packagegroup-arago-gtk-sdk-target.bb} |  0
 ...go-tisdk-gtk.bb =3D> packagegroup-arago-gtk.bb} |  0
 ... packagegroup-arago-multimedia-sdk-target.bb} |  0
 ...media.bb =3D> packagegroup-arago-multimedia.bb} |  0
 ...-sysrepo.bb =3D> packagegroup-arago-sysrepo.bb} |  0
 .../packagegroup-arago-toolchain-tisdk-target.bb | 12 ++++++------
 .../recipes-core/packagegroups/ti-world.bb       | 16 ++++++++--------
 17 files changed, 25 insertions(+), 25 deletions(-)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-addons-sdk-target.bb =3D> packagegroup-arago-addons-sdk-target.bb} (100=
%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-addons.bb =3D> packagegroup-arago-addons.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-connectivity-sdk-target.bb =3D> packagegroup-arago-connectivity-sdk-tar=
get.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-connectivity.bb =3D> packagegroup-arago-connectivity.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-crypto-sdk-target.bb =3D> packagegroup-arago-crypto-sdk-target.bb} (100=
%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-crypto.bb =3D> packagegroup-arago-crypto.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-graphics-sdk-target.bb =3D> packagegroup-arago-graphics-sdk-target.bb} =
(100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-graphics.bb =3D> packagegroup-arago-graphics.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-gtk-sdk-target.bb =3D> packagegroup-arago-gtk-sdk-target.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-gtk.bb =3D> packagegroup-arago-gtk.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-multimedia-sdk-target.bb =3D> packagegroup-arago-multimedia-sdk-target.=
bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-multimedia.bb =3D> packagegroup-arago-multimedia.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-sysrepo.bb =3D> packagegroup-arago-sysrepo.bb} (100%)

diff --git a/meta-arago-distro/recipes-core/images/arago-default-image.bb b=
/meta-arago-distro/recipes-core/images/arago-default-image.bb
index becd3e9b..7804e7bc 100644
--- a/meta-arago-distro/recipes-core/images/arago-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-default-image.bb
@@ -17,17 +17,17 @@ IMAGE_INSTALL +=3D "\
     packagegroup-arago-console \
     ti-test \
     ti-test-extras \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-ti=
sdk-graphics','',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-ti=
sdk-gtk','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gr=
aphics','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gt=
k','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opencl','packagegroup-arago-op=
encl','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','vulkan','packagegroup-arago-vu=
lkan','',d)} \
-    packagegroup-arago-tisdk-connectivity \
-    packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-multimedia \
-    packagegroup-arago-tisdk-addons \
-    packagegroup-arago-tisdk-addons-extra \
+    packagegroup-arago-connectivity \
+    packagegroup-arago-crypto \
+    packagegroup-arago-multimedia \
+    packagegroup-arago-addons \
+    packagegroup-arago-addons-extra \
     ${ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL} \
-    packagegroup-arago-tisdk-sysrepo \
+    packagegroup-arago-sysrepo \
 "
=20
 DEVTOOLS =3D " \
diff --git a/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb=
 b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
index a30acbfb..a7ed2e8d 100644
--- a/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-thinlinux-image.bb
@@ -16,9 +16,9 @@ SYSTEMD_DEFAULT_TARGET =3D "${@bb.utils.contains('DISTRO_=
FEATURES','opengl','graph
 IMAGE_INSTALL +=3D "\
     packagegroup-arago-base \
     packagegroup-arago-console \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-ti=
sdk-graphics','',d)} \
-    packagegroup-arago-tisdk-connectivity \
-    packagegroup-arago-tisdk-crypto \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gr=
aphics','',d)} \
+    packagegroup-arago-connectivity \
+    packagegroup-arago-crypto \
     docker \
     ${ARAGO_THIN_IMAGE_EXTRA_INSTALL} \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups=
/packagegroup-arago-addons-sdk-target.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-addons-sdk-target.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-a=
ddons-sdk-target.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-addons.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-addons.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-a=
ddons.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/package=
groups/packagegroup-arago-connectivity-sdk-target.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-connectivity-sdk-target.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-c=
onnectivity-sdk-target.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-connectivity.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-connectivity.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-c=
onnectivity.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups=
/packagegroup-arago-crypto-sdk-target.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-crypto-sdk-target.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-c=
rypto-sdk-target.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-crypto.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-crypto.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-c=
rypto.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegrou=
ps/packagegroup-arago-graphics-sdk-target.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-graphics-sdk-target.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-g=
raphics-sdk-target.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packageg=
roup-arago-graphics.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-graphics.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-g=
raphics.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/pa=
ckagegroup-arago-gtk-sdk-target.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-gtk-sdk-target.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-g=
tk-sdk-target.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-gtk.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-gtk.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-g=
tk.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegr=
oups/packagegroup-arago-multimedia-sdk-target.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-multimedia-sdk-target.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-m=
ultimedia-sdk-target.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packag=
egroup-arago-multimedia.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-multimedia.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-m=
ultimedia.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-sysrepo.bb b/meta-arago-distro/recipes-core/packagegroups/packagegr=
oup-arago-sysrepo.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-tisdk-sysrepo.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-s=
ysrepo.bb
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-toolchain-tisdk-target.bb
index d3a90595..2baa1045 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolc=
hain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolc=
hain-tisdk-target.bb
@@ -8,20 +8,20 @@ inherit packagegroup
=20
 TISDK_TOOLCHAIN_BASE_TARGET =3D "\
     packagegroup-arago-standalone-sdk-target \
-    packagegroup-arago-tisdk-multimedia-sdk-target \
+    packagegroup-arago-multimedia-sdk-target \
 "
=20
 TISDK_TOOLCHAIN_EXTRA_TARGET =3D "\
-    packagegroup-arago-tisdk-connectivity-sdk-target \
-    packagegroup-arago-tisdk-crypto-sdk-target \
+    packagegroup-arago-connectivity-sdk-target \
+    packagegroup-arago-crypto-sdk-target \
 "
 TISDK_TOOLCHAIN_EXTRA_TARGET:omapl138 =3D ""
=20
 RDEPENDS:${PN} =3D "\
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-ti=
sdk-gtk-sdk-target','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gt=
k-sdk-target','',d)} \
     ${TISDK_TOOLCHAIN_BASE_TARGET} \
     ${TISDK_TOOLCHAIN_EXTRA_TARGET} \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-ti=
sdk-graphics-sdk-target','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gr=
aphics-sdk-target','',d)} \
     ${@bb.utils.contains('DISTRO_FEATURES','opencl','packagegroup-arago-op=
encl-sdk-target','',d)} \
-    packagegroup-arago-tisdk-addons-sdk-target \
+    packagegroup-arago-addons-sdk-target \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/met=
a-arago-distro/recipes-core/packagegroups/ti-world.bb
index 25642831..86ba27c2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
@@ -30,14 +30,14 @@ RDEPENDS:${PN} =3D "\
     packagegroup-arago-base \
     packagegroup-arago-console \
     ti-test \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-ti=
sdk-graphics','',d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-ti=
sdk-gtk','',d)} \
-    packagegroup-arago-tisdk-connectivity \
-    packagegroup-arago-tisdk-crypto \
-    packagegroup-arago-tisdk-multimedia \
-    packagegroup-arago-tisdk-addons \
-    packagegroup-arago-tisdk-addons-extra \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago=
-base-tisdk-server-extra',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gr=
aphics','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','packagegroup-arago-gt=
k','',d)} \
+    packagegroup-arago-connectivity \
+    packagegroup-arago-crypto \
+    packagegroup-arago-multimedia \
+    packagegroup-arago-addons \
+    packagegroup-arago-addons-extra \
+    ${@bb.utils.contains('DISTRO_FEATURES','opengl','','packagegroup-arago=
-base-server-extra',d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "${PYTHON2A=
PPS}", "", d)} \
     ${DEVTOOLS} \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
--=20
2.39.2


