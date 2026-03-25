Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFBF109C02F
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 15:32:38 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25203.1774452756040905573
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 08:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=PqECOH6G;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.46, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVyaZSRYM4tHGLjhArhGp3q1vjAgqFyYLDnE67kaQxvnfpP59KJ+J8JDU6m2SWm0bFJslfBT+Sek03ZsqaDz5buPVmmvnd+eM1WFOu0AgH00N6xjOis63YAlPrJwUiypolfm09wooz5ZrG2pw0L5QAxZVNh2qPC5GqzrFrnStqDyQ6G73iSAQX48nWnCjXj3FGx8I+fOF2L0lnZg1rNegIwtXyNKhfpJFr9sM3JDnmzQK4c0NRj43BrKsc69lgF2X14YiQs+iNsujprcCVIBS/Nm5oCnTPe5R9+sws3+/Ewx46A2kvZ+/Fe829fEGFkSkWItdOHVqVsDBArtF4jqSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvn7tFvu+Xbe6Se3JUpxQ6/GN+V5BW4hKdSuhWYWdEo=;
 b=Q8zzgFpG+yiSaPj8NnIvR0WjkHiFGNrB/n5ZXgb8IOU3oqwNmJaRVbPXK/eOjdSdEycZfVFlCEor7hQ6YoFAylRtioFOYojKCGb4iYXJ8pgT17XEZs7ILzGorvMKR55yVC+4+Y3HYxI0htv/VaQyqtMVToBw2EviE6eugGsIbIHWQCttXT+GChRCWcA7MyKo8N4ZbhGbb7P7czlt9AVSmkZbwsNwAN28SNvwugr2LjK/9pgyXQgs/C2aXJweolIE++fkdf8VUNVB78koMK3lhPYK4iIM8igKqxprH7POnVodvOnhhvpxVBLumJDhezBaOIA0HsDI4Jb6FJ8LxFsAFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvn7tFvu+Xbe6Se3JUpxQ6/GN+V5BW4hKdSuhWYWdEo=;
 b=PqECOH6GNkMCwH8/8AMSeLfzOFy7Sq3yE8rmP/Koc8e5UH4RHk4iQqpDq2CEFUJg91l0Nh35nn99wfd+MDw5bwzXaoqQ/kVyXoEuUdyN2OT8f2wP0wBO7r56tX2wRlgWJr4UoQVVH6A4Y2sRdMX0Q08/E48XeM2aPXbj8aVNT/8=
