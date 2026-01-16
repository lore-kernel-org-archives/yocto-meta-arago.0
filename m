Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0545BC982C7
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 14:37:47 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7430.1768574257147625166
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 16 Jan 2026 06:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=il7MwDlz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.36, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpGOCZ3IjWkWtf6EvtBMTMCqqcmr3oxFXuZBxym4ZaJEspzBVygWHhx4aIqiIfNYssyMSBJ6OVgVg9NxZx0Hg3zd61B1EMKvUPb9tCVUlMzgdr0tdM0jshKJHVZmLQUnJS2AIEKMhnHQzLIjxpsu+LV6vQ+7X+WJgSiwTDFU5RCOaj/zvbg0B1Rsk3l0OLh/XmxqGzLk+XohT1hznIpU2VlhijSBOG+OCxOE7ejNrKTWhxNij1Q7fkZmENbghpI1+YdbELY9AslNJrmY8icsSc8HbfU7RKEIIO6g6UylxEpA9hW1GHtfpZMvE3W6AtnH8ATttdobZhJXw2vvPXKWrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=au6bZJS0mmUiRhL8UqsQhVYkNWIUWJgnK6wkAbHKBrs=;
 b=ZIxXxa5giHPYuA9LPufYaxdFWmldwJ7A+gc115PIEl3Dqw5jaiUnoZD7LwXThRP+RFy80V/zjUbKRXnozjsxmORS8syDaJ1nxu3DIpT30FpeZAIZvNAv83M3RCy77hClfFlr6W6wZFKcuwMFZZ9t3gVQCJPtqD3Rmjx++YJOha55kGIZWfVFzBwK+KafUb6VYxlNNlKpn49h9KmiDF6CHc8nOvwVwGqpwB67lrPtBpEz8NwuW/cAkWXodKU/HQ8YuzwGDtEn2/YF/o3n18N4nWUp5cLjlr6S9CxrudgY5I8IiyMkFAAL9KZifMTzOtScLWjKs9lm4ZxteZZGG6g98A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=au6bZJS0mmUiRhL8UqsQhVYkNWIUWJgnK6wkAbHKBrs=;
 b=il7MwDlzmtT4FJUxl06FqJ5Wt257DH3DhlVuHwYqjjqlLY94FywoA0HNKFckEgdGw5oZVeNs4njUh36nglLgEMaFyW45Thqz/W2v28O9cW+wjIfdh8VcB9jX/bsfmMbfQx67huPu6k6WTvvp2cY+phn9aeHEuK0UGWT8oqzfS8E=
