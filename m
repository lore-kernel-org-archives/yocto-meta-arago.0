Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220E2C982C4
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 14:37:37 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7476.1768574254496383403
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 06:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=d+O5wE7Q;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.10, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwBFq/OskeJTXRDdGsiRt+MP0TqnT9RBcCkgfF24scvwq3uXIiiBNcd1w1foOm9oDGuo6xvS3XY48hNSZqmELy7eZMYhQdzJCsiqNIivhbf0iMOWNJgYMVoPJ9YFAgWnI7psDeQ4VxXn84yQZEAoZt8VO+RIIb3t/Ag/IQIa87tknoCV3WYFI/Kz/7UbgDiumQZX8DcYeZKU9qVMR8CegK33bzsDQZUNmH4HOmuktAd3V1pD8v5qfUxZx+OuEAeU13A1QtHp5yE/XdzUKDaEXThAsjfj5JQGV1JMMZFOphz3D5wiQ1rcMay2RaNVHpbSvvwHnw3W5wWi9XNmZg0TJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aczmGraj9mm+kvDASScU0SDsOP/csdgnfy7gYM9HzMU=;
 b=d29gU/QRgBDJdzJxQJLScOF/P9Zxq0jlMhUWbyx8wpC86JnnvTZlT2ZdOW3IrpfLEo20auFRlxlQH7jfN98OqRLZN8PynS/oQ5DC+hWcDs1/Fbz2WlAIWuLxRPM9lLTbtQguvcswWmLyld/gAVMR8ENvnQOc1hUloPODoEW4j4L/G6cSGqF1vpzGrFHcXK2uAygPIlTX6pBI4AZaZmPY75SZtHhfKc5s9DzRjhWcink5E9AxypnG2x9nnfBYMNeJxVmwziLZ1HpiuNJ7zD2QxC0zWdD9OtcvO538N2AK2KBqTr0alejWAiTtRor5TOyUiq0fLzuR89noBTbPlJ5/QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aczmGraj9mm+kvDASScU0SDsOP/csdgnfy7gYM9HzMU=;
 b=d+O5wE7Qua2weVE39/kJQ7Vl0m5sQhIlb1iwWW0RJfp0PalJ1sWFNhP1i8GSwwQ6g5TrbK4MGgiajhBgUSfH4flqYUhyoDeHWK6S86n1uovNF7RwBBCsyCFliiOOCn5xdasUuH0+D7Bk3eZBXaOsuIaEn43hqXOwvnLzgs1wQJg=
