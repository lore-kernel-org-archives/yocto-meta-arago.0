Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C519BF47CD6
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 20:55:08 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54472.1772744105279104531
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 12:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=uVqosu92;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.53, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMts8S9kObRNnhn7ifilz5RM9VFTow4QveS4w3035e7kFT7wi5KcAYwPABgJKlseqA5lKQbF/vpvRVglq0i6JeR0HzuGUfIh2g7hu2xyvnwphf6dfYTChxWrCyDn1NjhA5sJBkBnQkc0TKGh3BAmOOq6nTgcEx3/CBPDBOBoFhvXA2JYLgmyiZr3U5FwYvf5F2Prid5hpTV7qVahOmd+sEfwOmTz3MeChmQOJwPssHjPzdj200s3c0aWnjMydkdr0PYPYSXu2xou5MzIFkQfxke/3aBTaXuZzAMlud6n9JMMKm3OPEMHnYMMMRChpgryq1pM8G3w5yMBbueXiBI4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2l93ScNwtWFh/xcWe+q3DjKG5RlrNFWWEmeRFv3g5O8=;
 b=sl8r2TtLIUYcuOWAbhuci98wJvk/pois0la5fZZ/yFX5BCj1KBnAvjeDIfROE9LxaIISX1q8FD8ibSQRTS+KpzB/c8KUoqVGlERxfFaAT/uQCqixnGVIf35QjveIsSw0c0wu6aJy0/jWQ8JsWfuqGwo1nGdXxqlRrpVQPHPFXqZhtvUbrxvFX8pfyReXuBqHGJmrA7g0nBsHiZC7hmRdI0LeREFW6U9kNTOkuhUt6YtcJSsm7vzPlnQhXQBpkbIc2oTzMBqCtOwFTNECUUFg4rtW2uPhq0dehchac8NSGd3XVaokEoQimeemQfmWKukOVUMw2QdqgpWGaQPTDNvt/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2l93ScNwtWFh/xcWe+q3DjKG5RlrNFWWEmeRFv3g5O8=;
 b=uVqosu92daiQEeJQeItAnp8CWHCrsj9i9QEdeJ+mnw4voRyMNnT/2GgiDIzzfvUxiT742WWFiNw59dZNUNnoAFCklB8lT4+6BbK+2SJXU16DXRD9qG0Jrfa5y4WHazhSRsIOVdT5MiV1pC7JW7XB20ffq+uJFyr0Cx29zKU7y/w=
Received: from SJ0PR05CA0120.namprd05.prod.outlook.com (2603:10b6:a03:334::35)
 by DS0PR10MB997672.namprd10.prod.outlook.com (2603:10b6:8:311::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 20:54:57 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::32) by SJ0PR05CA0120.outlook.office365.com
 (2603:10b6:a03:334::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 20:54:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 20:54:56 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:54:55 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 14:54:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 14:54:55 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Kstnf2529494;
	Thu, 5 Mar 2026 14:54:55 -0600
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] emptty: add version 0.15.0
Date: Thu, 5 Mar 2026 14:54:55 -0600
Message-ID: <20260305205455.267385-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|DS0PR10MB997672:EE_
X-MS-Office365-Filtering-Correlation-Id: 077753f7-a97b-495d-c25e-08de7af9752a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34020700016|376014|36860700016|82310400026|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info: 
	GOveG1xrrfnPfWBR5LmQ4jFiv/GF8gWcC/2cRa8H4gYtpFWkE05rd7YWRzqdNewY+wMB+ylOx2vrEAonitPtGSM5MvR8+lZ6q5vWmqwJh3VNmtwJSuoC0DS5vNadx1/92wh0OkeKFutewZFJcDQ/LDA0L9inGI1xOklEl3D26oNzt/Ju+g3rXKpLvY4BWoWlN28mnBDz0WZz+73K4rPLu8FP+QPsLUemEx4slBx31Dj02BJqwTX3JjpiUoMtqPWR3a1MiG7rMTIc+tyngBQHQsbfWVh8k+xmWCjqwnl7YXDZG+cTITze90YKKhnrrk1dN5N4jm8uBSPNHIUJYVOw/RFuT99f2jbrhe51P+avgTkW7aOAU14y550PkTQCck2MREfk0hdJFCbsL/GDxvkYbayzWUTftXARwYPSfp7HFTsXQMMDPbMoKWivHG2iMlsJgmOFIzjkPjY+Mo5eYg+ETMmncddiIyvL2b6evdHDsMTuHNmsBBDAEhgrAJF2yHyZT907QG3jsrbL8Yb5lfN2L/P1xxuHc4VhV5dtLQ6U4tfNq1pyo+kLQvGG+wO1URauOkk+iUT95gEEoxQa6nBmLw8IFU86oAUSsBHqokOh9qjBheX7DIa1BC+7Y1LTg0NZUvhIff2Q3FsMfiOs+OnE0WCa3g/5OKrnO30wBVm7rT1V9A/tITu8kUvlbQ1ENvz4cqkAOlZq6Bfbh++in0Af4MHQzVIJb1NFRF2n8Y4NV9k=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(376014)(36860700016)(82310400026)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aXjWbiIaixlSDUESV9ezxRE63KjiinEE8ew7W+EcVGt6IFyVUzZu8of/9aJQyiYMDeqozYNeIah0SHRFN5MFRLZ4Niadu+PBYusxsZhiDwKWQvzrGzORLj1K2BMdzEsHNl1cDCHB4t2XyaxYZguN4aADdsEL62Gh4dJC4uJRIP1ehKX31+5cHOfKtZCvN8LTH9XPBcr/7ErFw9XSPPLZz5pPjlUENKOXdv+eyTvkVDiecyok09cHRA38TwGK9RmX9CtUIpMQSnxWUWrPu2Kw3Dg0ehJ+pUIdGrWpYocpTXmiFMUHuNU7hVxzJ7A3s0mB5+MzLvQ6HirB2hkVeOte8Yt1jgYHEly4d/UMcmKjC5a2uuKQVV10ARzn7GeNL0zTq78dJUh2sN7Q/lhlzlVbtVrnXwBS8cOsZ2aZk9Eh17mSWZ4haHJwBRiodT9mpnoY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:54:56.2648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 077753f7-a97b-495d-c25e-08de7af9752a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997672
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 20:55:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17267

