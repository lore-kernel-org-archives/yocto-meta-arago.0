Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8D0EA4E13
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 14:59:16 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.162267.1772463548365842766
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 06:59:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=SAbL3uck;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.51, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InM7O7zH0XQfz79Iw3Gf02ObPDSnrcf0WkGeyKJQKlJqrO6Vo7vlH07ovm1wbR6g3nm88FB2dHjzBgCuuP5njVsyDOwnEuj1UQ+TUuUvjCx+UyajA/C/jXc31VhS2GDj/HHldQq6VXwxVuMNuzhWxluto5w0iYktpRQS085gjwiCAH2TkkNEZLfWMh03SkGlpQWMAko/3Y4xzSCOYKUwTCCgi7Zm4BieAM64eF3GRXNnSiUIiu4RIHqkzJohvENxuVvazdsierOFX4E6R6VVp+FgzdhbG8TaZ+Cst/uq3yAHh3LJnANC4DBBPboPLA5Fqd2dgAcLOPQTNEmj4hTWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIW4+9A1DU6gy6t2zPn77MkHHZgrxhqyMNX1dSjhF24=;
 b=yqpmrcDmTpqiTgxBRS7im1yT/QFNuWMS84raTza4t4DUjuMVIlYk2jT+HTZkNoe6Zd5MDq1EarXYKYMFTqcFLQsGtXnJhOHYQXQihmBwpJSuVm9Y9pJJIqTGC/tQfVi4QWG99G1pHa35kBuEX3hdKDtrVgue7lqnMtmA0t60e/9cvH5lNhf+fzOiUuMV8IhSePt1ZEbL1XOCjs0chxOFEfMLtOczU2F/lGBvbSGOsGd81hXQsff4zxKq3+bFyySyHXcGp8aGGLM4WOmo1a5tQuH22+F46XB/XeI0f4/CBAVvKmkahCzqD059M4lllFiZLTjJTlpCFU8hv2Tg1zuJGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIW4+9A1DU6gy6t2zPn77MkHHZgrxhqyMNX1dSjhF24=;
 b=SAbL3uckPjqG4o8Sy0M3hok7IBTJBJPExrEGcPpA8LRXtX1MzOLfXd/NYXXtqOYzL0UN1qC0aOA3boqvqqrn7+0EFSIX2W75XRhuuFklSxQcV6ILDfVQLE7zifB1VCT1Gc8sV2IXoo5rbPweOaMaA1BiLm1Zg4IlFH4OS4HLJwU=
