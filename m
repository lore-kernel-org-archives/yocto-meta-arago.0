Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0766E67A93
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 08:11:26 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13605.1772525476842853953
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 00:11:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=pmpbINj/;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.37, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXZg6c+MDfYw4hE2FkjXn3tBQnXKtqWT2DZzfDFm39IyGnd1/7q6+TewH/5KO/u5ZjZ331cM7bxe+JTcrpCSGKt2Hyk48KTR5tt8RXGHR6Wg42VuXbHlslsxfdDTerQO1qyFwBa4gql2YZqkAZKy0wZ4tBVEdHjRf+nXXBzXqYdrJ/snT3VUfv/mjECgcb8PdMkw2hnSOqhrF3WDKYIXxng34VObiuFmaLD+1aOHWqVs7JoXijuM466YzfVZHaP60YN4m65Zbzu743Q5pIKrqHF+vsm0YTWbQozxBv7FNUx7/8TpCgaZjtP66EP44FEw9zmpoiVD1kHXYTFfwF8gmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUQSOIpB0JVN0U3N+RXHKIM4xdPIdgpUbRFMZcMM8XM=;
 b=cCDFbstEshPSQbcSXlwRtxxYrAsY6NaxH2clT3TM9EXiq0XcjgRl5jWtM8vjRygBuY6ETcqyRy4nHRF/9bCm4yYsciTBHAIMhdcF1LWTg66XwQdCSLXXApW5rIYpDeRNBO+H/Putatl4ibOPFuORtnWOBBQ2y6GU3nlcCGMDdjeGKPTfy9HPCKlYRlm5IX1poi+tqg/UV6v/UYJjpOQI3s8KRjG43XuH3lq5khOIKVeqt1h4JZemmqe+p+MiF0pE01EOVUeAluIvKAwDvZ08aXGFgDi0MeCn3FtRQT56kCHXQM0YIQjm+uJQgG8tWFf8y1ebJfvurFTqzjz25pfIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUQSOIpB0JVN0U3N+RXHKIM4xdPIdgpUbRFMZcMM8XM=;
 b=pmpbINj/GsxqbOK8KuINPqatuHZ2VC4Sr533SUGbh5yjc0nGiFPVms/AvAdOfJ/6Eb793eXghKmqxi/2ryL9mCAftFIPiFhBPNa/ZmlJusadKs1/PuSF6n7AJTWRMeBkTZDh5y8eu0DQnxTUK5tDevdrADnL5BxtpG81yoLx7NY=
Received: from BYAPR06CA0036.namprd06.prod.outlook.com (2603:10b6:a03:d4::49)
 by DS0PR10MB6125.namprd10.prod.outlook.com (2603:10b6:8:c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Tue, 3 Mar
 2026 08:11:13 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:d4:cafe::a6) by BYAPR06CA0036.outlook.office365.com
 (2603:10b6:a03:d4::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Tue,
 3 Mar 2026 08:11:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Tue, 3 Mar 2026 08:11:13 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 02:11:09 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 02:11:09 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 02:11:09 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6238B6GG2262442;
	Tue, 3 Mar 2026 02:11:07 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <reatmon@ti.com>, <c-shilwant@ti.com>, <denys@konsulko.com>,
	<v-singh1@ti.com>, <khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v2 0/2] Migrate ONNX framework v1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
Date: Tue, 3 Mar 2026 13:41:03 +0530
Message-ID: <20260303081105.2111463-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|DS0PR10MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cdc4120-3001-4248-1306-08de78fc6fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info: 
	8x/I90G2CsdTA7LzNFszmx+IpuoTvKJaAFdnSqnIdrWuxiVmJK6Sw/g3cisWle1xFTxfX15VXV7hDYpPS59pibLmFDVR+IhsmTNUWcMe9+KFUqsudibhhw+jv3eykb0XzJJZ8bfnm3Qn8F1/GiHMPhQr/vnj2ZM+hRXwCyy55hJLKnSn8ibNsuUziZwZn9+YkojMHDChrrh3HGwzaTcah05YkULicGnzY0/rA9FHqxhK4GbQr1sBoMBRLPWqEV7gAZjytiP5Il2xioRNWlTyrZcXTRkyKhCC8AwSi0XJwn2KGBzZic3Rl57+Hr/FIFyiFRG2ByU8/vEzUBphzztpmSEQPJRruPOdIer3I6/x8pTxwFGledBzEyR2n1GBIrezR8dIPYBS7hbekEQ5Hc7QWGhBf2NPLSQ0a6Mrq2vS1X5syU3g3jAFYaqJrhfJzdKL6nq+jJz5dqPircylLeoWqI3f8hBqDSqy5ATG5hi95coRptItFAAunemCwLGodJHhgUSg+ziAOBlhJg8vbctxVO6TL6cmGV/t/bS7wqA6bWD33/RTH5fj7E8StfciEDJyhpOi/4nDk+MZ2AmiyD2siS/EJilgQhHVSIVtKBuUIzL6TNv3wDrq2VzXOofnVgqDOj6Is1dHPYzTaTvM+TQmaElLpdWWGUqk5ShN/labUyY3R6ncZ+nHkm7NOUi8/ALSq4a4/7cDkq/BOnIMtLMTVwN87NzBQs6zCMhesbJrnXrQyJHAlBWPerQ/r+i5O07Kcfe6KDXaukISm24Tvm5PufKFN286bFeJdMtnBIvu7FM=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	X2C5IDQHY3N3G/XKwStpZO4KUvC7AhScnIkq0Xpd496v7GXY0dTXkU09x1mSl4DyeBNYIkjkrsFRJb4vTbbCOpchBgmQWtnpV7mtTYc712Sr321GuhraoNmBfH9V31rgsCFKNMw0Sy/kt3deoCItxwo7yxWatkzFlk+aAlYxuv7+Nqs/2XUE03WF5jK5Ey9xqztBSnPEbvagXdHsKYqOURAG40SIL/Id0+LTu2Zftzr8lIggnTDUCorevY3wDif4AijLbAgSlLBiPqYuc3hHuxg1h8MlZrYjH4XT8BhbXnonuXXuBRQDfas28We28GmoQR6AiuxBc66+0PEZLt3eZX+1hAxytvWwGC+Re8D+3sX2OF5bfjMfr7KCYDKpU0z5B0N7pfj2SMQ7783MJPymoiR68+CPBRp4WkUhFnyA0afxPEI60UVj4EPK3ae8jMWp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 08:11:13.6476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdc4120-3001-4248-1306-08de78fc6fe9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6125
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 08:11:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17186

