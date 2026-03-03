Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE91EC1453
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:56:38 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18760.1772546194029839563
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 05:56:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=T29gj3fy;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.208.7, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2W4OICwCggX2BlVQnLQN7JFoiqTt9z5Yd7S71qL/8Rj7YcllfjqbQoO5ArEmQRAs6ykaqFeYMJtJyzq3iW6BoINaygKHO27rtH55yo5iXWVmTWvnVCZJy5jaEIey+y8MtVJc/3mDKII/+Id2xVG08fN0pqSoUimm4DS9kPrW9uvH+kVhKS73Btw41YFM+13+AydaAS46V9GYeiMt3lrGbMRvKzRgS+ezQE7qfI2a93hIIbEn4wK5lFvdDYBzP/4oSk64aluVjCkPi1p3K6/ONx5aa2DuBwAqoBLheDOUGXxPrelXL4WKWEnl5yMLgFR7PVEQGy1M+R5kbEuX5pCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vORNCtu+Rf+L1wrtNfdTFk7ua4MIduluIg80NDUcJSA=;
 b=o+i9Gii2JmSk0a5bLxHLBbGQkwA+32b+nXavoRE5Azxqjw+9bZDQORAsfQu8Jpy0BjVOqTCXam0LlfDZvK2boQgXryG4tpK04pRXQZ4+cXFRWATRpbkVAPhDfxVhbxW+JoN5wQDY6eVxRWs/TyHfoq5FXd/q5af5pLDx61RHguuTA++gpYDrWGcMdjGppU3fFWKcCUSAUf/1OHiBSkZeJneeV2N9FdT243Y4RMPAXLLVoS3B/ICLMv0xazxp31UDHXf7hLVk++cjxO6FPM9oU+cy/4pWglnc/5v5DCAtHl0zyeu2X739vTBV64AC3iaKgZp0QzeDHWkQ0ewOzWivkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vORNCtu+Rf+L1wrtNfdTFk7ua4MIduluIg80NDUcJSA=;
 b=T29gj3fy0UnbeRDokKnpDyYiKtZFwcdglvP80/Y7hW+5LfJmByDUZHGxmnOZli6cysj4+s9aocV6hiSo3jC+9P2Vsa5vW9s83dtiz2PP7t6+hS/h3QU8FXWgoE11IdDw+5t2KsAPAFa9F0SX/PewtlAwbLeioZpukNiklXcTO/E=
Received: from BY3PR05CA0050.namprd05.prod.outlook.com (2603:10b6:a03:39b::25)
 by BY5PR10MB4291.namprd10.prod.outlook.com (2603:10b6:a03:207::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 13:56:31 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::c2) by BY3PR05CA0050.outlook.office365.com
 (2603:10b6:a03:39b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 13:56:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 13:56:30 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 07:56:28 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 07:56:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 07:56:28 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 623DuPkO2219689;
	Tue, 3 Mar 2026 07:56:25 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <reatmon@ti.com>, <c-shilwant@ti.com>, <denys@konsulko.com>,
	<v-singh1@ti.com>, <khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [PATCH v3 0/2] [meta-arago][master][PATCH v2 0/2] Migrate ONNX framework v1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
Date: Tue, 3 Mar 2026 19:26:21 +0530
Message-ID: <20260303135623.2564012-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|BY5PR10MB4291:EE_
X-MS-Office365-Filtering-Correlation-Id: 567603cf-be5b-4a4f-3ae2-08de792cabf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	MLKlnlDdkHck2s2n4pjuFcbEo7qVjr2fujF2V22pJriEXtSMWuV/z3TI13O10ActixXB3tIHgh1qqUDKig2Xqkjo48d5+t1Mu05wJujKJdMLPzAeDX+FreJqnx5rTzmyXUICZPRMUcwgsNz7TiquTP17IxSRuVZLwszrqhCjeLAeKCE7UiwuIc46EY6yPtZ9HPgT5tQoeQIec7WCtNEmG/nN8+2UbzoTly4yjFS/csW15NAzFku5ipr1Thji3Q9cYgdJI15a9YFeFxyoy+Y/EZiKS5OrE2WAe5liqr3oCnfeBhiyytCe80SEvgfpKYBqPGgxzhU1o0Rvk/f9UGuaLF76wG236awZrE8W62bjm2UWMXNjlJWuWa+YcVNeL27vphuvzuIjmb5J/nwEQdeN6KwsZU4OUpYyNujEWE841WLJM11BCwZA9nUZdwUuR1Evi1ockjhAgqVbLr/oPvrUXF3UCpesqn3ksm82abMAOwTa6rEJ+Q6vdTL6PKP6VZ5cwlisx0s17HJ03gAcaGuzkTwaTUSVaYy5QZh9XGWoa/HyQkCtQvffKCz1L9XNo+4ohH5gcX3UsgDY/46YgwxQXNK4RApi5IS5SfVbpKZQEUPH5mU8HJ9MuLNP24B9LOxpwM1b0SxmKdSqQ4aZdMnP53CRtNWAGuMSCxQ853AIEK790qbdhDJeIGZmuSAFDwkzEKp2W3WBlAV8IwUl8Uatv9myQZhO8ChNCta0gwUrBScIwEViBuZk30oQkCMlY41/ExjmIXLroaSevdVgVSoWvarCzR7ny0Hw3/ElguTg2f0=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	vSJ0wUxAXPnaU1cKJprcweyBOBD7jwypm27cI4XIig5ZOrSPgxmw//ooRq4DbNy8ruj7eQjG35ZPNrp+X/eNcqGPkDP9V4DWLc/XY8yZiaebYcgYkZifoKp7zW86zIV8G1wQ32g3rznCT8XaMPsWuqW9uh3ySp4CcAEBlJ+mgDmD25GJ49XfNKvoBEGc9GSE7grmZvYS8d6vaLn0n8TGg5MtpRsNRI0ajUhTAohkefTIhZJZEnUTvKaxKkxhRmkUnv5B8iUpQsOMXDkJ37ZaHd9dizjfjz7R0qMc4tKIS7Hq7zQDB0BCcQ+O5mRDwUeii2bNV2RQ6T5B+NY9Bc2JODrguqSTaFBfRKkBJfD/DksMiiayWWekRyTGuOzJbwsb3+aMlKp0JRCfIf43dmUlLWjDcwF65b3eBRD5iR09c77mV64RX5bI2S2/5kJQZnyi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 13:56:30.2466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 567603cf-be5b-4a4f-3ae2-08de792cabf7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4291
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 13:56:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17194

Hello Team,

This series migrates ONNX and ONNXRUNTIME to the latest stable=20
version ONNX v1.18.0 and ONNXRUNTIME v1.23.2.=20

Benchmarking Results: https://gist.github.com/PrathamTI/e362321e3cb8eae86c7=
22c41d9c27ae2

### Build Logs:
 - ONNX: https://gist.github.com/PrathamTI/e0dc24c07081c4fd76374ff36d781b22
 - ONNXRUNTIME: https://gist.github.com/PrathamTI/ddb5b6e3f8f9d7434af4c4262=
45b7993

### Change log:
V2 -> V3:
 - Fixed recipe file patch filename references (REPO-1 fix)
 - Link to V2:
   https://patchwork.yoctoproject.org/project/arago/cover/20260303081105.21=
11463-1-p-deshmukh@ti.com/

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