Received: from PH7P221CA0056.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::30)
 by PH3PPF5EEF2B425.namprd10.prod.outlook.com (2603:10b6:518:1::7a5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Mon, 2 Mar
 2026 14:59:06 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:33c:cafe::53) by PH7P221CA0056.outlook.office365.com
 (2603:10b6:510:33c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16 via Frontend Transport; Mon,
 2 Mar 2026 14:59:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 14:59:04 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:59:01 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 08:59:00 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 08:59:00 -0600
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622EwvkZ960610;
	Mon, 2 Mar 2026 08:58:58 -0600
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <reatmon@ti.com>, <c-shilwant@ti.com>, <denys@konsulko.com>,
	<v-singh1@ti.com>, <khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [PATCH 0/2] meta-arago-extras: Migrate ONNX framework v1.16.1to v1.18.0 and ONNXRuntime v1.20.1 to v1.23.2
Date: Mon, 2 Mar 2026 20:28:44 +0530
Message-ID: <20260302145846.828106-1-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|PH3PPF5EEF2B425:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b87be7a-e28d-49a9-9c26-08de786c3f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	0pTJSbjOBLfVzzvmtSXy3ZCb4B98mzG03Yp5vGX57NNkbKaB0n1M/yPfGv/07HMHP1/tMy4G57MhjXw/oYG5hihbgaHgsn5yat/pIQpqT3qeoLZAxUBzSej9c8r+9FPZs0zseD9z3SXJSPurlpFNFZq1lDlsJa87p6ct1afW7u1wOzOa1/i/0tatVUW/pkNWw/5hO13M/aPtruItclHt+VFebRsGSlzv4x2rtb8Y56IMCD/IWwwsF0pCob4pyTiqKDxpOnZd1MLWlrjWZe2/fjW6MgMlU8U6zTW6rNYU1MLg9i/ht0iQ3gcWjw/dOzvlHWChl/aPU2c/UO69xkkOO/llYycyxYvqoqHRljBhBUDOOyZ+RFrA87Mk54MSqT8Tgqv8UOhEpluMc6C67Qj4HPhh2uyVjaJ4l+zvyQgeNUOq4LI8zm9QtDiKBnX3NhbzvserZih4zSl+7UCT0XDg9HIicrwuy1zTo0hke5XiLoowqB9JJqEeBrg75Zgl0X/AvHDL0644/rKEDc7oPDwtYq/iXxHxojxdfnFQHiZe5VhN2MFBWqiX3oyfaVvrayG+iJih7+T1vWYYWxJx25lyWP3GfJddiE1Vli9Zdqhzqz2lYC72x+s9QIvz8CrtTC8fmbtIp/ZwaKwn+CbKKRtLm1dTW0ot86qcZoXNJBGFcKZAlDscWPXBoHTu6qGzKa3qKYmawwdyx6kadyVlqIbCnm758dPaz6XlZziFLwR+KUNQy/MN89Az0ZKQYoMuiK89XD5/mzFTmhAUgm6fYZSv/Z26xyS2YSc7Z//wRyDCL9E=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+oenAsF2kJN15HSNRkqUqvV+Ba1+fDgb4DiDXMdYrLqQ1jvsdKmOTtkbk6A8wQneB44Bx04CpxjV339FZfFD6i4SQxV4A5ZztLeNW9y4CuNq9Sdjk453QNJugq3VPbVCWWB3n7uFTyPGjh97ZFh+an0cSPE6Js0T/RVyFAS/mezROfkKB9HJWWnivJ+lorjG5B3mdwvOWNTweSKlb9BQCvfRuCpqwqgoeyNXSSprN3/54PJ7WTWcY50/DbCa+ZujB+Sg7Oz89/M3nYGsefgY/6hGJca2VhB9FNv6zMVtTT2iRznPm4DWz3fgCP4FfMszRyANzRv629WKid1Xs7HoWG7QIuQgE3Eb/xapZQgjt8eWaKg/2rVqagwlYzkRbRVqUJO/RZ7gzpCZQ6XKSBbO7jeGE89o/xa/4shSRfLh3X6OjhvFQ2q4ItJeQhvx0LvT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:59:04.5939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b87be7a-e28d-49a9-9c26-08de786c3f49
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5EEF2B425
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 14:59:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17170

Hello Team,

This series migrates ONNX and ONNXRUNTIME to the latest stable=20
version ONNX v1.18.0 and ONNXRUNTIME v1.23.2.=20

Benchmarking Results: https://gist.github.com/PrathamTI/e362321e3cb8eae86c7=
22c41d9c27ae2

Build Logs:
 - ONNX: https://gist.github.com/PrathamTI/e0dc24c07081c4fd76374ff36d781b22
 - ONNXRUNTIME: https://gist.github.com/PrathamTI/ddb5b6e3f8f9d7434af4c4262=
45b7993

Pratham Deshmukh (2):
  meta-arago-extras: Migrate ONNX v1.16.1 to v1.18.0
  meta-arago-extras: Migrate ONNXRuntime v1.20.1 to v1.23.2

 .../onnx/onnx/0001-Apply-onnx-patch.patch     | 197 ++++++++++++++++++
 ...age-Protobuf-before-checking-if-it-w.patch |  25 ---
 ...-export-internal-targets-directories.patch |  28 ---
 ...uf-target-check-by-calling-find_pack.patch |  36 ++++
 ...tobuf-directory-exports-from-config-.patch |  37 ++++
 ...en-trying-to-create-the-final-onnx_g.patch |  34 +++
 ...ol-visibility-when-tests-are-enabled.patch |  36 ++++
 .../onnx/{onnx_1.16.1.bb =3D> onnx_1.18.0.bb}   |  11 +-
 ...g-header-to-fix-uint32_t-compilation.patch |  27 +++
 ...ble-permission-bit-from-source-files.patch |  72 -------
 ...-in-option-text-s-buildings-bindings.patch |  25 ---
 ...D_LIBRARY_PATH-to-search-path-when-n.patch |  32 ---
 ...MAKE_CXX_FLAGS-in-build-information-.patch |  30 ---
 ...ake-Print-out-result-of-find_package.patch |  37 ----
 .../onnxruntime/onnxruntime_1.20.1.bb         | 157 --------------
 .../onnxruntime/onnxruntime_1.23.2.bb         | 163 +++++++++++++++
 16 files changed, 537 insertions(+), 410 deletions(-)
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0001-Appl=
y-onnx-patch.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0001-Try-=
to-find-package-Protobuf-before-checking-if-it-w.patch
 delete mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0002-Do-n=
ot-re-export-internal-targets-directories.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0002-cmak=
e-Fix-Protobuf-target-check-by-calling-find_pack.patch
 create mode 100644 meta-arago-extras/recipes-framework/onnx/onnx/0003-cmak=
e-Remove-Protobuf-directory-exports-from-config-.patch
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
 delete mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time_1.20.1.bb
 create mode 100644 meta-arago-extras/recipes-framework/onnxruntime/onnxrun=
time_1.23.2.bb

--=20
2.34.1