From: Antonios Christidis <a-christidis@ti.com>

Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
relatively lightweight display manager that supports x11 as well as
wayland through both a CLI and an automatic login mechanism.

This can effectively replace the custom init scripts for both x11
(xserver-nodm-init) and wayland (weston-init) with a single tool with
more verbose logging capabilities.

This is split into two recipes. The emptty package provides the binary
and various agnostic configs while the emptty-conf package provides the
default configuration for the application itself. This RPROVIDES
virtual-emptty-conf, allowing other recipes to provide their own
configurations to override the default behavior.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 0001-emptty-add-version-0.15.0.patch          | 522 ++++++++++++++++++
 .../classes/tisdk-bundle.bbclass              |  14 +-
 meta-arago-distro/conf/distro/arago.conf      |   2 +
 .../recipes-graphics/emptty/emptty-conf.bb    |  14 +
 .../recipes-graphics/emptty/emptty.inc        |  27 +
 .../recipes-graphics/emptty/emptty/pamconf    |  11 +
 .../recipes-graphics/emptty/emptty_0.15.0.bb  |  57 ++
 .../wayland/weston-init-arago.bb              |  72 +++
 .../weston-init-arago/beaglebone/weston.ini   |  85 +++
 .../wayland/weston-init-arago/emptty.conf     |  77 +++
 .../weston-launch-calibrator.sh               |  13 +
 .../wayland/weston-init-arago/weston.ini      |  21 +
 12 files changed, 914 insertions(+), 1 deletion(-)
 create mode 100644 0001-emptty-add-version-0.15.0.patch
 create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty-conf.b=
b
 create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty.inc
 create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty/pamcon=
f
 create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0=
.bb
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-=
arago.bb
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-=
arago/beaglebone/weston.ini
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-=
arago/emptty.conf
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-=
arago/weston-launch-calibrator.sh
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init-=
arago/weston.ini

