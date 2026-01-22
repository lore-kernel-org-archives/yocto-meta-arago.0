Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09658C44500
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 12:31:19 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36336.1769085074189028793
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 04:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=iEz+otWC;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.50, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULIQ0bpwhcm2gnXK9uR6udIQMBY6SuDh5PmEPCXqsHjiE0jGa5SraoSiDXRcA+CnEYWSD7WXJELpzafBa0pFuaWieMVNyzImItkDfl3biBx18fjOLXZBLhkfCSKxlFQiAL4Oys2J3ty/BSklfeyg+XIW0W47lXQ6+JFkLbyNyCdDzVBrI1FogrB1+V772CfEAtPqcJBxKcOTnmABFi0NB2GAFjp3G/wnYBGuoUEUv4DW+2y5cOtunH30lzUo725gqzvIbekHtMIhJ/vJqkLYCRxKjcXO/LvhUKi3+6eZ3ZwTos4ULAh5S3mBe39eGarva8nmClFNymBmWn4+ZsnASQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBOZs3btWl60tgddnU72rq3OhDf0pTUtdGELeESPj44=;
 b=JX8OxUmRSjUU3do1NrcA5cyeN27zEl5LugWaRE0DNJqnhKxbjrXmmdia/NP4bWhjEvxirm5WrFvtXiMxoGJAkrUdGtij7/beCFD84uyNpj1oEl3wTJzupQxoUm6Uo8wH0vHkO1qrMXFIPYO37Fv+b8JO2ddlJ/ol1iv93UGwqF+JHi4QeRiMclH2plVN2eP+4hWCDGJVI5+SOsFwivf2MKx9EPw0pUC4bgORlBmoilz/cXmMAHaImTh7qg7M5vTKM3Nui0KifIDpNiBrBkVDpKlyfuihu9e9StAyaqfLWfykw8FMFgDsgNzYDcdwE8HCEbx9PyGCeQS6fLHSYmjXYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBOZs3btWl60tgddnU72rq3OhDf0pTUtdGELeESPj44=;
 b=iEz+otWCy2hFsUaauuk4HGfLYFR/guo3nLLuq0zgay5MmOxSzvMWjcLjlINMoVVvviSIl0N7ZzYt/J1YTVbqwlvcFxsW1mTN4rtGPSdCzjF1NG07dWpDXI0EUnOK41GZXZLY6I5lgmawkVvZtNfG1WKCRMPAzKbvIBURPoqskKs=
