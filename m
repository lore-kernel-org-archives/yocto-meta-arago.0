Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AB31099B49
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 22:14:12 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.964.1774044849918909074
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 15:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=WK+x/MPB;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.61, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3q2Ny9gadpkHeoQswo3Wi/w7DAufN6OsXyxDwKSqZLm25SBYDWoGIcrPBb+XUHTZ6q9JQr4QbzcINgLIi0GmLw7GMpPT2q5PjAk+IjhohEWwi0OBRsdvdOUa+IscHeoPa2U6SkUNA38Hm1C1i0uhM7FqxPcN/CtlVScVZO6IDv9ky+cfcRVEWCmi5SYDhuHclKuw6HdjQYiYYBxKSJ4nXpEvU368V3fYoLpV+Hn5VesEenb5PWPa66bJsxHta9Z2ZSWiMT3Z/2oOhhPYSvPzQzU+quJqWb8PcxgmWx4vfVFK2J67gpn+78apU97RJVGvDedgEKLeQLumq7E+5j8NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yik/JLDNoqu/p01kaWAqvTqLmfqHZHUkw7xX2E7K/HE=;
 b=OyAxwbyEBEJ0UfuExDrFbfzNQFkyAnWcDWv/VagCM6NHa9tAuazJx0PmHPmyyq2BxWaj5quouCulHoyQrdn7ONWfbmUqr7bjDIaOzpLW6M6KlxmOmLDj+ofADUGJG+bP83MroXLb4vuhOc8m0CZ/Xw7lT41VPjz+VXMw4K2ZlHodCnxCL2cqCY+YeMHnTCYjgCuO+/DdAg/3PLPyPMu8/k/2ZDQsX2W7wiMKj1E09Ds1bHHAg5zHSZUunFESwPg0HI2YMOqwbyxy8fcApjDGTBVSsPAS0zJxGdDkOJ2pYlMbnn3jIbEY+BdA3g8wgkllC2b0jPPnt7t8EAOzRVhaIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yik/JLDNoqu/p01kaWAqvTqLmfqHZHUkw7xX2E7K/HE=;
 b=WK+x/MPBZUk92wfhvMYWvCRbJ71C7Czu3MG435fO/JhmsZ+9bYCq23r1m9P+2ah7KfI62MRAG/0IAMNINkuGO3Czc+s71Bjuc+5wwVqyec6jTVpMV4+zDEWt56OhILXDAqOkd1u69m8BVoayt66xU6LLAXaRkXiJ31EbVkY/KYw=
Received: from SA9PR13CA0049.namprd13.prod.outlook.com (2603:10b6:806:22::24)
 by MN2PR10MB4367.namprd10.prod.outlook.com (2603:10b6:208:1d3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 22:14:06 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::30) by SA9PR13CA0049.outlook.office365.com
 (2603:10b6:806:22::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Fri,
 20 Mar 2026 22:14:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 22:14:06 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:14:05 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:14:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 17:14:04 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KME49K302267;
	Fri, 20 Mar 2026 17:14:04 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w3i6W-0000000GkRD-39ip;
	Fri, 20 Mar 2026 17:14:04 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 3/4] mesa-demos: Flip to a bbappend
