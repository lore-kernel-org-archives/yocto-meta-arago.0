Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C78E6BF10
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 22:08:47 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4190.1769810923096468174
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 14:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=lynCpgMt;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.43, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbwA4ApqlTSU3RHZwJDZCmESZ116AZw0/DMtQjglIR/M02n8OW0g6U8a6HXuz9Rc4MRvq6BE0msK+Hf2THTyQ5z+eEcfXby8igRHw59yMhvkRHPDn6yBg3LRUyDJgf8Fnc9gvcNf2lqePwygzF/V5lR6kfgtghW3CsjoOEektx+pEQeZ9qWZIfYihddBkdXNOFfzUx7KjQgvCmHekx/8ORX6gm4isxFtScszxje+3BcL7mS9FHfBhV3sljG9cFugkthyqttrvfZGk5T14QfHKVsgnm4+X9ogufenNzhl3DKYj0Mqrkmwe53E1ChlW12G1f+j3PqZ7GkGceFx2KOuQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYiOhcj8jBVIt9fJlKW64Ce1Y4O4bJCbYVS/kGH/0pI=;
 b=JpArNBVtZRqsLKJ3t67qpotTBjWFttfEWhYKyZDsTlkL5q94xwav8Y4tult+ArmFNNi3XJsIkoUbB4r/cVM1DfbIaBmsS743UnBMXUsLfn956/K3jvmjnk94PWSDNP7NAjizJuYUeEYg1D0jcCBB4iItTyJ1iGXwOPLXZrSgj95mhnVIxWFfL5FF3LdzQPPbJHWSZ7ipwvKhGUlVVSWohBbb+FCtzGgjLc4NkOT7VrITcf6mZmX4Vuc4mXp6O9vmlPEcqfqdPr+zgnZnmmgeL8TxXyEbLi6k2MB3dyZMqrU2LvaIvHqSQre6bX/HioxfoeJ0nt8PRl2s/fk33md9Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYiOhcj8jBVIt9fJlKW64Ce1Y4O4bJCbYVS/kGH/0pI=;
 b=lynCpgMt5nGRUKCh95kxC5+L7eDh16V23imvQFB3O6lrGkwesJhgCiDK6e4HP+bSTRt5VhoT6VDOlc3TxNv1dI+8YRWTGnNq9LBliPbYTjID+1chcyoJH8lJE0enZW1XIk9IoH93WyB1kqyZ8Kq7N1qkoYfIvuNkA/jRlkVFJY8=
Received: from BY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:1d0::35)
 by DS3PR10MB997726.namprd10.prod.outlook.com (2603:10b6:8:345::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Fri, 30 Jan
 2026 22:08:40 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::6c) by BY5PR04CA0025.outlook.office365.com
 (2603:10b6:a03:1d0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.12 via Frontend Transport; Fri,
 30 Jan 2026 22:08:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 22:08:38 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 16:08:33 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 16:08:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 16:08:33 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UM8WGX2385490;
	Fri, 30 Jan 2026 16:08:33 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH v2 2/2] meta-arago-distro: Remove tisdk name from Arago packagegroups
