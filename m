Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B1CF30953
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:59:23 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42498.1772711954836128296
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 03:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=H/NSW6ly;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.40, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utUkdFn4PNxUFwr98AM9yB0hrS03cSMwUaffkC90UXYs1isqonNFng/K72ghrLL/1xqPz36oYT9/9q4hykgyKEqjel3LW7KQ7FxCRfFvyxPDSW18Sj0o3t69NOREram6+jrXoxLFeem/yBkHauDFrUuxNsSkRVo7qKB+1MKELXJ3gjkPbAueM85EfemwHW5MiCiUJC8c/+fPSjK06/AG857uOHnMGy0IqTYAw10zfDVdPuUNAVFMhTOs06xXWDVLGRMD5NPxHCL4/ebyeiFM3zFlfX0WUkOwMZvYwoUtK/T98qUojD7nMyiJZbcKZXlkbJLICyBz9nzGl+uP+tX1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c0rAB9F+APVojdgmbytQ7xEDGHh8Gt633RNXB5j8+A=;
 b=lYgWz5RKQ9R9iiCr1viEGA8KXYJgkCdcdAf0gFdZldkHRx0xgwC2BATsFLChBjW9b+KjR9TCosZIDyN0hizXZe+5615jcz4C1gh6r+eBwblIK+lluNYRJGbhM2AIi+JkKBoRLX0fpwEsaRMryprthr+TUEUhWNKh/+RKCNx9yXuRJVdGlkGutCwgmSzjW3b9d5w3PHorwLyuUtlhsr+tukcb4/8htbU3qfyGlOGgac4l77k649zBfBSBNSELrm1xZQi42HmPuEHDThbLfUHKSwV9fFf5mxfX4mh3zuExQ2IuOknAd69rd+BQ2rLl6fH1LZ8BDuQMc9rzuqrMgy6s4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c0rAB9F+APVojdgmbytQ7xEDGHh8Gt633RNXB5j8+A=;
 b=H/NSW6ly4lFHz4fObxuJMXBGXwamRZo1MCCGJt/OtLoqJhzo3FFPLNIqbWM3dn3zke4JkuehdWeFryDtihK9S6EXCjVerrInJwSN1Jl/TN8SLeht9y1KJ7b1ulxT3//CaFNaVt4jlQILxv5alJ4I8cGISMwprqmwdDXnP0E96jw=
Received: from SA9PR13CA0047.namprd13.prod.outlook.com (2603:10b6:806:22::22)
 by PH0PR10MB5684.namprd10.prod.outlook.com (2603:10b6:510:149::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 11:59:11 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::e6) by SA9PR13CA0047.outlook.office365.com
 (2603:10b6:806:22::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.17 via Frontend Transport; Thu,
 5 Mar 2026 11:59:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 11:59:11 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 05:59:10 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 05:59:10 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 05:59:10 -0600
Received: from [172.24.233.101] (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Bx7hx1798505;
	Thu, 5 Mar 2026 05:59:08 -0600
Message-ID: <c3dec9df-48ea-439c-b88b-cefa04ffc81f@ti.com>
Date: Thu, 5 Mar 2026 17:29:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2 2/2] onnxruntime:upgrade 1.20.1 to
 1.23.2
To: Andrew Davis <afd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <c-shilwant@ti.com>, <denys@konsulko.com>,
	<v-singh1@ti.com>, <khasim@ti.com>
References: <20260303081105.2111463-1-p-deshmukh@ti.com>
 <20260303081105.2111463-3-p-deshmukh@ti.com>
 <15b3b1ca-3ae9-43b5-a531-5a51fdf30a6a@ti.com>
Content-Language: en-US
From: Pratham Deshmukh <p-deshmukh@ti.com>
In-Reply-To: <15b3b1ca-3ae9-43b5-a531-5a51fdf30a6a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|PH0PR10MB5684:EE_
X-MS-Office365-Filtering-Correlation-Id: 19831e99-2d27-45cf-c5c1-08de7aae9d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|36860700016|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	t5EZDDwTrU+ImGGDs/WCDPOi/hR2c9T+WZ8wa3wfm6Pars5/hf/o21GrolpnT+Yc7p/mi1beJAQcZNujrtntA2uoTSU5YUIU37BsHd9JaKowDl7w2AYRIC/bVVdQf6UNJdke2CoQOMTx9Eb5C6aglzG5xyoSqmDdO1r76HBgr9DvTS2ax49PZQ+G89m3aOBuvy1ng9wR+mw74+z/nq7fOoBAEpCjMjZCToHnbnZcw/TDIywEaumbxZHxuqZa2SsvzOwkmdWo3FW0DJ9bwfR0HatIvFxUOkiZRYs3veutVMjtULHATZnZ7U9F6uHeZzOY2HhlZQFXY/6NynDjsLEdM7ZpFG40an39cxuEGAj53AxMN0ihfQ+6Mfr+1wg7j4PiQTIVzeUVDEu/xw70r9IGY+i1vM7bhOEZFVoO+Ny1OtOOaDDyxZ5nSWInkPkrCKJVWHzQ48zGKPZawejYMAUCtGqKBjCgYw9R4d9VR/FzIgQiu6Dn+KREWNWTVdHSDCLns8fEZhxXmJP84YVGwKrZFOt2I9V8tIyzZj2WBVx5snfX7L2xkr+Vv8dnIdlSnfe3UxOE5FgPQN199/+adASB1OgzKdx1gXHB2WOoOajuYbNdqFdLK1mVP1P0cJxNVeKKksZXKylo22oKfYi0ws2/IrtwWnl+ez3ctWzVNkuoTSdq5kpse0HVkKeGkIrxZ+5xJiifnwJJF0LfEQkuRda68aC0kU9uTcFCbp7ngGRohOs=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700016)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0zqoqALN7AoZ+hLREJesqzktMT0Az5uT5mBbm57TiW44QelHQ8/S5XI5rjT0Y8oDcK9wyEx/ye8sKknKbyxGbNH1KKz5WTqT6e34S4fWi8t15xRJ5QnTwOMFlrjMFJzay6PQqpoxX9jfWEoU4YrISCNRhMU5Hy/89kMjwbcyPCqWAxHTrTC+krpbsN5NAxB6pzKF/hslj9Xr4xCra6bw40LaP89uS0ivZFFVKLXscAf8ePU0Kgkoxl4e2aKPeDnxfygyiMkoIYxRkiznnxyEUfJfktQsSm1E7mxPRLzXGTs7IGhgpkunsULCtPryBZqaxYmvj3IGNPI/kxF7QuH2Tax4XfrKMOI99rW6M+jtIg49NgVCuP2tfhZRtXiZPxZDX42lIpL+6/SQuJNmpfU37ToEPiOmHeAxOFPeeqfb89qkX4uiOPHILZiNFdhaYM/B
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 11:59:11.2150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19831e99-2d27-45cf-c5c1-08de7aae9d2a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5684
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 11:59:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17228


