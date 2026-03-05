Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C84DF3D319
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 15:49:00 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47387.1772725735314215011
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 07:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=j5CJy5UN;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.42, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqyxwhYCRDlaAEbZi6D5eNFWosrnbqK7+pGCgpMni22n+VTg8S81aX/BD5ER3Pm5ilaUJNOcDx0Va02ix49RT1cI8KpMKUnIQp3in8vvXngWdb/4HyY2j97DMKueAbje2Wp/MgAfQQ/F13iDXkPaNrrfiblpdacinXcKtrRwUH6G3t2ww6Gaz+25UOURWd3YZ/CzEURn2Uu1DQczwNJPeietMqnE9Jib+ftq7I0Eac9jFme1oEhzxrpOubH3mVogJhcYLBhjz1TNOc6+YWVp0oiuYKa3O7vGpVYDHu1nkTy4hvHsPDhStRxDTnFvcKedjtGgiaG8j41r/O5tXEOrwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+pOzVrbj3PUVTDfPK5QnLlcWAqYLNwSsdABEutx7oY=;
 b=wYGmMuGqk2MLeURIGqsDYVQJsimFx1w6njaLmYFrysZP41rwYoyonoxYfpvLLeJajiJOCTkBWvJgZHxCJiGdikF/uvZqRx2LVfEt4X1MG+A9I2Lscn+LBnmeM0AJeja1z2swxx+JspewiCwuwKR0QskAQl6Masy0SKSgIiE6J1+Hovzvz5W4WhVJUDZ0CwCcJrX4H45+RgzDB5P9BoSi31AOPiGcVK0yxsN08d/o+AeGU3gjo01JTL72cjAgq6kxVFZPKkLfVSk4SPYtc3RqdLfekB5jL9t4OvX2NbTYcX+XFi5njWh+euNLRy2/juDSgCSHCPal/Iv/ESFdI3I2zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+pOzVrbj3PUVTDfPK5QnLlcWAqYLNwSsdABEutx7oY=;
 b=j5CJy5UN2YRd+HRnBEHz8cheMKPd3viuNfHCsNqkivu1rLSodR/FHyRJY9Ch5rNJLtYdIqFDGibkxPUoqsvovUUXQAieOMdPhKv5eet5/rpXVm7nRy+XziL1RB+SscFmHwIoETdvduRpcDnYHT69CXJ1WNfg3aAPwo1uwQnijXI=
Received: from SJ0PR03CA0255.namprd03.prod.outlook.com (2603:10b6:a03:3a0::20)
 by SJ5PPF136884A98.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::78b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 15:48:52 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::59) by SJ0PR03CA0255.outlook.office365.com
 (2603:10b6:a03:3a0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Thu,
 5 Mar 2026 15:48:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 15:48:51 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:48:24 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 09:48:24 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 09:48:24 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625FmL6k2600702;
	Thu, 5 Mar 2026 09:48:21 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v4 0/2] Migrate ONNX framework v1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
Date: Thu, 5 Mar 2026 21:18:18 +0530
Message-ID: <20260305154820.1461983-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|SJ5PPF136884A98:EE_
X-MS-Office365-Filtering-Correlation-Id: 39db95a7-5f5b-41c1-3f21-08de7aceb2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	8s0e1VhPrms1cS0VIeviLW50iGInLi5L3/a9FRWMKf/n4nMpC7PrOR3fUDzIX3RoVR7ngADmYHulAsyuyoathk/oyRK7CBD2Jk0vMr21u2A+/636/UWX+gRnCmYRecc52QTCF+d+m462lpOqBrWTkeSJ7+I90WErGhOd6ULpLmUb7fuCWyJXIj9iw0Gey5AxR8Nx+q59G0+cFHod2BakMn9S8zwvIhqmN9rS39iyryW3WXVHa0/oHw2PeCa6fuSxwKsq2f84UL1SOC1wG6m3Q8Al2gKzMv7934y7qxV1WVfsjyMXOjKVGRrF2NBDnp+d2TfUIKHnDtDPKcBS8OJnjK0MuIBak7NDHAzqOMl1mHMzwsFzNmoua01X7IVAWW2SKJjoyDqdDdKnb5g/kzj0DDmqIwy6fJZxQhakroDbPM1UmLms2/fRRYVDCfz1UZ8kBuMh9jaqip+7/ga2kNAAXy4YygEnx3dWlZBGOM6DpFVqnR5XHhJKFTEzTZwJM3EObxCSkBIZ7wmZKpNgA0r60vuyKW+Ly0ehwswIezFIhsjmze/LoBDRVsWbvN7kPhUsrDMwcNhxTif3ck4unPqIeo31mc0YNPDzpMi3J1IxlKwFCq0Zejh8eZyZVUgpT0Kansgj1lrIea9l4aNAFKaLbLMmdmXHi3sE+JmMuKrcgT3l2cjf1TvtI/haFLfa9QXMoZHmREwbwbnHfWGNbpYeZhtXH0UbW2PAAJoempJjb5A=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(34020700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+VqsibxtMyRC99U8SxkzgdgSbmJJW13EIBmZLSXcuTQnIbHK1eDH1wwS80BRLDAZnK6WIs7TxKr+Tm+JR5ywzVzzYYiGxKjwz6BBBrgsMKlBFm5iYocUSr315cajv7pre6WHNKyNo7L7UzcFQKPktMKeEcJnyqOpQa5oueO3xSDwfD4HVyH7x2sXzjBShkqV3gEOvm3GXusSDg8jR8cPTFnxW4HREkyKvgrmRFzqXgUWJz1Rj0x/hcSU7gUi/8BksBxEpBkaDPP7REFzymS8zRT2l5TKlzZswxtdSKduN6AY0EdGGsH53NCCAS/XPS5/Dm13sELiof72Z94S/K8sZdZXnHpTKOgBfiPHNwUWIr/aXbOV4k+keypr+ONg+Xtf28fOkAfu1MgMw3WwvBUsr0F79JAdNROSetMaV61CGxh78Y0GXbRBDHt54iGWT97o
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:48:51.6011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39db95a7-5f5b-41c1-3f21-08de7aceb2f4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF136884A98
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 15:49:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17240

Hello Team,

This series migrates ONNX and ONNXRUNTIME to the latest stable
version ONNX v1.18.0 and ONNXRUNTIME v1.23.2.

Benchmarking Results: https://gist.github.com/PrathamTI/e362321e3cb8eae86c7=
22c41d9c27ae2

### Build Logs:
 - ONNX: https://gist.github.com/PrathamTI/e0dc24c07081c4fd76374ff36d781b22
 - ONNXRUNTIME: https://gist.github.com/PrathamTI/ddb5b6e3f8f9d7434af4c4262=
45b7993

### Change Logs:

V3 -> V4:
 - Removed redundant google-nsync dependency
 - Fixed improper tabs/spacing issue

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
 ...untime_1.20.1.bb =3D> onnxruntime_1.23.2.bb} |  57 ++---
 13 files changed, 370 insertions(+), 246 deletions(-)
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
.bb =3D> onnxruntime_1.23.2.bb} (72%)

--=20
2.34.1