Received: from BLAPR05CA0031.namprd05.prod.outlook.com (2603:10b6:208:335::12)
 by LV0PR10MB997686.namprd10.prod.outlook.com (2603:10b6:408:340::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 12:31:11 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:335:cafe::9) by BLAPR05CA0031.outlook.office365.com
 (2603:10b6:208:335::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 12:31:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 12:31:11 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 06:31:11 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 06:31:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 06:31:11 -0600
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MCV9Q0554005;
	Thu, 22 Jan 2026 06:31:09 -0600
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH v3 1/2] gstreamer1.0-plugins-good: Enable QT6 PACKAGECONFIG support
Date: Thu, 22 Jan 2026 18:01:06 +0530
Message-ID: <20260122123107.3001250-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|LV0PR10MB997686:EE_
X-MS-Office365-Filtering-Correlation-Id: b2cbe35a-1e36-42c9-1921-08de59b22092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3qb9Ci35r0jNuc05E0w96P+Kq4mtFnoWayGRQ7CCCFipp9gvThxFg2GEYIkS?=
 =?us-ascii?Q?KQPt24L5dDcgurXajpSGZMS7NqeXqDzwgt6Lpe3V7Vm1lbdWn+3NuGDqKsz8?=
 =?us-ascii?Q?lzLRIt2kwDB/A9SnTtbMyWwhXu4BQSSyzoTGIzI0psKXkVdZwr95Y6LFKdnm?=
 =?us-ascii?Q?JGstJYKfOLSgxzFarPtIiVKRCF+ewAzRTqYL0SMC/UUKeGcKf8bsBEZeC5Uw?=
 =?us-ascii?Q?afObt2nTwqBlC5GRMMIFpJs0W1uEid+GpPWoXc1esh6g5joQsAdU4BEgl2Ua?=
 =?us-ascii?Q?0FAfml8t2VHXK78CZ7hPL4pNtxF9pMaSXfIa39loJ/cYX8PZky5ZGdYLQV7v?=
 =?us-ascii?Q?aS7zNowGyiZEFLvy9KqywriAHnL3zcBRn4SsZDqnYxpCW46hH3Tkl2lgGykJ?=
 =?us-ascii?Q?YGecVN4T3Y0fNwdt1CARsjuoHkjnG1kpS7TYIHkVserxdlh49tzd1ys3TnDd?=
 =?us-ascii?Q?EQjcMqUkCVez88v5JzSqbN1kG59o0IpDGmg+mNHpUDtUmS/vCRagz0V4JcVh?=
 =?us-ascii?Q?JgCi+i7QozNSnJHybRH0xZRJqMlq9mr+6Tp1NZHeFwVB2K2+Hy94UC/kO2Tj?=
 =?us-ascii?Q?Ki6g8uOoVV5xL/jK9ZDbN4AyVhNSdl2CXWPiyjHOO7Lu4IWT6wow8kID/0gC?=
 =?us-ascii?Q?O6Rx6nTwopAtIBNRVfL8/lwbX7aefaIiDu5szSTD3qecIH/xskhUDG3/EkaI?=
 =?us-ascii?Q?TIhAR7Q+srn39bLoUbaJw/pyS0SblzaRvanAkzETy/UAXfD7jxjXPWI4Z0Pq?=
 =?us-ascii?Q?Hr7/Gm3DJW9mg4oeLCRB7yzGwUJlK7x56Zlm9Xbi3UWX693+WaN2IvW/gANX?=
 =?us-ascii?Q?BuMoxCeVSlJT+73A7OdV4PJwPodg+3XGFVhCunKGVj3doHU3djzDooWClp6r?=
 =?us-ascii?Q?jtQACzCDSXOnf9RVjzkfsLwuP07Rmq+lTV8lvIacNlCEJh4P2oQ7VkPxz+J6?=
 =?us-ascii?Q?bKtjAC61G2mBZUoPaaBuxgg4T0GhaE/qbiAW5tFf5ZZnSGJrjjobraJp66Ko?=
 =?us-ascii?Q?IQ0pLDM/lFxHLHgOW847Ikb9ZlDmgQIEZFB8krwmK/6CzUoWHKA2BYCj63zf?=
 =?us-ascii?Q?UBCyo21dibqmhfvLFeZ+gQBvBlLWI5Joq1jl68HGgsFPCJME5GUN1lLf6qWf?=
 =?us-ascii?Q?8h2E6Z/YchZT8PgnB+cU8Y9vhPrSO/njusAfk8c04Wru0o8mqUeWu42DQwbc?=
 =?us-ascii?Q?K5aQQek/JIymoLE2PyJR8F1QpGRBHbSniuGgfIg4HUq2xSaJbMLQizupX9kq?=
 =?us-ascii?Q?NSQjvSS6ZO89TYrQjbIDodAhSVBwxjkwXu3wS4U1T5eSANGHnJ33jlIuOeS3?=
 =?us-ascii?Q?+wyv32MPccZUU+tRu88peDHbzs2qUjciDBg7/18ZtJVX/NEpmhx7NalQJNhe?=
 =?us-ascii?Q?Sq851x9dK2qMXBr+jOuJ+QrqE01k8W7EDr6MBaN9asdresQ8891271jcKktt?=
 =?us-ascii?Q?V4b6rTikCVQHcKsf8UKJX2jWmqSCC375zKlaB91QSte8UML9F/UmYiuTTOaG?=
 =?us-ascii?Q?KZTR7LgruJdKl1/TrcQOUq/53MORVlqXof9IisAyLLrvOdHyOknU0Ab8SGSL?=
 =?us-ascii?Q?VFCsT5FWnZkiHltE5MyhPTLm5CeMflLr9rYD3iSq0WQER0MSBW64mlitWj6A?=
 =?us-ascii?Q?cTHAXBUoDx/jXSDLSy1HzfVVPWyHP8neu4SmowJV5sovoYeEYzMMC6UtHCFY?=
 =?us-ascii?Q?nY8Lpg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:31:11.7500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2cbe35a-1e36-42c9-1921-08de59b22092
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997686
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jan 2026 12:31:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17005

GStreamer's Qt6 qmlgl plugin enables video rendering in Qt6/QML application=
s
by providing GstGLVideoItem QML element. This plugin is essential for
integrating GStreamer pipelines with Qt6 Quick/QML user interfaces.

Enable Qt6 PACKAGECONFIG which are added in oe-core[0] to build the qmlgl
plugin when qt6-layer is present utilizing dynamic-layer.

[0]: https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next=
&id=3D0a6acd465deb1ee2d30e26b7662ad4abdc459bdb

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
Changes in v3: Rename files to arago standard and upstream qt6 packageconfi=
gs
Changes in v2: fix PRC failures

 meta-arago-extras/conf/layer.conf                          | 4 ++++
 .../gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc     | 7 +++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.26.%.bbappend    | 4 ++++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-mult=
imedia/gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc
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
gstreamer/gstreamer1.0-plugins-good_1.26-arago.inc b/meta-arago-extras/dyna=
mic-layers/qt6-layer/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good=
_1.26-arago.inc
new file mode 100644
index 00000000..8c89e68a
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.26-arago.inc
@@ -0,0 +1,7 @@
+PACKAGECONFIG:append =3D " qt6"
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
index 00000000..0ceb558c
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-good_1.26.%.bbappend
@@ -0,0 +1,4 @@
+GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO =3D ""
+GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO:arago =3D "gstreamer1.0-plugins-good_=
1.26-arago.inc"
+
+require ${GSTREAMER1p0_PLUGINS_GOOD_1p26_ARAGO}
--=20
2.34.1