diff --git a/0001-emptty-add-version-0.15.0.patch b/0001-emptty-add-version=
-0.15.0.patch
new file mode 100644
index 00000000..dba3013d
--- /dev/null
+++ b/0001-emptty-add-version-0.15.0.patch
@@ -0,0 +1,522 @@
+From d41ec048882b955124d7dbeee1c2bf1351a0aba4 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Thu, 5 Mar 2026 13:12:08 -0600
+Subject: [PATCH] emptty: add version 0.15.0
+
+Add emptty, a "Dead simple CLI Display Manager on TTY". This is a
+relatively lightweight display manager that supports x11 as well as
+wayland through both a CLI and an automatic login mechanism.
+
+This can effectively replace the custom init scripts for both x11
+(xserver-nodm-init) and wayland (weston-init) with a single tool with
+more verbose logging capabilities.
+
+This is split into two recipes. The emptty package provides the binary
+and various agnostic configs while the emptty-conf package provides the
+default configuration for the application itself. This RPROVIDES
+virtual-emptty-conf, allowing other recipes to provide their own
+configurations to override the default behavior.
+
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+---
+ .../classes/tisdk-bundle.bbclass              | 14 ++-
+ meta-arago-distro/conf/distro/arago.conf      |  2 +
+ .../recipes-graphics/emptty/emptty-conf.bb    | 14 +++
+ .../recipes-graphics/emptty/emptty.inc        | 27 ++++++
+ .../recipes-graphics/emptty/emptty/pamconf    | 11 +++
+ .../recipes-graphics/emptty/emptty_0.15.0.bb  | 57 +++++++++++++
+ .../wayland/weston-init-arago.bb              | 72 ++++++++++++++++
+ .../weston-init-arago/beaglebone/weston.ini   | 85 +++++++++++++++++++
+ .../wayland/weston-init-arago/emptty.conf     | 77 +++++++++++++++++
+ .../weston-launch-calibrator.sh               | 13 +++
+ .../wayland/weston-init-arago/weston.ini      | 21 +++++
+ 11 files changed, 392 insertions(+), 1 deletion(-)
+ create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty-conf.=
bb
+ create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty.inc
+ create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty/pamco=
nf
+ create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty_0.15.=
0.bb
+ create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init=
-arago.bb
+ create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init=
-arago/beaglebone/weston.ini
+ create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init=
-arago/emptty.conf
+ create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init=
-arago/weston-launch-calibrator.sh
+ create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init=
-arago/weston.ini
+
+diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-d=
istro/classes/tisdk-bundle.bbclass
+index cc5d1481..24146529 100644
+--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
++++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
+@@ -106,7 +106,7 @@ cleanup_host_packages() {
+ }
+=20
+ ROOTFS_PREPROCESS_COMMAND +=3D "tisdk_image_setup; "
+-ROOTFS_POSTPROCESS_COMMAND +=3D "tisdk_image_build; "
++ROOTFS_POSTPROCESS_COMMAND +=3D "tisdk_image_build; add_emptty_inittab; "
+ IMAGE_PREPROCESS_COMMAND:append =3D "tisdk_image_cleanup; "
+=20
+ # Create the SDK image.  We will re-use the rootfs_ipk_do_rootfs function=
ality
+@@ -304,6 +304,18 @@ tisdk_image_build () {
+     cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
+ }
+=20
++
++add_emptty_inittab() {
++    [ -f ${IMAGE_ROOTFS}${sysconfdir}/inittab ] || return 0
++
++    if ${@bb.utils.contains_any("IMAGE_FEATURES", [ "x11-base", "weston" =
], "true", "false", d)}
++    then
++	echo "7:5:respawn:${bindir}/emptty -t 7 -d" >> ${IMAGE_ROOTFS}${sysconfd=
ir}/inittab
++    fi
++}
++
++
++
+ TISDK_IMAGE_CLEANUP_DIRS ?=3D "var etc lib boot dev home media mnt proc r=
un sbin sys tmp usr"
+ TISDK_IMAGE_CLEANUP_FILES ?=3D "bin/bash bin/bash.bash bin/sh"
+=20
+diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/=
conf/distro/arago.conf
+index fb5c703f..43d4db53 100644
+--- a/meta-arago-distro/conf/distro/arago.conf
++++ b/meta-arago-distro/conf/distro/arago.conf
+@@ -68,6 +68,8 @@ PACKAGECONFIG:pn-glmark2 =3D "drm-gles2 wayland-gles2"
+=20
+ # Set this to empty string to prevent xwayland config from being added
+ PACKAGECONFIG:pn-weston-init =3D ""
++PREFERRED_RPROVIDER_virtual-emptty-conf =3D "weston-init-arago"
++PREFERRED_RPROVIDER_weston-init =3D "weston-init-arago"
+=20
+ # Enable testing for opencl and vulkan with piglit
+ PACKAGECONFIG:append:pn-piglit =3D " \
+diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb b/me=
ta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
+new file mode 100644
+index 00000000..0b98e2e1
+--- /dev/null
++++ b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
+@@ -0,0 +1,14 @@
++require emptty.inc
++
++SUMMARY +=3D " (Default config)"
++
++do_configure[noexec] =3D "1"
++do_compile[noexec] =3D "1"
++
++do_install () {
++    oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=3D${D} install-config
++}
++
++FILES:${PN} =3D "${sysconfdir}/emptty/conf"
++CONFFILES:${PN} =3D "${sysconfdir}/emptty/conf"
++RPROVIDES:${PN} +=3D "virtual-emptty-conf"
+diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty.inc b/meta-a=
rago-distro/recipes-graphics/emptty/emptty.inc
+new file mode 100644
+index 00000000..d99c4d8c
+--- /dev/null
++++ b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
+@@ -0,0 +1,27 @@
++SUMMARY =3D "Dead simple CLI Display Manager on TTY"
++DESCRIPTION =3D "Emptty is a simple display manager with a command line g=
reeter \
++It supports both X11 and Wayland sessions, exporting required variables a=
nd \
++creating user paths as necessary."
++
++HOMEPAGE =3D "https://github.com/tvrzna/emptty"
++BUGTRACKER =3D "https://github.com/tvrzna/emptty/issues"
++LICENSE =3D "MIT"
++LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3Dd1e4d12c7d1d1=
7367ba5668706a405ba"
++
++S =3D "${UNPACKDIR}"
++
++FILESEXTRAPATHS:append =3D ":${THISDIR}/emptty"
++
++GO_IMPORT =3D "github.com/tvrzna/emptty"
++GO_IMPORT_pam =3D "github.com/msteinert/pam"
++SRC_URI =3D "\
++    git://${GO_IMPORT}.git;protocol=3Dhttps;branch=3Dmaster;destsuffix=3D=
src/${GO_IMPORT} \
++    git://${GO_IMPORT_pam}.git;protocol=3Dhttps;branch=3Dmaster;name=3Dpa=
m;destsuffix=3Dsrc/${GO_IMPORT_pam} \
++    file://pamconf \
++    "
++SRCREV =3D "bb203ad0a224731a7a2ff50deeb342ab79c4af09"
++SRCREV_pam =3D "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
++
++SRCREV_FORMAT .=3D "_pam"
++
++PR =3D "r1"
+diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf b/me=
ta-arago-distro/recipes-graphics/emptty/emptty/pamconf
+new file mode 100644
+index 00000000..5c82d46b
+--- /dev/null
++++ b/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
+@@ -0,0 +1,11 @@
++#%PAM-1.0
++auth            sufficient      pam_succeed_if.so user ingroup nopasswdlo=
gin
++auth            include         common-auth
++-auth           optional        pam_gnome_keyring.so
++-auth           optional        pam_kwallet5.so
++account         include         common-account
++session         include         common-session
++-session        optional        pam_gnome_keyring.so auto_start
++-session        optional        pam_kwallet5.so auto_start force_run
++password        include         common-password
++
+diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb b/=
meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
+new file mode 100644
+index 00000000..415c5ea5
+--- /dev/null
++++ b/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
+@@ -0,0 +1,57 @@
++require emptty.inc
++
++PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
++PACKAGECONFIG[pam] =3D ",,libpam,pam-plugin-succeed-if"
++PACKAGECONFIG[x11] =3D ",,virtual/libx11,util-linux-mcookie"
++
++DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'virtual/c=
rypt', d)}"
++
++GO_TAGS =3D ""
++GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',no=
pam', d)}"
++GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',no=
xlib', d)}"
++
++GOBUILDFLAGS:append =3D " -tags=3D${GO_TAGS}"
++
++export GO111MODULE =3D "off"
++
++inherit go
++
++DEPENDS +=3D "gzip"
++
++do_install () {
++    # general collateral
++    install -Dm755 ${B}/${GO_BUILD_BINDIR}/emptty ${D}${bindir}/emptty
++    install -d ${D}${mandir}/man1
++    gzip -cn ${S}/src/${GO_IMPORT}/res/emptty.1 > ${D}${mandir}/man1/empt=
ty.1.gz
++
++    # pam config
++    if "${@bb.utils.contains('PACKAGECONFIG','pam','true','false',d)}"
++    then
++        install -Dm644 ${S}/pamconf ${D}${sysconfdir}/pam.d/emptty
++    fi
++
++    # systemd init service
++    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)=
}
++    then
++        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=3D${D} install-system=
d
++    fi
++}
++
++FILES:${PN} =3D "\
++    ${systemd_system_unitdir}/emptty.service \
++    ${bindir}/emptty \
++    ${mandir}/man1/emptty.1.gz \
++    ${sysconfdir}/pam.d/emptty \
++"
++
++RDEPENDS:${PN} +=3D "virtual-emptty-conf"
++SYSTEMD_SERVICE:${PN} =3D "emptty.service"
++
++inherit systemd
++
++USERADD_PACKAGES =3D "${PN}"
++GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
++
++inherit useradd
++
++
+diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.=
bb b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
+new file mode 100644
+index 00000000..484d25e1
+--- /dev/null
++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
+@@ -0,0 +1,72 @@
++SUMMARY =3D "Configuration files for the Weston Wayland compositor"
++LICENSE =3D "MIT"
++LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb=
788c80a0384361b4de20420"
++
++PACKAGE_ARCH =3D "${MACHINE_ARCH}"
++
++SRC_URI:append =3D " \
++    file://weston.ini \
++    file://weston-launch-calibrator.sh \
++    file://emptty.conf \
++"
++
++S =3D "${UNPACKDIR}"
++
++PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xway=
land', '', d)}"
++PACKAGECONFIG:append:qemuriscv64 =3D " use-pixman"
++PACKAGECONFIG:append:qemuppc64 =3D " use-pixman"
++
++PACKAGECONFIG[xwayland] =3D ",,"
++PACKAGECONFIG[no-idle-timeout] =3D ",,"
++PACKAGECONFIG[use-pixman] =3D ",,"
++
++DEFAULTBACKEND ??=3D ""
++DEFAULTBACKEND:qemuall ?=3D "drm"
++
++do_install() {
++	install -D -p -m0644 weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
++	install -D -p -m0644 emptty.conf ${D}${sysconfdir}/emptty/conf
++
++	if [ -n "${DEFAULTBACKEND}" ]; then
++		sed -i -e "/^\[core\]/a backend=3D${DEFAULTBACKEND}-backend.so" ${D}${s=
ysconfdir}/xdg/weston/weston.ini
++	fi
++
++	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}=
" =3D "yes" ]; then
++		sed -i -e "/^\[core\]/a xwayland=3Dtrue" ${D}${sysconfdir}/xdg/weston/w=
eston.ini
++	fi
++
++	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'n=
o', d)}" =3D "yes" ]; then
++		sed -i -e "/^\[core\]/a idle-time=3D0" ${D}${sysconfdir}/xdg/weston/wes=
ton.ini
++	fi
++
++	if [ "${@bb.utils.contains('PACKAGECONFIG', 'use-pixman', 'yes', 'no', d=
)}" =3D "yes" ]; then
++		sed -i -e "/^\[core\]/a use-pixman=3Dtrue" ${D}${sysconfdir}/xdg/weston=
/weston.ini
++	fi
++
++	install -dm 755 -o weston -g weston ${D}/home/weston
++	install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-=
calibrator
++}
++
++inherit useradd
++
++USERADD_PACKAGES =3D "${PN}"
++
++# rdepends on weston which depends on virtual/egl
++#
++require ${COREBASE}/meta/recipes-graphics/wayland/required-distro-feature=
s.inc
++
++RDEPENDS:${PN} =3D "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwa=
yland', 'weston-xwayland', '', d)} emptty"
++
++FILES:${PN} +=3D "\
++    ${sysconfdir}/xdg/weston/weston.ini \
++    ${sysconfdir}/emptty/conf \
++    /home/weston \
++    ${bindir}/weston-launch-calibrator \
++    "
++
++CONFFILES:${PN} +=3D "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/e=
mptty/conf"
++RPROVIDES:${PN}:append =3D " virtual-emptty-conf weston-init"
++RCONFLICTS:${PN} +=3D "weston-init"
++
++USERADD_PARAM:${PN} =3D "--home /home/weston --shell /bin/sh --user-group=
 -G video,input,render,nopasswdlogin weston"
