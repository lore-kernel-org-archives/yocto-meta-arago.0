Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB24D48996
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 12:11:26 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4715.1768565484209751843
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 04:11:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=rzlTkCha;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.39, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzmJtpP6QbNv0A79N1PmxAZO9jfBS8bqloftE53DJ1OYbhE51zd69nJbx92Y9THDjEc0FYlGZYMnSr/G25aPFFzTXYCHc5F5447J9aBREd0RjNaWjk6f6XjKCmvhUP3LLBoaikbRijPzXn/M7pq8zSG0XjKS6pvE/pcT3t6x6HPv9J3IOMrZ4GDscBR+w9mfib4cLIL6bbB1ql8WPoY9f5uaEabOPEJB/5fGNFjd6SBOfZv+TlJkSNAmSTJLKdXwJn7mMhMq5aL1adzR2OZAj7vzxN3yE4YSA6kco2zuFFXsyuEapNvrvQB2nyTzSQ/S4aLvwD4iAkzuWn8IkVHiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbAvPZSfurQp1U5/RgyUHMlVjmJOlXbV+WUoN7/axPM=;
 b=ZTlJAsRP2fGHe3XnZ6di+na66ePcxbDvZWkRxjiyy/XvINa/MAw0B9OCQ+IKcWFea2deOPIyG+pYYqKyxZL/sQyz3rzjwQyw3CymZtKTriZv7SB+7pTm/noBMqsKTnSpwLl8woTV2ktpcnG8fbTvLSpEzMlN/xnO+1J13uxr+ODU9hLNYtifPl/BARlYrE5C3W0AuGPWb6FbD+04TlmrmQ24KdlsPaoUpYT6kMdvuzPZg0euNmVF6KqDwes3B53Kf2kqPnRrQvWBurK3RgGfJE9gipLytEuCvWB1wWa9dyaqrKpb9ZSpcRHeblKOvblp/RmKaW49mwtGQ5Z55jqAxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbAvPZSfurQp1U5/RgyUHMlVjmJOlXbV+WUoN7/axPM=;
 b=rzlTkChaGFdnmR5RlhSDSf2RvCUaX4dc1OtQ4h+wycU8oMcZguZzSOQywWHERIxzIlJcrd7QtA9Op1CQEu0aKKhP5waKgcH0NVeSYCkuAZKAJbsS+i0C6Q9tdRU2A8OJSxUICf9kNU01CFnCv6u/x1agIZfRcuAdxhegDmKZWF4=