Received: from BYAPR21CA0027.namprd21.prod.outlook.com (2603:10b6:a03:114::37)
 by CO6PR10MB5620.namprd10.prod.outlook.com (2603:10b6:303:14b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 14:37:33 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:a03:114:cafe::18) by BYAPR21CA0027.outlook.office365.com
 (2603:10b6:a03:114::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via Frontend Transport; Fri,
 16 Jan 2026 14:37:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.0 via Frontend Transport; Fri, 16 Jan 2026 14:37:33 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 08:37:32 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 08:37:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 08:37:32 -0600
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GEbPJY3417786;
	Fri, 16 Jan 2026 08:37:30 -0600
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH v2 2/2] meson: Add patch to fix Qt6 private header detection for cross-compilation
Date: Fri, 16 Jan 2026 20:07:22 +0530
Message-ID: <20260116143722.2135247-2-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116143722.2135247-1-j-sahu@ti.com>
References: <20260116143722.2135247-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|CO6PR10MB5620:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c8e4a5-1795-43a8-3162-08de550cc904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wVz2DmuQQb4/eFiU+7Zx1GpVKBNWWbdaWNxgxcUo/dljODWtzmd/XwI4afAv?=
 =?us-ascii?Q?xQ7V5LBrt7QuOsIoXzRc7uBnogHMVYvfSCTPmo+EKFdzPiLSbu1a8Thj7b8u?=
 =?us-ascii?Q?REIC8R9qY9oy63/6GYM0hmmPJoy+b85cW7ayDqvCwcwAxvuypnfNm24Qe0Bq?=
 =?us-ascii?Q?nRbbhR931r4fahncIyuJpg/S5QFW54FAyk3FiEQlXr+FBkv/tVBxu1euOqAm?=
 =?us-ascii?Q?xVzkvyQXL6tVqFf38eqbdPdI2pnwGSN/USWH/gq2U7MY48iGtMb1Atf2T9MU?=
 =?us-ascii?Q?5qorgCGm5KWWxS2roPBRhmxzWfpxhIK25h7CS4brzHOQhA5QdgaquqBQGtBm?=
 =?us-ascii?Q?BwGIoTSfm3bKFwAtR+am4dGFTeXSsvK8WT6e9wVzGHVsagWuUHhaV/AtEVrQ?=
 =?us-ascii?Q?6hbWGkNg9vHgtfRyheeg1gr6aGV6ZZWKXMbi1miAd9CdJWo+cfwxsfLY0pdd?=
 =?us-ascii?Q?SZDu/FSsu51Azq5NZ5Q2xno3Kjfrp1ub3aiJalbjXiXo4mpL3fHH/KXV0w++?=
 =?us-ascii?Q?a1RcWEXruWeQz1XRSGVR9YWG/rq7XC5hZeFC3mZ65gJU+Ae2jiSNO1caMNcs?=
 =?us-ascii?Q?s78Icd1rWogbmBe3AFCpD3uyzEqGmqd6fblVsLbHe677p/2IgvoUJusv7bp9?=
 =?us-ascii?Q?k9q3/xZ4aQvYsbTjyJgV0uPV39D6LBE4wuKseFf/Z6Uyi3ALyVljihXB7h7w?=
 =?us-ascii?Q?v1IrRXOrjeibVeNKsxClEZEB93kkAHDyLQ1xEbhEbNq1iE+84uBTMGOC/1g0?=
 =?us-ascii?Q?v4UihmaG4kfCW4gTNF9rwDTWf1pObDdMHE8BcE+7ZDMIKIlKmLAt9PlXl/0e?=
 =?us-ascii?Q?+YJhEDqNrQDFKHVUyryHWHPB6O4oTChTE2SON382c5RaxULTGb6AtkrU3hkM?=
 =?us-ascii?Q?X4Ak8cYEYK4gXhoRF307Slg8Z8ELL4otx7pxQ0P6ViHFNIEAQhMPX0FBw+LB?=
 =?us-ascii?Q?89/EZxy/q6TFLM06ySQa5bHEh7IXUa336ba7EEWlWYOrgGepWZlAB3CUiorx?=
 =?us-ascii?Q?c6hhfJcWHLAioi3g3O8QXW/R9EFPByHu621Ux42VoRCGPX04VDESvghCGcTo?=
 =?us-ascii?Q?+sJlnwuQKQ1u7Kj8Q77aiJhTEzRva0RBeckgptdefqgGHTVR1VNA1Gn7RyHA?=
 =?us-ascii?Q?hMtqrI6e2G6K4xrhaaVKrrwSbkqRrB3XZ2qSF9eYWuhQBl3guZ3NpRxypGfo?=
 =?us-ascii?Q?c4FjehxBwz/LxYZDqoHZg6mA1ZMMz+d69YGaBaWozymu7AQhnKQO5PgwCpmw?=
 =?us-ascii?Q?hj/VtfHy8y3YDwKK3s73uLG9PJphFNDe+cnju8hqRJWyxZEZXW6uZpw+2PkA?=
 =?us-ascii?Q?e7SYb7Dcq442qW1M35fQoqynPnN7/87Occ9F54z7DYDrkm3IjkqrP1hLceeA?=
 =?us-ascii?Q?KCChVwFEAKUsafDzrg8+hgrnmuFe5N9yNWf/7ZST3vNk01bs0AbmwkB7lI6p?=
 =?us-ascii?Q?/ZCy2kSZfM3zNaCyWKSXs+9CzysMV43OzOXYRdE+ApsFkOygZVCOfxagsJfU?=
 =?us-ascii?Q?SAOKDek7mxDee+jXGwZynlUMICs54iAHqvk584Qjmkn77NtB6EhDoeGAJqEB?=
 =?us-ascii?Q?dZTnM3oT1W4+5Ht8gWjzHmDNExAtJSlECorpq/0KaxgC1CQzkPC9zXcF9dPi?=
 =?us-ascii?Q?rctk9zM1JGgb7we9mP0T7tA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 14:37:33.2347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c8e4a5-1795-43a8-3162-08de550cc904
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5620
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 16 Jan 2026 14:37:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16967

GStreamer commit 6efccf0ee18a[0] introduced dependency on Qt private header=
s
for building Qt6 qmlgl plugins. This exposed a bug in meson's Qt dependency
detection where it checks the build host filesystem instead of the sysroot
for private header paths.

Add patch to fix meson's inability to check Qt private header paths in the
sysroot during cross-compilation that sets PKG_CONFIG_SYSROOT_DIR and prepe=
nds
sysroot to Qt private header paths.

[0]: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/6efccf0ee1=
8a3cf7f426a5acceaa716e7c41f5dd

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 .../recipes-devtools/meson/meson-qt6.inc      |  5 ++
 ...respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch | 72 +++++++++++++++++++
 .../recipes-devtools/meson/meson_%.bbappend   |  4 ++
 3 files changed, 81 insertions(+)
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-devt=
ools/meson/meson-qt6.inc
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-devt=
ools/meson/meson/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.=
patch
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-devt=
ools/meson/meson_%.bbappend

diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/me=
son/meson-qt6.inc b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devt=
ools/meson/meson-qt6.inc
new file mode 100644
index 00000000..4a6cd19b
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/mes=
on-qt6.inc
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/meson:"
+
+SRC_URI:append =3D " \
+    file://0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch=
 \