Received: from BL1PR13CA0250.namprd13.prod.outlook.com (2603:10b6:208:2ba::15)
 by IA4PR10MB8753.namprd10.prod.outlook.com (2603:10b6:208:55c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:32:33 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::6f) by BL1PR13CA0250.outlook.office365.com
 (2603:10b6:208:2ba::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Wed,
 25 Mar 2026 15:32:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 15:32:33 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 10:32:33 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 10:32:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 10:32:32 -0500
Received: from [10.249.32.33] ([10.249.32.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62PFWW2v055758;
	Wed, 25 Mar 2026 10:32:32 -0500
Message-ID: <0c96914b-77a2-4dfa-b208-85e37ee33c2e@ti.com>
Date: Wed, 25 Mar 2026 10:32:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH 3/4] mesa-demos: Flip to a bbappend
To: Denys Dmytriyenko <denis@denix.org>, Randolph Sapp <rs@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
References: <20260320221404.3991734-1-reatmon@ti.com>
 <20260320221404.3991734-3-reatmon@ti.com> <DH7YLAZ0Q5JO.3DMH78OR4C8Y2@ti.com>
 <20260322192633.GS11121@denix.org> <DHABYNK6UHI3.38G28NSA7DBOQ@ti.com>
 <189FA0BA138E397B.1003@lists.yoctoproject.org>
 <20260324181432.GV11121@denix.org>
 <189FD9F3C6CA2766.55659@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <189FD9F3C6CA2766.55659@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|IA4PR10MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a37a46-5b43-4fef-2427-08de8a83bc28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	0Q3svEltMLP4Uq80iWxx/gnJeKOe3Qg0BA8XpSc4aIsG2HcaW3GOqsNq0sgdak0Z9XTe2IVFjUdn+QotWE8TH4pQqZWdI74B3TkP8bcIID7pHwkwkJmFIzqWWAhNuuiz9dhMBQog7Tl4MBjMovYtRggkb9H40olhFikScHrsrIJ9bXNAPxFda1Me7jnPbvZ2ZgPRM+s3KNwT5XwwYtczceKF4VW3ba841CgiMrQ/ftm8bWPZ9fgsaom6QKwqzTFgsNhml1pfEFjOVgQ3mDYESU1Hcq8ZImdsTgC23OVLIvn/CCg3smpCknY5Qy7K1LCZOwWYwpYXZOgSf8MtCWNwg8cN9mcdDk8A1O7fbxMg/0Bdzfr+ldBvuu+rR80o+97HjVkgPgeVeQuZ561Dy1G5hgmO76QNPSMAtCUyF02Xxco725sRTVJG1bi9ExPny5CJD8S07TEoCH0tuu1c6ZlRIhZyhs+i5qSuQjV6/IkttbSqO1KbNngL7tujYAb0tEsqOnJg2GCTZK8D/TDstbRnD2Czg2ZaiYRrFmEyKpUe+uu4ehzVzPPYvfXjt6ilnENL8JuqUG8NoSjR81YiB2hsTiLlsDL89nNpyKlpv0yDKCWpNMNP6ofA3qJdn3Qy8G8Y1GH0pHl9r5XN2ccpQsTtwcZ8sxuCqkA6NV/lA1zzqGSqpwES+k4ZXRb63RYRzcqlFudxlFctNNCrMjmkomZFmw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eR6OZt4zg175jIkK0yitMuj2iz6p099It9EpGnNshRjWdjW81grkDxJN7c7BnRcWsBjzzJRopE1KfGkvvepP4tqZJlPIEC2M4DNkAWwgg5Fuu1jUwKU4jvWX+I9t4DJUO1mebp+nqL7dRNtXUFZcnVPCDE02fVnAZOCSShxwbT0yzFodzOt2Z/q40HdcSlE/skYNBYdnpwdiZtqjF1qO76Hv4THKIbZ8GAexd8JwRcXh/25S7RDjeDf31yeGjo+6W+zy28r3sY1QR9YJBeYy6ACn/IMOZinzht8c3NZUloBcgVX/7/chBB9Z1AqmI93wJO/YG8u7IbVVW3EsfPZqP3S3I82oqhBvblrp1ZO3osLuHbYoiOHsDHkV0loMRspJ6yJYcmC8+MojtBG3g1GJmfzPfciBK7wtbi0CATtcaCsMSgCxTvruP2nHgU5bd6yB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:32:33.4154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a37a46-5b43-4fef-2427-08de8a83bc28
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8753
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Mar 2026 15:32:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17438



On 3/24/2026 1:20 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 3/24/2026 1:14 PM, Denys Dmytriyenko wrote:
>> On Mon, Mar 23, 2026 at 08:51:31PM -0400, Denys Dmytriyenko wrote:
>>> On Mon, Mar 23, 2026 at 12:16:30PM -0500, Randolph Sapp wrote:
>>>> On Sun Mar 22, 2026 at 2:26 PM CDT, Denys Dmytriyenko wrote:
>>>>> On Fri, Mar 20, 2026 at 05:22:30PM -0500, Randolph Sapp via=20
>>>>> lists.yoctoproject.org wrote:
>>>>>> On Fri Mar 20, 2026 at 5:14 PM CDT, Ryan Eatmon via=20
>>>>>> lists.yoctoproject.org wrote:
>>>>>>> Clean up a check layer error related to how this recipe was setup.
>>>>>>>
>>>>>>> Change the recipe to a bbappend instead of a new git version. =20
>>>>>>> Apply all
>>>>>>> of the changes that were made in the new recipe to the bbappend, an=
d
>>>>>>> remove the PREFERRED_VERSION in arago-prefs.inc.
>>>>>>>
>>>>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>>>>> ---
>>>>>>> =C2=A0 .../conf/distro/include/arago-prefs.inc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 3 --
>>>>>>> =C2=A0 .../mesa/mesa-demos-arago.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++=
+++++
>>>>>>> =C2=A0 .../mesa/mesa-demos_9.0.0.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++
>>>>>>> =C2=A0 .../recipes-graphics/mesa/mesa-demos_git.bb=C2=A0=C2=A0 | 42=
=20
>>>>>>> -------------------
>>>>>>> =C2=A0 4 files changed, 21 insertions(+), 45 deletions(-)
>>>>>>> =C2=A0 create mode 100644=20
>>>>>>> meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
>>>>>>> =C2=A0 create mode 100644=20
>>>>>>> meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend
>>>>>>> =C2=A0 delete mode 100644=20
>>>>>>> meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>>>>>>>
>>>>>>> diff --git=20
>>>>>>> a/meta-arago-distro/conf/distro/include/arago-prefs.inc=20
>>>>>>> b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>>>>>>> index 4d1a6006..6a2faa53 100644
>>>>>>> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>>>>>>> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>>>>>>> @@ -10,6 +10,3 @@ VIRTUAL-RUNTIME_dbus =3D "dbus-broker"
>>>>>>> =C2=A0 # application that does not have a GPLv3 license
>>>>>>> =C2=A0 PREFERRED_VERSION_crda =3D "3.18"
>>>>>>> =C2=A0 PREFERRED_VERSION_obex =3D "0.34"
>>>>>>> -
>>>>>>> -# Bump mesa-demos to include some patches not in a tagged release
>>>>>>> -PREFERRED_VERSION_mesa-demos =3D "9.0.0+git"
>>>>>>> diff --git=20
>>>>>>> a/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc=20
>>>>>>> b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
>>>>>>> new file mode 100644
>>>>>>> index 00000000..5a5412c2
>>>>>>> --- /dev/null
>>>>>>> +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
>>>>>>> @@ -0,0 +1,17 @@
>>>>>>> +SECTION =3D ""
>>>>>>> +
>>>>>>> +LIC_FILES_CHKSUM:remove =3D=20
>>>>>>> "file://src/xdemos/glxgears.c;beginline=3D1;endline=3D20;md5=3D9142=
25785450eff644a86c871d3ae00e"
>>>>>>> +
>>>>>>> +LIC_FILES_CHKSUM:append =3D "=20
>>>>>>> file://src/xdemos/glxgears.c;beginline=3D1;endline=3D20;md5=3Da481f=
bdb2ac800ecb12405c33bcfacae"
>>>>>>> +
>>>>>>> +SRC_URI =3D=20
>>>>>>> "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhttps;branc=
h=3Dmain"
>>>>>>> +SRCREV =3D "02eae079cb0b8186064d5b194ca4cc2995f099ee"
>>>>>>> +
>>>>>>> +PV =3D "9.0.0+git"
>>>>>>> +
>>>>>>> +REQUIRED_DISTRO_FEATURES:remove =3D "x11"
>>>>>>> +
>>>>>>> +PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES',=20
>>>>>>> 'wayland', d)}"
>>>>>>> +
>>>>>>> +PACKAGECONFIG[glut] =3D=20
>>>>>>> "-Dwith-glut=3D${STAGING_EXECPREFIXDIR},-Dglut=3Ddisabled,freeglut"
>>>>>>> +PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Denabled,-Dosmesa=3Ddisabled,=
"
>>>>>>> diff --git=20
>>>>>>> a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend=
 b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend
