Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D52EB7EDD
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 12:32:55 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17039.1772627566744002767
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 04:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=hXlud+lw;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.26, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBd0pgx+YfC83phPqRvSHA5Z9PUJQltm0w6su4uci8taHk88pNzl6qqRg/bIJTa6nU7fnTLPXuoViA8OMC7Js19qwFBhCAJE5ED74a6+z3CNBQxim0TcMFYltnOsatpydvpC0ItonmyCyA4ME6lbtdZ0XZa/TVzz0AKkfHpOTdmOFYLu5wrmzDNuZiPhipeHC4ZTOy2pcm/1TSbcC4ESflCVqGqvtZ84uPQLkYHshDtATFyUEe9y4FtHiZWobYdYBS6u7IKOARYSTushL/V6VH4Wa3J0m+m7fB2hGQKEnVU0lM/yfWSne6V1GXKbsw9mL3CbnJDVH/DwpGXr2d95Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSbUogfuuuAS/MKEOUsMSAnO9Z2+6w5HSDWuHwa20RY=;
 b=cUzEaCuerWAjOkNlPDGLvYSTMLOZVlRGzUDXykjxVSjGguA6WN5nFHRNlqG1Hc/RUrtZDRB4S5UE8X1qjPxyHqwpvbLl+PDrQ8gspMBjyxMHPN2zkOJVvjGRELazhCjdvZD0o54HZN7ZAvg/cgl3dpuBxyTPMBG3g/bF7kDE2IGNKeOlggQ+ORtphstbdLX2A8RZuXAXP7ZBPBU+bJ3VSYU8ALdYusIdYyspu2pGAe2S3cF6zA03CnOkBwUCFYTzxEk3yE1ie5Z5qgyGIfNsaOsoQQIl16zPf2iwy2h0GzHymjxtmtLouUwtyQVGVrvB6uf5luu01zcLU6xG54bnlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSbUogfuuuAS/MKEOUsMSAnO9Z2+6w5HSDWuHwa20RY=;
 b=hXlud+lw5nSCPINcm8/Ijbe2+CPmxRBFGbm6o2l8WI3BcQo8uMWeELDrp1z89oTDSZmLvp+Tkw/QRngvGS7q6qlJtsvL2sBZrIdBV4HLk5MZjJ5EB+A+KK5MQKxXr5X+LZmEKXRRI2UiiXbe4z8Tgpef/uQVRiG2XaRSKxpVQkY=
Received: from BN1PR10CA0030.namprd10.prod.outlook.com (2603:10b6:408:e0::35)
 by CY5PR10MB5913.namprd10.prod.outlook.com (2603:10b6:930:2f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 12:32:42 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:e0:cafe::29) by BN1PR10CA0030.outlook.office365.com
 (2603:10b6:408:e0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 12:32:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Wed, 4 Mar 2026 12:32:40 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 06:32:25 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 06:32:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 06:32:25 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624CWMFo4050563;
	Wed, 4 Mar 2026 06:32:23 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH 0/4] Migrate GP AI Stacks