+"
diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/me=
son/meson/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch b=
/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/meson/00=
01-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch
new file mode 100644
index 00000000..ff14dc1c
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/mes=
on/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch
@@ -0,0 +1,72 @@
+From 39f0e9c9b620b4289da61422022e507144a681b0 Mon Sep 17 00:00:00 2001
+From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
+Date: Fri, 9 Jan 2026 17:44:57 +0530
+Subject: [PATCH] qt: respect PKG_CONFIG_SYSROOT_DIR for cross-compilation
+
+When cross-compiling with Yocto/OpenEmbedded, pkg-config returns paths
+without the sysroot prefix (e.g., /usr/include/QtCore), but the actual
+files are in the recipe-sysroot. The _qt_get_private_includes() function
+checks the host filesystem instead of the sysroot for Qt private headers.
+
+This patch adds PKG_CONFIG_SYSROOT_DIR support to prepend sysroot when
+checking directory existence and when returning paths. Changes only
+activate when PKG_CONFIG_SYSROOT_DIR is set, preserving native builds.
+
+Also fixes dirname assignment to use full path instead of basename.
+
+Related issue: https://github.com/mesonbuild/meson/issues/15456
+
+Upstream-Status: Inappropriate [Yocto-specific sysroot handling]
+
+Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
+---
+ mesonbuild/dependencies/qt.py | 21 ++++++++++++++++-----
+ 1 file changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/mesonbuild/dependencies/qt.py b/mesonbuild/dependencies/qt.py
+index c245e5c..a3846ec 100644
+--- a/mesonbuild/dependencies/qt.py
++++ b/mesonbuild/dependencies/qt.py
+@@ -42,16 +42,24 @@ def _qt_get_private_includes(mod_inc_dir: str, module:=
 str, mod_version: str) ->
+     if int(mod_version.split('.')[0]) < 5:
+         return []
+
++    # Respect PKG_CONFIG_SYSROOT_DIR for cross-compilation
++    sysroot =3D os.environ.get('PKG_CONFIG_SYSROOT_DIR', '')
+     private_dir =3D os.path.join(mod_inc_dir, mod_version)
+     # fallback, let's try to find a directory with the latest version
+-    if os.path.isdir(mod_inc_dir) and not os.path.exists(private_dir):
+-        dirs =3D [filename for filename in os.listdir(mod_inc_dir)
+-                if os.path.isdir(os.path.join(mod_inc_dir, filename))]
++    # Check in sysroot for cross-compilation
++    check_mod_inc =3D os.path.join(sysroot, mod_inc_dir.lstrip('/')) if s=
ysroot else mod_inc_dir
++    check_private =3D os.path.join(sysroot, private_dir.lstrip('/')) if s=
ysroot else private_dir
++    if os.path.isdir(check_mod_inc) and not os.path.exists(check_private)=
:
++        dirs =3D [filename for filename in os.listdir(check_mod_inc)
++                if os.path.isdir(os.path.join(check_mod_inc, filename))]
+
+         for dirname in sorted(dirs, reverse=3DTrue):
+             if len(dirname.split('.')) =3D=3D 3:
+-                private_dir =3D dirname
++                private_dir =3D os.path.join(mod_inc_dir, dirname)
+                 break
++    # Prepend sysroot to returned paths for cross-compilation
++    if sysroot and not private_dir.startswith(sysroot):
++        private_dir =3D os.path.join(sysroot, private_dir.lstrip('/'))
+     return [private_dir, Path(private_dir, f'Qt{module}').as_posix()]
+
+
+@@ -192,7 +200,10 @@ class QtPkgConfigDependency(_QtBase, PkgConfigDepende=
ncy, metaclass=3Dabc.ABCMeta)
+             if self.private_headers:
+                 qt_inc_dir =3D mod.get_variable(pkgconfig=3D'includedir')
+                 mod_private_dir =3D os.path.join(qt_inc_dir, 'Qt' + m)
+-                if not os.path.isdir(mod_private_dir):
++                # Check in sysroot for cross-compilation
++                sysroot =3D os.environ.get('PKG_CONFIG_SYSROOT_DIR', '')
++                check_dir =3D os.path.join(sysroot, mod_private_dir.lstri=
p('/')) if sysroot else mod_private_dir
++                if not os.path.isdir(check_dir):
+                     # At least some versions of homebrew don't seem to se=
t this
+                     # up correctly. /usr/local/opt/qt/include/Qt + m_name=
 is a
+                     # symlink to /usr/local/opt/qt/include, but the pkg-c=
onfig
+--
+2.34.1
diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/me=
son/meson_%.bbappend b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-d=
evtools/meson/meson_%.bbappend
new file mode 100644
index 00000000..1512fdf6
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/mes=
on_%.bbappend
@@ -0,0 +1,4 @@
+MESON_QT6 =3D ""
+MESON_QT6:arago =3D "meson-qt6.inc"
+
+require ${MESON_QT6}
--=20
2.34.1


