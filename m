Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B49D106703D
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:24:52 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22902.1773325488576118443
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 07:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=UfEhslc3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.198.0, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6BGUSxJyVBmZsT33uyTRDqO62SWDb9bdnbWT2sjjKAq5KywZtnTOVjO452/s6cwCemNzbtGj2H8VRlO4yuB26DOW6HqXoO3pgCcYdYN7Mu+PsXfA78gOh9SIi/sKBelLoM9t2w6FvlAkjRJKSC2Of1DhDs9yA/xuwhelxDi6SaIEiNnBGgm6dAdhqiDDy/tJPNCDPwti8BBej8rcDTjbEftcOMhQTNSxJg/d1OGi2hb/BRQcWEoa9eiSLQNrS2YJaUfpQVqQsXPRlj7wNNlWHXy6J6CJBPL+bJ8BFJcW565viPAbQW+zcEy1vaEZRWHur1mtIhHx1rtuaOujwJ5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNwtR8zN0fhDpFj0cBYKCzVBkSEpLOSupuFH8fk/z6U=;
 b=PJnXZPYiWRvUaJnoU/3U05naIy81A2NV2hhF7X1mYbyqhjtxEUr7irXfeQ9aL63pGFZ4k1JD4FOXxrfKTeGiSzC8DFSgtMKgNA5vr/VNWlmpqzti1Kj2UJnyggeuPkYoTJpC7trjRmdjzmA0T24S4s20E2TD1BYUleon6yn54QqgHwIinGysEWkfk0gp2fwnSX8TvKLXqUf4D7fyp/5evXrqh89U2y+rr0qcvg+fyPCJK4L80lPvByRXUWa1HGMQsirRAzpUxnhRuXQ4Dp9xjo/S5Fr25C1SPI/DQMtgSFZX8IpkjQRP9sFUV8b9kxFGeRWDWbUW+S7JxBh3/IKmxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNwtR8zN0fhDpFj0cBYKCzVBkSEpLOSupuFH8fk/z6U=;
 b=UfEhslc3a4U7Ne6ezq0QhK7JlEKMqGajxbfoVX2mLRk5jnpXUYJcY4HZZW92xphMCtnkv+tC1TTOuvBc83AvghrDNu2lja0+9348GCwXo7Jq88vN+y5w0lNmaMJEhFaxJCaNd5SX6v5H2BCsYzdRgXYavBx/dteFMYTq6+qxDbw=
