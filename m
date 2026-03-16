Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DACF506E4
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 14:57:44 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.35])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52695.1773673055195448263
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 07:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=b+L/EU3o;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.35, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuxfoXO7Y3M7/IN4B9/SSjRwXB+xdoTWWX55SLToIeVhQk4ROSFD1hM+/pacVYYvmFjakUiMgAwVsfAjwonewfv27oBkavvycYq2Pq0p2mdFk4udw3QvFTKWp0S5+pBOEM5Mj89UTVGcvrODvB7F7qMgPr+6Ieuk/+N45jv+TG4NYkmRHEcabqmpy89Gyv4ChUu57XKwSvPTtrWz+JB3LpU43gpvJGUE8Fhq2Xq/OBP9Psg85/7u7OUSDazH6ETg81dAyOcQ09z4UYKe2EYnFwnbHlJd9zyVXPFRv5TmgvoAbNMuUP9UHuitjYuLtLvQmGZAd1o7y01U92o4DZ141A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZ7CQ3qm+bSicdEMYm3kcGy/outPRc7yV3hL3Nxajns=;
 b=LX5+ADatiAVLu/+e8KYIH+nDWNhxiuE3zTVdxZvV8WyHqDw3hIMlkMJx3lJMhmb9kBXndlD3dOFQmZbAakO1fnD9BThWIJ+9xY1K0f1WH8z6b5vrlfDnyf9Wc8nQhrOhp5vZqSsyztNscJW8oZ7BYJfkatnmlgWXOByb5aItTaGZTzzaX1/5rQ3YkrqusjmClqDz6GiMxTEN+YN8xk2woJoUS8qyBTAXUPl2uJtHGYXPZxV1DyPf6t0HpPgPl/nIEwSKC1WtCKsEFga6HKBOXcBKVOY4KUiPNQuSO+QyvvDVoQJtZEI0fcBn2mCvodIGkWufGxZCaEo5nEVmPohccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ7CQ3qm+bSicdEMYm3kcGy/outPRc7yV3hL3Nxajns=;
 b=b+L/EU3ov4eryyWSFXyjKUBMybcKhIcTm6gw8LPPMkamrdrBF2Um7BmNbZI/JvEukP/d/N9E9DWlkfadOiV89SoRjJTc/XEpoi0HMoJ8S0OjKeCfPgIA55Djfc9ywTfobj9HqulDz98Lw+0LHuXWRwc5YPMir21kHvLs5YH6tmU=