On 03/03/26 7:59 pm, Andrew Davis wrote:
> On 3/3/26 2:11 AM, Pratham Deshmukh wrote:
>> We are migrating ONNXRuntime from v1.20.1 to the latest
>> stable version v1.23.2.
>>
>> Removed Patches (Fixed Upstream):
>> =C2=A0=C2=A0 =E2=80=A2 0001-Remove-executable-permission-bit-from-source=
-files.patch
>> =C2=A0=C2=A0=C2=A0=C2=A0 - Commit Link:=20
>> https://github.com/microsoft/onnxruntime/commit/392961ffaef52f5a51c230e2=
6df8c16492580160
>> =C2=A0=C2=A0 =E2=80=A2 0002-cmake-Fix-typo-in-option-text-s-buildings-bi=
ndings.patch
>> =C2=A0=C2=A0=C2=A0=C2=A0 - Commit Link:=20
>> https://github.com/microsoft/onnxruntime/commit/fd22509e3645a23e62c51680=
b534201c324d3342
>> =C2=A0=C2=A0 =E2=80=A2 0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-pat=
h-when-n.patch
>> =C2=A0=C2=A0=C2=A0=C2=A0 - Commit Link:=20
>> https://github.com/microsoft/onnxruntime/commit/49e94da68244fa51c28396d0=
642707121eacc527
>> =C2=A0=C2=A0 =E2=80=A2 0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-info=
rmation-.patch
>> =C2=A0=C2=A0=C2=A0=C2=A0 - Commit Link:=20
>> https://github.com/microsoft/onnxruntime/commit/3fb2dc73f53b84b3df81639e=
b6340c1bb5ec774d
>> =C2=A0=C2=A0 =E2=80=A2 0005-cmake-Print-out-result-of-find_package.patch
>> =C2=A0=C2=A0=C2=A0=C2=A0 - With the updated helper_functions.cmake this =
patch is no=20
>> longer needed.
>>
>> Added Patches (New Requirements):
>> =C2=A0=C2=A0 =E2=80=A2 0001-Added-the-missing-header-to-fix-uint32_t-com=
pilation.patch
>> =C2=A0=C2=A0=C2=A0=C2=A0 - Fixes missing stdint.h include causing uint32=
_t compilation=20
>> errors
>>
>> Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>> ---
>> =C2=A0 ...g-header-to-fix-uint32_t-compilation.patch | 27 +++++++
>> =C2=A0 ...ble-permission-bit-from-source-files.patch | 72 --------------=
-----
>> =C2=A0 ...-in-option-text-s-buildings-bindings.patch | 25 -------
>> =C2=A0 ...D_LIBRARY_PATH-to-search-path-when-n.patch | 32 ---------
>> =C2=A0 ...MAKE_CXX_FLAGS-in-build-information-.patch | 30 --------
>> =C2=A0 ...ake-Print-out-result-of-find_package.patch | 37 ----------
>> =C2=A0 ...untime_1.20.1.bb =3D> onnxruntime_1.23.2.bb} | 68 ++++++++++--=
------
>> =C2=A0 7 files changed, 64 insertions(+), 227 deletions(-)
>> =C2=A0 create mode 100644=20
>> meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Added-t=
he-missing-header-to-fix-uint32_t-compilation.patch
>> =C2=A0 delete mode 100644=20
>> meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Remove-=
executable-permission-bit-from-source-files.patch
>> =C2=A0 delete mode 100644=20
>> meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0002-cmake-F=
ix-typo-in-option-text-s-buildings-bindings.patch
>> =C2=A0 delete mode 100644=20
>> meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0003-ACL-Do-=
not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
>> =C2=A0 delete mode 100644=20
>> meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0004-Do-not-=
include-CMAKE_CXX_FLAGS-in-build-information-.patch
>> =C2=A0 delete mode 100644=20
>> meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0005-cmake-P=
rint-out-result-of-find_package.patch
>> =C2=A0 rename=20
>> meta-arago-extras/recipes-framework/onnxruntime/{onnxruntime_1.20.1.bb=20
>> =3D> onnxruntime_1.23.2.bb} (46%)
>>
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Added=
-the-missing-header-to-fix-uint32_t-compilation.patch=20
>> b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Added=
-the-missing-header-to-fix-uint32_t-compilation.patch=20
>>
>> new file mode 100644
>> index 00000000..21e0a301
>> --- /dev/null
>> +++=20
>> b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Added=
-the-missing-header-to-fix-uint32_t-compilation.patch
>> @@ -0,0 +1,27 @@
>> +From cb67823df8cfa19cf1c0c0ddd1b9aa29ee7773ba Mon Sep 17 00:00:00 2001
>> +From: Pratham Deshmukh <p-deshmukh@ti.com>
>> +Date: Thu, 12 Feb 2026 16:02:40 +0530
>> +Subject: [PATCH] Added the missing header to fix uint32_t=20
>> compilation error.
>> +
>> +Upstream-Status: Backport=20
>> [https://github.com/microsoft/onnxruntime/commit/d6e712c]
>> +
>> +Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
>> +---
>> + onnxruntime/core/common/semver.h | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/onnxruntime/core/common/semver.h=20
>> b/onnxruntime/core/common/semver.h
>> +index a07c24f016..98bb6a2cef 100644
>> +--- a/onnxruntime/core/common/semver.h
>> ++++ b/onnxruntime/core/common/semver.h
>> +@@ -3,6 +3,7 @@
>> +
>> + #pragma once
>> +
>> ++#include <cstdint>
>> + #include <optional>
>> + #include <string_view>
>> +
>> +--
>> +2.34.1
>> +
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Remov=
e-executable-permission-bit-from-source-files.patch=20
>> b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Remov=
e-executable-permission-bit-from-source-files.patch=20
>>
>> deleted file mode 100644
>> index b64e32ca..00000000
>> ---=20
>> a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0001-Remov=
e-executable-permission-bit-from-source-files.patch
>> +++ /dev/null
>> @@ -1,72 +0,0 @@
>> -From 626066499c34c524924302342fc071f32442caae Mon Sep 17 00:00:00 2001
>> -From: Andrew Davis <afd@ti.com>
>> -Date: Sun, 12 Jan 2025 12:48:49 -0600
>> -Subject: [PATCH] Remove executable permission bit from source files
>> -
>> -These are source files, not executables, do not set the executable
>> -permission bit on these files.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Andrew Davis <afd@ti.com>
>> ----
>> - onnxruntime/contrib_ops/cpu/utils/console_dumper.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
>> - onnxruntime/core/optimizer/bias_softmax_fusion.cc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> - onnxruntime/core/providers/acl/acl_execution_provider.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 0
>> - onnxruntime/core/providers/acl/acl_fwd.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 0
>> - onnxruntime/core/providers/acl/acl_provider_factory.cc=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 0
>> - onnxruntime/core/providers/acl/math/gemm.cc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 0
>> - onnxruntime/core/providers/acl/nn/batch_norm.cc=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> - onnxruntime/core/providers/acl/nn/batch_norm.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> - onnxruntime/test/optimizer/graph_transform_test.cc=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
>> - onnxruntime/test/optimizer/graph_transform_test_layernorm.cc | 0
>> - 10 files changed, 1 insertion(+)
>> - mode change 100755 =3D> 100644=20
>> onnxruntime/core/optimizer/bias_softmax_fusion.cc
>> - mode change 100755 =3D> 100644=20
>> onnxruntime/core/providers/acl/acl_execution_provider.h
>> - mode change 100755 =3D> 100644 onnxruntime/core/providers/acl/acl_fwd.=
h
>> - mode change 100755 =3D> 100644=20
>> onnxruntime/core/providers/acl/acl_provider_factory.cc
>> - mode change 100755 =3D> 100644=20
>> onnxruntime/core/providers/acl/math/gemm.cc
>> - mode change 100755 =3D> 100644=20
>> onnxruntime/core/providers/acl/nn/batch_norm.cc
>> - mode change 100755 =3D> 100644=20
>> onnxruntime/core/providers/acl/nn/batch_norm.h
>> - mode change 100755 =3D> 100644=20
>> onnxruntime/test/optimizer/graph_transform_test.cc
>> - mode change 100755 =3D> 100644=20
>> onnxruntime/test/optimizer/graph_transform_test_layernorm.cc
>> -
>> -diff --git a/onnxruntime/contrib_ops/cpu/utils/console_dumper.h=20
>> b/onnxruntime/contrib_ops/cpu/utils/console_dumper.h
>> -index 9ebc44f441..64bd2b7b18 100644
>> ---- a/onnxruntime/contrib_ops/cpu/utils/console_dumper.h
>> -+++ b/onnxruntime/contrib_ops/cpu/utils/console_dumper.h
>> -@@ -3,6 +3,7 @@
>> -
>> - #pragma once
>> - #include <string>
>> -+#include <iostream>
>> - #include "core/framework/ort_value.h"
>> - #include "core/framework/float16.h"
>> - #include "contrib_ops/cpu/utils/debug_macros.h"
>> -diff --git a/onnxruntime/core/optimizer/bias_softmax_fusion.cc=20
>> b/onnxruntime/core/optimizer/bias_softmax_fusion.cc
>> -old mode 100755
>> -new mode 100644
>> -diff --git a/onnxruntime/core/providers/acl/acl_execution_provider.h=20
>> b/onnxruntime/core/providers/acl/acl_execution_provider.h
>> -old mode 100755
>> -new mode 100644
>> -diff --git a/onnxruntime/core/providers/acl/acl_fwd.h=20
>> b/onnxruntime/core/providers/acl/acl_fwd.h
>> -old mode 100755
>> -new mode 100644
>> -diff --git a/onnxruntime/core/providers/acl/acl_provider_factory.cc=20
>> b/onnxruntime/core/providers/acl/acl_provider_factory.cc
>> -old mode 100755
>> -new mode 100644
>> -diff --git a/onnxruntime/core/providers/acl/math/gemm.cc=20
>> b/onnxruntime/core/providers/acl/math/gemm.cc
>> -old mode 100755
>> -new mode 100644
>> -diff --git a/onnxruntime/core/providers/acl/nn/batch_norm.cc=20
>> b/onnxruntime/core/providers/acl/nn/batch_norm.cc
>> -old mode 100755
>> -new mode 100644
>> -diff --git a/onnxruntime/core/providers/acl/nn/batch_norm.h=20
>> b/onnxruntime/core/providers/acl/nn/batch_norm.h
>> -old mode 100755
>> -new mode 100644
>> -diff --git a/onnxruntime/test/optimizer/graph_transform_test.cc=20
>> b/onnxruntime/test/optimizer/graph_transform_test.cc
>> -old mode 100755
>> -new mode 100644
>> -diff --git=20
>> a/onnxruntime/test/optimizer/graph_transform_test_layernorm.cc=20
>> b/onnxruntime/test/optimizer/graph_transform_test_layernorm.cc
>> -old mode 100755
>> -new mode 100644
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0002-cmake=
-Fix-typo-in-option-text-s-buildings-bindings.patch=20
>> b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0002-cmake=
-Fix-typo-in-option-text-s-buildings-bindings.patch=20
>>
>> deleted file mode 100644
>> index 88423190..00000000
>> ---=20
>> a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0002-cmake=
-Fix-typo-in-option-text-s-buildings-bindings.patch
>> +++ /dev/null
>> @@ -1,25 +0,0 @@
>> -From be67663e9a44d146033aeb97804145a60b4032db Mon Sep 17 00:00:00 2001
>> -From: Andrew Davis <afd@ti.com>
>> -Date: Thu, 16 Jan 2025 12:35:03 -0600
>> -Subject: [PATCH] [cmake] Fix typo in option text s/buildings/bindings
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Andrew Davis <afd@ti.com>
>> ----
>> - cmake/CMakeLists.txt | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/cmake/CMakeLists.txt b/cmake/CMakeLists.txt
>> -index d90a2a3550..e0cde678db 100644
>> ---- a/cmake/CMakeLists.txt
>> -+++ b/cmake/CMakeLists.txt
>> -@@ -77,7 +77,7 @@ option(onnxruntime_GENERATE_TEST_REPORTS "Enable=20
>> test report generation" OFF)
>> - option(onnxruntime_ENABLE_STATIC_ANALYSIS "Enable static analysis"=20
>> OFF)
>> - option(onnxruntime_USE_CUSTOM_STATIC_ANALYSIS_RULES "Use a custom=20
>> SDL Rule. It is mainly for our CI build" OFF)
>> - option(onnxruntime_REDIRECT_STATIC_ANALYSIS_OUTPUTS_TO_FILE "Use a=20
>> custom SDL Rule. It is mainly for our CI build" OFF)
>> --option(onnxruntime_ENABLE_PYTHON "Enable python buildings" OFF)
>> -+option(onnxruntime_ENABLE_PYTHON "Enable python bindings" OFF)
>> - # Enable it may cause LNK1169 error
>> - option(onnxruntime_ENABLE_MEMLEAK_CHECKER "Experimental: Enable=20
>> memory leak checker in Windows debug build" OFF)
>> - option(onnxruntime_USE_CUDA "Build with CUDA support" OFF)
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0003-ACL-D=
o-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch=20
>> b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0003-ACL-D=
o-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch=20
>>
>> deleted file mode 100644
>> index 75cb9b18..00000000
>> ---=20
>> a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0003-ACL-D=
o-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -From b1689f3f963f4c07d3329a838569ac4c2fa2bd5f Mon Sep 17 00:00:00 2001
>> -From: Andrew Davis <afd@ti.com>
>> -Date: Thu, 16 Jan 2025 12:38:13 -0600
>> -Subject: [PATCH] [ACL] Do not add LD_LIBRARY_PATH to search path=20
>> when not
>> - defined
>> -
>> -If LD_LIBRARY_PATH is not defined a blank "-L" is added to the
>> -link command. This causes the next object to be linked to get
>> -treated as if it was a search path and causes link failure.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Andrew Davis <afd@ti.com>
>> ----
>> - cmake/onnxruntime_providers_acl.cmake | 4 +++-
>> - 1 file changed, 3 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/cmake/onnxruntime_providers_acl.cmake=20
>> b/cmake/onnxruntime_providers_acl.cmake
>> -index e23d289271..19d41dc73f 100644
>> ---- a/cmake/onnxruntime_providers_acl.cmake
>> -+++ b/cmake/onnxruntime_providers_acl.cmake
>> -@@ -13,7 +13,9 @@
>> -=C2=A0=C2=A0=C2=A0=C2=A0 onnxruntime_common onnxruntime_framework onnx =
onnx_proto=20
>> ${PROTOBUF_LIB} flatbuffers::flatbuffers Boost::mp11 safeint_interface
>> -=C2=A0=C2=A0 )
>> -
>> --=C2=A0 target_link_libraries(onnxruntime_providers_acl=20
>> -L$ENV{LD_LIBRARY_PATH})
>> -+=C2=A0 if (DEFINED ENV{LD_LIBRARY_PATH})
>> -+=C2=A0=C2=A0=C2=A0 target_link_libraries(onnxruntime_providers_acl=20
>> -L$ENV{LD_LIBRARY_PATH})
>> -+=C2=A0 endif()
>> -=C2=A0=C2=A0 add_dependencies(onnxruntime_providers_acl=20
>> ${onnxruntime_EXTERNAL_DEPENDENCIES})
>> -=C2=A0=C2=A0 set_target_properties(onnxruntime_providers_acl PROPERTIES=
 FOLDER=20
>> "ONNXRuntime")
>> -=C2=A0=C2=A0 target_include_directories(onnxruntime_providers_acl
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0004-Do-no=
t-include-CMAKE_CXX_FLAGS-in-build-information-.patch=20
>> b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0004-Do-no=
t-include-CMAKE_CXX_FLAGS-in-build-information-.patch=20
>>
>> deleted file mode 100644
>> index e8f086a8..00000000
>> ---=20
>> a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0004-Do-no=
t-include-CMAKE_CXX_FLAGS-in-build-information-.patch
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -From 7ea6e35d3630f8c19080a0cb5a4a4c55c242a36b Mon Sep 17 00:00:00 2001
>> -From: Andrew Davis <afd@ti.com>
>> -Date: Thu, 16 Jan 2025 12:40:57 -0600
>> -Subject: [PATCH] Do not include CMAKE_CXX_FLAGS in build information=20
>> string
>> -
>> -While this information can be useful, it often includes information
>> -that may be specific to the build machine (like include paths with
>> -usernames, e.g. -I /home/myname/externalproject/fakeroot/inlcude).
>> -
>> -This causes issues for reproducible builds (resulting binaries will
>> -be different between different build machines).
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Andrew Davis <afd@ti.com>
>> ----
>> - cmake/CMakeLists.txt | 1 -
>> - 1 file changed, 1 deletion(-)
>> -
>> -diff --git a/cmake/CMakeLists.txt b/cmake/CMakeLists.txt
>> -index e0cde678db..e0d8fd0a17 100644
>> ---- a/cmake/CMakeLists.txt
>> -+++ b/cmake/CMakeLists.txt
>> -@@ -1439,7 +1439,6 @@ if (Git_FOUND)
>> -=C2=A0=C2=A0 string(APPEND ORT_BUILD_INFO "git-branch=3D${ORT_GIT_BRANC=
H},=20
>> git-commit-id=3D${ORT_GIT_COMMIT}, ")
>> - endif()
>> - string(APPEND ORT_BUILD_INFO "build type=3D${CMAKE_BUILD_TYPE}")
>> --string(APPEND ORT_BUILD_INFO ", cmake cxx flags: ${CMAKE_CXX_FLAGS}")
>> - configure_file(onnxruntime_config.h.in=20
>> ${CMAKE_CURRENT_BINARY_DIR}/onnxruntime_config.h)
>> - get_property(onnxruntime_GENERATOR_IS_MULTI_CONFIG GLOBAL PROPERTY=20
>> GENERATOR_IS_MULTI_CONFIG)
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0005-cmake=
-Print-out-result-of-find_package.patch=20
>> b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0005-cmake=
-Print-out-result-of-find_package.patch=20
>>
>> deleted file mode 100644
>> index 249aadee..00000000
>> ---=20
>> a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime/0005-cmake=
-Print-out-result-of-find_package.patch
>> +++ /dev/null
>> @@ -1,37 +0,0 @@
>> -From a73d9b9f4dba6d164e128d6c768d1b0a04e969ab Mon Sep 17 00:00:00 2001
>> -From: Andrew Davis <afd@ti.com>
>> -Date: Thu, 16 Jan 2025 12:47:27 -0600
>> -Subject: [PATCH] [cmake] Print out result of find_package
>> -
>> -A verbose only message is already printed that states the CMake will
>> -attempt to find a package using find_package():
>> -
>> -> Trying find_package(...) before FetchContent
>> -
>> -But it never prints if the package was found this way or not.
>> -Add this result message.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Andrew Davis <afd@ti.com>
>> ----
>> - cmake/external/helper_functions.cmake | 3 +++
>> - 1 file changed, 3 insertions(+)
>> -
>> -diff --git a/cmake/external/helper_functions.cmake=20
>> b/cmake/external/helper_functions.cmake
>> -index e3f2211f96..9ca6a967da 100644
>> ---- a/cmake/external/helper_functions.cmake
>> -+++ b/cmake/external/helper_functions.cmake
>> -@@ -138,9 +138,12 @@ macro(onnxruntime_fetchcontent_makeavailable)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unset(__cmake_fpArgs)
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if(${__cmake_contentNa=
me}_FOUND)
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 message(VERBOSE=
 "Found ${__cmake_contentName} with=20
>> find_package()")
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FetchConte=
nt_SetPopulated(${__cmake_contentName})
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FetchConte=
nt_GetProperties(${__cmake_contentName})
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue()
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else()
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 message(VERBOSE=
 "Could not find ${__cmake_contentName}=20
>> with find_package()")
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 endif()
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 endif()
>> -=C2=A0=C2=A0=C2=A0=C2=A0 else()
>> diff --git=20
>> a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb=
=20
>> b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.23.2.bb
>> similarity index 46%
>> rename from=20
>> meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
>> rename to=20
>> meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.23.2.bb
>> index a5026484..f47523ca 100644
>> ---=20
>> a/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.20.1.bb
>> +++=20
>> b/meta-arago-extras/recipes-framework/onnxruntime/onnxruntime_1.23.2.bb
>> @@ -4,33 +4,37 @@ HOMEPAGE =3D "https://www.onnxruntime.ai/"
>> =C2=A0 LICENSE =3D "MIT"
>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3D0f7e3b1308cb5c00b372a6e78835732d"
>> =C2=A0 -SRC_URI =3D "\
>> -=20
>> git://github.com/microsoft/onnxruntime.git;protocol=3Dhttps;branch=3Drel=
-1.20.1=20
>> \
>> -=20
>> git://github.com/HowardHinnant/date.git;protocol=3Dhttps;branch=3Dmaster=
;name=3Ddate;destsuffix=3D${S}/cmake/external/date=20
>> \
>> -=20
>> git://github.com/pytorch/cpuinfo.git;protocol=3Dhttps;branch=3Dmain;name=
=3Dcpuinfo;destsuffix=3D${S}/cmake/external/cpuinfo=20
>> \
>> -=20
>> git://github.com/google/flatbuffers.git;protocol=3Dhttps;branch=3Dmaster=
;name=3Dflatbuffers;destsuffix=3D${S}/cmake/external/flatbuffers=20
>> \
>> -=20
>> git://github.com/dcleblanc/SafeInt.git;protocol=3Dhttps;branch=3Dmaster;=
name=3Dsafeint;destsuffix=3D${S}/cmake/external/safeint=20
>> \
>> -=20
>> git://gitlab.com/libeigen/eigen.git;protocol=3Dhttps;branch=3D3.4;name=
=3Deigen;destsuffix=3D${S}/cmake/external/eigen=20
>> \
>> -=20
>> git://github.com/google/nsync.git;protocol=3Dhttps;branch=3Dmaster;name=
=3Dnsync;destsuffix=3D${S}/cmake/external/nsync=20
>> \
>> -"
>> +SRC_URI =3D "\
>> +=20
>> git://github.com/microsoft/onnxruntime.git;protocol=3Dhttps;branch=3Drel=
-1.23.2=20
>> \
>> +=20
>> git://github.com/HowardHinnant/date.git;protocol=3Dhttps;branch=3Dmaster=
;name=3Ddate;destsuffix=3D${S}/_deps/date-src=20
>> \
>
> These used to be extracted to ${S}/cmake/external/x and now you=20
> extract them to ${S}/_deps/x,
> I do like the new location, but it might reduce the churn in this one=20
> patch if you moved
> their destination in a standalone patch first.
>
This is something that I observed while building on my host. All these=20
dependencies were extracted in ${S}/_deps/x so maintained the same in=20
the recipe.
 >but it might reduce the churn in this one patch if you moved their=20
destination in a standalone patch >first

Are there any benefits in doing so?

>> +=20
>> git://github.com/pytorch/cpuinfo.git;protocol=3Dhttps;branch=3Dmain;name=
=3Dcpuinfo;destsuffix=3D${S}/_deps/pytorch_cpuinfo-src=20
>> \
>> +=20
>> git://github.com/google/flatbuffers.git;protocol=3Dhttps;branch=3Dmaster=
;name=3Dflatbuffers;destsuffix=3D${S}/_deps/flatbuffers-src=20
>> \
>> +=20
>> git://github.com/dcleblanc/SafeInt.git;protocol=3Dhttps;branch=3Dmaster;=
name=3Dsafeint;destsuffix=3D${S}/_deps/safeint-src=20
>> \
>> +=20
>> git://github.com/eigen-mirror/eigen.git;protocol=3Dhttps;branch=3Dmaster=
;name=3Deigen;destsuffix=3D${S}/_deps/eigen3-src=20
>> \
>> +=20
>> git://github.com/google/nsync.git;protocol=3Dhttps;branch=3Dmaster;name=
=3Dnsync;destsuffix=3D${S}/_deps/google_nsync-src=20
>> \
>
> I thought new versions of onnxruntime didn't need google-nsync anymore?
>
Removed this. Will update in v3 series.
>> +=20
>> git://github.com/boostorg/mp11.git;protocol=3Dhttps;branch=3Dmaster;name=
=3Dmp11;destsuffix=3D${S}/_deps/mp11-src=20
>> \
>> +=20
>> git://github.com/dmlc/dlpack.git;protocol=3Dhttps;branch=3Dmain;name=3Dd=
lpack;destsuffix=3D${S}/_deps/dlpack-src=20
>> \
>> +=20
>> git://github.com/abseil/abseil-cpp.git;protocol=3Dhttps;branch=3Dlts_202=
5_05_12;name=3Dabseil-cpp;destsuffix=3D${S}/_deps/abseil_cpp-src=20
>> \
>> +=20
>> git://github.com/google/re2.git;protocol=3Dhttps;branch=3Dmain;name=3Dre=
2;destsuffix=3D${S}/_deps/re2-src=20
>> \
>
> Tabs are used everywhere else in this file, use them for this list=20
> too. (matches
> how it was before also)
>
ok
>> +"
>> =C2=A0 SRC_URI +=3D "\
>> - file://0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch \
>> -=20
>> file://0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch \
>> -=20
>> file://0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch \
>> -=C2=A0=C2=A0=C2=A0 file://0005-cmake-Print-out-result-of-find_package.p=
atch \
>> - file://0001-Remove-executable-permission-bit-from-source-files.patch \
>> +=20
>> file://0001-Added-the-missing-header-to-fix-uint32_t-compilation.patch \
>> =C2=A0 "
>> =C2=A0 =C2=A0 SRCREV_FORMAT =3D "default"
>> -SRCREV =3D "5c1b7ccbff7e5141c1da7a9d963d660e5741c319"
>> +SRCREV =3D "a83fc4d58cb48eb68890dd689f94f28288cf2278"
>> =C2=A0 SRCREV_date =3D "6e921e1b1d21e84a5c82416ba7ecd98e33a436d0"
>> -SRCREV_cpuinfo =3D "ca678952a9a8eaa6de112d154e8e104b22f9ab3f"
>> +SRCREV_cpuinfo =3D "8a1772a0c5c447df2d18edf33ec4603a8c9c04a6"
>> =C2=A0 SRCREV_flatbuffers =3D "0100f6a5779831fa7a651e4b67ef389a8752bd9b"
>> =C2=A0 SRCREV_safeint =3D "4cafc9196c4da9c817992b20f5253ef967685bf8"
>> -SRCREV_eigen =3D "e7248b26a1ed53fa030c5c459f7ea095dfd276ac"
>> +SRCREV_eigen =3D "1d8b82b0740839c0de7f1242a3585e3390ff5f33"
>> =C2=A0 SRCREV_nsync =3D "13de152c2a1cd73ff4df97bd2c406b6d15d34af3"
>> +SRCREV_mp11 =3D "0a0b5fb001ce0233ae3a6f99d849c0649e5a7361"
>> +SRCREV_dlpack =3D "5c210da409e7f1e51ddf445134a4376fdbd70d7d"
>> +SRCREV_abseil-cpp =3D "bc257a88f7c1939f24e0379f14a3589e926c950c"
>> +SRCREV_re2 =3D "6dcd83d60f7944926bfd308cc13979fc53dd69ca"
>> =C2=A0 -# Only compatible with armv7a, armv7ve, and aarch64
>> +#Only compatible with armv7a, armv7ve, and aarch64
>
> Unneeded change.
>
Will fix this.
>> =C2=A0 COMPATIBLE_MACHINE =3D "(^$)"
>> =C2=A0 COMPATIBLE_MACHINE:aarch64 =3D "(.*)"
>> =C2=A0 COMPATIBLE_MACHINE:armv7a =3D=20
>> "${@bb.utils.contains("TUNE_FEATURES","neon","(.*)","(^$)",d)}"
>> @@ -38,11 +42,9 @@ COMPATIBLE_MACHINE:armv7ve =3D=20
>> "${@bb.utils.contains("TUNE_FEATURES","neon","(.*)"
>> =C2=A0 =C2=A0 DEPENDS +=3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 onnx \
>> -=C2=A0=C2=A0=C2=A0 abseil-cpp \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 protobuf \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 protobuf-native \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 boost \
>> -=C2=A0=C2=A0=C2=A0 re2 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nlohmann-json \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 microsoft-gsl \
>> =C2=A0 "
>> @@ -78,22 +80,26 @@ PACKAGECONFIG[armnn] =3D=20
>> "-Donnxruntime_USE_ARMNN=3DON, -Donnxruntime_USE_ARMNN=3DOFF,
>> =C2=A0 PACKAGECONFIG[armnn-relu] =3D "-Donnxruntime_ARMNN_RELU_USE_CPU=
=3DON,=20
>> -Donnxruntime_ARMNN_RELU_USE_CPU=3DOFF"
>> =C2=A0 PACKAGECONFIG[armnn-bn] =3D "-Donnxruntime_ARMNN_BN_USE_CPU=3DON,=
=20
>> -Donnxruntime_ARMNN_BN_USE_CPU=3DOFF"
>> =C2=A0 -EXTRA_OECMAKE:append =3D " \
>> -=C2=A0=C2=A0=C2=A0 -DFETCHCONTENT_FULLY_DISCONNECTED=3DON \
>> -=C2=A0=C2=A0=C2=A0 -DFETCHCONTENT_SOURCE_DIR_DATE=3D${S}/cmake/external=
/date \
>> -=20
>> -DFETCHCONTENT_SOURCE_DIR_PYTORCH_CPUINFO=3D${S}/cmake/external/cpuinfo =
\
>> - -DFETCHCONTENT_SOURCE_DIR_PYTORCH_CLOG=3D${S}/cmake/external/cpuinfo \
>> -=20
>> -DFETCHCONTENT_SOURCE_DIR_FLATBUFFERS=3D${S}/cmake/external/flatbuffers =
\
>> - -DFETCHCONTENT_SOURCE_DIR_SAFEINT=3D${S}/cmake/external/safeint \
>> -=C2=A0=C2=A0=C2=A0 -DFETCHCONTENT_SOURCE_DIR_EIGEN=3D${S}/cmake/externa=
l/eigen \
>> - -DFETCHCONTENT_SOURCE_DIR_GOOGLE_NSYNC=3D${S}/cmake/external/nsync \
>> -"
>> =C2=A0 +EXTRA_OECMAKE:append =3D " \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFETCHCONTENT_FULLY_DISCONNECTED=3DON \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFETCHCONTENT_SOURCE_DIR_DATE=3D${S}/_d=
eps/date-src \
>> +=20
>> -DFETCHCONTENT_SOURCE_DIR_PYTORCH_CPUINFO=3D${S}/_deps/pytorch_cpuinfo-s=
rc=20
>> \
>> +=20
>> -DFETCHCONTENT_SOURCE_DIR_PYTORCH_CLOG=3D${S}/_deps/pytorch_cpuinfo-src =
\
>> + -DFETCHCONTENT_SOURCE_DIR_FLATBUFFERS=3D${S}/_deps/flatbuffers-src \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFETCHCONTENT_SOURCE_DIR_SAFEINT=3D${S}=
/_deps/safeint-src \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFETCHCONTENT_SOURCE_DIR_EIGEN3=3D${S}/=
_deps/eigen3-src \
>> + -DFETCHCONTENT_SOURCE_DIR_GOOGLE_NSYNC=3D${S}/_deps/google_nsync-src \
>> + -DFETCHCONTENT_SOURCE_DIR_ABSEIL_CPP=3D${S}/_deps/abseil_cpp-src \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFETCHCONTENT_SOURCE_DIR_MP11=3D${S}/_d=
eps/mp11-src \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFETCHCONTENT_SOURCE_DIR_DLPACK=3D${S}/=
_deps/dlpack-src \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DFETCHCONTENT_SOURCE_DIR_RE2=3D${S}/_de=
ps/re2-src \
>> +"
>> =C2=A0 EXTRA_OECMAKE:append =3D " \
>> -DONNX_CUSTOM_PROTOC_EXECUTABLE=3D${STAGING_BINDIR_NATIVE}/protoc \
>> -Donnx_SOURCE_DIR=3D${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR} \
>> -DPython_INCLUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
>> -=C2=A0=C2=A0=C2=A0 --compile-no-warning-as-error \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --compile-no-warning-as-erro=
r \
>
> Random incorrect whitespace change. Please review your commits for these
> in the future before sending.
>
> Andrew
>
Thanks Andrew. I'll make the changes in v3.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --log-level=3DVERBOSE \
>> =C2=A0 "
>