Date: Fri, 20 Mar 2026 17:14:03 -0500
Message-ID: <20260320221404.3991734-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320221404.3991734-1-reatmon@ti.com>
References: <20260320221404.3991734-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|MN2PR10MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: 0337016b-4163-4d46-b938-08de86ce00ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	8gTL9XEEPB7nI7tEnCZNfB7Rf1DWiaDfBhTqW0+epifWjsjp4eyTE5GsTqKaKB6TrX6EQff4d/2IGTg45KRTO/EEvXa37ZpyRjmhgpkhStyXMEDwLlIhhDk8S68gT1TT7/xZ86kpbDhjm/CBR7DOAHY7jkVjaRUBqKFMwPA19XbvYHL6YysKNWEW+Ip13gnkd1DBlkt64pYPSWu5sgaxKlT/3PE1oE/rjISt5I+rVvr/I45488aC0BkVGOd2+IbUMTaOETk84kmODwgliodxYodcnxcSBgxRzqfk/jOC1/T9WKlPLy6bxbnX0r2U2XoxoRlDZy5CWmt/TXCXnmP6yhgWAOgK5A/l+GdmYQk0WwczARfYkZObKkhs7Es6F822Tww7KfhXTiMJGC4vJUBTYO88cC0VBCK3kB5wyiKLZw732VtxOjiCwQmdAtHsq7rjqLGhhZc2ch+I7La1l0Nb4y0Ncd0fn3TGRvvebc7J7pQY1v8d/UsSxhJAcZyrqNSdwyhJQ4zLF4JKSWi2lZ6EFsdNv7ZcEerfMDsPfzLprFnjQvQm219vTUAOIWOPHx8VOnICTSVv5JrrCBot84G+BisiTM+uwAmQhKm43ESrlNvRedbe24t/7nGAfRKpPvE8qfPReH++B9mPMoJ6qNDH/oiBJuF5lAroqoOWNwEpyf+9y2kBWLuUyghAcrwWtIP/8PKvDyvz5IFAwMYD+cjSVA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xG/LnK5v/3LuLr53dj3VBPotdhrn+o+oZwGaX/+kJ8+boCB+6AKMeO2isWdZhSPYLKAqTsUapPY3SDQabYX07WKhd+GYcbX3jgmlYwepV29YBtcm5a8HZ+EfdrAHhMeCVZ6F6960wWQJIOnCpcI4znuiO2s1PlUfn9czUf3k4fCyohU0JzPtwd7JZEDbY9rjMNGy8OeXx6WGyHjK/zFwP18Yo5LLHfg6eSqmzOn+Khd7moB2phb/ocCBsNKEttjyo/26o/lp42DpolfqfNSv+bARChHjoRWRIHO9VAkPhF5/Mq8ZXhaLdQZr56bhDhnjcmY5XobO/B+lHfrhZZNGVTuyOX1J4b8sbTbTXfyNlaofJQ8+HjKRlS5B3IINM2rTfcEUhaB450Oc6/bWSMPsvvZr8CoezLmO49L2M0j+N3rsS6RHn/Zktk6sLW66mFsz
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 22:14:06.5195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0337016b-4163-4d46-b938-08de86ce00ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4367
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Mar 2026 22:14:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17409

Clean up a check layer error related to how this recipe was setup.

Change the recipe to a bbappend instead of a new git version.  Apply all
of the changes that were made in the new recipe to the bbappend, and
remove the PREFERRED_VERSION in arago-prefs.inc.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../conf/distro/include/arago-prefs.inc       |  3 --
 .../mesa/mesa-demos-arago.inc                 | 17 ++++++++
 .../mesa/mesa-demos_9.0.0.bbappend            |  4 ++
 .../recipes-graphics/mesa/mesa-demos_git.bb   | 42 -------------------
 4 files changed, 21 insertions(+), 45 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos-arag=
o.inc
 create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.=
0.bbappend
 delete mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.=
bb

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-a=
rago-distro/conf/distro/include/arago-prefs.inc
index 4d1a6006..6a2faa53 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -10,6 +10,3 @@ VIRTUAL-RUNTIME_dbus =3D "dbus-broker"
 # application that does not have a GPLv3 license
 PREFERRED_VERSION_crda =3D "3.18"
 PREFERRED_VERSION_obex =3D "0.34"
