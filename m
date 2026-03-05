Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A0DF47CC0
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:44:07 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52958.1772739841193952747
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 11:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=A14UDgoL;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.49, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSSBXwvfrXH+cL/9XQsUosQv916L/S6Wri6NAloMp/9yQ6tPBHQggsdXVanA9hp7cHgkhDTkujjgaVuxLj/YPKmZVVE2d5DIyZrtq2vpdQE2B1zkgacqE2KYtRBGAZXX3+vgXa1uFkK7WiAI5BWHrHBrA5Kb+GLNxSSkcBm1l01zlN3gBqmW0xaxAAq0m0pl/ile8u93FZnfJbHcg0QF/83iSggczyfnFk9D5HQ+v43H2mrz645SnPQFBsWXfnBWMWSypjOnXbhwaWzipw5pLGQrwVUU8et2I6A3T8qahmKoGx+svZfeRe4wV7Aj0fGSc0y77srqfomxPuzpc1GH8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oie/8FRPfNiVQgs40qlRa/i2qbjG7pjQIFd0B4wdxYU=;
 b=cGm7vZltP5SZ/GOv855f/RcTATDFLeNyrXCXB+K2UAcDZBUnyXMv9xqlOr/gWau8oYYFtZkVjuNsYewxS40FLSK7OoKHq+YINKT+iz8Kvv0OujrGaPcxM2KyYtGURvouPvzwTlCf8ZPjN1IcfYhyfAU8ypo+LvsT3oDm828dMXh5EdMgU61dozs2w8So1GuhPRkDwbhUtCsi2JA70liiCUtvEfcYHFpSXOn6lEldbOEOktAqBYTf/V2ZtQDsRK4xFpXpn3cUPxeSHrg4VmIxZcokp+J8GpNy9xZP7lQdu1EeolBnhxz/ckLat3WvBOHENUxPq3dtbJpZPW7bO3N4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oie/8FRPfNiVQgs40qlRa/i2qbjG7pjQIFd0B4wdxYU=;
 b=A14UDgoL7N15pus/zFFF4pSWF+Khv84VQG9EFVzX274jxsZit1YwJqfwbhmglDY0fKv4ywELxXh6EkF0TuQ+fT+wWN83gLXXMjuYS6mDSeLrtahh1jv6Xzqx82JAK+Xt4oPtX7vdvptl1Za7NXCKvyDCvWl3nJcvbFKkUrtqr6U=
Received: from BN9PR03CA0554.namprd03.prod.outlook.com (2603:10b6:408:138::19)
 by DS0PR10MB7245.namprd10.prod.outlook.com (2603:10b6:8:fd::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18; Thu, 5 Mar 2026 19:43:56 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:408:138:cafe::d2) by BN9PR03CA0554.outlook.office365.com
 (2603:10b6:408:138::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Thu,
 5 Mar 2026 19:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:43:54 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:43:43 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:43:43 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:43:43 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Jhe5b2933792;
	Thu, 5 Mar 2026 13:43:41 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH v6 0/2] Migrate ONNX framework v1.16.1 to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