Received: from SJ0PR05CA0204.namprd05.prod.outlook.com (2603:10b6:a03:330::29)
 by BN0PR10MB4920.namprd10.prod.outlook.com (2603:10b6:408:128::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 14:24:45 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::54) by SJ0PR05CA0204.outlook.office365.com
 (2603:10b6:a03:330::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.8 via Frontend Transport; Thu,
 12 Mar 2026 14:24:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 14:24:44 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 09:24:43 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 09:24:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 09:24:43 -0500
Received: from [172.24.233.101] (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CEOfdb2453999;
	Thu, 12 Mar 2026 09:24:42 -0500
Message-ID: <547ed737-dcd4-49aa-8c57-d346205417b3@ti.com>
Date: Thu, 12 Mar 2026 19:54:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v3 1/1] nnstreamer: Move test binaries
 to main package
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>
References: <20260312130928.889341-1-p-deshmukh@ti.com>
 <20260312130928.889341-2-p-deshmukh@ti.com>
 <ffed25c0-dbdd-4388-b4ca-90b4efcc43d6@ti.com>
Content-Language: en-US
From: Pratham Deshmukh <p-deshmukh@ti.com>
In-Reply-To: <ffed25c0-dbdd-4388-b4ca-90b4efcc43d6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|BN0PR10MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: e7faf5c4-4ec8-4ed5-f412-08de80431b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003|22082099003|7142099003;
X-Microsoft-Antispam-Message-Info: 
	1/oONusveyOF8ImbN0urAnStmuginLNoOpgnNAcCmuJdSePnUOIfaLA1VZur5X0y868h0b9HcDyd+DDpEpLvZol9NLhqNLahbX5b/UfMY4frYFYMioAyBnT6ZMAVHiCR7/FlLez/kNFI2wst7NysZdo3EQea5IxrUmtYQGQnS/qk2WJ03ZEF+yUzZDzdHdeYd1yzX08RzuQ8glpPsfWtd/tznJr1WzxGi7y6WmfD/uW9yHIOovLdIRD49quFSNmUAld4vAYTsK/7/XNt89xbGVSaD9TdMe1JcMjC/FkzQKA+DcoqxLu4q0rScmbPcPgMN6S38owioMgyCd+HU3zkqpT9KAGpX2E05nG/eFkeV9i0sixWMj3Fsz0YlHUyBezeGfBEDYd7/er0DIUNnrkJS4xRazNYtPNrv2u3CydJC1rQJshcNECR3M9o4MYcN6dvHMPtHNvZfC+SPhtfpninOULDCfrR5Nwm0VvoIuYcI51/w26xwKIsV0n4aIal/HSYyOO3IlO8kgpapae7Y0sprDoDKxhqEzJnk0TDc/gxfr/5cMfhr9ZqO1+iKEntj6QhAGcGv3gU+Dll061IVp/IgbQZUD9VSmxK5TUxyE6eyIAVwnkCLr258tAGPlciUKxE1SS8aqx/JOmkNwQBu4t4xOQZSZKWqp/74yn5FMrx+vkNllf7fEyPqfAu9TayFAhwVYcKG5XCz67JsuH5X1EG4M60Oim02NThgqnrevTijyQ4ALinFSezVoe09JflsknBn+m+Bn7fnrnBtzn8e/8ytg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WujImZGa3DTvPOXqiiP1K2CMKD/YHnkoAGY6ibVwRZObtJSSOsK7BLQo6IY1ehZslfhXUw7vd7hDsENATDaY5PA6ZHT1u+6DhD5acjpqIiOG8b4AVh6kpG42vOwLGIFVb+VA9xARQo+fKNC0mY2Wj0bbTmu0MS1lGRKI5Fiqhj1rEuaXiDRD3LtZev87E7q3nEJRdBJCnzVDRc+ZGZoM2Y5ST/vwFkgl83HFRR9xGFLrWIJlGCHdOTabwVFvOL2pk5krFXaqwQBj3zVN/z420/wM61uHTYVwGi49FrwF/dJWHSstH+FW/81d8e4gH4gOpQCMRdZS9MoFOxroy4uj1lA8o/YIua02vs1DNh1foxa/lrpXZgyZBcAZqX4l+12m0CcrEWBP5TNnoD3xDJok7TQsOk3YAa2T0Q2GOY8Mugw2auaPuClssglwfZpwm68p
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:24:44.5679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7faf5c4-4ec8-4ed5-f412-08de80431b92
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4920
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 14:24:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17321


On 12/03/26 7:17 pm, Andrew Davis wrote:
> On 3/12/26 8:09 AM, Pratham Deshmukh wrote:
>> Consolidate unittest executables into main nnstreamer
>> package instead of separate nnstreamer- tests package to
>> fix missing benchmark utilities.
>>
>> This resolves file packaging conflicts and ensures
>> unittest_filter_onnxruntime is available for ONNX
>> Runtime benchmarking without additional dependencies.
>>
>
> Why can't ONNXRuntime just depend on the -test package?
>
> Also this commit content looks to be mostly around fixing
> the "buildpaths" error, which isn't described in the commit
> message at all..
>
> Andrew
>
Do you mean to just add runtime dependeny to pull in nnstreamer-tests=20
package?

I'll fix the commit, Thanks.

>> Fixes: 319271fe5fc8bc3016b1eb765784076af666b61b ("nnstreamer: upgrade=20
>> 2.4.4 -> 2.6.0")
>>
>> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>> ---
>> Change Logs:
>> =C2=A0 v2 -> v3:
>> =C2=A0 - Fix runitme dependencies issue for unittest_filter_onnxruntime.
>> =C2=A0 - Upgrade recipe to make it QA compliant.
>> =C2=A0 v1 -> v2:
>> =C2=A0 - Added fix commit hash in the commit message.
>>
>> =C2=A0 ...ute-build-paths-from-generated-test-.patch | 42 ++++++++++++++=
+++++
>> =C2=A0 .../nnstreamer/nnstreamer_2.6.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++----
>> =C2=A0 2 files changed, 48 insertions(+), 9 deletions(-)
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-Remo=
ve-absolute-build-paths-from-generated-test-.patch
>>
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-Re=
move-absolute-build-paths-from-generated-test-.patch=20
>> b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-Re=
move-absolute-build-paths-from-generated-test-.patch=20
>>
>> new file mode 100644
>> index 00000000..345b3eb2
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-Re=
move-absolute-build-paths-from-generated-test-.patch
>> @@ -0,0 +1,42 @@
>> +From a5f962b51431ac19c264b8b9baa78ff283a77efe Mon Sep 17 00:00:00 2001
>> +From: Pratham Deshmukh <p-deshmukh@ti.com>
>> +Date: Tue, 10 Mar 2026 15:23:05 +0530
>> +Subject: [PATCH] fix: Remove absolute build paths from generated=20
>> test files
>> +
>> +Replace meson.build_root() with relative paths in custom_filter_path
>> +to prevent Yocto buildpaths QA errors. The generated unittest files
>> +were embedding absolute build directory paths (e.g., /tmp/work/...)
>> +as string literals, which Yocto's QA system correctly flags as a
>> +build reproducibility issue.
>> +
>> +The runtime code already handles proper path resolution using
>> +NNSTREAMER_SOURCE_ROOT_PATH environment variable or relative
>> +fallbacks, so this change maintains full functionality
>> +while eliminating embedded build paths.
>> +
>> +Fixes: QA Issue "contains reference to TMPDIR [buildpaths]" in
>> +unittest_tizen_custom.cc and unittest_tizen_custom-set.cc
>> +
>> +Upstream-Status: Inappropriate [oe-specific]
>> +
>> +Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>> +---
>> + tests/nnstreamer_filter_extensions_common/meson.build | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/tests/nnstreamer_filter_extensions_common/meson.build=20
>> b/tests/nnstreamer_filter_extensions_common/meson.build
>> +index ecd1878b..ba72ee20 100644
>> +--- a/tests/nnstreamer_filter_extensions_common/meson.build
>> ++++ b/tests/nnstreamer_filter_extensions_common/meson.build
>> +@@ -9,7 +9,7 @@ tizen_apptest_deps =3D [
>> + # Format for adding subplugin into extensions -
>> + # [name, extension abbreviation, dependencies, model file=20
>> name/folder path/file path, test name]
>> + extensions =3D []
>> +-custom_filter_path =3D join_paths(meson.build_root(), 'tests',=20
>> 'nnstreamer_example',
>> ++custom_filter_path =3D join_paths('tests', 'nnstreamer_example',
>> +=C2=A0=C2=A0=C2=A0=C2=A0 'libnnstreamer_customfilter_passthrough.' + so=
_ext)
>> + extensions +=3D [['custom', 'custom', nnstreamer_unittest_deps,=20
>> custom_filter_path, 'custom']]
>> + extensions +=3D [['custom', 'custom', nnstreamer_unittest_deps,=20
>> custom_filter_path, 'custom-set']]
>> +--
>> +2.34.1
>> +
>> diff --git=20
>> a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb=20
>> b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
>> index c62589ac..7bf64408 100644
>> ---=20
>> a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
>> +++=20
>> b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.bb
>> @@ -3,7 +3,11 @@ DESCRIPTION =3D "NNStreamer is a set of Gstreamer=20
>> plugins that allow Gstreamer dev
>> =C2=A0 LICENSE =3D "LGPL-2.1-only"
>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3Dc25e5c1949624d71896127788f1ba590"
>> =C2=A0 -SRC_URI =3D=20
>> "git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;protocol=3Dhtt=
ps"
>> +SRC_URI =3D " \
>> +=20
>> git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;protocol=3Dhttp=
s \
>> +=20
>> file://0001-fix-Remove-absolute-build-paths-from-generated-test-.patch \
>> +"
>> +
>> =C2=A0 SRCREV =3D "b970e9eff6bfb4e915463842422fe14bb2e53f84"
>> =C2=A0 =C2=A0 # Only compatible with armv7a, armv7ve, and aarch64
>> @@ -53,16 +57,9 @@ FILES:${PN} +=3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir}/gstreamer-1.0/*.so \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir}/nnstreamer/* \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${sysconfdir}/nnstreamer.ini \
>> -"
>> -INSANE_SKIP:${PN} +=3D "dev-so"
>> -
>> -PACKAGES =3D+ "${PN}-tests"
>> -
>> -FILES:${PN}-tests +=3D "\
>> -=C2=A0=C2=A0=C2=A0 ${libdir}/nnstreamer/customfilters/* \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${bindir}/unittest-nnstreamer/* \
>> =C2=A0 "
>> -INSANE_SKIP:${PN}-tests +=3D "buildpaths"
>> +INSANE_SKIP:${PN} +=3D "dev-so"
>> =C2=A0 =C2=A0 FILES:${PN}-dev =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${includedir}/nnstreamer/* \
>

