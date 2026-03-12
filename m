Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1903E106703B
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:33:02 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23103.1773325971574180748
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 07:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BIvBKa1q;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.21, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pk21okw6IRRuKsibfV6N/yyWMOl4cwmrzkSAtEr7tWqTF+FNeBzgTFlmc/J38uAYQzxEQWMxQViHSgvw6F3cLEfWpZI3ZJ5lSQtwMstV9Hy8z1gKcXL2+g55Uaqg2eOq1WuqxC9F57XgZkvZP9LMzMFZOIRqa3h79LJ8f9g4DJC8P4j71++8nooaX8U9h5H1h+AeiGCd6IkyOHrOLI9ljhZX+Mehnyt+nbtK4NoSzT3gXf0VKMOz6fLfhfe0ihMtO5KEQLS6DO0+3nU3CqK7HE9e9gVKgtG/hgw2D09CVP0tTsfU7paH7kXDZ3IGhAEewRUB9Q7/0wFvYMZZ+0lXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlNpFI3IWfdu3HXDdRN3r6rwyfRNA9adZRmLU5FNuso=;
 b=D+TkF4k9t31Trdx1CqXxwNlJy/JtZ0CVpjkHli4gIHagQHHM2B9empcTK2PZYEw3IzsIECoiVUS9zFiUZafOB/vAC5q/7GS6pMRi6E7c5kOBJoG+NI6OPW2jEx9wEQoFLSjdvm3mtntKNbwTJyRwehKZ9AqGdsi/yZV8pwPAgRYLuC0tAk+BYR7exuAfhnUCEckDRItk7zzwwsLYdZINubQ25b+5ApWZGbg+aMDTFpzHE1DHz0BBp68xiRBWpRuaqTzD2RBv2RL2eJqjOzTSqngMKm1EIg/jdJbTNgFiy4zC7hsrIdXYuZZr3OgJUmLo/jfG3LIVegy3Rb9uJ6fEdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlNpFI3IWfdu3HXDdRN3r6rwyfRNA9adZRmLU5FNuso=;
 b=BIvBKa1qC+btHmRJzSh2P6X4h9UJO2y8kNuTpOL104pb+qfUlBrY3vRkLHx9g5VkszKDfrqUVqh4KlMHuIfJv81YlmpBvLmMJsHvsPOgO8QtRvLjs7m8jZ5ZRrQiDP9cgpoY0Eq2Ke9vBXpMF28695rJRa4ODg1j1GznxThnr+s=
Received: from BN9PR03CA0081.namprd03.prod.outlook.com (2603:10b6:408:fc::26)
 by IA1PR10MB7516.namprd10.prod.outlook.com (2603:10b6:208:44f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 14:32:49 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:fc:cafe::49) by BN9PR03CA0081.outlook.office365.com
 (2603:10b6:408:fc::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 14:32:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 14:32:47 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 09:32:46 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 09:32:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 09:32:46 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CEWjXI2985438;
	Thu, 12 Mar 2026 09:32:45 -0500
Message-ID: <e027749c-95bc-4c2d-8e71-383e458986b3@ti.com>
Date: Thu, 12 Mar 2026 09:32:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v3 1/1] nnstreamer: Move test binaries
 to main package