>>>>>>> new file mode 100644
>>>>>>> index 00000000..3b26e342
>>>>>>> --- /dev/null
>>>>>>> +++=20
>>>>>>> b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend
>>>>>>> @@ -0,0 +1,4 @@
>>>>>>> +MESA_DEMOS_ARAGO =3D ""
>>>>>>> +MESA_DEMOS_ARAGO:arago =3D "mesa-demos-arago.inc"
>>>>>>> +
>>>>>>> +require ${MESA_DEMOS_ARAGO}
>>>>>>> diff --git=20
>>>>>>> a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb=20
>>>>>>> b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>>>>>>> deleted file mode 100644
>>>>>>> index 2da3ceff..00000000
>>>>>>> --- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>>>>>>> +++ /dev/null
>>>>>>> @@ -1,42 +0,0 @@
>>>>>>> -SUMMARY =3D "Mesa demo applications"
>>>>>>> -DESCRIPTION =3D "This package includes the demonstration=20
>>>>>>> application, such as glxgears. \
>>>>>>> -These applications can be used for Mesa validation and=20
>>>>>>> benchmarking."
>>>>>>> -HOMEPAGE =3D "http://mesa3d.org"
>>>>>>> -BUGTRACKER =3D "https://bugs.freedesktop.org"
>>>>>>> -
>>>>>>> -LICENSE =3D "MIT & PD"
>>>>>>> -LIC_FILES_CHKSUM =3D=20
>>>>>>> "file://src/xdemos/glxgears.c;beginline=3D1;endline=3D20;md5=3Da481=
fbdb2ac800ecb12405c33bcfacae \
>>>>>>> -                   =20
>>>>>>> file://src/xdemos/glxdemo.c;beginline=3D1;endline=3D8;md5=3Db01d5ab=
1aee94d35b7efaa2ef48e1a06"
>>>>>>> -
>>>>>>> -SRC_URI =3D=20
>>>>>>> "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhttps;branc=
h=3Dmain"
>>>>>>> -SRCREV =3D "02eae079cb0b8186064d5b194ca4cc2995f099ee"
>>>>>>> -
>>>>>>> -DEFAULT_PREFERENCE =3D "-1"
>>>>>>> -PV =3D "9.0.0+git"
>>>>>>> -
>>>>>>> -inherit meson pkgconfig features_check
>>>>>>> -REQUIRED_DISTRO_FEATURES =3D "opengl"
>>>>>>> -
>>>>>>> -EXTRA_OEMESON =3D "-Dwith-system-data-files=3Dtrue"
>>>>>>> -
>>>>>>> -PACKAGECONFIG ?=3D "drm egl gles1 gles2 \
>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', =
'vulkan=20
>>>>>>> x11 wayland', d)}"
>>>>>>> -
>>>>>>> -PACKAGECONFIG[drm] =3D "-Dlibdrm=3Denabled,-Dlibdrm=3Ddisabled,lib=
drm"
>>>>>>> -PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl=3Ddisabled,virtual/e=
gl"
>>>>>>> -PACKAGECONFIG[gles1] =3D=20
>>>>>>> "-Dgles1=3Denabled,-Dgles1=3Ddisabled,virtual/libgles1"
>>>>>>> -PACKAGECONFIG[gles2] =3D=20
>>>>>>> "-Dgles2=3Denabled,-Dgles2=3Ddisabled,virtual/libgles2"
>>>>>>> -PACKAGECONFIG[glut] =3D=20
>>>>>>> "-Dwith-glut=3D${STAGING_EXECPREFIXDIR},-Dglut=3Ddisabled,freeglut"
>>>>>>> -PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Denabled,-Dosmesa=3Ddisabled,=
"
>>>>>>> -PACKAGECONFIG[vulkan] =3D=20
>>>>>>> "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan-loader glslang-nativ=
e"
>>>>>>> -PACKAGECONFIG[wayland] =3D=20
>>>>>>> "-Dwayland=3Denabled,-Dwayland=3Ddisabled,virtual/libgl wayland=20
>>>>>>> wayland-native wayland-protocols libxkbcommon libdecor"
>>>>>>> -PACKAGECONFIG[x11] =3D=20
>>>>>>> "-Dx11=3Denabled,-Dx11=3Ddisabled,virtual/libx11 libglu libxkbcommo=
n=20
>>>>>>> libxcb"
>>>>>>> -
>>>>>>> -do_install:append() {
>>>>>>> -=C2=A0=C2=A0=C2=A0 # it can be completely empty when all PACKAGECO=
NFIG options=20
>>>>>>> are disabled
>>>>>>> -=C2=A0=C2=A0=C2=A0 rmdir --ignore-fail-on-non-empty ${D}${bindir}
>>>>>>> -
>>>>>>> -=C2=A0=C2=A0=C2=A0 if [ -f ${D}${bindir}/clear ]; then
>>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv ${D}${bindir}/clear =
${D}${bindir}/clear.mesa-demos
>>>>>>> -=C2=A0=C2=A0=C2=A0 fi
>>>>>>> -}
>>>>>>
>>>>>> I still hate that layer conformance thinks this is the correct way=20
>>>>>> to do what is
>>>>>> essentially adding a new *optional* package version. Feels really=20
>>>>>> backwards and
>>>>>> gross, but I'm already picking other fights right now.
>>>>>
>>>>> In order for a new version of a recipe to be *optional*, it should=20
>>>>> not be
>>>>> selected by bitbake by default.
>>>>>
>>>>> There are 2 ways to do this (besides making a bbappend):
>>>>>
>>>>> 1. Use the same name, but lower the default preference=20
>>>>> DEFAULT_PREFERENCE=3D"-1"
>>>>> and still able to select it with=20
>>>>> PREFERRED_VERSION_mesa-demos=3D"9.0.0+git"
>>>>
>>>> Yeah, I did that. You can see it in the patch above, being removed. Th=
e
>>>> conformance still thinks it's wrong.
>>>
>>> Ah, indeed, missed that.
>>>
>>> Still not sure why the yocto-check-layer fails for this case...
>>
>> FTR, in our discussions during early days of YP Compat and=20
>> yocto-check-layer
>> several years ago, this was one of the correct methods to deal with=20
>> multiple
>> versions - see the comments here:
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12688
>>
>> Do you have the exact error message that the tool now prints?
>=20
> Of course not.=C2=A0 I was just fixing the issue not documenting things. =
I'll=20
> have to revert the patch to get the message.=C2=A0 I'll try and do that=20
> sometime this week... if I can remember to...