Date: Fri, 6 Mar 2026 01:13:37 +0530
Message-ID: <20260305194339.2081304-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|DS0PR10MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 17370be6-8529-4106-5b31-08de7aef88f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|34020700016;
X-Microsoft-Antispam-Message-Info: 
	L6O5k+SIxLbHspsL1D81PtR84WFXdOsExaPKJ+MeWz41HRYx0UCzB4C4jsEJWxYHgZz/RaLQWor6CMoUjnF/x7ZcJUnLeUbDEpitw2Ic/U3VFrpgp2ID+hinIZdnmMnUbZqU9bFsUj1LUIqB03pU+rgM2U/6FAZYP5MtjQJUUBqd80ithwalKpRtZVHjqJyZ8EVWC3gs86OpJIpPiPo+AHTEPnuxMC3thoccm34U4100uic23LVKwegJh6GxIb5+LvjF/CGSiQDhgfG7eiB/H0ZsN6zdc1Scz7PJdhr3WPo4JT4etUHMZecKypGc7qtfyOq3JhofabQZDnRJgobuCFMaFZmW1X3c4PnV8Hk+r8WgXR5/9udMHIjoIp8kcsebINAel22E++qFHurlmOhBpBqVn5+0RpGLLhhFaB75Wg0mXDnvFnkfijc6JJeWlMR4x7mZdW+eBbCt2VzmRmXAyaUIS1r5Z/Ys9P6pxAlCwbQtmp39XSPJ5ExgXXqAz5gjY1twaetfb6pS1lhoQiUCpaQs+LGNy5WWbeU5V1IgxjFyjYUUIHQ7TGpzcvv4YW41RSLddoh8oqSjG7BWzvRzUks+f1uDUrHh6LBZ79YzKn4fmdUa0LkmraqQ1vofLrY7+mt5Yloj7zrwaozZFHviXBhdPrxXeddfWOCfe0VhAPhaC009VTYg4FKnUum49gKuhlwycAiO5vqpbiZd5QGs27aieWdGZD76WOLX1O9DSdY=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xGM3LKmp8Bq0bvThp1JFTM1OJzhjbqM0p/LBD3oDHZJ9fRr82xzBLUV0ubMr4bIx0Z1m/DmeNOwrA54WaJ+eNafTfQ31XnStwzoRAAImAVdKguoksu7KZnjOliCeJe3vxw32sNfeIlHZnVLEBJ1rG93HZE/0e40rQsUcWogLivJh1Er+0sIiFTfQf7wPDeX+MQgI3+sLJKohPTsgV3b+i18c/x8UkOdQzCm4z0j7Upx5Z8otYy85dyjY1xruRCMywMJNqRiroMQmpGrEhEadjvgeYA7pfksHfea8YGUl04EesXBhpmj7lr3Wf3jpUdCNs3mdh8cBGVYp9z/piJnm9McVUXnzJdj9mAV9xMRz2UpDi3J23Z11bAhjox6VxUSuCoErHXTYl88popaRgQPSxbNOLur47oDlxFArGHwyfG/iclG3ycVJpRgo8zhdGvB5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:43:54.5498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17370be6-8529-4106-5b31-08de7aef88f3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7245
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Mar 2026 19:44:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17264

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

V5 -> V6:
 - Added Authored-by signature in patches
 - Link to V5:
   https://patchwork.yoctoproject.org/project/arago/cover/20260305180824.18=
23814-1-p-deshmukh@ti.com/

V4 -> V5:
 - Fixed incorrect patch version in v4
 - Clean indentation issues
 - Link to V4:
   https://patchwork.yoctoproject.org/project/arago/cover/20260305154820.14=
61983-1-p-deshmukh@ti.com/

V3 -> V4:
 - Removed redundant google-nsync dependency
 - Fixed improper tabs/spacing issue
 - Link to V3:=20
   https://patchwork.yoctoproject.org/project/arago/cover/20260303135623.25=
64012-1-p-deshmukh@ti.com/

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
 ...f-target-check-by-calling-find_pack.patch} |  30 ++-
 ...obuf-directory-exports-from-config-.patch} |  30 ++-
 ...en-trying-to-create-the-final-onnx_g.patch |  34 +++
 ...ol-visibility-when-tests-are-enabled.patch |  36 ++++
 .../onnx/{onnx_1.16.1.bb =3D> onnx_1.18.0.bb}   |  11 +-
 ...g-header-to-fix-uint32_t-compilation.patch |  27 +++
 ...ble-permission-bit-from-source-files.patch |  72 -------
 ...-in-option-text-s-buildings-bindings.patch |  25 ---
 ...D_LIBRARY_PATH-to-search-path-when-n.patch |  32 ---
 ...MAKE_CXX_FLAGS-in-build-information-.patch |  30 ---
 ...ake-Print-out-result-of-find_package.patch |  37 ----
 ...untime_1.20.1.bb =3D> onnxruntime_1.23.2.bb} |  53 ++---
 13 files changed, 370 insertions(+), 244 deletions(-)
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0001-Appl=
y-onnx-patch.patch
 rename meta-arago-extras/recipes-framework/onnx/onnx/{0001-Try-to-find-pac=
kage-Protobuf-before-checking-if-it-w.patch =3D> 0002-cmake-Fix-Protobuf-ta=
rget-check-by-calling-find_pack.patch} (39%)
 rename meta-arago-extras/recipes-framework/onnx/onnx/{0002-Do-not-re-expor=
t-internal-targets-directories.patch =3D> 0003-cmake-Remove-Protobuf-direct=
ory-exports-from-config-.patch} (40%)
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
.bb =3D> onnxruntime_1.23.2.bb} (73%)

--=20
2.34.1