To: Pratham Deshmukh <p-deshmukh@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>
References: <20260312130928.889341-1-p-deshmukh@ti.com>
 <20260312130928.889341-2-p-deshmukh@ti.com>
 <ffed25c0-dbdd-4388-b4ca-90b4efcc43d6@ti.com>
 <547ed737-dcd4-49aa-8c57-d346205417b3@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <547ed737-dcd4-49aa-8c57-d346205417b3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|IA1PR10MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: c6ad3f7e-89d0-45e7-8b1a-08de80443b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|7142099003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	1eg+S0KIpvqMQbi35021mVRMgGLrn8MiqTidGXdZ+fTw0KeDE3azHuiWM/XgmqqmbSbatREhwXg5h2lqNEXDueSA6o5wp4qvy2AkVOW9AqPP/CJVXPboAui9IWkXjW997KEbJiF1FEQxWxCNjLtLkFeERVyrJRwx1FOiWuTzTttN07j+tPH+ervyJhYm+kWYByFUWHlDf1aopkxOeE6jRW1KS6/LEMYtX+WxaBkyfJCT/Hqew1riTPQ901QYYUWXRoNWxB1xpDiOgvvORxdEWFGWJVYKpzQzarVpvSLv296Qh9qbQeGj9eSr+I8V6BVbimR3arL5iSpnKRI+P6KiCOmTTBZSSxZ+a8yaP2IcVg5jXFLvkYvX8NeVSNuearuyYNca8pGdxNZvIjKYtDeBdRoROkNoBww+4Wpz+X9gfH+DG/RzapOxELZiWAs5DJ9mRz1auKRP6yttWspzq4tgcH3XctGb1N8ypJTRxumhTeizoQcDl5Vw//xev8i3MRpjMa5fhXwdd+uwl+XgUttY1w/GhKu7xrLzb1Ko1cLr8NXiIqrNm6XqIxerVBf0rytDS9+0P3eVZnQyb+pgbvLdh32RimXE9JEQf/z6bNS31xcZtU6ioKDku/wpNoSGaeCVkxMuY4W9zS0yS/WNdnXMVSmfb+5TMAihKfoGpkx+sdOpvVYYNmUAPL8HzUK7IxxqPSXirgVz7VGadzLeg7AtltJLamasTP3SY6B6Q0UtyKRXA5fsoXVeX258A/NqlN+aYAzBvAwFf+Rjq/oSByyUFw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(7142099003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uv4MCCbIUzBg258t1bZ58F3uPuQUeY7MA7TlRAmq7lp2JBffyDWBba8zc/SC8Mq02ecjILH5tkvBYYJx+ROJHLc/r1y9KbIuGUw9LfEDb+HWycO/ZjTX+so5L0c2CSjpsavSO3w8G5KKroWR5G1Xmj7KkZHXVIGMZ1fLAAX2gpG+uQRW3qEtNnFcz5l2nKftl0l9ZxvMUsVxVdoQEY//Xf7wkzt7GH1lvFQnDM5srqyS84E2maQ76u80mN31NBQhXiIkJpz+rayRA2fzZfAF5ZLrLBkga0fQrCj9TO7Rlrrgt0c+rqlpihKxZ7HjNeux51ASDBMMp1BAJQdPaRVozGYANmfOW2gjPLLt7CoJ7gbLIHmLtMh5vh72tHQPsIhdURzeWhS3CBz1K4mp3qZ+bwl1Sc3hFAEwyH1/D0GuZlTslbGtWpoNsTps7F3vwj67
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:32:47.6085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ad3f7e-89d0-45e7-8b1a-08de80443b7b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7516
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 14:33:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17322

On 3/12/26 9:24 AM, Pratham Deshmukh wrote:
>=20
> On 12/03/26 7:17 pm, Andrew Davis wrote:
>> On 3/12/26 8:09 AM, Pratham Deshmukh wrote:
>>> Consolidate unittest executables into main nnstreamer
>>> package instead of separate nnstreamer- tests package to
>>> fix missing benchmark utilities.
>>>
>>> This resolves file packaging conflicts and ensures
>>> unittest_filter_onnxruntime is available for ONNX
>>> Runtime benchmarking without additional dependencies.
>>>
>>
>> Why can't ONNXRuntime just depend on the -test package?
>>
>> Also this commit content looks to be mostly around fixing
>> the "buildpaths" error, which isn't described in the commit
>> message at all..
>>
>> Andrew
>>
> Do you mean to just add runtime dependeny to pull in nnstreamer-tests pac=
kage?
>=20

Yes, the test programs belong in the `nnstreamer-tests` package, so whateve=
r
it is that depends on those tests should declare that package as a dependen=
cy.

Andrew

