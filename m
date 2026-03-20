Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B0F1099B48
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 22:22:43 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1191.1774045354306104477
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 15:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=IrT7G7o3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.25, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8TEpXmTMBZIpmu2CKV6EJN0wVytRIz3k3brUzgQqSvdPV7Z4JguED5GIGSMdpRFVh7ohB8A9Zy7EAoNODdzwo99lXG74i3v20zbjBN7/p3xFLDk/XkvIpIbNArXA4DMO+saYYa6du2zrPlGtWbXNV2UiENqNfv/QFvcG4SxTCDqpkzrkE0foLrCkgWF4S1Yz24a/4jJ5o93Egcd5mMQs0IAgZLjqZTuCMyLUzNIqhL9sgusFyTJMxGR4J7kaFDUz/McixRhsUzanATBQU/sdpwVTfdeLGeQg4kkeW3bPkKMbBH0WJU5Nb8V3j2qBJTQuN77RoaO5J7v1yGH3A3nVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8B+nHVKOUiwmKQP+2tQZSQWO6gqBcgzrHVy7ZkI2pIU=;
 b=tGJ01HfRhHaJp61IFJoqEgiWjd4EGxvGShEnAfo+3YEiPI1vox64qsIz0gW0X+6Cs1qoFw7hc3UorUdYt8NLKJb6LLWUJjmM8WwlOk9dWQHuDwIdNv95w9R5shD4PZx5hPqVUMXgym+/kTzXwjf7aORWxOx6kowU9mDhisQFCK3ZcHfsX6PVhIp3EnmJbOdU+7xFMr0kdC6/FRMr7mwjaC4XBBtVZxNP7UMI2dZlfgV9CYvuyE/HhZzq7d5YaUGTAfPl1SSc73YNe95rT1HWj//zzyTif5uta18v3OAKgTOFdjfTU49AwiAH6ZH0gMSoACfHANUdvRPGgPSvHd1nwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8B+nHVKOUiwmKQP+2tQZSQWO6gqBcgzrHVy7ZkI2pIU=;
 b=IrT7G7o3ENld7SKuZlrNK6RGoZ5trx9EjfiNJZU6vDnddTHnPLXI5lA8G+QZyV3cMZb9idvPBL51iQ8URzfb2GvqOTU1BeQe5x7VRjqn52muVA0Z2sIWGPNWN2cy8isWUNExrl96t2DTwLNCtGi8AN6RU0G9lN5/tdYtPYirOIU=
