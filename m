Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26FDD109C02F
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 14:51:08 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24128.1774450266079534384
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Mar 2026 07:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=a3LuWypo;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.12, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMcF0480pQx07wQGXLF5PSRcwnRy0N6wQFs7ohno788ibOlGHb+U9kHjJ+Z1XPkauUpvrtNx0w4CeLPqVBTX2r2jM5tkac7ya5rpwiNKt874YQ1cz0LUelYFhpDLgUZRcMgXmptt/HTTIM4r3vs5LKvuo/awqe2iQ7qeU3yogqAlmZVAXqhiPNMOeboCEUkp2m9t0Yx3NODojvZiQ2mA5G089faLTQ+GvZBx/yRbHtVtae0K/z/yDRj+baWYDb3eUg7CYIWMT2oR8Mz+sWZN7lmauTQkyc2xIbnpO+eXAvgu2lRXRAGN5Dvh/12tOT3Mflc6A5BBHnAMFqTr7X774Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udx2Nj06g6OdzqO+tsuF4+64nvW2w1S4Pi8PnOl4FIE=;
 b=iIhbW0BOGMcLczLej01gnRP4qFvz+PqJEKSN9ZgzFNJq3BlRW9amZdnMH3F1/ObjvyR/zleLZgLg6FeeFLI6Vrd6BgC6RiU1x1XjEFfa04U3k0SioOyDIQYwAhHOMw26gJlKDnCOwAY37FHwcpfUHArdyg0JIHFbX9E34S721/jfyS9t7+U+5QYA1OncwD8wcdzey+5TlPuM557vBl7yat4YxU1htHi8uCgV3T22p5IBwGjG2QSaeN45qmmTWrI9iHr9xzOgdG3v/5Z9YRngLKWdzJ/nffKFt7vhT8v7wNsG3LF+V3bgmoZWbtdc4A1BkVa5AjVHeb5ZCEcs4PN7tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udx2Nj06g6OdzqO+tsuF4+64nvW2w1S4Pi8PnOl4FIE=;
 b=a3LuWypoUMJJr14gmnYhl9e+ZagfAMq6yHTljdH+YdPuIsb7SRzRr6TxSJIrp6waJob8NZhTNIQO2Aur1x43XumwGOhJ7c6ngX3GW/ECL7WwSLbG1GqKyOtBUB3tWBOvwbquU9Jcw/vjyIGHXSnM3TrCE6ALKT+YFGwm1R59DWA=