Hello Team,

This series migrates ONNX and ONNXRUNTIME to the latest stable=20
version ONNX v1.18.0 and ONNXRUNTIME v1.23.2.=20

Benchmarking Results: https://gist.github.com/PrathamTI/e362321e3cb8eae86c7=
22c41d9c27ae2

Build Logs:
 - ONNX: https://gist.github.com/PrathamTI/e0dc24c07081c4fd76374ff36d781b22
 - ONNXRUNTIME: https://gist.github.com/PrathamTI/ddb5b6e3f8f9d7434af4c4262=
45b7993

Change Logs:
V1 -> V2:
 - Fixed commit message format to follow meta-arago standards
 - Added proper [meta-arago][master] tags to all patch subjects
 - Fixed upstream commit links to point to actual commits instead of file l=
ines
 - Improved rename detection for better diff readability (-M20)
 - Addressed review feedback from Andrew Davis
 - Link to V1:
   https://patchwork.yoctoproject.org/project/arago/cover/20260302145846.82=
8106-1-p-deshmukh@ti.com/

Pratham Deshmukh (2):
  onnx: upgrade 1.16.1 -> 1.18.0
  onnxruntime: upgrade 1.20.1 -> 1.23.2

 .../onnx/onnx/0001-Apply-onnx-patch.patch     | 197 ++++++++++++++++++
 ...f-target-check-by-calling-find_pack.patch} |  29 ++-
 ...obuf-directory-exports-from-config-.patch} |  29 ++-
 ...en-trying-to-create-the-final-onnx_g.patch |  34 +++
 ...ol-visibility-when-tests-are-enabled.patch |  36 ++++
 .../onnx/{onnx_1.16.1.bb =3D> onnx_1.18.0.bb}   |  11 +-
 ...g-header-to-fix-uint32_t-compilation.patch |  27 +++
 ...ble-permission-bit-from-source-files.patch |  72 -------
 ...-in-option-text-s-buildings-bindings.patch |  25 ---
 ...D_LIBRARY_PATH-to-search-path-when-n.patch |  32 ---
 ...MAKE_CXX_FLAGS-in-build-information-.patch |  30 ---
 ...ake-Print-out-result-of-find_package.patch |  37 ----
 ...untime_1.20.1.bb =3D> onnxruntime_1.23.2.bb} |  68 +++---
 13 files changed, 377 insertions(+), 250 deletions(-)
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0001-Appl=
y-onnx-patch.patch
 rename meta-arago-extras/recipes-framework/onnx/onnx/{0001-Try-to-find-pac=
kage-Protobuf-before-checking-if-it-w.patch =3D> 0002-cmake-Fix-Protobuf-ta=
rget-check-by-calling-find_pack.patch} (40%)
 rename meta-arago-extras/recipes-framework/onnx/onnx/{0002-Do-not-re-expor=
t-internal-targets-directories.patch =3D> 0003-cmake-Remove-Protobuf-direct=
ory-exports-from-config-.patch} (41%)
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0004-Link=
er-failed-when-trying-to-create-the-final-onnx_g.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0005-Fix-=
symbol-visibility-when-tests-are-enabled.patch
 rename meta-arago-extras/recipes-framework/onnx/{onnx_1.16.1.bb =3D> onnx_=
1.18.0.bb} (87%)
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0001-Added-the-missing-header-to-fix-uint32_t-compilation.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0001-Remove-executable-permission-bit-from-source-files.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0002-cmake-Fix-typo-in-option-text-s-buildings-bindings.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0003-ACL-Do-not-add-LD_LIBRARY_PATH-to-search-path-when-n.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0004-Do-not-include-CMAKE_CXX_FLAGS-in-build-information-.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time/0005-cmake-Print-out-result-of-find_package.patch
 rename meta-arago-extras/recipes-framework/onnxruntime/{onnxruntime_1.20.1=
.bb =3D> onnxruntime_1.23.2.bb} (46%)

--=20
2.34.1


