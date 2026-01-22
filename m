Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8E6CA5FD7
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 12:31:19 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36337.1769085078101087763
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 04:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=NFteoPt9;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.42, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OR5mwElUFFmcK2aZOeNqJsMrp21lYHvrv6Kbsscy06wovGj+mQcrB+JSaC4Eo854UjwbAb1PFeOUiy9FIgaq7y1rUhcbCF6288+KXYFbbebIiUMabvDURmnyhTYHrHTyo01G9t8DeGHVImeJXJ6j/CMReSyc+d3UrsP12wo8ieIWg9eumQrrk4q8fFa0ObmDUs5u613kOauzQIaM2rrkVnqQU5S1Pnc7tl9SRqTKA2e15EqjSr5NtPpx1yq65wqPHN6i8MAyHGscDcuflL6GXz1PAuc4cydR4pIQ9eYpPflIDLm4yaMFJH0erq6I8O3wunvy+Z4yyYBXO/L0rxmD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmlktPFtfG9dGuAv+rXXQh2cJtzlFi3QqfaQ/mtnZ+8=;
 b=eS2ZL5jpJOVEhaM9N/siBB5VuwefIFfiiYU04sUXjL9tlX8jPQwcLmjdFy6bV7l7wP/j45Z3aBIVXJJIog+PywxqkerIBWeeNDUe4sJN3477nFeKcWIcjkRMC874+2wzAIVtS4n2Ds1m3+miQOh9SA6LqPaAdZ177yHBVuu40VuboyKuMqJU+MC3Dmn1i9UWdsVZt5zFjDJDgW2hTJbyGKFBfEEwOpIrTW6I59BWWml6RiQb/MldvOPHnynaw+CHqpQOf/CoLjxMQd1ER/vF9kZkjJYM/TSUBLuVNHZrf/zKiaz3gTZnkWtEKfdkHJVLkpOXNb735EV5N0VhTEUz+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmlktPFtfG9dGuAv+rXXQh2cJtzlFi3QqfaQ/mtnZ+8=;
 b=NFteoPt9uJ0Q/7/uy/3YoRS3Gk3KuE42Vw10rTdsZqin6aIXRd+1Rr23utWxlVTijqM2x49Ux+u1TyW40pL9P73DQ6wZsJjQXH0vW7y2VyD5+f9EA+7LwCBrTzjoL8a0sj48kElcnCE8PWKitBfrAVgKmcuNlqojWBVWdvZpmjA=