++GROUPADD_PARAM:${PN} =3D "-r wayland; -r render; -r nopasswdlogin"
+diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/=
beaglebone/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-i=
nit-arago/beaglebone/weston.ini
+new file mode 100644
+index 00000000..9fd9851d
+--- /dev/null
++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beagleb=
one/weston.ini
+@@ -0,0 +1,85 @@
++# configuration file for Weston
++
++[core]
++idle-time=3D0
++#modules=3Dxwayland.so,cms-colord.so
++#shell=3Ddesktop-shell.so
++gbm-format=3Drgb565
++require-input=3Dfalse
++
++[shell]
++locking=3Dfalse
++animation=3Dzoom
++panel-position=3Dtop
++startup-animation=3Dfade
++#background-image=3D/usr/share/backgrounds/gnome/Aqua.jpg
++#background-color=3D0xff002244
++#background-type=3Dtile
++#clock-format=3Dminutes
++#panel-color=3D0x90ff0000
++#locking=3Dtrue
++#animation=3Dzoom
++#startup-animation=3Dfade
++#binding-modifier=3Dctrl
++#num-workspaces=3D6
++#cursor-theme=3Dwhiteglass
++#cursor-size=3D24
++
++#lockscreen-icon=3D/usr/share/icons/gnome/256x256/actions/lock.png
++#lockscreen=3D/usr/share/backgrounds/gnome/Garden.jpg
++#homescreen=3D/usr/share/backgrounds/gnome/Blinds.jpg
++#animation=3Dfade
++
++#[launcher]
++#icon=3D/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
++#path=3D/usr/bin/gnome-terminal
++
++#[launcher]
++#icon=3D/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
++#path=3D/usr/bin/weston-terminal
++
++#[launcher]
++#icon=3D/usr/share/icons/hicolor/24x24/apps/google-chrome.png
++#path=3D/usr/bin/google-chrome
++
++#[launcher]
++#icon=3D/usr/share/icons/gnome/24x24/apps/arts.png
++#path=3D/build/weston-0lEgCh/weston-1.11.0/weston-flower
++
++#[input-method]
++#path=3D/usr/libexec/weston-keyboard
++
++[output]
++name=3DHDMI-A-1
++#mode=3D1680x1050
++#transform=3D90
++#icc_profile=3D/usr/share/color/icc/colord/Bluish.icc
++
++#[output]
++#name=3DVGA1
++#mode=3D173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
++#transform=3Dflipped
++
++#[output]
++#name=3DX1
++#mode=3D1024x768
++#transform=3Dflipped-90
++
++[libinput]
++touchscreen_calibrator=3Dtrue
++#enable_tap=3Dtrue
++
++#[touchpad]
++#constant_accel_factor =3D 50
++#min_accel_factor =3D 0.16
++#max_accel_factor =3D 1.0
++
++[screen-share]
++command=3D/usr/bin/weston --backend=3Drdp-backend.so --shell=3Dfullscreen=
-shell.so --no-clients-resize
++
++#[xwayland]
++#path=3D/usr/bin/Xwayland
++
++[autolaunch]
++# launch the calibrator on startup if a touchscreen is detected
++path=3D/usr/bin/weston-launch-calibrator
+diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/=
emptty.conf b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/=
emptty.conf
+new file mode 100644
+index 00000000..ffe1a3c2
+--- /dev/null
++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.=
conf
+@@ -0,0 +1,77 @@
++# TTY, where emptty will start.
++TTY_NUMBER=3D7
++
++# Enables switching to defined TTY number.
++SWITCH_TTY=3Dtrue
++
++# Enables printing of /etc/issue in daemon mode.
++PRINT_ISSUE=3Dtrue
++
++# Enables printing of default motd, /etc/emptty/motd or /etc/emptty/motd-=
gen.sh.
++PRINT_MOTD=3Dtrue
++
++# Preselected user, if AUTOLOGIN is enabled, this user is logged in.
++DEFAULT_USER=3Dweston
++
++# Enables Autologin, if DEFAULT_USER is defined and part of nopasswdlogin=
 group. Possible values are "true" or "false".