Received: from CH0PR04CA0070.namprd04.prod.outlook.com (2603:10b6:610:74::15)
 by IA1PR10MB6220.namprd10.prod.outlook.com (2603:10b6:208:3a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 14:37:30 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:74:cafe::a0) by CH0PR04CA0070.outlook.office365.com
 (2603:10b6:610:74::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 14:37:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Fri, 16 Jan 2026 14:37:30 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 08:37:28 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 08:37:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 08:37:28 -0600
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GEbPJX3417786;
	Fri, 16 Jan 2026 08:37:26 -0600
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH v2 1/2] gstreamer1.0-plugins-good: Add QT6 PACKAGECONFIG support
Date: Fri, 16 Jan 2026 20:07:21 +0530
Message-ID: <20260116143722.2135247-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|IA1PR10MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 14bbace1-490f-4526-6108-08de550cc75c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vvCDXZmRlcttIH/yq8MSiIyKjANWax9bXxNbJQpD79KxUVbteQGVRHLFsCaf?=
 =?us-ascii?Q?ryKYXBSzGm1ZaqgqqCK/BGfPiXGdP4SgeZX/KjmNv1ahrpw3EKGXu23oXbq7?=
 =?us-ascii?Q?oWRNiqIu9p5YPJ8ncrwlxxbMry8jbwB6+c/u6cUQ35zABv764cjEevbsAwG9?=
 =?us-ascii?Q?yer5ktAz6UCWPobEJk3nk5+S0wu1HwrPvdVsV/1pNX+KCSS1BZX4hku3Z0wQ?=
 =?us-ascii?Q?2zsqMCTo2pH/EJpv/qx6Pgyq9+wxGVR04wKaIKWD5hBw5CkX/aJAdz8l82pN?=
 =?us-ascii?Q?RoJytZIKmSkqPQNnwyi+cMKqHZGSIQReoLcpOetIUSd2eFRJgO7LyWOVeO9i?=
 =?us-ascii?Q?pv52hdASH4jO/wDydZ5Eie/oPeFZLhfVwNDpEUUvLbrZTTUeKbRtJIwKcgQx?=
 =?us-ascii?Q?wR9XD41BwJTL477kFk4bZmLqhvtY2VC4//BDe+241rjxHiwqDQc19GiUzUlr?=
 =?us-ascii?Q?By14wPzuGtfrmIrX3u5N7Si1KAyhsLH0RtlYGXt/D4kQH1+iM9/c4UOUIkbQ?=
 =?us-ascii?Q?URkB9+18RVNI7JyXwYIbQ+euXV+3GKD+lnLfQhIV3L2yQss8H89OBFIQrMO3?=
 =?us-ascii?Q?ChhZXcT52ZNWgYw8zpEixiYyPEYQwS//5OhVzEbebhJeuQCRPXfBjU1m0ttJ?=
 =?us-ascii?Q?RDhcVil8Rulo5AAilSrlXEe/BQAmeNkLg4mWy1kLW7Ixi/bfaEiDfN299KwV?=
 =?us-ascii?Q?hcVCJjIA0WAHrVQ4QNHZxvUWUGi+VYkWDmQafCs0mug65dLwrelyCUrQnEOY?=
 =?us-ascii?Q?MVavOcZJjGzUDGpa1GjT6v2Aywzp1DhD9bcVkKuwgYT6r0eighrvwF85D/pi?=
 =?us-ascii?Q?5dYScko61i+6LW3GXUVXoHnjzZtZKlB0ELAKo2xc5P7JWhcJUAAox3Bym4sz?=
 =?us-ascii?Q?oEah6RWOSTG5KSQou8PwO/4GQj7yPDT34MGk6DyTL/5G3jZj4wc/SBlVAuYe?=
 =?us-ascii?Q?fRy22kJaIke7YRSHDBqzCoKG6NlC9AdMLnYY9kBWLI6ZPYAYOQxpP1HlQsK6?=
 =?us-ascii?Q?wojqtIAyqAdPNZ5DqSp2ZjI3JFVRlNeptA2yB01E6JKoMx6tSMmj7qGdAET+?=
 =?us-ascii?Q?Y5uLB0vOLquLNdhh3qiSp0tlZW9GXPsiEVJ/cLbHyelh/dIy5UrqsdPD1BTK?=
 =?us-ascii?Q?Sst7T6jcIk5Ff2BkqtajbLB42pwHalgdeWvOZsD5DoxFHS0ld4pT+B3VXQ3F?=
 =?us-ascii?Q?9uFLF9gC/d2WRw+bngOUfajjSHmT9W1UoRt0km3ERoJqvi4X/VFQRknBF78P?=
 =?us-ascii?Q?2O9uMevGuUTZQ4ekbviVaSWfhWtK4sQ6qOZ24ktHFokNT/lSQOhRwF3wBnWT?=
 =?us-ascii?Q?Yfw3m6hwyh+M6yaMHZrOEmjPS0pOhlr/dR9foKGktTKUbuVsXkjo5kpCaPqt?=
 =?us-ascii?Q?W8gtUmTlRZn6eId8QnD3xZuzkGI5a084e0lWxxfOQghuVBGfT+1wbf17Y6z8?=
 =?us-ascii?Q?Ja45Rxj/sFDxA0Waxnk0GvOxa+zS6KZEUMlCT8Qt+DMbsxjzglZVSnEYZEbm?=
 =?us-ascii?Q?X72aBWzDPv3e0kr5wY9+Cudryitbr+2rIKLvPRLRyefQWs4e6lsTQqNUdgwC?=
 =?us-ascii?Q?PsZfmuwloxcSDSVQemMVXz0Z80uUcNsmAwdQUyfwPbLtJ/eGIJSPWASASbVN?=
 =?us-ascii?Q?wmj9RidapEk4Hi4XRkmeW7/zODfbjNgJGYmYoyROnSuh?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 14:37:30.4917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14bbace1-490f-4526-6108-08de550cc75c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6220
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 14:37:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16966

GStreamer's Qt6 qmlgl plugin enables video rendering in Qt6/QML application=
s
by providing GstGLVideoItem QML element. This plugin is essential for
integrating GStreamer pipelines with Qt6 Quick/QML user interfaces.

Enable Qt6 PACKAGECONFIG to build the qmlgl plugin when qt6-layer is presen=
t
utilizing dynamic-layer.

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 meta-arago-extras/conf/layer.conf                     |  4 ++++
 .../gstreamer/gstreamer1.0-plugins-good_1.26-qt6.inc  | 11 +++++++++++
 .../gstreamer1.0-plugins-good_1.26.%.bbappend         |  4 ++++
 3 files changed, 19 insertions(+)
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-mult=
imedia/gstreamer/gstreamer1.0-plugins-good_1.26-qt6.inc
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
gstreamer/gstreamer1.0-plugins-good_1.26-qt6.inc b/meta-arago-extras/dynami=
c-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1=
.26-qt6.inc
new file mode 100644
index 00000000..e30440e1
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.26-qt6.inc
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
diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/=
gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend b/meta-arago-extras/dyn=
amic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-goo=
d_1.26.%.bbappend
new file mode 100644
index 00000000..27426f4d
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.26.%.bbappend
@@ -0,0 +1,4 @@
+GSTREAMER1p0_PLUGINS_GOOD_1p26_QT6 =3D ""
+GSTREAMER1p0_PLUGINS_GOOD_1p26_QT6:arago =3D "gstreamer1.0-plugins-good_1.=
26-qt6.inc"
+
+require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_QT6}
--=20
2.34.1