INFO: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
INFO: FAIL: test_signatures (common.CommonCheckLayer.test_signatures)
INFO: ---------------------------------------------------------------------=
-
INFO: Traceback (most recent call last):
   File=20
"/scratch/builds/check-layer/check-layer-meta-arago-master-wip/ypcompat/bui=
ld/sources/oe-core/scripts/lib/checklayer/cases/common.py",=20
line 141, in test_signatures
     self.fail('Adding layer %s changed signatures.\n%s' %=20
(self.tc.layer['name'], msg))
AssertionError: Adding layer meta-arago-distro changed signatures.
29 signatures changed, initial differences (first hash before, second=20
after):
    mesa-demos:do_create_recipe_spdx:=20
fdfa5e3d9511bd54a5acc78263febea675fa0c8a2008acf3cfa30ec4e2f8a5a1 ->=20
8edf52b9c5a6900ec8145520c5669c21acaf8d19a8a0fa1cfa8053d37bee568c
       bitbake-diffsigs --task mesa-demos do_create_recipe_spdx=20
--signature=20
fdfa5e3d9511bd54a5acc78263febea675fa0c8a2008acf3cfa30ec4e2f8a5a1=20
8edf52b9c5a6900ec8145520c5669c21acaf8d19a8a0fa1cfa8053d37bee568c
       NOTE: Reconnecting to bitbake server...
       basehash changed from=20