Received: from BL1PR13CA0068.namprd13.prod.outlook.com (2603:10b6:208:2b8::13)
 by MW4PR10MB6559.namprd10.prod.outlook.com (2603:10b6:303:228::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 14:57:32 +0000
Received: from BL02EPF0001A0FD.namprd03.prod.outlook.com
 (2603:10b6:208:2b8:cafe::90) by BL1PR13CA0068.outlook.office365.com
 (2603:10b6:208:2b8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 14:57:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A0FD.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 14:57:32 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 09:57:30 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 09:57:30 -0500
Received: from DLEE206.ent.ti.com ([fe80::83f5:84c9:ae30:5a3e]) by
 DLEE206.ent.ti.com ([fe80::83f5:84c9:ae30:5a3e%6]) with mapi id
 15.02.2562.020; Mon, 16 Mar 2026 09:57:30 -0500
From: "Deshmukh, Pratham" <p-deshmukh@ti.com>
To: "Eatmon, Ryan" <reatmon@ti.com>, "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>
CC: "Davis, Andrew" <afd@ti.com>, "Shilwant, Chirag" <c-shilwant@ti.com>,
	"Dmytriyenko, Denys" <denys@ti.com>, "Singh, Vishnu" <v-singh1@ti.com>
Subject: Re: [meta-arago][master][PATCH v4 1/1] nnstreamer: Add test package
 dependency and fix buildpaths QA issues
Thread-Topic: [meta-arago][master][PATCH v4 1/1] nnstreamer: Add test package
 dependency and fix buildpaths QA issues
Thread-Index: AQHctScQpDIfdzO/KUSD7sV8AHKoWLWxdgKA///IUJk=
Date: Mon, 16 Mar 2026 14:57:30 +0000
Message-ID: <7cb5cc3a5370464fa80ac543d871f7d3@ti.com>
References: <20260316092648.1377711-1-p-deshmukh@ti.com>
 <20260316092648.1377711-2-p-deshmukh@ti.com>,<54b6b817-38de-4a2b-bc22-f54379ca78a6@ti.com>
In-Reply-To: <54b6b817-38de-4a2b-bc22-f54379ca78a6@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.130.53]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: multipart/alternative;
	boundary="_000_7cb5cc3a5370464fa80ac543d871f7d3ticom_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FD:EE_|MW4PR10MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: fae25cc4-0776-453a-a0b7-08de836c59fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|22082099003|56012099003|18002099003|7053199007|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	+D49tEbKd0Vs8ZkPdZQj9aJkyxurANQt8UDZrvM2pWT51lgj3gZTLhZlVD2K2Sq8YiliT9zfGVlDL6rlrwJverm4egFrGY2oLkxkXePhjxMGHTAWrClTmK5dP7lRS3nrbEKupT2O+9In2NnXKEF7QTBcRkh+fCMQf4K5QA8tGYEXuM5lnrtVivS+4dpn7NauqN+mpBcj/rQfz4y0HtR0epW4Kjf6loHG7yG6+2a4PkzWJNMHIS1Jpux+8L2PcRj1J+U5TLavMfdA6T9WAjUccWl2x+o9TwFrbB4VKUEQ/KhbmIy6aiRwUPdWbqnOSQA8k5YA+pBIlFROcS7M03mNqlUbKaQtdFlyLR6fyYh39kRRss1If0/IdjE110FuFDB4cp5i12FdQHwt+jZC6fYD4oThx11n4TfnZda7zAbUdMbmvkN2pqqf4+uDKDFEyi2m8cPPpmXEvhr26dNhkmga9wKTcj7aBzYE5FLmZiTSBpOOF2Ol9i0v0Rw9HO7VfZMeIYlANH4wKGiLMUN+9x1AdIHkEyqGFEgh7iPu3LZkRqTOt5XBiuazG0TD/FFwU1I0jGoisTT5nX93FdNbGaSOJOL2Mz7UTFjPrYs08XrRItGja2Ajal9+A6dZdeJn0wzLPbDE0ib8A3lXeUX/4Yb/LbXaBHI3tPLc+6/czurtpIeGi6dwigPTZo7U94KXHjMetnzy4CVvo4qU3b2c8kW5cUenTbDFJQrDCf3IZZ4HYYQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LE1gKIWBNaH/mOxjrpHb2zpXpRWWfmYjRDKgjk80fZgZyx2s2C7DKY3bZsIzQOQ2IGXKQpu/VszDNaFxLLLpFNEJWK/2uLnANhqHiFmdDJ8kqKjJTaxap6I17mMX8rCVbo2O3h/aDi2EHqF5Tt7Wj0ZER20zzuG3EWIgpdOL/sHrEkwU3gMMkE+wMocnG9pMFFlQGaUTvYCG6ivM4/UUF/3zJ3KhzxlgY3R3axCqhRloOj6bIJVzqb9Avgw1yk1nUoi8hqw7erxTdOuKtTEf8VIndb3MvCyeY5qXegElT2KC3NhOHxLrY3U5oMwicKcy7uH1USjmFlKn2CbGY+ZQxtnKXUJxdm5t/JzbOyD+TzzVLF9/+pvnNqTwGBtq/2im77BumU3OuvLjAvp+4+Xx4kdH6LxklJ4Wky//C1w5luwQ+PdfjiJMvXfHHvhdt7wa
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:57:32.1385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fae25cc4-0776-453a-a0b7-08de836c59fb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6559
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Mar 2026 14:57:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17350

--_000_7cb5cc3a5370464fa80ac543d871f7d3ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The intent here was not to force the tests into all images. The nnstreamer =
components (like other stacks) are pulled in through the meta-tisdk:meta-ti=
-ml layer for a specific SDK images that require them, so the base arago-de=
fault-image is not bloated.


https://github.com/TexasInstruments/meta-tisdk/blob/master/meta-ti-ml/recip=
es-core/images/tisdk-default-image.bbappend

________________________________
From: Eatmon, Ryan
Sent: Monday, March 16, 2026 6:40:23 PM
To: Deshmukh, Pratham; meta-arago@lists.yoctoproject.org
Cc: Davis, Andrew; Shilwant, Chirag; Dmytriyenko, Denys; Singh, Vishnu
Subject: Re: [meta-arago][master][PATCH v4 1/1] nnstreamer: Add test packag=
e dependency and fix buildpaths QA issues



On 3/16/2026 4:26 AM, Pratham Deshmukh via lists.yoctoproject.org wrote:
> Add runtime dependency to automatically install
> nnstreamer-tests package when nnstreamer is installed,
> ensuring unittest_filter_onnxruntime is available for
> ONNX Runtime benchmarking.
>
> Include buildpaths compliance patch that replaces
> absolute build paths(meson.build_root()) with relative
> paths in generated unittest files, resolving QA errors
> "contains reference to TMPDIR [buildpaths]" in unittest_tizen_custom.cc
> and unittest_tizen_custom-set.cc.
>
> Fixes: 319271fe5fc8bc3016b1eb765784076af666b61b ("nnstreamer: upgrade 2.4=
.4 -> 2.6.0")
>
> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> ---
> Change Logs:
>   v3 -> v4:
>   - Use RDEPENDS approach instead of package consolidation to maintain
>     clean separation between runtime and test components.
>   v2 -> v3:
>   - Fix runitme dependencies issue for unittest_filter_onnxruntime.
>   - Upgrade recipe to make it QA compliant.
>   v1 -> v2:
>   - Added fix commit hash in the commit message.
>
>   ...ute-build-paths-from-generated-test-.patch | 42 +++++++++++++++++++
>   .../nnstreamer/nnstreamer_2.6.0.bb            |  9 +++-
>   2 files changed, 49 insertions(+), 2 deletions(-)
>   create mode 100644 meta-arago-extras/recipes-multimedia/nnstreamer/nnst=
reamer/0001-fix-Remove-absolute-build-paths-from-generated-test-.patch
>
> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/0=
001-fix-Remove-absolute-build-paths-from-generated-test-.patch b/meta-arago=
-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-Remove-absolute-b=
uild-paths-from-generated-test-.patch
> new file mode 100644
> index 00000000..345b3eb2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix=
-Remove-absolute-build-paths-from-generated-test-.patch
> @@ -0,0 +1,42 @@
> +From a5f962b51431ac19c264b8b9baa78ff283a77efe Mon Sep 17 00:00:00 2001
> +From: Pratham Deshmukh <p-deshmukh@ti.com>
> +Date: Tue, 10 Mar 2026 15:23:05 +0530
> +Subject: [PATCH] fix: Remove absolute build paths from generated test fi=
les
> +
> +Replace meson.build_root() with relative paths in custom_filter_path
> +to prevent Yocto buildpaths QA errors. The generated unittest files
> +were embedding absolute build directory paths (e.g., /tmp/work/...)
> +as string literals, which Yocto's QA system correctly flags as a
> +build reproducibility issue.
> +
> +The runtime code already handles proper path resolution using
> +NNSTREAMER_SOURCE_ROOT_PATH environment variable or relative
> +fallbacks, so this change maintains full functionality
> +while eliminating embedded build paths.
> +
> +Fixes: QA Issue "contains reference to TMPDIR [buildpaths]" in
> +unittest_tizen_custom.cc and unittest_tizen_custom-set.cc
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
> +---
> + tests/nnstreamer_filter_extensions_common/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/nnstreamer_filter_extensions_common/meson.build b/tes=
ts/nnstreamer_filter_extensions_common/meson.build
> +index ecd1878b..ba72ee20 100644
> +--- a/tests/nnstreamer_filter_extensions_common/meson.build
> ++++ b/tests/nnstreamer_filter_extensions_common/meson.build
> +@@ -9,7 +9,7 @@ tizen_apptest_deps =3D [
> + # Format for adding subplugin into extensions -
> + # [name, extension abbreviation, dependencies, model file name/folder p=
ath/file path, test name]
> + extensions =3D []
> +-custom_filter_path =3D join_paths(meson.build_root(), 'tests', 'nnstrea=
mer_example',
> ++custom_filter_path =3D join_paths('tests', 'nnstreamer_example',
> +     'libnnstreamer_customfilter_passthrough.' + so_ext)
> + extensions +=3D [['custom', 'custom', nnstreamer_unittest_deps, custom_=
filter_path, 'custom']]
> + extensions +=3D [['custom', 'custom', nnstreamer_unittest_deps, custom_=
filter_path, 'custom-set']]
> +--
> +2.34.1
> +
> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2=
.6.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.=
bb
> index c62589ac..fbfb887c 100644
> --- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
> @@ -3,7 +3,11 @@ DESCRIPTION =3D "NNStreamer is a set of Gstreamer plugin=
s that allow Gstreamer dev
>   LICENSE =3D "LGPL-2.1-only"
>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc25e5c1949624d71896127788f1b=
a590"
>
> -SRC_URI =3D "git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;pr=
otocol=3Dhttps"
> +SRC_URI =3D " \
> +     git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;protocol=
=3Dhttps \
> +     file://0001-fix-Remove-absolute-build-paths-from-generated-test-.pa=
tch \
> +"
> +
>   SRCREV =3D "b970e9eff6bfb4e915463842422fe14bb2e53f84"
>
>   # Only compatible with armv7a, armv7ve, and aarch64
> @@ -56,13 +60,14 @@ FILES:${PN} +=3D "\
>   "
>   INSANE_SKIP:${PN} +=3D "dev-so"
>
> +RDEPENDS:${PN} +=3D "nnstreamer-tests"
> +

Why are we forcing the tests to be installed when nnstreamer is installed? =
 In fact, I cannot find any recipe that even refers to nnstreamer.  How is =
this even begin included in builds?  In my mind, if you are wanting the tes=
ts for use during our testing, then nnstreamer-tests should be included in =
the ti-test package to ensure that the tests are present.


>   PACKAGES =3D+ "${PN}-tests"
>
>   FILES:${PN}-tests +=3D "\
>        ${libdir}/nnstreamer/customfilters/* \
>        ${bindir}/unittest-nnstreamer/* \
>   "
> -INSANE_SKIP:${PN}-tests +=3D "buildpaths"
>
>   FILES:${PN}-dev =3D "\
>        ${includedir}/nnstreamer/* \

--
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


--_000_7cb5cc3a5370464fa80ac543d871f7d3ticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>The intent here was not to force the tests into all images. The nnstream=
er&nbsp;components&nbsp;(like other stacks)&nbsp;are pulled in through the =
meta-tisdk:meta-ti-ml layer for a specific SDK images that require them, so=
 the base arago-default-image is not bloated.&nbsp;<br>
<br>
<br>
<a href=3D"https://github.com/TexasInstruments/meta-tisdk/blob/master/meta-=
ti-ml/recipes-core/images/tisdk-default-image.bbappend" class=3D"x_OWAAutoL=
ink">https://github.com/TexasInstruments/meta-tisdk/blob/master/meta-ti-ml/=
recipes-core/images/tisdk-default-image.bbappend</a><br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Eatmon, Ryan<br>
<b>Sent:</b> Monday, March 16, 2026 6:40:23 PM<br>
<b>To:</b> Deshmukh, Pratham; meta-arago@lists.yoctoproject.org<br>
<b>Cc:</b> Davis, Andrew; Shilwant, Chirag; Dmytriyenko, Denys; Singh, Vish=
nu<br>
<b>Subject:</b> Re: [meta-arago][master][PATCH v4 1/1] nnstreamer: Add test=
 package dependency and fix buildpaths QA issues</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText"><br>
<br>
On 3/16/2026 4:26 AM, Pratham Deshmukh via lists.yoctoproject.org wrote:<br=
>
&gt; Add runtime dependency to automatically install<br>
&gt; nnstreamer-tests package when nnstreamer is installed,<br>
&gt; ensuring unittest_filter_onnxruntime is available for<br>
&gt; ONNX Runtime benchmarking.<br>
&gt; <br>
&gt; Include buildpaths compliance patch that replaces<br>
&gt; absolute build paths(meson.build_root()) with relative<br>
&gt; paths in generated unittest files, resolving QA errors<br>
&gt; &quot;contains reference to TMPDIR [buildpaths]&quot; in unittest_tize=
n_custom.cc<br>
&gt; and unittest_tizen_custom-set.cc.<br>
&gt; <br>
&gt; Fixes: 319271fe5fc8bc3016b1eb765784076af666b61b (&quot;nnstreamer: upg=
rade 2.4.4 -&gt; 2.6.0&quot;)<br>
&gt; <br>
&gt; Signed-off-by: Pratham Deshmukh &lt;p-deshmukh@ti.com&gt;<br>
&gt; ---<br>
&gt; Change Logs:<br>
&gt;&nbsp;&nbsp; v3 -&gt; v4:<br>
&gt;&nbsp;&nbsp; - Use RDEPENDS approach instead of package consolidation t=
o maintain<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; clean separation between runtime and test comp=
onents.<br>
&gt;&nbsp;&nbsp; v2 -&gt; v3:<br>
&gt;&nbsp;&nbsp; - Fix runitme dependencies issue for unittest_filter_onnxr=
untime.<br>
&gt;&nbsp;&nbsp; - Upgrade recipe to make it QA compliant.<br>
&gt;&nbsp;&nbsp; v1 -&gt; v2:<br>
&gt;&nbsp;&nbsp; - Added fix commit hash in the commit message.<br>
&gt; <br>
&gt;&nbsp;&nbsp; ...ute-build-paths-from-generated-test-.patch | 42 &#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; .../nnstreamer/nnstreamer_2.6.0.bb&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 9 &#43;&#43;&#43;-<br>
&gt;&nbsp;&nbsp; 2 files changed, 49 insertions(&#43;), 2 deletions(-)<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-arago-extras/recipes-multimedia/nn=
streamer/nnstreamer/0001-fix-Remove-absolute-build-paths-from-generated-tes=
t-.patch<br>
&gt; <br>
&gt; diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreame=
r/0001-fix-Remove-absolute-build-paths-from-generated-test-.patch b/meta-ar=
ago-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-Remove-absolut=
e-build-paths-from-generated-test-.patch<br>
&gt; new file mode 100644<br>
&gt; index 00000000..345b3eb2<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-multimedia/nnstreamer/nnst=
reamer/0001-fix-Remove-absolute-build-paths-from-generated-test-.patch<br>
&gt; @@ -0,0 &#43;1,42 @@<br>
&gt; &#43;From a5f962b51431ac19c264b8b9baa78ff283a77efe Mon Sep 17 00:00:00=
 2001<br>
&gt; &#43;From: Pratham Deshmukh &lt;p-deshmukh@ti.com&gt;<br>
&gt; &#43;Date: Tue, 10 Mar 2026 15:23:05 &#43;0530<br>
&gt; &#43;Subject: [PATCH] fix: Remove absolute build paths from generated =
test files<br>
&gt; &#43;<br>
&gt; &#43;Replace meson.build_root() with relative paths in custom_filter_p=
ath<br>
&gt; &#43;to prevent Yocto buildpaths QA errors. The generated unittest fil=
es<br>
&gt; &#43;were embedding absolute build directory paths (e.g., /tmp/work/..=
.)<br>
&gt; &#43;as string literals, which Yocto's QA system correctly flags as a<=
br>
&gt; &#43;build reproducibility issue.<br>
&gt; &#43;<br>
&gt; &#43;The runtime code already handles proper path resolution using<br>
&gt; &#43;NNSTREAMER_SOURCE_ROOT_PATH environment variable or relative<br>
&gt; &#43;fallbacks, so this change maintains full functionality<br>
&gt; &#43;while eliminating embedded build paths.<br>
&gt; &#43;<br>
&gt; &#43;Fixes: QA Issue &quot;contains reference to TMPDIR [buildpaths]&q=
uot; in<br>
&gt; &#43;unittest_tizen_custom.cc and unittest_tizen_custom-set.cc<br>
&gt; &#43;<br>
&gt; &#43;Upstream-Status: Inappropriate [oe-specific]<br>
&gt; &#43;<br>
&gt; &#43;Signed-off-by: Pratham Deshmukh &lt;p-deshmukh@ti.com&gt;<br>
&gt; &#43;---<br>
&gt; &#43; tests/nnstreamer_filter_extensions_common/meson.build | 2 &#43;-=
<br>
&gt; &#43; 1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
&gt; &#43;<br>
&gt; &#43;diff --git a/tests/nnstreamer_filter_extensions_common/meson.buil=
d b/tests/nnstreamer_filter_extensions_common/meson.build<br>
&gt; &#43;index ecd1878b..ba72ee20 100644<br>
&gt; &#43;--- a/tests/nnstreamer_filter_extensions_common/meson.build<br>
&gt; &#43;&#43;&#43;&#43; b/tests/nnstreamer_filter_extensions_common/meson=
.build<br>
&gt; &#43;@@ -9,7 &#43;9,7 @@ tizen_apptest_deps =3D [<br>
&gt; &#43; # Format for adding subplugin into extensions -<br>
&gt; &#43; # [name, extension abbreviation, dependencies, model file name/f=
older path/file path, test name]<br>
&gt; &#43; extensions =3D []<br>
&gt; &#43;-custom_filter_path =3D join_paths(meson.build_root(), 'tests', '=
nnstreamer_example',<br>
&gt; &#43;&#43;custom_filter_path =3D join_paths('tests', 'nnstreamer_examp=
le',<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; 'libnnstreamer_customfilter_passthrough.=
' &#43; so_ext)<br>
&gt; &#43; extensions &#43;=3D [['custom', 'custom', nnstreamer_unittest_de=
ps, custom_filter_path, 'custom']]<br>
&gt; &#43; extensions &#43;=3D [['custom', 'custom', nnstreamer_unittest_de=
ps, custom_filter_path, 'custom-set']]<br>
&gt; &#43;--<br>
&gt; &#43;2.34.1<br>
&gt; &#43;<br>
&gt; diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreame=
r_2.6.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6=
.0.bb<br>
&gt; index c62589ac..fbfb887c 100644<br>
&gt; --- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0=
.bb<br>
&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-multimedia/nnstreamer/nnst=
reamer_2.6.0.bb<br>
&gt; @@ -3,7 &#43;3,11 @@ DESCRIPTION =3D &quot;NNStreamer is a set of Gstr=
eamer plugins that allow Gstreamer dev<br>
&gt;&nbsp;&nbsp; LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
&gt;&nbsp;&nbsp; LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=
=3Dc25e5c1949624d71896127788f1ba590">file://LICENSE;md5=3Dc25e5c1949624d718=
96127788f1ba590</a>&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt; -SRC_URI =3D &quot;git://github.com/nnstreamer/nnstreamer.git;branch=
=3Dmain;protocol=3Dhttps&quot;<br>
&gt; &#43;SRC_URI =3D &quot; \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; git://github.com/nnstreamer/nnstreamer.g=
it;branch=3Dmain;protocol=3Dhttps \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0001-fix-Remove-absolu=
te-build-paths-from-generated-test-.patch">
file://0001-fix-Remove-absolute-build-paths-from-generated-test-.patch</a> =
\<br>
&gt; &#43;&quot;<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp; SRCREV =3D &quot;b970e9eff6bfb4e915463842422fe14bb2e53f84&=
quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; # Only compatible with armv7a, armv7ve, and aarch64<br>
&gt; @@ -56,13 &#43;60,14 @@ FILES:${PN} &#43;=3D &quot;\<br>
&gt;&nbsp;&nbsp; &quot;<br>
&gt;&nbsp;&nbsp; INSANE_SKIP:${PN} &#43;=3D &quot;dev-so&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;RDEPENDS:${PN} &#43;=3D &quot;nnstreamer-tests&quot;<br>
&gt; &#43;<br>
<br>
Why are we forcing the tests to be installed when nnstreamer is installed?&=
nbsp; In fact, I cannot find any recipe that even refers to nnstreamer.&nbs=
p; How is this even begin included in builds?&nbsp; In my mind, if you are =
wanting the tests for use during our testing, then
 nnstreamer-tests should be included in the ti-test package to ensure that =
the tests are present.<br>
<br>
<br>
&gt;&nbsp;&nbsp; PACKAGES =3D&#43; &quot;${PN}-tests&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; FILES:${PN}-tests &#43;=3D &quot;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${libdir}/nnstreamer/customf=
ilters/* \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${bindir}/unittest-nnstreame=
r/* \<br>
&gt;&nbsp;&nbsp; &quot;<br>
&gt; -INSANE_SKIP:${PN}-tests &#43;=3D &quot;buildpaths&quot;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; FILES:${PN}-dev =3D &quot;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${includedir}/nnstreamer/* \=
<br>
<br>
-- <br>
Ryan Eatmon&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; reatmon@ti.com<br>
-----------------------------------------<br>
Texas Instruments, Inc.&nbsp; -&nbsp; LCPD&nbsp; -&nbsp; MGTS<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_7cb5cc3a5370464fa80ac543d871f7d3ticom_--

