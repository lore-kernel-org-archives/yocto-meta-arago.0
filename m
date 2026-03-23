Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F745F483D8
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 17:16:49 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.539.1774286196548884362
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 10:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=icvXTsgh;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.59, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULyLWBe7FE8wLGW4R4/QWCfN7HpmiGDNVneNZRJ7iIHv73q3/WUKBG4DxDJVKfvPPl35b/74jg8SuCVCoGYas5SqiiFg63Iretd3KFv6fo0AhUWGVLCokPcY1nTYxCPOnFiJwlCreMcrXW7Q1LMxWSLQ7rDr4fZmhWDkA1Ysd6Al/AelWWvrM98nb2VHVbG6xK+I43+thTdrs2lan85Edq8ro0Y233qEELOtu3mNV/LHFOe04k6X636qOXrLTd5Nodu8b3WBjifs9/266hpITfxqvfi2V5LuMal8l5CP1V4PRSFQRm4b5ddH/lgMOH6IgOBV9Pz6VQttIeFRw5UpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KMXAsTlGbIa4eVFQ9rRMEvb5V/2gLiTOUsbgxph1Lg=;
 b=x0BFgx3ly7uKqxqp2/KqE7mPSuU6lzLQmRwQFiepIXAmOThoasqDItYdhS3ybAEo+9XgS/xu4en+99WL8NolVTc/dCPth43nZIP4SnLj6FFq0oRJZEfW7HUNhupuUEsEM/hMbQ4YfLKkks4/qqnmT6S4NlHDfp1ALVzFfktgsO7upYXmBrqkpVAW3AKuRrmXNzGkijT2pYCC//W+LMccEaIt7sqnjS+hc//5xrd8a4JvRwt2XuqR889lR/qxo+T3Y4oQbyNqwgCQL3n1YIgwwn/uCjupmdqmXV6q1Ut1seUqDk/INHgRjm4seBZFSxAaos+/oZ0ASLiwEiuNDy0KZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KMXAsTlGbIa4eVFQ9rRMEvb5V/2gLiTOUsbgxph1Lg=;
 b=icvXTsghV5AivEEqMTK5qJfRTSIFovnI299R2XdkEX/GVfSZHW838txw+IfY7+zMrTB0Or0u/7SdlFQ5mgipsnEx9GjZIs2IrXv98xr83AtD1nkjZq04mgkE8gX6c4BuEmbX80Ea6vvdWu67TmcqNoT9AVu19ODnQow6eTrOwzI=
Received: from CH0PR03CA0353.namprd03.prod.outlook.com (2603:10b6:610:11a::15)
 by PH7PR10MB7781.namprd10.prod.outlook.com (2603:10b6:510:304::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 17:16:32 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::a0) by CH0PR03CA0353.outlook.office365.com
 (2603:10b6:610:11a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend
 Transport; Mon, 23 Mar 2026 17:16:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Mon, 23 Mar 2026 17:16:31 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 12:16:31 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 12:16:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 12:16:30 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62NHGUiw1145889;
	Mon, 23 Mar 2026 12:16:30 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Mar 2026 12:16:30 -0500
Message-ID: <DHABYNK6UHI3.38G28NSA7DBOQ@ti.com>
CC: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 3/4] mesa-demos: Flip to a bbappend
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260320221404.3991734-1-reatmon@ti.com>
 <20260320221404.3991734-3-reatmon@ti.com>
 <DH7YLAZ0Q5JO.3DMH78OR4C8Y2@ti.com> <20260322192633.GS11121@denix.org>