> I'll fix the commit, Thanks.
>=20
>>> Fixes: 319271fe5fc8bc3016b1eb765784076af666b61b ("nnstreamer: upgrade 2=
.4.4 -> 2.6.0")
>>>
>>> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>>> ---
>>> Change Logs:
>>> =C2=A0 v2 -> v3:
>>> =C2=A0 - Fix runitme dependencies issue for unittest_filter_onnxruntime=
.
>>> =C2=A0 - Upgrade recipe to make it QA compliant.
>>> =C2=A0 v1 -> v2:
>>> =C2=A0 - Added fix commit hash in the commit message.
>>>
>>> =C2=A0 ...ute-build-paths-from-generated-test-.patch | 42 +++++++++++++=
++++++
>>> =C2=A0 .../nnstreamer/nnstreamer_2.6.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++----
>>> =C2=A0 2 files changed, 48 insertions(+), 9 deletions(-)
>>> =C2=A0 create mode 100644 meta-arago-extras/recipes-multimedia/nnstream=
er/nnstreamer/0001-fix-Remove-absolute-build-paths-from-generated-test-.pat=
ch
>>>
>>> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer=
/0001-fix-Remove-absolute-build-paths-from-generated-test-.patch b/meta-ara=
go-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-fix-Remove-absolute=
-build-paths-from-generated-test-.patch
>>> new file mode 100644
>>> index 00000000..345b3eb2
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer/0001-f=
ix-Remove-absolute-build-paths-from-generated-test-.patch
>>> @@ -0,0 +1,42 @@
>>> +From a5f962b51431ac19c264b8b9baa78ff283a77efe Mon Sep 17 00:00:00 2001
>>> +From: Pratham Deshmukh <p-deshmukh@ti.com>
>>> +Date: Tue, 10 Mar 2026 15:23:05 +0530
>>> +Subject: [PATCH] fix: Remove absolute build paths from generated test =
files
>>> +
>>> +Replace meson.build_root() with relative paths in custom_filter_path
>>> +to prevent Yocto buildpaths QA errors. The generated unittest files
>>> +were embedding absolute build directory paths (e.g., /tmp/work/...)
>>> +as string literals, which Yocto's QA system correctly flags as a
>>> +build reproducibility issue.
>>> +
>>> +The runtime code already handles proper path resolution using
>>> +NNSTREAMER_SOURCE_ROOT_PATH environment variable or relative
>>> +fallbacks, so this change maintains full functionality
>>> +while eliminating embedded build paths.
>>> +
>>> +Fixes: QA Issue "contains reference to TMPDIR [buildpaths]" in
>>> +unittest_tizen_custom.cc and unittest_tizen_custom-set.cc
>>> +
>>> +Upstream-Status: Inappropriate [oe-specific]
>>> +
>>> +Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>>> +---
>>> + tests/nnstreamer_filter_extensions_common/meson.build | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/tests/nnstreamer_filter_extensions_common/meson.build b/t=
ests/nnstreamer_filter_extensions_common/meson.build
>>> +index ecd1878b..ba72ee20 100644
>>> +--- a/tests/nnstreamer_filter_extensions_common/meson.build
>>> ++++ b/tests/nnstreamer_filter_extensions_common/meson.build
>>> +@@ -9,7 +9,7 @@ tizen_apptest_deps =3D [
>>> + # Format for adding subplugin into extensions -
>>> + # [name, extension abbreviation, dependencies, model file name/folder=
 path/file path, test name]
>>> + extensions =3D []
>>> +-custom_filter_path =3D join_paths(meson.build_root(), 'tests', 'nnstr=
eamer_example',
>>> ++custom_filter_path =3D join_paths('tests', 'nnstreamer_example',
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 'libnnstreamer_customfilter_passthrough.' + s=
o_ext)
>>> + extensions +=3D [['custom', 'custom', nnstreamer_unittest_deps, custo=
m_filter_path, 'custom']]
>>> + extensions +=3D [['custom', 'custom', nnstreamer_unittest_deps, custo=
m_filter_path, 'custom-set']]
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer=
_2.6.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.=
0.bb
>>> index c62589ac..7bf64408 100644
>>> --- a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.=
bb
>>> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.6.0.=
bb
>>> @@ -3,7 +3,11 @@ DESCRIPTION =3D "NNStreamer is a set of Gstreamer plug=
ins that allow Gstreamer dev
>>> =C2=A0 LICENSE =3D "LGPL-2.1-only"
>>> =C2=A0 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc25e5c1949624d7189612=
7788f1ba590"
>>> =C2=A0 -SRC_URI =3D "git://github.com/nnstreamer/nnstreamer.git;branch=
=3Dmain;protocol=3Dhttps"
>>> +SRC_URI =3D " \
>>> + git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;protocol=3Dh=
ttps \
>>> + file://0001-fix-Remove-absolute-build-paths-from-generated-test-.patc=
h \
>>> +"
>>> +
>>> =C2=A0 SRCREV =3D "b970e9eff6bfb4e915463842422fe14bb2e53f84"
>>> =C2=A0 =C2=A0 # Only compatible with armv7a, armv7ve, and aarch64
>>> @@ -53,16 +57,9 @@ FILES:${PN} +=3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir}/gstreamer-1.0/*.so \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir}/nnstreamer/* \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${sysconfdir}/nnstreamer.ini \
>>> -"
>>> -INSANE_SKIP:${PN} +=3D "dev-so"
>>> -
>>> -PACKAGES =3D+ "${PN}-tests"
>>> -
>>> -FILES:${PN}-tests +=3D "\
>>> -=C2=A0=C2=A0=C2=A0 ${libdir}/nnstreamer/customfilters/* \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${bindir}/unittest-nnstreamer/* \
>>> =C2=A0 "
>>> -INSANE_SKIP:${PN}-tests +=3D "buildpaths"
>>> +INSANE_SKIP:${PN} +=3D "dev-so"
>>> =C2=A0 =C2=A0 FILES:${PN}-dev =3D "\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${includedir}/nnstreamer/* \
>>