0ffaa6b8739b033ea2ced33806a84321f22cd2b545941a995e45c20e25d3ac83 to=20
7f97e74de56a366492f9e28738528bb75cb27a658d2f3e0a55d843ea35bf8bfb
       Variable FILE_LAYERNAME value changed from 'core' to=20
'meta-arago-distro'
       Variable PV value changed from '9.0.0' to '9.0.0+git'
       runtaskdeps changed:
       ['gcc-cross-x86_64:do_create_recipe_spdx=20
gcc-runtime:do_create_recipe_spdx glibc:do_create_recipe_spdx=20
glslang-native:do_create_recipe_spdx', +libdecor:do_create_recipe_spdx,=20
'libdrm:do_create_recipe_spdx libglu:do_create_recipe_spdx=20
libx11:do_create_recipe_spdx libxcb:do_create_recipe_spdx=20
libxkbcommon:do_create_recipe_spdx mesa:do_create_recipe_spdx=20
meson-native:do_create_recipe_spdx ninja-native:do_create_recipe_spdx=20
pkgconf-native:do_create_recipe_spdx=20
python3-native:do_create_recipe_spdx qemu-native:do_create_recipe_spdx=20
vulkan-loader:do_create_recipe_spdx',=20
+wayland-native:do_create_recipe_spdx=20
wayland-protocols:do_create_recipe_spdx wayland:do_create_recipe_spdx]
       Number of task dependencies changed
       Dependency on task libdecor:do_create_recipe_spdx was added with=20