Received: from BN9PR03CA0530.namprd03.prod.outlook.com (2603:10b6:408:131::25)
 by SJ0PR10MB4749.namprd10.prod.outlook.com (2603:10b6:a03:2da::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 14:51:02 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::73) by BN9PR03CA0530.outlook.office365.com
 (2603:10b6:408:131::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.32 via Frontend Transport; Wed,
 25 Mar 2026 14:51:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 14:51:01 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 09:51:01 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 09:51:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 09:51:00 -0500
Received: from pratham-TI.dhcp.ti.com (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62PEopPT470987;
	Wed, 25 Mar 2026 09:50:58 -0500
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <afd@ti.com>, <c-shilwant@ti.com>, <denys@ti.com>, <v-singh1@ti.com>,
	<khasim@ti.com>, Pratham Deshmukh <p-deshmukh@ti.com>
Subject: [meta-arago][master][PATCH  2/3] onnx: fix 32-bit ARM build failure due to LONG_BIT mismatch
Date: Wed, 25 Mar 2026 20:20:49 +0530
Message-ID: <20260325145050.1053445-3-p-deshmukh@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325145050.1053445-1-p-deshmukh@ti.com>
References: <20260325145050.1053445-1-p-deshmukh@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|SJ0PR10MB4749:EE_
X-MS-Office365-Filtering-Correlation-Id: ff49fd94-6d90-4fec-2db5-08de8a7deee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	7qEiv3f/mdwnQYfT7/kPjp33AO98f1r4GGL6xSXEtAhRNG0K7HoF+iYs/Ls/4v7U2R5fzNvWWcpL/YVXUkhg9kr2xymeELEcpbD9k0Xy/Y94TT/74a97CQQSwTOsKbs9jVYTcPDjBVulatr4tIoCEejTffO2dQsIX3FPcMbbFD0G3wc+MIgX5QqlWNXvxKiQH2wLUm2arf9f14s2+kWCkE6VaYVmcVe7+6UKMuMsDUgNh+v/kOMu9AAe44wRzQ/8oQ5uXkwHuo1b+WEGIC8cE+yGyoJROPkkNL1bkGBALBMBQFhrhc9Nt7GwdCQbOzqFeMoy0WTUzTvq1ZQWvEi/rAff3KYtQwPhQq88N/r/MBldCBQ8ryq5IOGAjDOzp/tot9SsqupfkXWsMUKb13QYS/l9ItrsU8VnkPMrJeT8xud+Fo37qnLl3Q8cIKwpDxKBvmiUEBSwdArp5uPGfG3EfZps/Vw2HTcDtqyYjSf49mliwJFGk1i6cfzORbDufO/XS8Zcpagqao4dQYYoMLS5oGCKGipH64jxlc8ewmsgrlkPR/I79nfrB4Ve8J6Wph+/xN/LD23F8AAZDBISZWxH+3qBygqaAkE9tRNrK9cHzlzYSHCjiyIEN2XJgGtth4HCzk9U71Dj9tzMJNzwrA853VKYSr6kcYx2Cl7jQ7lQzDlq0uuHze8b/weqxIQ5scVIgQwkkKW0AhhYXC0e4Qrm4ULr5i1tY4n/zNHJ5RIKV5h1v6TRpldse1ZsxU0Ug9xr8BiP6RSkXtivk2iJda/gXQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jJAzyGxxaKOwTMwzDpNpNcekflwVoeE3pFFCmE+0lT2tMvlpd8RrWeGrFRCAz77Lc+E4895U2duYk8EqPWDdGd3xfQ0RMHUTPEP7MY45RiuS7apa9dQjD0U86p05/6Ycc/DzchRLoIZ7rA0s33fjeHEO3Ql3OPf2JivHgTLmSYb9omIsnusQdkTGzswpxd+bVADQLk9Zdl6WrmTk/hWaAZo5v8sCaGJZr1CjID3MBvyE73GBH5FqjWJiGfzshdbkxhejqYTB20xwjdbsEDt8N1sIFsjGLIUMWDtXL1eY1lKGQtKJlcKim/l1mQG58fi/f/0fCWkT8RQVNv5q6eT19iFk5PU2WzybO7hubYQQz7CpT70FtQdbhJFsXZSwhZGKSwLjVusXKB96Eom7LwqazRRzjxZbXzf0rZhVOPDcCwmmU1fZecD23yCl4b4XlX+O
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:51:01.5150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff49fd94-6d90-4fec-2db5-08de8a7deee0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4749
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Mar 2026 14:51:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17434

Switch from python3native to python3targetconfig and update CMake
include paths to point to the target sysroot.

The build was incorrectly pulling Python headers from the native
(x86_64) sysroot, leading to a "LONG_BIT definition appears wrong"
error when cross-compiling for 32-bit ARMv7. Using python3targetconfig
ensures the compiler uses the target's architecture-specific
configuration, making the recipe compatible with both the
architectures.

Signed-off-by: Pratham Deshmukh <p-deshmukh@ti.com>
---
 meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb b/meta=
-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
index fc565dec..7d27119d 100644
--- a/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
+++ b/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
@@ -61,7 +61,7 @@ EXTRA_OECMAKE:append =3D " \
 	--log-level=3DVERBOSE \
 "
=20
-inherit python3native cmake
+inherit python3targetconfig cmake
=20
 python do_build_version_file() {
     import os
--=20
2.34.1