Date: Fri, 30 Jan 2026 16:08:30 -0600
Message-ID: <20260130220830.2173125-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260130220830.2173125-1-afd@ti.com>
References: <20260130220830.2173125-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|DS3PR10MB997726:EE_
X-MS-Office365-Filtering-Correlation-Id: e381ff6a-dea3-407c-a181-08de604c1f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?g9wKEyFJ/1TOLUwgqucxiPCX8rBpYOAb0PfqsTE3UGV2ITb/2I/yL0T3s6dh?=
 =?us-ascii?Q?Y7KrBQemC9wMQGjoTUHE/8kkDTguZxI5OG6jmeaa7afUeF/AKnTdhsCEgahq?=
 =?us-ascii?Q?xcJfSyBZJdnVUxErYu3cV4PFAX+Lh8NLh7Mf4GOKUqMzrCAFy92yxxmZHXrt?=
 =?us-ascii?Q?CPCODazFY6amCu4gEEEgc5ukGiRRZxYuHYYmbFd+bqiFVclMrsbSlZ5PwI/L?=
 =?us-ascii?Q?f+APSZqVm3XgV1en8okJZ/5ROROmNobbaJAoUvarSqCD6S2Jt+K90QAvdFom?=
 =?us-ascii?Q?IRvD/m4ubXZTZWZHtUxYAc+XExcMYf6EGsrmyd4JNQDR063oDxlG6lyt+VJI?=
 =?us-ascii?Q?pwhvoM3jiJbMvw1Y7gAIr2XhN2KA3JO+FWejNNjUmVBA5hhlg1lceiyROQgC?=
 =?us-ascii?Q?ntNr/wwbWzrAB98yc12/KT+pZb3eP2oZ8pvlU5JDE/A4XJOFRiGgugatYDko?=
 =?us-ascii?Q?NONRkQvdh8VptkTFFXIbmSHuJNwBGEnx/mknjLeGzINmQQDJokFukSBl5rVk?=
 =?us-ascii?Q?2eFoV4+b+Ree8QVDTV5YvkV80/5J7Va+ILI/y5H434rLr7M71+oe7Z4QVfW8?=
 =?us-ascii?Q?6CdTgk7qOcuuhdfxbWoOEG2VIDdef8jGSsO98rE1DrWZnhulWOdRt02Ag2IB?=
 =?us-ascii?Q?axExKe60ihK3IIt2m2sen0rXoAY+RtwoI4SN4DRYcgDtyJ9PqawnYCurHUzd?=
 =?us-ascii?Q?JAQ3jNRuzlgrZbm8x6TqXo21R29CL9X6g1bG/3JLryDaeXzW6J5F8XKNoTmy?=
 =?us-ascii?Q?nl09LJDWyrqXuEGQHrmfuigBy+f67SeyX7mvYTxTjuwCRik0LhIXXB3QpF7J?=
 =?us-ascii?Q?yyP6kdLPzTU0+LoxrNADxaqWriVXRS4qrwi34mTT/gn187yHmamUi4L0TEkx?=
 =?us-ascii?Q?aAJLxxbaibvbtXeny6xDvklNa9P5XQyqsctIdNvmebZb4WoY9YMZN6F//YxK?=
 =?us-ascii?Q?M0bvMri1BGbFHLwQminpOSmhQcL+DypyDDK+1kXCMAssRg2onZWjjJDbXcdY?=
 =?us-ascii?Q?hIkqYffC2wKw4ds8Iu1rI2w6yNT0ZTIVcHDohqhGxu9oDDzpesrhRcorvBjj?=
 =?us-ascii?Q?xW6c3S3JjHETgowYUhcXKp2gcdQN/FLXcXW8P5QsKcuvdU5hpZWLx1k2nqm/?=
 =?us-ascii?Q?8GWVYmvAV2zu+I2cfOiowas+AhCunikvhRzDVeYq7mMB916M0964cZMoIAnP?=
 =?us-ascii?Q?N78OqWdA0v7esZnOdW+F/BQwu1cGieyIFgTfZNxJIA5rmVpWxLy1D+JInyoB?=
 =?us-ascii?Q?ILDzgMII3JLck8tXFrNoCOb07g3b+HsZl+jNJE8XYtq8Z28Y8dWNWDsiqjco?=
 =?us-ascii?Q?oqr21INBmYovSZFwZ0w5PBGh0pbe9KWIvKidPJcrVe0BuYa2GfDUcE6Koisv?=
 =?us-ascii?Q?ox+lSJNZ9YRk2S76u4DAj7xRRYxp2FxEhdQYS7K2j4cZ/ZGKJXp2gm8U3iE/?=
 =?us-ascii?Q?hGzI3M3+EOTH977OmxWkLjPCdnQe5FdbieUzvY1uD1wB8WqAz+Iq0Icr4VUl?=
 =?us-ascii?Q?lVQPDm7ZcZedHvdtDECpYsfuna+wpr714pU/6Q5f7dtzof6oTYJrf51voefw?=
 =?us-ascii?Q?3xMrr8+6hpifg+5djvyEo7+ecvmsOosPegA23S5zaPFsghkepLO8sVeJTwcV?=
 =?us-ascii?Q?ou9pHhOTkrx5fu45ukDdOySpO0oKL5s3q51m4gCAL/KBowNwYHzfMrVsuunR?=
 =?us-ascii?Q?jrA2Rw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uE1JSIipZNEEeBo7c7bRnN9JV4Ay923CaNtUFuwitHoYl9Dcx6LgFPcUYoGMdu4vfniRaDgyXKidE22DKdDmPnF7RLAoBEiHYZvM3dhQ2zTtfTJVyAC86twctIn9lG4Y7EDs5PhC3O65wYN7ht3u3M4cpYe6rTtCtWeF7kvcblcM/CwtBCXscWztmQV4Z6uyYv1TxI2g5Eb5iuOL8N6CzWHmqIr91gNyuP94rsRvr/D5jZgGl0xXS6Kra9bVLwD3OUPvsV4f8IGDTRnXZOrtWXl4ez0u6HCE+UOk2uRHw6tzbShqUig+VrfnY1P+gDMLxANzxJsZeybQmnvRnrolk0iiUXn9OWC2i+wDPCJ0rHfJ1612Lg6Vn7oZeo1vrXKULKds0X050IA+NNd1BcDz3U9AYb5lMgOghCTH4cvHY9HCWf3DG03/f5OqDOLc8MBp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 22:08:38.9840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e381ff6a-dea3-407c-a181-08de604c1f3d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997726
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 30 Jan 2026 22:08:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17058

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
 ...b =3D> packagegroup-arago-base-server-extra.bb} |  0
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
 18 files changed, 25 insertions(+), 25 deletions(-)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-addons-sdk-target.bb =3D> packagegroup-arago-addons-sdk-target.bb} (100=
%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ti=
sdk-addons.bb =3D> packagegroup-arago-addons.bb} (100%)
 rename meta-arago-distro/recipes-core/packagegroups/{packagegroup-arago-ba=
se-tisdk-server-extra.bb =3D> packagegroup-arago-base-server-extra.bb} (100=
%)
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
o-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups=
/packagegroup-arago-base-server-extra.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-base-tisdk-server-extra.bb
rename to meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-b=
ase-server-extra.bb
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


