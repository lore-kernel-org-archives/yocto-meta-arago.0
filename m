Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5290FEC0F0
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 18:20:25 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4145.1774376418455042551
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 11:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ISZu33rE;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.25, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PlXnPBC3fqv2h06LOlE2kwuxbAdVvCgYL1S7Qgs0AgheU83f4Lrk0XHtY6hNq1Uca2P7LZA8obaXrZFnRceLIdTzRglF7j0Bmw91tZREDLt4LwP2p+/3XnHAIkMsp+aiVcp+WYjzf6XBQxJA8PYGrDe3aVWsU+TvCJeYW78zVxjBwS1BMa5jt0r/Z2dzU/3sIoEvdY7Vs3PGw8FkgreTSeJoDxiO1FQx0pTlagwIzEbZSMfY1h7jim5veSjVIuxdVBf54tv1aaYB1CwrnEcQKT1u5spGZOis9q229huiXYclxdRuZFcKKiDe1EbsBYmu9ndjnPS5a9N9HSFjEpHu3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sngO5PNhl67yVNnXEJu1xRcSB/r3Y4nnv0izL5ZPcU=;
 b=dae8dDHd7AFwCGShQHW+M86sls7vUtQaEsYyIguGzKB6+xalMVwSNLVuhCNJyHgGlSSUbG/VnbSnruzfZVQ6z81qcHX/RarqRxxlBRA40TjfzkCHEgjh56O0gm9WyXEnADEZv/VlUIE378i0NU9ysWdWODl2dpUWSNoTCF/6YutTbPBeaqIDqRs0O5WJXwVQY7c31jkA9dPdGsTy0bKY8TPXBkpe0drVhfI0nf0cKzUeSk8GZwxJnIT+bbOwtWmRvMlAoPZ+cznO2DMQKL8wpma/2H5+khk1dWc4B7yU0fAG6/TwMqgyaZsi2ESfHeBs3J8xtDNs4J/T7PblGdfrvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sngO5PNhl67yVNnXEJu1xRcSB/r3Y4nnv0izL5ZPcU=;
 b=ISZu33rET5N+4v1tBfPrXx+o/KIvxOYpWjREcNfYE8USQHPjr3b4HFQUkIIF8R91YuOqxZmmKPHpBbtF7C9kmvbwu19bVuZLx/TmlEuz5GxAYehAZ4n8uvjv/7ehgXJVk7HGxAoJjZ8LNE6hHmGYVOgUlGQaLZvp6OZIAMlKhZs=