Date: Wed, 4 Mar 2026 18:02:17 +0530
Message-ID: <20260304123221.1450993-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|CY5PR10MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c9fb7d2-b0e3-4754-d749-08de79ea2056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|34020700016|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: 
	N0vw+N7yYBzCAij4PeXhpryTBfOpVTmUpeAsErkIOYl3Ksie6UF7OzXO7nYtVsEAG4UvW9S1HQ3q/i4hVwVQn16mbJmSHNw6CfNgFoAoYydP4whBylXrPSaEj90ymfO4QSXjK6UPB7+xUZ8+RYAC9UBrVcRASHBIKQVyy0l7hmRJ1fRZLYb3M83I3Q+NbH0GDSccEBXe8/sMlwIgL1olIPc05FBg6B/UCejkmsYCz1ZBM6J/ii9B5hyRsIZROjMZ2Qi18XeKlU4HF4N/73utZJ8+4WhHM8cLjKEB/7rSKdUXTzcroxizfomTpoh0VxoqiKDSh+VXXbciKY5V6CKhx4xvPV5PBou3jrO1h6GeyAHN41sNBrdADVoc9UGB7s2TGf/qKnlVy36/tjYlbW+DNkCpoVv4i8ZwTIPPZU110v8BfvSQwEdBUV0IMWRUcA0AYOsvVQ+lPV7lXRia4+eqf10wHGaX1zsMlM+HzhdQBc59j9shWJF3lcT/+2CbOrKUDc+TKWC6PcVprOIyoT2H6ppj4R/yJ6jm06NIohvAny0aJCSYqPYZoG2uNxpk0N6h+wRS4YOKAiWCsZ5alPUaalJvILZx666Jaw1jvOmTUQCBCruaqLbH4MSvUIkc5HmZc4GsW/nzeeO3Ikk3JM35fojrXXUmt2kYcIolBH5cvhKUAM6zB7x/T/bAMEcqeLanY+XTqv3CM4ul7/r7cqDjOA0bWOgVkREkugN8xLnLyGo=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(34020700016)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gW6buLKXxZHi0eJEXD9FkNs6G0JVU97JciRMbVKh7pVZZ6MDDjXJ+WM/rdWFUHy12O5aenDNfh6OXdYCImi/mmtQeho1N6fWE3HyuPhw5aWwILgWqGNdtce2tqpvYFUA0SSleTsEaUobdC2OcrwVPxYgC/Ta8pndzsWe9oA7xdfg5KE4Mof4u8tr6fGPHnf1bolz8jfAF3eUNhKdlTT/lvJhbt9LwTtX50PirHxjlwDHzV+PgdbVmxQt77oT3hPuqt0mLAMaS3ZvbZjUQXXKOUr7LeuH+o9rqHpWgGEyBb5JN4+IwoozEpiNgcNie9PEGAst24d9D9nKg2cdwqi077t5FJreDM4thoQT93q93bqmOr+X8qQ894AFapyYdSOEYGF+XSRjrFw84UGOz5rRpELoavZSRHdSUtq5YEjoVDgGzllSw4InFRr7qREGtC6W
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 12:32:40.3900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9fb7d2-b0e3-4754-d749-08de79ea2056
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5913
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Mar 2026 12:32:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17215

Hello Team,

This patch series provides an upgrade of the ML framework
stack in meta-arago, bringing all components to their latest stable
versions. The upgrades are ordered by dependency hierarchy to ensure
proper build compatibility:

1. ARM Compute Library: v24.12 =E2=86=92 v52.07
2. ARM NN: v24.11 =E2=86=92 v26.01
3. TensorFlow Lite: v2.18.0 =E2=86=92 v2.20.0
4. nnstreamer: v2.4.4 =E2=86=92 v2.6.0

### Benchmarking Results:

 - arm-compute-library
   - https://gist.github.com/PrathamTI/7031b8646dec1887f8375fc886a5321d
   - https://gist.github.com/PrathamTI/d051afea17832175bdce65907b2d07a1
=20
 - tensorflow-lite
   - With XNNPack Enabled=20
     - https://gist.github.com/PrathamTI/54978841a77c58fbd4ca567f03e890df
   - With XNNPack Disabled=20
     - https://gist.github.com/PrathamTI/096ce1ed02d5577a7f44bc1c7f6b2569

 - nnstreamer
   - https://gist.github.com/PrathamTI/fe06aacff9ad69f5e7c6ca6c04de1808