Received: from BYAPR02CA0066.namprd02.prod.outlook.com (2603:10b6:a03:54::43)
 by PH7PR10MB6058.namprd10.prod.outlook.com (2603:10b6:510:1fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 12:31:15 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:54:cafe::4e) by BYAPR02CA0066.outlook.office365.com
 (2603:10b6:a03:54::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 12:31:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 12:31:14 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 06:31:14 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 06:31:13 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 06:31:13 -0600
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MCV9Q1554005;
	Thu, 22 Jan 2026 06:31:12 -0600
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH v3 2/2] meson: Add patch to fix Qt6 private header detection for cross-compilation
Date: Thu, 22 Jan 2026 18:01:07 +0530
Message-ID: <20260122123107.3001250-2-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122123107.3001250-1-j-sahu@ti.com>
References: <20260122123107.3001250-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|PH7PR10MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fed94be-6b47-498b-075a-08de59b22245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PE2+TFa+uvohiM9M7iiKMDZc0iyjOF1WpbKRgj9jG5Sm/ifJEN+4rFf+cAjB?=
 =?us-ascii?Q?WBEr9KhsICVCzV3Nk+3O0UtAvTNlfbVLpeRb/j/NwUEwqylBoJ+hTKG9eXXO?=
 =?us-ascii?Q?mFJgG9XKJ1kSki+NMJ4NH9Q7c76z6pbBVfp+SWs7ynxXvDYWNXkzWA2SCqDc?=
 =?us-ascii?Q?xAHkCU4LlQZRW/0R8b3lM0pp0kuX5s51oZzy5T7J2ihgJ4/v+hdVTMbWnrTB?=
 =?us-ascii?Q?x8DsOYvotWrH7qc5gzXXhmvu4YckSEq/yGinQwSI373oD1Nn5WiN6vYRpggm?=
 =?us-ascii?Q?FNHQxH56kcLDPfnfWWjHLOCrhkWNtmya/rq4rqt6LlFo3m9100wOiYX+cMbY?=
 =?us-ascii?Q?Uudj/G1q+vjipJFDn4SUodU/Pf1sO4H+O+FTCouc0BZJkjqY49YMbRs/UzdE?=
 =?us-ascii?Q?ElpVeJJoJ0P4J+ShoJyMANtQIcs2E+jG2DCahB/utaJJRQjLzXORIOqP5rP7?=
 =?us-ascii?Q?/bz3kDHc6Zqiirim/yNH9kPULceMqYg7zNvzG7I4oZUAF3KfV3AEuvRXJEJj?=
 =?us-ascii?Q?IDFsJtLZ015xGaXyQjrNO+TQ4LBd7tjK6I2+dm2NRg48i37l5xRn5lT9e2EC?=
 =?us-ascii?Q?q3TtEIKdNbNPI1Lnlj0NDXICoZ/p2TMNPRJwjBUbREgN6oRmy43BKdlBGWQI?=
 =?us-ascii?Q?LC4xER7PmaO347aiGZ+Ib7/M9DBWElECR5HvgJg9MM5aSnvU+fdIvW0Vp+Hy?=
 =?us-ascii?Q?WGnSI1mL6dOJmjPvYP2pAiBj2SUjhUBNJhLpcy1PwtyrB1Bj9RfWc2t4hKBY?=
 =?us-ascii?Q?svwZqV8VQJGF1V7f+d6Lzfzr/klnCqtpdWiH8VzcDG6MZItLjx8uYJpYZMjp?=
 =?us-ascii?Q?ytN6Ct0lmWSnZ56kkWw/CsHNfabu1grBHoaF7mhMLo2boz6u26O7pqXlbPWW?=
 =?us-ascii?Q?69rVZFAU2jx5dzo5ZYjGfeRVLEHizBFgCv79rIIdAy3lvxwW7ticec6KlKt0?=
 =?us-ascii?Q?iSvNBw7jC+viZ97iauIv8DAfxcVUqfFVMHNkViqU9BbmiKT1qnD5eiF6/Hxf?=
 =?us-ascii?Q?EqSq8ZguyjaYHi/hT6B1uFSXvNMVaI0M1Wqqf6bdMK5z3EEL6qMEEmU5EjxR?=
 =?us-ascii?Q?9NqeYMsXNrd4jrIdYnhOjWCH1P86zUWeQhTU+Z3xXMxr+8ro+UXD4w4ocDP0?=
 =?us-ascii?Q?PdKymuyR9bKQCMUN0HlinSQ57z4Tk8II03mpS2Jr10XSArnbcD3ttD6/yh08?=
 =?us-ascii?Q?F3pX1Qi6kX7NvzNcdcD+FLW3SsiHE39jidDomdL3fB8+hML66QaYbdcEMyCe?=
 =?us-ascii?Q?dWldP8arQNcIN1SIaCFWAyXNvohxXS7iz08Uo7hvNIWLUQy4hI0WgwwXKBt8?=
 =?us-ascii?Q?SNgp73Dg20UF7sml+X664rD3MtDmcpg6aVnULuNKRaqbr9XHZ3rD/470DrzU?=
 =?us-ascii?Q?KHI5QtGADzEvQgpHEhtFzjkNDxTbZYJ4vYWzfoYDoAeYbzCwPKZlaPU49ME+?=
 =?us-ascii?Q?STkzQbaGWD1QDAcaWzxe2UOVFE4+VDMaAzUn9tQkm/Ay/hkypI/CwGLGRcnq?=
 =?us-ascii?Q?OXXk/GAV94CERyc7QhEu/BiH81HOp7ORijxQdWRquj5gmA3gzf8vKzoxNVgN?=
 =?us-ascii?Q?Qi5MoEsXKtjL1iRUFVjUqiSe0IzXeGos6ghQYl2MOEdGXppv9B4zWg8UqJcm?=
 =?us-ascii?Q?9kGepFyKnRU/rVQjXh19tKkUK+7noYYlD7E8QzWsBIcAXCKCZsKJMwBL09xO?=
 =?us-ascii?Q?g5ZOVA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:31:14.5941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fed94be-6b47-498b-075a-08de59b22245
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6058
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jan 2026 12:31:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17006

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
 .../recipes-devtools/meson/meson-arago.inc    |  5 ++
 ...respect-PKG_CONFIG_SYSROOT_DIR-for-c.patch | 72 +++++++++++++++++++
 .../recipes-devtools/meson/meson_%.bbappend   |  4 ++
 3 files changed, 81 insertions(+)
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-devt=
ools/meson/meson-arago.inc
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-devt=
ools/meson/meson/0001-qt-dependencies-respect-PKG_CONFIG_SYSROOT_DIR-for-c.=
patch
 create mode 100644 meta-arago-extras/dynamic-layers/qt6-layer/recipes-devt=
ools/meson/meson_%.bbappend

diff --git a/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/me=
son/meson-arago.inc b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-de=
vtools/meson/meson-arago.inc
new file mode 100644
index 00000000..4a6cd19b
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/mes=
on-arago.inc
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
index 00000000..01265b04
--- /dev/null
+++ b/meta-arago-extras/dynamic-layers/qt6-layer/recipes-devtools/meson/mes=
on_%.bbappend
@@ -0,0 +1,4 @@
+MESON_ARAGO =3D ""
+MESON_ARAGO:arago =3D "meson-arago.inc"
+
+require ${MESON_ARAGO}
--=20
2.34.1