++AUTOLOGIN=3Dtrue
++
++# The default session used, if Autologin is enabled. If session is not fo=
und in list of session, it proceeds to manual selection.
++AUTOLOGIN_SESSION=3DWeston
++
++# If Autologin is enabled and session does not start correctly, the numbe=
r of retries in short period is kept to eventually stop the infinite loop o=
f restarts. -1 is for infinite retries, 0 is for no retry.
++AUTOLOGIN_MAX_RETRY=3D-1
++
++# Default LANG, if user does not have set own in init script.
++#LANG=3Den_US.UTF-8
++
++# Starts desktop with calling "dbus-launch".
++DBUS_LAUNCH=3Dtrue
++
++# Starts Xorg desktop with calling "~/.xinitrc" script, if is true, file =
exists and selected WM/DE is Xorg session, it overrides DBUS_LAUNCH.
++XINITRC_LAUNCH=3Dfalse
++
++# Prints available WM/DE each on new line instead of printing on single l=
ine.
++VERTICAL_SELECTION=3Dfalse
++
++# Defines the way, how is logging handled. Possible values are "rotate", =
"appending" or "disabled".
++#LOGGING=3Drotate
++
++# Overrides path of log file
++#LOGGING_FILE=3D/var/log/emptty/[TTY_NUMBER].log
++
++# Arguments passed to Xorg server.
++#XORG_ARGS=3D
++
++# Allows to use dynamic motd script to generate custom MOTD.
++#DYNAMIC_MOTD=3Dfalse
++
++# Allows to override default path to dynamic motd.
++#DYNAMIC_MOTD_PATH=3D/etc/emptty/motd-gen.sh
++
++# Allows to override default path to static motd.
++#MOTD_PATH=3D/etc/emptty/motd
++
++# Foreground color, available only in daemon mode.
++#FG_COLOR=3DLIGHT_BLACK
++
++# Background color, available only in daemon mode.
++#BG_COLOR=3DBLACK
++
++# Enables numlock in daemon mode. Possible values are "true" or "false".
++#ENABLE_NUMLOCK=3Dfalse
++
++# Defines the way, how is logging of session errors handled. Possible val=
ues are "rotate", "appending" or "disabled".
++SESSION_ERROR_LOGGING=3Drotate
++
++# Overrides path of session errors log file
++#SESSION_ERROR_LOGGING_FILE=3D/var/log/emptty/session-errors.[TTY_NUMBER]=
.log
++
++# If set true, it will not use `.emptty-xauth` file, but the standard `~/=
.Xauthority` file. This allows to handle xauth issues.
++#DEFAULT_XAUTHORITY=3Dfalse
++
++#If set true, Xorg will be started as rootless, if system allows and empt=
ty is running in daemon mode.
++#ROOTLESS_XORG=3Dfalse
++
++#If set true, environmental groups are printed to differ Xorg/Wayland/Cus=
tom/UserCustom desktops.
++IDENTIFY_ENVS=3Dfalse
+diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/=
weston-launch-calibrator.sh b/meta-arago-distro/recipes-graphics/wayland/we=
ston-init-arago/weston-launch-calibrator.sh
+new file mode 100644
+index 00000000..45863ecd
+--- /dev/null
++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-=
launch-calibrator.sh
+@@ -0,0 +1,13 @@
++#!/bin/sh
++
++if [ -e /dev/input/touchscreen0 ]; then
++	echo "Touch screen detected..."
++	if [ -n "$LIBINPUT_CALIBRATION_MATRIX" ]; then
++		echo "Calibration matrix already present, skipping calibration..."
++	else
++		echo "Calibrating touchscreen..."
++		exec weston-calibrator
++	fi
++else
++	echo "Touch screen not detected, skipping calibration..."
++fi
+diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/=
weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/w=
eston.ini
+new file mode 100644
+index 00000000..1bc7a010
+--- /dev/null
++++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.=
ini
+@@ -0,0 +1,21 @@
++[core]
++idle-time=3D0
++require-input=3Dfalse
++require-outputs=3Dnone
++
++[shell]
++locking=3Dfalse
++animation=3Dzoom
++panel-position=3Dtop
++startup-animation=3Dfade
++
++[libinput]
++touchscreen_calibrator=3Dtrue
++
++[autolaunch]
++# launch the calibrator on startup if a touchscreen is detected
++path=3D/usr/bin/weston-launch-calibrator
++
++[screensaver]
++# Uncomment path to disable screensaver
++#path=3D@libexecdir@/weston-screensaver
+--=20
+2.34.1
+
diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-di=
stro/classes/tisdk-bundle.bbclass
index cc5d1481..24146529 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -106,7 +106,7 @@ cleanup_host_packages() {
 }
=20
 ROOTFS_PREPROCESS_COMMAND +=3D "tisdk_image_setup; "
-ROOTFS_POSTPROCESS_COMMAND +=3D "tisdk_image_build; "
+ROOTFS_POSTPROCESS_COMMAND +=3D "tisdk_image_build; add_emptty_inittab; "
 IMAGE_PREPROCESS_COMMAND:append =3D "tisdk_image_cleanup; "
=20
 # Create the SDK image.  We will re-use the rootfs_ipk_do_rootfs functiona=
lity
@@ -304,6 +304,18 @@ tisdk_image_build () {
     cp ${WORKDIR}/opkg.conf ${IMAGE_ROOTFS}/etc/
 }
=20
+
+add_emptty_inittab() {
+    [ -f ${IMAGE_ROOTFS}${sysconfdir}/inittab ] || return 0
+
+    if ${@bb.utils.contains_any("IMAGE_FEATURES", [ "x11-base", "weston" ]=
, "true", "false", d)}
+    then
+	echo "7:5:respawn:${bindir}/emptty -t 7 -d" >> ${IMAGE_ROOTFS}${sysconfdi=
r}/inittab
+    fi
+}
+
+
+
 TISDK_IMAGE_CLEANUP_DIRS ?=3D "var etc lib boot dev home media mnt proc ru=
n sbin sys tmp usr"
 TISDK_IMAGE_CLEANUP_FILES ?=3D "bin/bash bin/bash.bash bin/sh"
=20
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/c=
onf/distro/arago.conf
index fb5c703f..43d4db53 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -68,6 +68,8 @@ PACKAGECONFIG:pn-glmark2 =3D "drm-gles2 wayland-gles2"
=20
 # Set this to empty string to prevent xwayland config from being added
 PACKAGECONFIG:pn-weston-init =3D ""
+PREFERRED_RPROVIDER_virtual-emptty-conf =3D "weston-init-arago"
+PREFERRED_RPROVIDER_weston-init =3D "weston-init-arago"
=20
 # Enable testing for opencl and vulkan with piglit
 PACKAGECONFIG:append:pn-piglit =3D " \
diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb b/met=
a-arago-distro/recipes-graphics/emptty/emptty-conf.bb
new file mode 100644
index 00000000..0b98e2e1
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb
@@ -0,0 +1,14 @@
+require emptty.inc
+
+SUMMARY +=3D " (Default config)"
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+do_install () {
+    oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=3D${D} install-config
+}
+
+FILES:${PN} =3D "${sysconfdir}/emptty/conf"
+CONFFILES:${PN} =3D "${sysconfdir}/emptty/conf"
+RPROVIDES:${PN} +=3D "virtual-emptty-conf"
diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty.inc b/meta-ar=
ago-distro/recipes-graphics/emptty/emptty.inc
new file mode 100644
index 00000000..d99c4d8c
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
@@ -0,0 +1,27 @@
+SUMMARY =3D "Dead simple CLI Display Manager on TTY"
+DESCRIPTION =3D "Emptty is a simple display manager with a command line gr=
eeter \
+It supports both X11 and Wayland sessions, exporting required variables an=
d \
+creating user paths as necessary."
+
+HOMEPAGE =3D "https://github.com/tvrzna/emptty"
+BUGTRACKER =3D "https://github.com/tvrzna/emptty/issues"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3Dd1e4d12c7d1d17=
367ba5668706a405ba"
+
+S =3D "${UNPACKDIR}"
+
+FILESEXTRAPATHS:append =3D ":${THISDIR}/emptty"
+
+GO_IMPORT =3D "github.com/tvrzna/emptty"
+GO_IMPORT_pam =3D "github.com/msteinert/pam"
+SRC_URI =3D "\
+    git://${GO_IMPORT}.git;protocol=3Dhttps;branch=3Dmaster;destsuffix=3Ds=
rc/${GO_IMPORT} \
+    git://${GO_IMPORT_pam}.git;protocol=3Dhttps;branch=3Dmaster;name=3Dpam=
;destsuffix=3Dsrc/${GO_IMPORT_pam} \
+    file://pamconf \
+    "
+SRCREV =3D "bb203ad0a224731a7a2ff50deeb342ab79c4af09"
+SRCREV_pam =3D "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
+
+SRCREV_FORMAT .=3D "_pam"
+
+PR =3D "r1"
diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf b/met=
a-arago-distro/recipes-graphics/emptty/emptty/pamconf
new file mode 100644
index 00000000..5c82d46b
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty/pamconf
@@ -0,0 +1,11 @@
+#%PAM-1.0
+auth            sufficient      pam_succeed_if.so user ingroup nopasswdlog=
in
+auth            include         common-auth
+-auth           optional        pam_gnome_keyring.so
+-auth           optional        pam_kwallet5.so
+account         include         common-account
+session         include         common-session
+-session        optional        pam_gnome_keyring.so auto_start
+-session        optional        pam_kwallet5.so auto_start force_run
+password        include         common-password
+
diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb b/m=
eta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
new file mode 100644
index 00000000..415c5ea5
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty_0.15.0.bb
@@ -0,0 +1,57 @@
+require emptty.inc
+
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam x11', d)}"
+PACKAGECONFIG[pam] =3D ",,libpam,pam-plugin-succeed-if"
+PACKAGECONFIG[x11] =3D ",,virtual/libx11,util-linux-mcookie"
+
+DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', 'virtual/cr=
ypt', d)}"
+
+GO_TAGS =3D ""
+GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nop=
am', d)}"
+GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',nox=
lib', d)}"
+
+GOBUILDFLAGS:append =3D " -tags=3D${GO_TAGS}"
+
+export GO111MODULE =3D "off"
+
+inherit go
+
+DEPENDS +=3D "gzip"
+
+do_install () {
+    # general collateral
+    install -Dm755 ${B}/${GO_BUILD_BINDIR}/emptty ${D}${bindir}/emptty
+    install -d ${D}${mandir}/man1
+    gzip -cn ${S}/src/${GO_IMPORT}/res/emptty.1 > ${D}${mandir}/man1/emptt=
y.1.gz
+
+    # pam config
+    if "${@bb.utils.contains('PACKAGECONFIG','pam','true','false',d)}"
+    then
+        install -Dm644 ${S}/pamconf ${D}${sysconfdir}/pam.d/emptty
+    fi
+
+    # systemd init service
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
+    then
+        oe_runmake -C ${S}/src/${GO_IMPORT} DESTDIR=3D${D} install-systemd
+    fi
+}
+
+FILES:${PN} =3D "\
+    ${systemd_system_unitdir}/emptty.service \
+    ${bindir}/emptty \
+    ${mandir}/man1/emptty.1.gz \
+    ${sysconfdir}/pam.d/emptty \
+"
+
+RDEPENDS:${PN} +=3D "virtual-emptty-conf"
+SYSTEMD_SERVICE:${PN} =3D "emptty.service"
+
+inherit systemd
+
+USERADD_PACKAGES =3D "${PN}"
+GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
+
+inherit useradd
+
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.b=
b b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
new file mode 100644
index 00000000..484d25e1
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
@@ -0,0 +1,72 @@
+SUMMARY =3D "Configuration files for the Weston Wayland compositor"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb7=
88c80a0384361b4de20420"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+SRC_URI:append =3D " \
+    file://weston.ini \
+    file://weston-launch-calibrator.sh \
+    file://emptty.conf \
+"
+
+S =3D "${UNPACKDIR}"
+
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayl=
and', '', d)}"
+PACKAGECONFIG:append:qemuriscv64 =3D " use-pixman"
+PACKAGECONFIG:append:qemuppc64 =3D " use-pixman"
+
+PACKAGECONFIG[xwayland] =3D ",,"
+PACKAGECONFIG[no-idle-timeout] =3D ",,"
+PACKAGECONFIG[use-pixman] =3D ",,"
+
+DEFAULTBACKEND ??=3D ""
+DEFAULTBACKEND:qemuall ?=3D "drm"
+
+do_install() {
+	install -D -p -m0644 weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
+	install -D -p -m0644 emptty.conf ${D}${sysconfdir}/emptty/conf
+
+	if [ -n "${DEFAULTBACKEND}" ]; then
+		sed -i -e "/^\[core\]/a backend=3D${DEFAULTBACKEND}-backend.so" ${D}${sy=
sconfdir}/xdg/weston/weston.ini
+	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'yes', 'no', d)}"=
 =3D "yes" ]; then
+		sed -i -e "/^\[core\]/a xwayland=3Dtrue" ${D}${sysconfdir}/xdg/weston/we=
ston.ini
+	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no=
', d)}" =3D "yes" ]; then
+		sed -i -e "/^\[core\]/a idle-time=3D0" ${D}${sysconfdir}/xdg/weston/west=
on.ini
+	fi
+
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'use-pixman', 'yes', 'no', d)=
}" =3D "yes" ]; then
+		sed -i -e "/^\[core\]/a use-pixman=3Dtrue" ${D}${sysconfdir}/xdg/weston/=
weston.ini
+	fi
+
+	install -dm 755 -o weston -g weston ${D}/home/weston
+	install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-c=
alibrator
+}
+
+inherit useradd
+
+USERADD_PACKAGES =3D "${PN}"
+
+# rdepends on weston which depends on virtual/egl
+#
+require ${COREBASE}/meta/recipes-graphics/wayland/required-distro-features=
.inc
+
+RDEPENDS:${PN} =3D "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xway=
land', 'weston-xwayland', '', d)} emptty"
+
+FILES:${PN} +=3D "\
+    ${sysconfdir}/xdg/weston/weston.ini \
+    ${sysconfdir}/emptty/conf \
+    /home/weston \
+    ${bindir}/weston-launch-calibrator \
+    "
+
+CONFFILES:${PN} +=3D "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/em=
ptty/conf"
+RPROVIDES:${PN}:append =3D " virtual-emptty-conf weston-init"
+RCONFLICTS:${PN} +=3D "weston-init"
+
+USERADD_PARAM:${PN} =3D "--home /home/weston --shell /bin/sh --user-group =
-G video,input,render,nopasswdlogin weston"
+GROUPADD_PARAM:${PN} =3D "-r wayland; -r render; -r nopasswdlogin"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/b=
eaglebone/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-in=
it-arago/beaglebone/weston.ini
new file mode 100644
index 00000000..9fd9851d
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/beaglebo=
ne/weston.ini
@@ -0,0 +1,85 @@
+# configuration file for Weston
+
+[core]
+idle-time=3D0
+#modules=3Dxwayland.so,cms-colord.so
+#shell=3Ddesktop-shell.so
+gbm-format=3Drgb565
+require-input=3Dfalse
+
+[shell]
+locking=3Dfalse
+animation=3Dzoom
+panel-position=3Dtop
+startup-animation=3Dfade
+#background-image=3D/usr/share/backgrounds/gnome/Aqua.jpg
+#background-color=3D0xff002244
+#background-type=3Dtile
+#clock-format=3Dminutes
+#panel-color=3D0x90ff0000
+#locking=3Dtrue
+#animation=3Dzoom
+#startup-animation=3Dfade
+#binding-modifier=3Dctrl
+#num-workspaces=3D6
+#cursor-theme=3Dwhiteglass
+#cursor-size=3D24
+
+#lockscreen-icon=3D/usr/share/icons/gnome/256x256/actions/lock.png
+#lockscreen=3D/usr/share/backgrounds/gnome/Garden.jpg
+#homescreen=3D/usr/share/backgrounds/gnome/Blinds.jpg
+#animation=3Dfade
+
+#[launcher]
+#icon=3D/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
+#path=3D/usr/bin/gnome-terminal
+
+#[launcher]
+#icon=3D/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
+#path=3D/usr/bin/weston-terminal
+
+#[launcher]
+#icon=3D/usr/share/icons/hicolor/24x24/apps/google-chrome.png
+#path=3D/usr/bin/google-chrome
+
+#[launcher]
+#icon=3D/usr/share/icons/gnome/24x24/apps/arts.png
+#path=3D/build/weston-0lEgCh/weston-1.11.0/weston-flower
+
+#[input-method]
+#path=3D/usr/libexec/weston-keyboard
+
+[output]
+name=3DHDMI-A-1
+#mode=3D1680x1050
+#transform=3D90
+#icc_profile=3D/usr/share/color/icc/colord/Bluish.icc
+
+#[output]
+#name=3DVGA1
+#mode=3D173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
+#transform=3Dflipped
+
+#[output]
+#name=3DX1
+#mode=3D1024x768
+#transform=3Dflipped-90
+
+[libinput]
+touchscreen_calibrator=3Dtrue
+#enable_tap=3Dtrue
+
+#[touchpad]
+#constant_accel_factor =3D 50
+#min_accel_factor =3D 0.16
+#max_accel_factor =3D 1.0
+
+[screen-share]
+command=3D/usr/bin/weston --backend=3Drdp-backend.so --shell=3Dfullscreen-=
shell.so --no-clients-resize
+
+#[xwayland]
+#path=3D/usr/bin/Xwayland
+
+[autolaunch]
+# launch the calibrator on startup if a touchscreen is detected
+path=3D/usr/bin/weston-launch-calibrator
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/e=
mptty.conf b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/e=
mptty.conf
new file mode 100644
index 00000000..ffe1a3c2
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.c=
onf
@@ -0,0 +1,77 @@
+# TTY, where emptty will start.
+TTY_NUMBER=3D7
+
+# Enables switching to defined TTY number.
+SWITCH_TTY=3Dtrue
+
+# Enables printing of /etc/issue in daemon mode.
+PRINT_ISSUE=3Dtrue
+
+# Enables printing of default motd, /etc/emptty/motd or /etc/emptty/motd-g=
en.sh.
+PRINT_MOTD=3Dtrue
+
+# Preselected user, if AUTOLOGIN is enabled, this user is logged in.
+DEFAULT_USER=3Dweston
+
+# Enables Autologin, if DEFAULT_USER is defined and part of nopasswdlogin =
group. Possible values are "true" or "false".
+AUTOLOGIN=3Dtrue
+
+# The default session used, if Autologin is enabled. If session is not fou=
nd in list of session, it proceeds to manual selection.
+AUTOLOGIN_SESSION=3DWeston
+
+# If Autologin is enabled and session does not start correctly, the number=
 of retries in short period is kept to eventually stop the infinite loop of=
 restarts. -1 is for infinite retries, 0 is for no retry.
+AUTOLOGIN_MAX_RETRY=3D-1
+
+# Default LANG, if user does not have set own in init script.
+#LANG=3Den_US.UTF-8
+
+# Starts desktop with calling "dbus-launch".
+DBUS_LAUNCH=3Dtrue
+
+# Starts Xorg desktop with calling "~/.xinitrc" script, if is true, file e=
xists and selected WM/DE is Xorg session, it overrides DBUS_LAUNCH.
+XINITRC_LAUNCH=3Dfalse
+
+# Prints available WM/DE each on new line instead of printing on single li=
ne.
+VERTICAL_SELECTION=3Dfalse
+
+# Defines the way, how is logging handled. Possible values are "rotate", "=
appending" or "disabled".
+#LOGGING=3Drotate
+
+# Overrides path of log file
+#LOGGING_FILE=3D/var/log/emptty/[TTY_NUMBER].log
+
+# Arguments passed to Xorg server.
+#XORG_ARGS=3D
+
+# Allows to use dynamic motd script to generate custom MOTD.
+#DYNAMIC_MOTD=3Dfalse
+
+# Allows to override default path to dynamic motd.
+#DYNAMIC_MOTD_PATH=3D/etc/emptty/motd-gen.sh
+
+# Allows to override default path to static motd.
+#MOTD_PATH=3D/etc/emptty/motd
+
+# Foreground color, available only in daemon mode.
+#FG_COLOR=3DLIGHT_BLACK
+
+# Background color, available only in daemon mode.
+#BG_COLOR=3DBLACK
+
+# Enables numlock in daemon mode. Possible values are "true" or "false".
+#ENABLE_NUMLOCK=3Dfalse
+
+# Defines the way, how is logging of session errors handled. Possible valu=
es are "rotate", "appending" or "disabled".
+SESSION_ERROR_LOGGING=3Drotate
+
+# Overrides path of session errors log file
+#SESSION_ERROR_LOGGING_FILE=3D/var/log/emptty/session-errors.[TTY_NUMBER].=
log
+
+# If set true, it will not use `.emptty-xauth` file, but the standard `~/.=
Xauthority` file. This allows to handle xauth issues.
+#DEFAULT_XAUTHORITY=3Dfalse
+
+#If set true, Xorg will be started as rootless, if system allows and emptt=
y is running in daemon mode.
+#ROOTLESS_XORG=3Dfalse
+
+#If set true, environmental groups are printed to differ Xorg/Wayland/Cust=
om/UserCustom desktops.
+IDENTIFY_ENVS=3Dfalse
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/w=
eston-launch-calibrator.sh b/meta-arago-distro/recipes-graphics/wayland/wes=
ton-init-arago/weston-launch-calibrator.sh
new file mode 100644
index 00000000..45863ecd
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston-l=
aunch-calibrator.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+if [ -e /dev/input/touchscreen0 ]; then
+	echo "Touch screen detected..."
+	if [ -n "$LIBINPUT_CALIBRATION_MATRIX" ]; then
+		echo "Calibration matrix already present, skipping calibration..."
+	else
+		echo "Calibrating touchscreen..."
+		exec weston-calibrator
+	fi
+else
+	echo "Touch screen not detected, skipping calibration..."
+fi
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/w=
eston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/we=
ston.ini
new file mode 100644
index 00000000..1bc7a010
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/weston.i=
ni
@@ -0,0 +1,21 @@
+[core]
+idle-time=3D0
+require-input=3Dfalse
+require-outputs=3Dnone
+
+[shell]
+locking=3Dfalse
+animation=3Dzoom
+panel-position=3Dtop
+startup-animation=3Dfade
+
+[libinput]
+touchscreen_calibrator=3Dtrue
+
+[autolaunch]
+# launch the calibrator on startup if a touchscreen is detected
+path=3D/usr/bin/weston-launch-calibrator
+
+[screensaver]
+# Uncomment path to disable screensaver
+#path=3D@libexecdir@/weston-screensaver
--=20
2.34.1