In-Reply-To: <20260322192633.GS11121@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|PH7PR10MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dcaee2c-8c06-42f5-afe3-08de88ffed89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	m2VVzTm6LesHxKAKh+tdGe9TVCy62AvpqagUjSCynju+eQrc4WdWK3qbVY1LML1HX4RiSYr85/v3Hae+DLXhEnMfxo0Czl0h57P044Mw1ANR2jJfOVn6Hcm/I6Jk2FkTnM4b7T08ePK/+WUWEZF8cti9LLIxXBiQhaW+hRUAJyv7Yu6ACH26NkjvM/RC7hICpvSn089VB9/V3ISOtLGJKDR1XwKs34pQ0wOcpDWYcMKa4sdLPhUK/fxL6d9KLH5svsF6eOvmaLblnbVFrfXHo/y0Q0Jl96UnVQ6oPveV3g0Wfe1gqu+qJEp/49pX54FxNHfLGDRqGw2BPhI8/drhwb8WrVlRDyLH6oQe2V4w5ipbqJx3NrHgc+2wip+hZ+2oZXkLYPH1jLKVt3xp1c7PkvIgkSjMIEWGNq52ksWFHrk0XAfwo26+F9HcG60pZl5eym7mPMgs2xmHOBnTToRE+9rOgAvi74psZxwQ7etD4NaCa/3RDgb3ucmXtkamwYn/goZ2QZC4KmXjKptFGNabGuuUzXOE5vmxeepsHRABWlmfGNSqi6p2rRnz5PZXH93b7r3I2/5nJMWc+8ldyKNJcXwDp5KDQtbOQFTfAuYZsdGPkEsVBVgxMEAiTrpEvyaJEMijorPaXorN7C3OK26MowzvlVzdGccWzkz3FTP3eBwnDIG/wTO86lk6CsP2a/lWQQ9mixKj6/u5YvicdbS0EQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lus7AeNnG1pIjQ81t0I7/zlP5IAkLLJ/FKEGv+iowRu19I3EgNvwLbF82Of3ucexGUt846gwkrchMJVV81mItis1jNei5ik63UOxBRKrBA0FkU5g2z5RnX6NY3YF76gHw4ERdO+UfN05sGCIybKqOIpL+GS1H18aKdQ+e6m6XgXPcdxtRqEW1aYzaCZ0mLPRxksTgYoaV3QQFE4tYLxmp9WP8B5grNlOG0+BbaUPQYa10MhZ6Jm/y0DpySra7QTyNsHnHgvgdXFMYrQEEvTvwyTgXjyCTtvyg6lR7E5hkrOZrQVE5RsZdJafVb5GQt26xIYPsktXqKPEzmL08a9bJnDBRFc7BJxkQPWk+aPid8WaZTV7IAgkKLb8hfVPyXzCX6HBKPa4AURY6+/AbQmtG73dPwFl2eR6szjfSQIJANsgnuT354G8/EGXGbtO5udZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 17:16:31.5527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dcaee2c-8c06-42f5-afe3-08de88ffed89
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7781
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Mar 2026 17:16:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17422

On Sun Mar 22, 2026 at 2:26 PM CDT, Denys Dmytriyenko wrote:
> On Fri, Mar 20, 2026 at 05:22:30PM -0500, Randolph Sapp via lists.yoctopr=
oject.org wrote:
>> On Fri Mar 20, 2026 at 5:14 PM CDT, Ryan Eatmon via lists.yoctoproject.o=
rg wrote:
>> > Clean up a check layer error related to how this recipe was setup.
>> >
>> > Change the recipe to a bbappend instead of a new git version.  Apply a=
ll
>> > of the changes that were made in the new recipe to the bbappend, and
>> > remove the PREFERRED_VERSION in arago-prefs.inc.
>> >
>> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> > ---
>> >  .../conf/distro/include/arago-prefs.inc       |  3 --
>> >  .../mesa/mesa-demos-arago.inc                 | 17 ++++++++
>> >  .../mesa/mesa-demos_9.0.0.bbappend            |  4 ++
>> >  .../recipes-graphics/mesa/mesa-demos_git.bb   | 42 ------------------=
-
>> >  4 files changed, 21 insertions(+), 45 deletions(-)
>> >  create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos=
-arago.inc
>> >  create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos=
_9.0.0.bbappend
>> >  delete mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos=
_git.bb
>> >
>> > diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/m=
eta-arago-distro/conf/distro/include/arago-prefs.inc
>> > index 4d1a6006..6a2faa53 100644
>> > --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> > +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> > @@ -10,6 +10,3 @@ VIRTUAL-RUNTIME_dbus =3D "dbus-broker"
>> >  # application that does not have a GPLv3 license
>> >  PREFERRED_VERSION_crda =3D "3.18"
>> >  PREFERRED_VERSION_obex =3D "0.34"
>> > -
>> > -# Bump mesa-demos to include some patches not in a tagged release
>> > -PREFERRED_VERSION_mesa-demos =3D "9.0.0+git"
>> > diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.=
inc b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
>> > new file mode 100644
>> > index 00000000..5a5412c2
>> > --- /dev/null
>> > +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
>> > @@ -0,0 +1,17 @@
>> > +SECTION =3D ""
>> > +
>> > +LIC_FILES_CHKSUM:remove =3D "file://src/xdemos/glxgears.c;beginline=
=3D1;endline=3D20;md5=3D914225785450eff644a86c871d3ae00e"
>> > +
>> > +LIC_FILES_CHKSUM:append =3D " file://src/xdemos/glxgears.c;beginline=
=3D1;endline=3D20;md5=3Da481fbdb2ac800ecb12405c33bcfacae"
>> > +
>> > +SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dh=
ttps;branch=3Dmain"
>> > +SRCREV =3D "02eae079cb0b8186064d5b194ca4cc2995f099ee"
>> > +
>> > +PV =3D "9.0.0+git"
>> > +
>> > +REQUIRED_DISTRO_FEATURES:remove =3D "x11"
>> > +
>> > +PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', =
d)}"
>> > +
>> > +PACKAGECONFIG[glut] =3D "-Dwith-glut=3D${STAGING_EXECPREFIXDIR},-Dglu=
t=3Ddisabled,freeglut"
>> > +PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Denabled,-Dosmesa=3Ddisabled,"
>> > diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.=
bbappend b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappen=
d
>> > new file mode 100644
>> > index 00000000..3b26e342
>> > --- /dev/null
>> > +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappen=
d
>> > @@ -0,0 +1,4 @@
>> > +MESA_DEMOS_ARAGO =3D ""
>> > +MESA_DEMOS_ARAGO:arago =3D "mesa-demos-arago.inc"
>> > +
>> > +require ${MESA_DEMOS_ARAGO}
>> > diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb=
 b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>> > deleted file mode 100644