Received: from SJ0PR13CA0174.namprd13.prod.outlook.com (2603:10b6:a03:2c7::29)
 by CO1PR10MB4724.namprd10.prod.outlook.com (2603:10b6:303:96::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Fri, 20 Mar
 2026 22:22:31 +0000
Received: from CO1PEPF00012E62.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::ff) by SJ0PR13CA0174.outlook.office365.com
 (2603:10b6:a03:2c7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 22:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E62.mail.protection.outlook.com (10.167.249.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 22:22:31 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:22:30 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 17:22:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 17:22:30 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KMMUce311799;
	Fri, 20 Mar 2026 17:22:30 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 Mar 2026 17:22:30 -0500
Message-ID: <DH7YLAZ0Q5JO.3DMH78OR4C8Y2@ti.com>
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 3/4] mesa-demos: Flip to a bbappend
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260320221404.3991734-1-reatmon@ti.com>
 <20260320221404.3991734-3-reatmon@ti.com>
In-Reply-To: <20260320221404.3991734-3-reatmon@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E62:EE_|CO1PR10MB4724:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b16a584-5e0a-4cf8-9850-08de86cf2d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	zmIEQw7PwE7FoHW/68Xjl4cJzNpmQlx8pNOK7DjP4wwiZ5pxEw4szI0HOY2sH/5fggB9m7Bqjmx++qM9vSsf4vRoQHWn0Kg4Lq3+NmceColM8/NqZ1KZu00Gsg9hRKYtIUKElsWBme33FT9VpnqJFYvwlkczgIES6NCc3z+agt7zx8Ts4kQh1V0Q5QzZ3xc5mX8EPWWhHMg5aIRs4is5f6AIkF7S9VaCyv9oSL3XraJQ7V8aF3crv5nknOA6l+8Hycyoaf+I9BS9bIMf0ScrZfhqx1uSFg0WDp2SJxto9GJq+uvFTX2aXSMnAMOhhHIBDFcuNtyM3CsclEy9AkEBLWULZmwZypgH8wxqoLjMBIhR3PsOypIMMZGig3lhk5hsphOviw9iw+kg592lyb9AGwQZE3pCBrKyWBH/w8QtxnKyJ3UaTKlLfj10e4pWMbFrUMHZVSjhO6gpziaTQtPTh0Lqg6BodEr0Oksk3UGs5JrkHFsfbMe3OdpOSBkIOq9W0vkF/5MQ3MRKGYRlUrRyY62uRgsc7yqAnBJRZxIyhQtCzSNe8Wtjd2CvDeL+Fqu4eLiw3RaRDslTOn3LMwuABzs2XuSIhnST7/KoQ7oaNpfO2giMVz+FkRVxUc89QWIPsJMbWjJ9v9vGoqE7RCDfl/1gjJxp9cZkEgre083IekDbqIOAlU+lDpbOCL3nq8p2G520mvA/+EBToHT7vRiPQA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	opnK799Rs3sGVLmX5pOMVHP32R3BaM6KHsUJlB6Ae2gU6Cq2qjLsXKL7VLfmdTYtZIeWUTjW2mT5CKzIGGdax/GMcCeURl7wAtR2Pt1nBLjnJZt6Zk0Lv3Uy4pFiuS0GOaDD9p2qNfaX6DTYm4s0DhdJnEhPuPsVCBJIGaEeSFBgVydwiPiywe0z1a8buwLbqdoHXSJeK/sO5LE1NtkWytPF6iwieewpeuGlgpHbGcnAqNIuVy2SXwFDXc3DcIg8eycjJ983LlN84YKuOT/UklFJpPAGcJHRAuEQWE2380wB4tJxYkOwC8v1+lNeLhlDzkt3wTjYz3npSnl7AMZDTjICQzhhXPC5KUdIPgHFh2SaF3naFm9tNq6tbd5ITpydoerZbi6n0A8C6xCr0QSsIREl1/SifjgLDnyThtC44OQUWWSQwE7aO8LtJ+VH5j+l
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 22:22:31.2149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b16a584-5e0a-4cf8-9850-08de86cf2d87
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E62.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4724
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 Mar 2026 22:22:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17412

On Fri Mar 20, 2026 at 5:14 PM CDT, Ryan Eatmon via lists.yoctoproject.org =
wrote:
> Clean up a check layer error related to how this recipe was setup.
>
> Change the recipe to a bbappend instead of a new git version.  Apply all
> of the changes that were made in the new recipe to the bbappend, and
> remove the PREFERRED_VERSION in arago-prefs.inc.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc       |  3 --
>  .../mesa/mesa-demos-arago.inc                 | 17 ++++++++
>  .../mesa/mesa-demos_9.0.0.bbappend            |  4 ++
>  .../recipes-graphics/mesa/mesa-demos_git.bb   | 42 -------------------
>  4 files changed, 21 insertions(+), 45 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos-ar=
ago.inc
>  create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.=
0.0.bbappend
>  delete mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_gi=
t.bb
>
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-arago-distro/conf/distro/include/arago-prefs.inc
> index 4d1a6006..6a2faa53 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -10,6 +10,3 @@ VIRTUAL-RUNTIME_dbus =3D "dbus-broker"
>  # application that does not have a GPLv3 license
>  PREFERRED_VERSION_crda =3D "3.18"
>  PREFERRED_VERSION_obex =3D "0.34"
> -
> -# Bump mesa-demos to include some patches not in a tagged release
> -PREFERRED_VERSION_mesa-demos =3D "9.0.0+git"
> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc=
 b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
> new file mode 100644
> index 00000000..5a5412c2
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
> @@ -0,0 +1,17 @@
> +SECTION =3D ""
> +
> +LIC_FILES_CHKSUM:remove =3D "file://src/xdemos/glxgears.c;beginline=3D1;=
endline=3D20;md5=3D914225785450eff644a86c871d3ae00e"
> +
> +LIC_FILES_CHKSUM:append =3D " file://src/xdemos/glxgears.c;beginline=3D1=
;endline=3D20;md5=3Da481fbdb2ac800ecb12405c33bcfacae"
> +
> +SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhttp=
s;branch=3Dmain"
> +SRCREV =3D "02eae079cb0b8186064d5b194ca4cc2995f099ee"
> +
> +PV =3D "9.0.0+git"
> +
> +REQUIRED_DISTRO_FEATURES:remove =3D "x11"
> +
> +PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}=
"
> +
> +PACKAGECONFIG[glut] =3D "-Dwith-glut=3D${STAGING_EXECPREFIXDIR},-Dglut=
=3Ddisabled,freeglut"
> +PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Denabled,-Dosmesa=3Ddisabled,"
> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bba=
ppend b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend
> new file mode 100644
> index 00000000..3b26e342
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend
> @@ -0,0 +1,4 @@
> +MESA_DEMOS_ARAGO =3D ""
> +MESA_DEMOS_ARAGO:arago =3D "mesa-demos-arago.inc"
> +
> +require ${MESA_DEMOS_ARAGO}
> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/=
meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> deleted file mode 100644
> index 2da3ceff..00000000
> --- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -SUMMARY =3D "Mesa demo applications"
> -DESCRIPTION =3D "This package includes the demonstration application, su=
ch as glxgears. \
> -These applications can be used for Mesa validation and benchmarking."
> -HOMEPAGE =3D "http://mesa3d.org"
> -BUGTRACKER =3D "https://bugs.freedesktop.org"
> -
> -LICENSE =3D "MIT & PD"
> -LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;beginline=3D1;endline=
=3D20;md5=3Da481fbdb2ac800ecb12405c33bcfacae \
> -                    file://src/xdemos/glxdemo.c;beginline=3D1;endline=3D=
8;md5=3Db01d5ab1aee94d35b7efaa2ef48e1a06"
> -
> -SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhttp=
s;branch=3Dmain"
> -SRCREV =3D "02eae079cb0b8186064d5b194ca4cc2995f099ee"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -PV =3D "9.0.0+git"
> -
> -inherit meson pkgconfig features_check
> -REQUIRED_DISTRO_FEATURES =3D "opengl"
> -
> -EXTRA_OEMESON =3D "-Dwith-system-data-files=3Dtrue"
> -
> -PACKAGECONFIG ?=3D "drm egl gles1 gles2 \
> -                  ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan x11 wayl=
and', d)}"
> -
> -PACKAGECONFIG[drm] =3D "-Dlibdrm=3Denabled,-Dlibdrm=3Ddisabled,libdrm"
> -PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl=3Ddisabled,virtual/egl"
> -PACKAGECONFIG[gles1] =3D "-Dgles1=3Denabled,-Dgles1=3Ddisabled,virtual/l=
ibgles1"
> -PACKAGECONFIG[gles2] =3D "-Dgles2=3Denabled,-Dgles2=3Ddisabled,virtual/l=
ibgles2"
> -PACKAGECONFIG[glut] =3D "-Dwith-glut=3D${STAGING_EXECPREFIXDIR},-Dglut=
=3Ddisabled,freeglut"
> -PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Denabled,-Dosmesa=3Ddisabled,"
> -PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan=
-loader glslang-native"
> -PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,vir=
tual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
> -PACKAGECONFIG[x11] =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,virtual/libx11 =
libglu libxkbcommon libxcb"
> -
> -do_install:append() {
> -	# it can be completely empty when all PACKAGECONFIG options are disable=
d
> -	rmdir --ignore-fail-on-non-empty ${D}${bindir}
> -
> -	if [ -f ${D}${bindir}/clear ]; then
> -		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
> -	fi
> -}

I still hate that layer conformance thinks this is the correct way to do wh=
at is
essentially adding a new *optional* package version. Feels really backwards=
 and
gross, but I'm already picking other fights right now.