Received: from MN2PR08CA0007.namprd08.prod.outlook.com (2603:10b6:208:239::12)
 by CO1PR10MB4596.namprd10.prod.outlook.com (2603:10b6:303:6f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 24 Mar
 2026 18:20:14 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:208:239:cafe::79) by MN2PR08CA0007.outlook.office365.com
 (2603:10b6:208:239::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 18:20:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 18:20:11 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 13:20:06 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 13:20:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 13:20:06 -0500
Received: from [10.249.32.33] ([10.249.32.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OIK6j53091557;
	Tue, 24 Mar 2026 13:20:06 -0500
Message-ID: <30965aea-5c51-41ee-b990-e856319aff90@ti.com>
Date: Tue, 24 Mar 2026 13:20:06 -0500
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
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260324181432.GV11121@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|CO1PR10MB4596:EE_
X-MS-Office365-Filtering-Correlation-Id: dd9b3a41-645f-4aa8-709f-08de89d1fcf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	WwnXtELYeDeMrq4IsVa3t4AUfduvvblcejstvF6Vne3AoFwkKl5hw+vbqkqauFNZ1malz2WbyQvrXJcw3nVwOOjSXfPXVJCtNfwFBgUyrl9lEOOZJwCyM9d98cWunx1bLgqXUiCjqE/CwGjbp5r63EngXO/YrStcx3rGQjzgU9v+v3fQDU6/vG8qQ2bWUkKQUfRc6mmGhDWRxsHs3rcPqRhavRBV6ed/qOXghouTXnydOOWG7x+NFDYKXktr/oUBQpOqmYrvTspVZkaiVH9LSmlFHsKn9Iz3tZkohjXD21J6rRu8Hs6ZP2SCcb+/fUmyLShCmtq0pJSI4AyBJ50Z9MZspPHzgobl8QVURbKHBe6K74Rikel9eh3tQnmXaR9z3hivMpjvTgv6WihNJvM5DG721LN+c/hHSVI/lCnVAJ8s3pMPvmjxB6PctIFTqKDex+Io7BdJe/wxbg5ZKJDsCt52ppndnBYjTFeroFcC0MUua0h3D+igB5GIKF9M6DZW7HBYiKqmlfwCTXWUW0UkpnzgE7THjqJt+590Ubuz6ghg2bHHQXvp4nYjqP0tjAAkLd57Bh2/CUWojCzqSnpmvajTDbGcdcYedC/+Bbov3elbF7+zhEIjYSPXSE1dwoMouhb+u38i8fRg7dC/JcHR8siSUz7E6bszSbOJa7M3zdCgOK+Sq7h/upMfgQwac/Wl/1chO+nAGacinWg5n7xmrg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7Usv/qfYjEUDnK0jcIt7RwlWwM480HGDoUclqiG2LWKPAAYgtWD2I4nNNzRZ6LAL7YFH8SF6iUM8TmxN5Ix6BrZRRg+oHu9Z+J4jrgfISzRvdIcZBlpxZY+LrGcOQqZIZ3VnX+5YPdcxERCrwiOB5XquK/JjIlduoRdHBmPgIsdiFp33Aa3j+knCs3bYPjyY3As7kPY29WzCtEQKRbWF/hmCXpJnqehWVxysfnpY0QCpKiW4SZezITyLmnhv0Ue8KrN5dFoWNwokcsEL6vf1743cUBKQHScORBat87Qqm8h8J+SspIuaux8UVrEtk6w3rhSZKrBu60L2xNfXJ3hFrv+grQrZiKy0LaZyWo8MFz2+A2XGbaLmYzf6uZAhrEllj8Pte8k33mlygcYtPccx/BLUfySpHlP6uiDHpklsqHnxvaOluwtLXR9SQGiUsjpf
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:20:11.7250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9b3a41-645f-4aa8-709f-08de89d1fcf6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4596
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Mar 2026 18:20:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17429



On 3/24/2026 1:14 PM, Denys Dmytriyenko wrote:
> On Mon, Mar 23, 2026 at 08:51:31PM -0400, Denys Dmytriyenko wrote:
>> On Mon, Mar 23, 2026 at 12:16:30PM -0500, Randolph Sapp wrote:
>>> On Sun Mar 22, 2026 at 2:26 PM CDT, Denys Dmytriyenko wrote:
>>>> On Fri, Mar 20, 2026 at 05:22:30PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
>>>>> On Fri Mar 20, 2026 at 5:14 PM CDT, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>>>> Clean up a check layer error related to how this recipe was setup.
>>>>>>
>>>>>> Change the recipe to a bbappend instead of a new git version.  Apply all
>>>>>> of the changes that were made in the new recipe to the bbappend, and
>>>>>> remove the PREFERRED_VERSION in arago-prefs.inc.
>>>>>>
>>>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>>>> ---
>>>>>>   .../conf/distro/include/arago-prefs.inc       |  3 --
>>>>>>   .../mesa/mesa-demos-arago.inc                 | 17 ++++++++
>>>>>>   .../mesa/mesa-demos_9.0.0.bbappend            |  4 ++
>>>>>>   .../recipes-graphics/mesa/mesa-demos_git.bb   | 42 -------------------
>>>>>>   4 files changed, 21 insertions(+), 45 deletions(-)
>>>>>>   create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
>>>>>>   create mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend
>>>>>>   delete mode 100644 meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>>>>>>
>>>>>> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>>>>>> index 4d1a6006..6a2faa53 100644
>>>>>> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>>>>>> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>>>>>> @@ -10,6 +10,3 @@ VIRTUAL-RUNTIME_dbus = "dbus-broker"
>>>>>>   # application that does not have a GPLv3 license
>>>>>>   PREFERRED_VERSION_crda = "3.18"
>>>>>>   PREFERRED_VERSION_obex = "0.34"
>>>>>> -
>>>>>> -# Bump mesa-demos to include some patches not in a tagged release
>>>>>> -PREFERRED_VERSION_mesa-demos = "9.0.0+git"
>>>>>> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
>>>>>> new file mode 100644
>>>>>> index 00000000..5a5412c2
>>>>>> --- /dev/null
>>>>>> +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos-arago.inc
>>>>>> @@ -0,0 +1,17 @@
>>>>>> +SECTION = ""
>>>>>> +
>>>>>> +LIC_FILES_CHKSUM:remove = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e"
>>>>>> +
>>>>>> +LIC_FILES_CHKSUM:append = " file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae"
>>>>>> +
>>>>>> +SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
>>>>>> +SRCREV = "02eae079cb0b8186064d5b194ca4cc2995f099ee"
>>>>>> +
>>>>>> +PV = "9.0.0+git"
>>>>>> +
>>>>>> +REQUIRED_DISTRO_FEATURES:remove = "x11"
>>>>>> +
>>>>>> +PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
>>>>>> +
>>>>>> +PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},-Dglut=disabled,freeglut"
>>>>>> +PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
>>>>>> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend
>>>>>> new file mode 100644
>>>>>> index 00000000..3b26e342
>>>>>> --- /dev/null
>>>>>> +++ b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_9.0.0.bbappend
>>>>>> @@ -0,0 +1,4 @@
>>>>>> +MESA_DEMOS_ARAGO = ""
>>>>>> +MESA_DEMOS_ARAGO:arago = "mesa-demos-arago.inc"
>>>>>> +
>>>>>> +require ${MESA_DEMOS_ARAGO}
>>>>>> diff --git a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb b/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>>>>>> deleted file mode 100644
>>>>>> index 2da3ceff..00000000
>>>>>> --- a/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb
>>>>>> +++ /dev/null
>>>>>> @@ -1,42 +0,0 @@
>>>>>> -SUMMARY = "Mesa demo applications"
>>>>>> -DESCRIPTION = "This package includes the demonstration application, such as glxgears. \
>>>>>> -These applications can be used for Mesa validation and benchmarking."
>>>>>> -HOMEPAGE = "http://mesa3d.org"
>>>>>> -BUGTRACKER = "https://bugs.freedesktop.org"
>>>>>> -
>>>>>> -LICENSE = "MIT & PD"
>>>>>> -LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae \
>>>>>> -                    file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
>>>>>> -
>>>>>> -SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;protocol=https;branch=main"
>>>>>> -SRCREV = "02eae079cb0b8186064d5b194ca4cc2995f099ee"
>>>>>> -
>>>>>> -DEFAULT_PREFERENCE = "-1"
>>>>>> -PV = "9.0.0+git"
>>>>>> -
>>>>>> -inherit meson pkgconfig features_check
>>>>>> -REQUIRED_DISTRO_FEATURES = "opengl"
>>>>>> -
>>>>>> -EXTRA_OEMESON = "-Dwith-system-data-files=true"
>>>>>> -
>>>>>> -PACKAGECONFIG ?= "drm egl gles1 gles2 \
>>>>>> -                  ${@bb.utils.filter('DISTRO_FEATURES', 'vulkan x11 wayland', d)}"
>>>>>> -
>>>>>> -PACKAGECONFIG[drm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
>>>>>> -PACKAGECONFIG[egl] = "-Degl=enabled,-Degl=disabled,virtual/egl"
>>>>>> -PACKAGECONFIG[gles1] = "-Dgles1=enabled,-Dgles1=disabled,virtual/libgles1"
>>>>>> -PACKAGECONFIG[gles2] = "-Dgles2=enabled,-Dgles2=disabled,virtual/libgles2"
>>>>>> -PACKAGECONFIG[glut] = "-Dwith-glut=${STAGING_EXECPREFIXDIR},-Dglut=disabled,freeglut"
>>>>>> -PACKAGECONFIG[osmesa] = "-Dosmesa=enabled,-Dosmesa=disabled,"
>>>>>> -PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader glslang-native"
>>>>>> -PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,virtual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor"
>>>>>> -PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libglu libxkbcommon libxcb"
>>>>>> -
>>>>>> -do_install:append() {
>>>>>> -	# it can be completely empty when all PACKAGECONFIG options are disabled
>>>>>> -	rmdir --ignore-fail-on-non-empty ${D}${bindir}
>>>>>> -
>>>>>> -	if [ -f ${D}${bindir}/clear ]; then
>>>>>> -		mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
>>>>>> -	fi
>>>>>> -}
>>>>>
>>>>> I still hate that layer conformance thinks this is the correct way to do what is
>>>>> essentially adding a new *optional* package version. Feels really backwards and
>>>>> gross, but I'm already picking other fights right now.
>>>>
>>>> In order for a new version of a recipe to be *optional*, it should not be
>>>> selected by bitbake by default.
>>>>
>>>> There are 2 ways to do this (besides making a bbappend):
>>>>
>>>> 1. Use the same name, but lower the default preference DEFAULT_PREFERENCE="-1"
>>>> and still able to select it with PREFERRED_VERSION_mesa-demos="9.0.0+git"
>>>
>>> Yeah, I did that. You can see it in the patch above, being removed. The
>>> conformance still thinks it's wrong.
>>
>> Ah, indeed, missed that.
>>
>> Still not sure why the yocto-check-layer fails for this case...
> 
> FTR, in our discussions during early days of YP Compat and yocto-check-layer
> several years ago, this was one of the correct methods to deal with multiple
> versions - see the comments here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12688
> 
> Do you have the exact error message that the tool now prints?

Of course not.  I was just fixing the issue not documenting things. 
I'll have to revert the patch to get the message.  I'll try and do that 
sometime this week... if I can remember to...


> 
>>>> 2. Use a different name e.g. mesa-demos-arago and set PROVIDES="mesa-demos" -
>>>> allows selecting it with PREFERRED_PROVIDER_mesa-demos="mesa-demos-arago"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