Received: from BL1P221CA0035.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::8)
 by PH7PR10MB5813.namprd10.prod.outlook.com (2603:10b6:510:132::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 12:11:21 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:5b5:cafe::21) by BL1P221CA0035.outlook.office365.com
 (2603:10b6:208:5b5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 12:11:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Fri, 16 Jan 2026 12:11:20 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 06:11:20 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 06:11:19 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 06:11:19 -0600
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GCBHIS3115968;
	Fri, 16 Jan 2026 06:11:18 -0600
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH 1/2] gstreamer1.0-plugins-good: Add QT6 PACKAGECONFIG support
Date: Fri, 16 Jan 2026 17:40:43 +0530
Message-ID: <20260116121044.2028660-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|PH7PR10MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1f6b11-7e4c-479f-f55c-08de54f85bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|34020700016|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x8qwBbPJnU4tMsBnMiL0tbRbe30soJQCAvMa+Hg+LqEIsY3BAjy5goLR7doO?=
 =?us-ascii?Q?384Xrfu8BfSKhUBbYj7/TsFSqqq6oI/AQFPhA0KhJxkCKIRyPrujGHRAqNGh?=
 =?us-ascii?Q?iP5mi2U7OFX25BBWKKm/64mog37Biv6Uadl3nzwnojLRfO16pNBCOFG5lalg?=
 =?us-ascii?Q?J2a9tC6v/tmi1rOcChtPh+VQsVw9KLVi0CoJa7WRhmGytQdiDP9KXiXTyeb3?=
 =?us-ascii?Q?b8sRwnyT+AyDHQe0nMSAWaYUxuC1ZT44Dl3cSjfSo1AF60xSdHimT9Ta9lGW?=
 =?us-ascii?Q?HMt9wJylrUGyagX87nPCVtJzpmbby7cwy0vjV/AMvtJuO/Rpuc5PG6j8YktD?=
 =?us-ascii?Q?C0hfBO5BzMaBwLUWgu8w+U2JkrPB4Gb3+Qo39CsVM6Y1/rIiaeVPbbyqkyil?=
 =?us-ascii?Q?AwCqOuQU0D74o4OrmgbRruRjQp4Cjtsw8fPqyXk6J9AZ8g7Wis/e7BCpPIXh?=
 =?us-ascii?Q?7V55iu4fQ572UqZVDTNbVSw5Z+0EqLiniq90qXVsAa+OBwoZ/zY7DU/Sd7YU?=
 =?us-ascii?Q?9rarDmFjRM4P+c7E5609j5ATLOsO40vmPEeiNl9JxnFS3jWgEcJPCmfpupCq?=
 =?us-ascii?Q?p3EsJAHf31msttH8ofBATxkICaCLVt+PqJpOplB3BCYDO3KYcCITejfFZj94?=
 =?us-ascii?Q?WpHUDcsU37VRBCLb0W6GvHiBZn1XQi57oi56huQzD7SaY3kONdSDMwcvgLbK?=
 =?us-ascii?Q?YBR3ID3Cik2gqI+pQlwM+Kmq89qjmltaP6ZXfHE7CzlX8OUn0+a2Z+4Co6sO?=
 =?us-ascii?Q?wjFigKiJJr8C33NmexXzWsVPBanoCTn0wenfVz5NnUNinLaKLMFsOQaK4FpT?=
 =?us-ascii?Q?fZADOEfji37xdwykYRXDS5IWCAqXEU7gCeGVNO4VVDBtmvAjyAsFOxIl+WMU?=
 =?us-ascii?Q?JqAjqQgdOkERp33rOGkb+28c9xNgLIFgKrs8oVQI7QhTgW0J3McDO4jnYTsI?=
 =?us-ascii?Q?QGLcHizkduO6iSBFkrKjL1IVKjkkpKad/r6NNrvHKmrEAAek/THsIkcuIya9?=
 =?us-ascii?Q?MW+JtJDvwEjHbyDXW5RMm5A6gwDFslWs8j8KLez9UVlGIRG25FlruyvJbNHR?=
 =?us-ascii?Q?BbTJWKSc3P3NgJ9zVgefvhd98NvqkQFiojOqpmHLwyyy7abeYr3uDW5m7RTt?=
 =?us-ascii?Q?fbS0n7Lum6DyzCLZtmhsMogdoFcq/HvWyL7SK9XYTj8i0s2CbHzCiSao6S8p?=
 =?us-ascii?Q?QdUGh77zP8NTkOmrXmOhh9+fs9U0vM/siBK1MSYjhqremPseckuyIr6gGsV5?=
 =?us-ascii?Q?gbk3bCiwKOZWiZv9dIJi3XafU8yM+DNCbXRDKLTvFtH/V93mkyoPXAUbfW4J?=
 =?us-ascii?Q?7q8SE/HQ6xOIj6xyM7uln5vFNTDgpUQS1cNgFdtLlrCDBHFcCpvv/6cg5o3A?=
 =?us-ascii?Q?UXqydxO9FIzuKlD8M4JfDYDq+SzTLZKbuLLOKpyEfpk+BXAu2lCZrpZsyThO?=
 =?us-ascii?Q?4Y7TFYSpN6mWjQDvoCXKWQAK7pxtaqA+Q7A1bWa+zCd/NaNaRr3a0fk/5KnR?=
 =?us-ascii?Q?zvuO7hX9LPvaH3v9N0dvbXFldyBov2SSct5vWrJ36UE39CQsbmWuQIRl/4vr?=
 =?us-ascii?Q?k0TcJZFdHrd55DJmW2PMbMagyTlJvamk452iiqbiXzf1rQFWnEir0Fgp9Y7L?=
 =?us-ascii?Q?uakaz1F7Tm5NRkM51db/7vlNiGq448cLmTNS9SF9EezE?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(34020700016)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 12:11:20.3961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1f6b11-7e4c-479f-f55c-08de54f85bfc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5813
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 12:11:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16963

GStreamer's Qt6 qmlgl plugin enables video rendering in Qt6/QML application=
s
by providing GstGLVideoItem QML element. This plugin is essential for integ=
rating
GStreamer pipelines with Qt6 Quick/QML user interfaces.

Enable Qt6 PACKAGECONFIG to build the qmlgl plugin when qt6-layer is presen=
t
utilizing dynamic-layer.

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 meta-arago-extras/conf/layer.conf                     |  4 ++++
 .../gstreamer1.0-plugins-good_1.26.%.bbappend         | 11 +++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-mult=
imedia/gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend

diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/lay=
er.conf
index 3927a913..1a4a5bdd 100644
--- a/meta-arago-extras/conf/layer.conf
+++ b/meta-arago-extras/conf/layer.conf
@@ -22,3 +22,7 @@ LAYERDEPENDS_meta-arago-extras =3D " \
     networking-layer \
     openembedded-layer \
 "
+
+BBFILES_DYNAMIC +=3D " \
+    qt6-layer:${LAYERDIR}/dynamic-layers/qt6-layer/recipes*/*/*.bbappend \
+"
diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend b/meta-arago-extras/dyn=
amic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.26.%.bbappend
new file mode 100644
index 00000000..e30440e1
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.26.%.bbappend
@@ -0,0 +1,11 @@
+PACKAGECONFIG:append =3D " qt6"
+
+QT6WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "wayland", =
"qtwayland", "", d)}"
+
+PACKAGECONFIG[qt6] =3D "-Dqt6=3Denabled, -Dqt6=3Ddisabled, qtbase qtbase-n=
ative qtdeclarative qttools-native ${QT6WAYLANDDEPENDS}"
+
+# Qt tools like rcc, moc and uic are located in /usr/libexec, instead of
+# /usr/bin, which is not in PATH by default.
+do_configure:prepend:class-target() {
+	export PATH=3D${STAGING_DIR_NATIVE}${libexecdir}:$PATH
+}
--=20
2.34.1