Pratham Deshmukh (4):
  arm-compute-library: upgrade 24.12 -> 52.07
  armnn: upgrade v24.11 to v26.01
  tensorflow-lite: upgrade 2.18.0 -> 2.20.0
  nnstreamer: upgrade 2.4.4 -> 2.6.0

 ...NABLE_NEON-in-code-for-checking-NEO.patch} |  72 ++---
 ...-indention-in-cmake-generator-script.patch | 130 ---------
 ...ENABLE_SVE-in-code-for-checking-SVE.patch} | 117 ++++-----
 ...ce-files-at-library-definition-time.patch} | 246 ++++++++++--------
 .../0004-Allow-ARMv7-builds-using-CMake.patch | 174 +++++++++++++
 ...ptions-for-SVE-SVE2-and-BF16-support.patch | 112 --------
 ...mbol-error-when-building-TensorInfo.patch} |  24 +-
 ...SVE2-support-to-be-disabled-in-CMake.patch |  91 -------
 .../0006-Remove-TARGET-dependency.patch       |  58 +++++
 .../0007-Allow-ARMv7-builds-using-CMake.patch |  86 ------
 ...rate-generic-library-name-instead-of.patch |  33 +++
 .../0008-Add-FP16-source-path.patch           |  28 ++
 ..._24.12.bb =3D> arm-compute-library_52.07.bb} |  56 ++--
 .../armnn/{armnn_24.11.bb =3D> armnn_26.01.bb}  |  10 +-
 .../flatbuffers/flatbuffers-arago.inc         |   8 +
 .../flatbuffers/flatbuffers.bbappend          |   4 +
 .../protobuf/protobuf-arago.inc               |  18 ++
 .../protobuf/protobuf_%.bbappend              |   5 +
 ...te_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} |  52 ++--
 ...nstreamer_2.4.4.bb =3D> nnstreamer_2.6.0.bb} |   2 +-
 20 files changed, 620 insertions(+), 706 deletions(-)
 rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/{0002-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch =
=3D> 0001-Use-ARM_COMPUTE_ENABLE_NEON-in-code-for-checking-NEO.patch} (58%)
 delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0001-fix-Fix-indention-in-cmake-generator-script.patch
 rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/{0003-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE-.patch =
=3D> 0002-Use-ARM_COMPUTE_ENABLE_SVE-in-code-for-checking-SVE.patch} (67%)
 rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/{0004-Add-source-files-at-library-definition-time.patch =3D> 0003-A=
dd-source-files-at-library-definition-time.patch} (24%)
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0004-Allow-ARMv7-builds-using-CMake.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0005-Add-CMake-options-for-SVE-SVE2-and-BF16-support.pa=
tch
 rename meta-arago-extras/recipes-devtools/arm-compute-library/arm-compute-=
library/{0008-Fix-undefined-symbol-error-when-building-TensorInfo.patch =3D=
> 0005-Fix-undefined-symbol-error-when-building-TensorInfo.patch} (68%)
 delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0006-Allow-SVE-and-SVE2-support-to-be-disabled-in-CMake=
.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0006-Remove-TARGET-dependency.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0007-Allow-ARMv7-builds-using-CMake.patch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0007-cmake-Generate-generic-library-name-instead-of.pat=
ch
 create mode 100644 meta-arago-extras/recipes-devtools/arm-compute-library/=
arm-compute-library/0008-Add-FP16-source-path.patch
 rename meta-arago-extras/recipes-devtools/arm-compute-library/{arm-compute=
-library_24.12.bb =3D> arm-compute-library_52.07.bb} (58%)
 rename meta-arago-extras/recipes-devtools/armnn/{armnn_24.11.bb =3D> armnn=
_26.01.bb} (88%)
 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuff=
ers-arago.inc
 create mode 100644 meta-arago-extras/recipes-devtools/flatbuffers/flatbuff=
ers.bbappend
 create mode 100644 meta-arago-extras/recipes-devtools/protobuf/protobuf-ar=
ago.inc
 create mode 100644 meta-arago-extras/recipes-devtools/protobuf/protobuf_%.=
bbappend
 rename meta-arago-extras/recipes-framework/tensorflow-lite/{tensorflow-lit=
e_2.18.0.bb =3D> tensorflow-lite_2.20.0.bb} (86%)
 rename meta-arago-extras/recipes-multimedia/nnstreamer/{nnstreamer_2.4.4.b=
b =3D> nnstreamer_2.6.0.bb} (97%)

--=20
2.34.1