-
-# Bump mesa-demos to include some patches not in a tagged release
-PREFERRED_VERSION_mesa-demos =3D "9.0.0+git"
diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc b=
/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
new file mode 100644
index 00000000..5a5412c2
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
@@ -0,0 +1,17 @@
+SECTION =3D ""
+
+LIC_FILES_CHKSUM:remove =3D "file://src/xdemos/glxgears.c;beginline=3D1;en=
dline=3D20;md5=3D914225785450eff644a86c871d3ae00e"
+
+LIC_FILES_CHKSUM:append =3D " file://src/xdemos/glxgears.c;beginline=3D1;e=
ndline=3D20;md5=3Da481fbdb2ac800ecb12405c33bcfacae"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhttps;=
branch=3Dmain"
+SRCREV =3D "02eae079cb0b8186064d5b194ca4cc2995f099ee"
+
+PV =3D "9.0.0+git"
+
+REQUIRED_DISTRO_FEATURES:remove =3D "x11"
+
+PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
+
+PACKAGECONFIG[glut] =3D "-Dwith-glut=3D${STAGING_EXECPREFIXDIR},-Dglut=3Dd=
isabled,freeglut"
+PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Denabled,-Dosmesa=3Ddisabled,"
diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbapp=
end b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend
new file mode 100644
index 00000000..3b26e342
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend
@@ -0,0 +1,4 @@
+MESA_DEMOS_ARAGO =3D ""
+MESA_DEMOS_ARAGO:arago =3D "mesa-demos-arago.inc"
+
+require ${MESA_DEMOS_ARAGO}
diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/me=
ta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
deleted file mode 100644
index 2da3ceff..00000000
--- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY =3D "Mesa demo applications"
-DESCRIPTION =3D "This package includes the demonstration application, such=
 as glxgears. \
-These applications can be used for Mesa validation and benchmarking."
-HOMEPAGE =3D "http://mesa3d.org"
-BUGTRACKER =3D "https://bugs.freedesktop.org"
-
-LICENSE =3D "MIT & PD"
-LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;beginline=3D1;endline=
=3D20;md5=3Da481fbdb2ac800ecb12405c33bcfacae \
-                    file://src/xdemos/glxdemo.c;beginline=3D1;endline=3D8;=
md5=3Db01d5ab1aee94d35b7efaa2ef48e1a06"
-
-SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhttps;=
branch=3Dmain"
-SRCREV =3D "02eae079cb0b8186064d5b194ca4cc2995f099ee"
-
-DEFAULT_PREFERENCE =3D "-1"
-PV =3D "9.0.0+git"
-
-inherit meson pkgconfig features_check
-REQUIRED_DISTRO_FEATURES =3D "opengl"
-
-EXTRA_OEMESON =3D "-Dwith-system-data-files=3Dtrue"
-
-PACKAGECONFIG ?=3D "drm egl gles1 gles2 \
-                  ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan x11 waylan=
d', d)}"
-
-PACKAGECONFIG[drm] =3D "-Dlibdrm=3Denabled,-Dlibdrm=3Ddisabled,libdrm"
-PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl=3Ddisabled,virtual/egl"
-PACKAGECONFIG[gles1] =3D "-Dgles1=3Denabled,-Dgles1=3Ddisabled,virtual/lib=
gles1"
-PACKAGECONFIG[gles2] =3D "-Dgles2=3Denabled,-Dgles2=3Ddisabled,virtual/lib=
gles2"
-PACKAGECONFIG[glut] =3D "-Dwith-glut=3D${STAGING_EXECPREFIXDIR},-Dglut=3Dd=
isabled,freeglut"
-PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Denabled,-Dosmesa=3Ddisabled,"
-PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan-l=
oader glslang-native"
-PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,virtu=
al/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
-PACKAGECONFIG[x11] =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,virtual/libx11 li=
bglu libxkbcommon libxcb"
-
-do_install:append() {
-	# it can be completely empty when all PACKAGECONFIG options are disabled
-	rmdir --ignore-fail-on-non-empty ${D}${bindir}
-
-	if [ -f ${D}${bindir}/clear ]; then
-		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
-	fi
-}
--=20
2.43.0