hash d0ae5f314e39c6759b1251b19ee60fed31cb596ed74db4c2af1bf9c81120ca71
       Dependency on task wayland-native:do_create_recipe_spdx was added=20
with hash 2fcdc48b49b216a7ca88d77c47fdfc2fced6fd430cbd56bf3c3f40c653b3bf5d
       Dependency on task wayland-protocols:do_create_recipe_spdx was=20
added with hash=20
9a61f0be609311e41c15076efa091042796ff578c07eb574639515b57ad99c43
       Dependency on task wayland:do_create_recipe_spdx was added with=20
hash f93d7441a54a3996ec8f51403ffbdfafdacae6748ab40267eaa86a84d2602137

    mesa-demos:do_recipe_qa:=20
fdb65811eccad14710d68baedd228db109d29a414864839cb980b24a31f23cef ->=20
3e2485f2d58b88827b96212eb4ae8f3c71cab6a96180855597ac5107ce9ab30b
       bitbake-diffsigs --task mesa-demos do_recipe_qa --signature=20
fdb65811eccad14710d68baedd228db109d29a414864839cb980b24a31f23cef=20
3e2485f2d58b88827b96212eb4ae8f3c71cab6a96180855597ac5107ce9ab30b
       NOTE: Reconnecting to bitbake server...
       Task dependencies changed from:
       ['BPN', 'HOMEPAGE', 'INSANE_SKIP', 'MLPREFIX', 'OE_SHARED_UMASK',=20
'PN', 'PR', 'PV', 'QA_ERRORS_FOUND', 'RECIPE_MAINTAINER',=20
'SPECIAL_PKGSUFFIX', 'SRC_URI', 'SRC_URI[sha256sum]',=20
'SSTATECREATEFUNCS', 'SSTATEPOSTCREATEFUNCS', 'SSTATEPOSTUNPACKFUNCS',=20
'SSTATE_BUILDDIR', 'SSTATE_INSTDIR', 'SSTATE_MANIFESTS',=20
'SSTATE_SCAN_FILES', 'SSTATE_SKIP_CREATION', 'SUMMARY',=20
'do_recipe_qa[network]', 'do_recipe_qa[sstate-inputdirs]',=20
'oe.path.copyhardlinktree', 'oe.path.copytree', 'oe.path.remove',=20
'oe.qa.exit_if_errors', 'oe.qa.exit_with_message_if_errors',=20
'oe.sstatesig.sstate_get_manifest_filename', 'oe.utils.prune_suffix',=20
'sstate_add', 'sstate_clean', 'sstate_clean_manifest', 'sstate_init',=20
'sstate_install', 'sstate_installpkgdir', 'sstate_package',=20
'sstate_state_fromvars', 'sstate_task_postfunc', 'sstate_task_prefunc']
       to:
       ['HOMEPAGE', 'INSANE_SKIP', 'OE_SHARED_UMASK', 'PN', 'PR', 'PV',=20
'QA_ERRORS_FOUND', 'RECIPE_MAINTAINER', 'SRC_URI', 'SSTATECREATEFUNCS',=20
'SSTATEPOSTCREATEFUNCS', 'SSTATEPOSTUNPACKFUNCS', 'SSTATE_BUILDDIR',=20
'SSTATE_INSTDIR', 'SSTATE_MANIFESTS', 'SSTATE_SCAN_FILES',=20
'SSTATE_SKIP_CREATION', 'SUMMARY', 'do_recipe_qa[network]',=20
'do_recipe_qa[sstate-inputdirs]', 'oe.path.copyhardlinktree',=20
'oe.path.copytree', 'oe.path.remove', 'oe.qa.exit_if_errors',=20
'oe.qa.exit_with_message_if_errors',=20
'oe.sstatesig.sstate_get_manifest_filename', 'sstate_add',=20
'sstate_clean', 'sstate_clean_manifest', 'sstate_init',=20
'sstate_install', 'sstate_installpkgdir', 'sstate_package',=20
'sstate_state_fromvars', 'sstate_task_postfunc', 'sstate_task_prefunc']
       basehash changed from=20