>> > index 2da3ceff..00000000
>> > --- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>> > +++ /dev/null
>> > @@ -1,42 +0,0 @@
>> > -SUMMARY =3D "Mesa demo applications"
>> > -DESCRIPTION =3D "This package includes the demonstration application,=
 such as glxgears. \
>> > -These applications can be used for Mesa validation and benchmarking."
>> > -HOMEPAGE =3D "http://mesa3d.org"
>> > -BUGTRACKER =3D "https://bugs.freedesktop.org"
>> > -
>> > -LICENSE =3D "MIT & PD"
>> > -LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;beginline=3D1;endl=
ine=3D20;md5=3Da481fbdb2ac800ecb12405c33bcfacae \
>> > -                    file://src/xdemos/glxdemo.c;beginline=3D1;endline=
=3D8;md5=3Db01d5ab1aee94d35b7efaa2ef48e1a06"
>> > -
>> > -SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dh=
ttps;branch=3Dmain"
>> > -SRCREV =3D "02eae079cb0b8186064d5b194ca4cc2995f099ee"
>> > -
>> > -DEFAULT_PREFERENCE =3D "-1"
>> > -PV =3D "9.0.0+git"
>> > -
>> > -inherit meson pkgconfig features_check
>> > -REQUIRED_DISTRO_FEATURES =3D "opengl"
>> > -
>> > -EXTRA_OEMESON =3D "-Dwith-system-data-files=3Dtrue"
>> > -
>> > -PACKAGECONFIG ?=3D "drm egl gles1 gles2 \
>> > -                  ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan x11 w=
ayland', d)}"
>> > -
>> > -PACKAGECONFIG[drm] =3D "-Dlibdrm=3Denabled,-Dlibdrm=3Ddisabled,libdrm=
"
>> > -PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl=3Ddisabled,virtual/egl"
>> > -PACKAGECONFIG[gles1] =3D "-Dgles1=3Denabled,-Dgles1=3Ddisabled,virtua=
l/libgles1"
>> > -PACKAGECONFIG[gles2] =3D "-Dgles2=3Denabled,-Dgles2=3Ddisabled,virtua=
l/libgles2"
>> > -PACKAGECONFIG[glut] =3D "-Dwith-glut=3D${STAGING_EXECPREFIXDIR},-Dglu=
t=3Ddisabled,freeglut"
>> > -PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Denabled,-Dosmesa=3Ddisabled,"
>> > -PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vul=
kan-loader glslang-native"
>> > -PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,=
virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdeco=
r"
>> > -PACKAGECONFIG[x11] =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,virtual/libx=
11 libglu libxkbcommon libxcb"
>> > -
>> > -do_install:append() {
>> > -	# it can be completely empty when all PACKAGECONFIG options are disa=
bled
>> > -	rmdir --ignore-fail-on-non-empty ${D}${bindir}
>> > -
>> > -	if [ -f ${D}${bindir}/clear ]; then
>> > -		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
>> > -	fi
>> > -}
>>=20
>> I still hate that layer conformance thinks this is the correct way to do=
 what is
>> essentially adding a new *optional* package version. Feels really backwa=
rds and
>> gross, but I'm already picking other fights right now.
>
> In order for a new version of a recipe to be *optional*, it should not be=
=20
> selected by bitbake by default.
>
> There are 2 ways to do this (besides making a bbappend):
>
> 1. Use the same name, but lower the default preference DEFAULT_PREFERENCE=
=3D"-1"=20
> and still able to select it with PREFERRED_VERSION_mesa-demos=3D"9.0.0+gi=
t"

Yeah, I did that. You can see it in the patch above, being removed. The
conformance still thinks it's wrong.

> 2. Use a different name e.g. mesa-demos-arago and set PROVIDES=3D"mesa-de=
mos" -=20
> allows selecting it with PREFERRED_PROVIDER_mesa-demos=3D"mesa-demos-arag=
o"

