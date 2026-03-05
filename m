Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C602BF47CD8
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 21:02:48 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54674.1772744559802091965
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 13:02:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=mDAKosNP;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.22, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSwHWpZlEY9mYIPySkwYog1Q6BGIAYOBqze4hFeT0gui5y56oW+OoIXuA4zb13q6BZrFba+uyKZa8o0NwltMgUWZ7OtzPETjYYAm/QqHPzCIc3oJTyOzbrN4f/DriLafABz+Cf/Bj5MEd/3ValRGU4GRzjRiDfEJPPoQlIaxjrMmLrtlQ51rqZzmrCu84HXusLnlv73LyEXSEkpGEHww1ttlj5NfMATX5y0EBUb5RvbHZ5kcJayQFV18awS537ki7Fph2CIt7yrwRKl+jeBpo27+5mFTzqtBBrk95V/teJYvcN2tfQ6pf49AdIaTmZ8HzrYVP0tB6mG5gVsXef8xow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7/2HDgrsBuOgZyAPdloCatu6TOZYXvLioRmZhCu91k=;
 b=MIftV9XYaC+BQjFf8ePrks9LwdUXEApfTJX/DKSB4D9o8xE0Ag/7JPaiFDCCon1haA5wdulvLvWsaixufIc1895F2ABXUwCI0FDXDsZaDmFGZ2K6lEAUkPqMvtsyxxgQdOaDd/2NrCeADpqqVC2YvRPdq4kX9pvhEGc3Gq/54uC3FYjtFUpf4Cv/5pM0k9egBkpaVGcZnfDkfJJpVqoJRTBPtTJXzbNbd44TzQFrfUaBWuXLA49v557KoJ2Blb1zsly3KAyZQIzqU91zh6vtmY09K2CDDefouWvcGiQNiV8cnZ4i4rFxWq1jucxjy2tENm75pR0g2hI4liuzh6Gg2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7/2HDgrsBuOgZyAPdloCatu6TOZYXvLioRmZhCu91k=;
 b=mDAKosNPCE2IK/P/V3feD5hsxFKMnFF3e48wbtJoqPejihOWHR9XCcCiMW2EzjahSLGRe3744flsm45g+CTQd0UjINhEE9R6uTRIBUjTagf11TCA3tJSsgf/qRg8eWv7eEcmFSHXU8VENlPm6U0laIJeVMtxp0R1UkmVmZfAdio=
Received: from SJ0PR03CA0106.namprd03.prod.outlook.com (2603:10b6:a03:333::21)
 by DS4PPFB033C1B5C.namprd10.prod.outlook.com (2603:10b6:f:fc00::d42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 21:02:37 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::84) by SJ0PR03CA0106.outlook.office365.com
 (2603:10b6:a03:333::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 21:02:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 21:02:35 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 15:02:32 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 15:02:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 15:02:32 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625L2W4m3032793;
	Thu, 5 Mar 2026 15:02:32 -0600
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2] emptty: add version 0.15.0
Date: Thu, 5 Mar 2026 15:02:32 -0600
Message-ID: <20260305210232.268113-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|DS4PPFB033C1B5C:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c21fb7c-af83-4b90-f59c-08de7afa8703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|34020700016|36860700016|376014|82310400026|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info: 
	EJmN9fWSNh5LU5BavGJmTyFu6kixtnWBMyIJj+mcNxoxRuwog4l+uM4KRIp8LLmbUerqOFaMq5599ci4fTEmHi9pJXK2yHX9WdzAbKzbAnWlg9b6Q+IAonjLvLc1p9IkP/gW99Vxs53lUk4P897FViM3MMaFXQrDuyvfqrxwsyAkXvhVlfBUhtsEYgvNIwdnel2i7dV4Efo1iVU+NgEJcniIyoP9sxiD6SMz+ETnInxiOSxlvF2cZQs5w0+IfZrbLcu5VLmcJJjXXHbGZWmhHzNyvOXzrJlmeT86/7M16FlhO++1RGKD3m67TLd/X6rOxAoUUhMhseb8fgJE4JrKTfIGiCFgbIGUXbBWGXMP+aAQXbW3U8N1fV5hLuJyV8JOm/YF60i2y6DAJ3EgbKEy5i+vaAkhPkprLYf0pN//l/vaIg+1tbweBSa5afjYB+XVYATedqaMdgLzDjBKQJsH5gp+aXd7LSO+AsbDlfCe7wF9Yf837wKPe/cLjWT3GA00jXMOEZEaakg51+zEiaXuezen84i+Zoq/tK6elZhmRwuQcz0iLW4JF1WrC5GDx0aRJmh7gKIUQeGa8+CNr7H5Gzxd89eUAIEXCHYJdhjYFVUiQ2V6klSQnmySgItnxQESJjwGjDiR+q3knA6ZVnZm0x5kvaH8U4+uapbJ130BADAC9uvaYyaal6gb59z47kWWnx4CL1Htw3Wvp25av7zH67VRduhATo8nkzzdvPAm0xY=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(34020700016)(36860700016)(376014)(82310400026)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6ZwTOLXvGMi+mTgToo65F6RKFQ2jfLJNqu7/zvzXKKbYRLJe6B+irK7NUxZpj4CF3IXZQOP/bzTuBrsV/2eFE3K4XF1ACA/pqMFYUVWSZwU6jYTGUvc4EOQIsdzp5BqX0HhIPSmp7CI849l7oHcXF5cMdAltNoLXYXr+JHLQx0P8gZI0uhTLBLHFpMTuh07NynZoxmahKo74SDUuwfhosy5Hp6m9aX6Mx8BoMUlH/1QgUBn7gCT2Zei/P59y9+GF/O8neMQu+0PtBOe3sJ7J6HHd/1OGsvk9Tl741L32X2QYcpsFac7Oy1k1RgpjDGhs18XJEaVc7RkCKekc6F5oaxXPriy+9QzrEs8Rvb6706QuNmwFFlvXfDQRd79OE2PYjRotn3zasnOQXB4dnEH1Rhvb1zIM89/KNnPPzfZpy1wVL8NO9n4FeHxkGVSwp7fN
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 21:02:35.7497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c21fb7c-af83-4b90-f59c-08de7afa8703
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFB033C1B5C
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 21:02:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17269

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
v2:
- Removed patch, emptty-add-version-0.15.0.patch
 .../classes/tisdk-bundle.bbclass              | 14 ++-
 meta-arago-distro/conf/distro/arago.conf      |  2 +
 .../recipes-graphics/emptty/emptty-conf.bb    | 14 +++
 .../recipes-graphics/emptty/emptty.inc        | 27 ++++++
 .../recipes-graphics/emptty/emptty/pamconf    | 11 +++
 .../recipes-graphics/emptty/emptty_0.15.0.bb  | 57 +++++++++++++
 .../wayland/weston-init-arago.bb              | 72 ++++++++++++++++
 .../weston-init-arago/beaglebone/weston.ini   | 85 +++++++++++++++++++
 .../wayland/weston-init-arago/emptty.conf     | 77 +++++++++++++++++
 .../weston-launch-calibrator.sh               | 13 +++
 .../wayland/weston-init-arago/weston.ini      | 21 +++++
 11 files changed, 392 insertions(+), 1 deletion(-)
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