f3c45b3c71fdb2e78bea3799d710ff4dc34bc08debc780666a13aae14dc3929b to=20
62f19e76a9f74c8a8a8467e3cb7f322f7c3accd60a3d56bfa412a438aa00b5bb
       List of dependencies for variable SRC_URI changed from=20
'frozenset({'BPN', 'PV', 'SRC_URI[sha256sum]'})' to 'frozenset()'
       Dependency on Variable BPN was removed
       Dependency on Variable MLPREFIX was removed
       Dependency on Variable SPECIAL_PKGSUFFIX was removed
       Dependency on Variable SRC_URI[sha256sum] was removed
       Dependency on Variable oe.utils.prune_suffix was removed
       Variable PV value changed from '9.0.0' to '9.0.0+git'
       Variable SRC_URI value changed:
       "[-https://archive.mesa3d.org/demos/${BPN}-${PV}.tar.xz=20
  file://0001-meson-fix-glx-detection-without-glvnd.patch            -]=20
{+git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhttps;branch=3Dmai=
n+}"

    mesa-demos:do_write_config:=20
74d083f3c31a70739bd6dc4c614b966960da100230c569a6ed4b20a9ce6d9d48 ->=20
9b254ca132ba955b0a0fa5bc1a05608cbd6f91fe7f39e8f359773e443f4ad001
       bitbake-diffsigs --task mesa-demos do_write_config --signature=20
74d083f3c31a70739bd6dc4c614b966960da100230c569a6ed4b20a9ce6d9d48=20
9b254ca132ba955b0a0fa5bc1a05608cbd6f91fe7f39e8f359773e443f4ad001
       NOTE: Reconnecting to bitbake server...
       basehash changed from=20
d06bb5d1e0378df4aef1951edc4d39162f54204b9b371a2849b1bd8814260f70 to=20
82023e545f66d6c0bd6d4af9c64f8234be828d1121aaf8183285cd8098584fa3
       Variable PV value changed from '9.0.0' to '9.0.0+git'


That's the errors.  Basically, the tool does not like having two recipes=20
for the same package.








>=20
>>
>>>>> 2. Use a different name e.g. mesa-demos-arago and set=20
>>>>> PROVIDES=3D"mesa-demos" -
>>>>> allows selecting it with=20
>>>>> PREFERRED_PROVIDER_mesa-demos=3D"mesa-demos-arago"
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

