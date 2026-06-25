Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2F4CDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 15:56:21 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14598.1782402978391559232
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Jun 2026 08:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZaKWkoJp;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=qlAsk3Ko;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65PFdG6i1705210;
	Thu, 25 Jun 2026 10:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ZjSlo4I7s8GqN
	4UcyZ94DArB3Bpx4M7ar98AFzQJG9g=; b=ZaKWkoJpbd4CuU6n1j6CKGwJY8dve
	O2uMwkWQ95W0sBFMYePcNnaM+eHY+1R0ugkyyo8B0hcEMCG5qe1Up4sUKHXaTW9x
	sfbjueSPMQyWNRULGdemWrIbrhlQdtgs0olYCLM7zlEp3aHKTZUJbhas5M5AKQCC
	2iZ+V5ui1exY04E9KW7f9rOVqTDSwh8SV0ayQnG8me/iQFAm46Oq4J7jaeb7ZMS1
	/2ZB02zt0xs1B/mJo9X2ZDfq2CYSp4JsoqTM1jxnyUzlVqVcPH3o9GqM6HnMO+dG
	o/kJtD4jy1C2Fjv6N/dhYJtjQ9Evnx2X9AbeI2ZTNrUkBhE29DKnCAaVA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010010.outbound.protection.outlook.com [52.101.56.10])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f12hfstyn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 10:56:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FclTumfiFyD6DQtNQ4JdncfNXhCAiBGTDKJxfxdiylap9xKnDzvcSJh+NHqeLEsyNkZ/pv8yZHnw+4Gxk4AClLlGBn0154UwNaDFzrQpZ+VUe7iVl3XHf4Recde8qE0Fzn/SO+zLgv/JvLKjxjtpvXV9G163QGBK7aSdULmL/U/GUqJUBSJ2omKi8NnwILYJOg110STOQTVJ+VKuz6ybnHZ0ulZT21Dhgd+ukQFoE2DzonoW4bJ2FtvnuQPcbO9BS5QU+lzSNPJ6M001OO9VBy+ZEYLLAICjQZb52s9vwMuYEYdKzqUJBJZQaQO3kxOeyfqgha2767nbTeGnOsTQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjSlo4I7s8GqN4UcyZ94DArB3Bpx4M7ar98AFzQJG9g=;
 b=LuMhqKjfMkkFUmxOf8heOOswsckZsV5X+MLPe269TuGfyhZUX6YJqvvxpcaJnrjRfal70qmT0CofuAbvVh/fWo2ntFaHfLF0LtlVjnlzsdq87ez74onRaMAoWmuOblq3c1CAFYMLHBGKwIkWkO1GsHkAvwSYkMjksFKyef3JEBxTuOr6ram+vlNB2aoYNKcZgsfft/D9xk9/RjhO6mmJFCy5qi+wYuS7ZJSgX/XFU/4KdLTdj9mjxZ533701AqZyj6A6XpK+HRnjldgrDZspgVw5EAPyeby/miXJnHbCpP44o8PMkLh3TBGsyDfa9Hxi0zrk5eMQkVeNiGffm3MPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjSlo4I7s8GqN4UcyZ94DArB3Bpx4M7ar98AFzQJG9g=;
 b=qlAsk3KocuSLFaRNaSy4Gpe1/ZTL3QmV9h2pc2BZg3OcJOyXh5L1/08faFAQR2MAWbj0U4DmNoDxon28nWR2kyfVHmLOAZXJE4hdbi6falEdSU+fvaFl7y/Ppn0FZQYaGMJ7kxXKXVbRZP4ghd624C9sd9r/J7sEZ4LZBAWumyw=
Received: from IA4P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::8)
 by LV0PR10MB997968.namprd10.prod.outlook.com (2603:10b6:408:38f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 15:56:14 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::49) by IA4P220CA0004.outlook.office365.com
 (2603:10b6:208:558::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Thu,
 25 Jun 2026 15:56:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 15:56:13 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 10:56:12 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 10:56:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 10:56:12 -0500
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PFuBmK3081095;
	Thu, 25 Jun 2026 10:56:12 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/wrynose][PATCH] linux-firmware: Move this to meta-ti-bsp
Date: Thu, 25 Jun 2026 10:56:09 -0500
Message-ID: <20260625155609.28414-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|LV0PR10MB997968:EE_
X-MS-Office365-Filtering-Correlation-Id: df398b00-6b52-43ad-0f40-08ded2d248cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YjH41xt8LFUU9oYVMKseoh7CYfCvUsQg+46Zek28V1Sq6/Tf8MI62d2vkdMbdCTFKXEjNlsBErDsCPD5xmM6EANrEsGw4YKmiDVl+MV4+d/LoSr/0oDpDS27bX6+rJw6/GyT+ttAgKCE7dE0CRR6POI0N2VAo72412fnCn/EHbhGXM0Wt+ahsYK+FNgZO6oIStPqis+jsT2gihzFz2gw3V8cw7aPoRjaDE53wIOf9J5ItEy3AsIaUrv4PjreHCNbmgGxb6ipDncp1mdRV70WCV+7x1UtT73GvkYmArDp3ZzgIPROad1HUTt+5WKHI3FpbsUOflckf3hELUcyll/o9rTaj+PDKWP1C7X1ZMM8T/lKz7635tFYciGiyl1uDPF4NLGGe+s1l/OP9oThgKvNaHvf/8Nli6W3BR94tUTDZ6q8cQnqHfquWuHfqEss3ECTDYAIF7uBEeu0SunR9RgURfEdVKXGBs9nRezd0y2e00/deQA2NWMIEEu3jbVOdEczAwBEA2x4QF7wuMpW/0GwhSFZQEGNyVkoU9A1gFw6iEzk51clDUr3Y01WjYqUMSBXpmBl5KRia59aWa/tlL4ggXP+l5qwCUSpMlWESG9J0VA60OBPW9Vl400i06l7ZG4n+wSPYuabxOFnLx6mNgtebZEjhdxLPqaMHGNbZgEPhuuDKvbbWI+fROvmtWAxUKekJK9BYZ/2rhC++oLq0g+3tQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	T12ELXt2ctFBuW/t8kxMjQ5rsPt9CIeVo86Rf/bUOUa7IonNr79MV5u9PNKuT+2yrQeSnYunicRW+c/Zbj60JEoWctp9W6zU+M6Y5oOMP7fp5yLsNwh1l6lnD9CGt3dSw1gerxSJZgmQ8Ina6cNGqVWq0Vzp9WRKfYwDqbjWO6Nu1dN0K0HWtHLo3fcMajILaCyvqGgMsxxn4RnDLS0ViuRCmCIYdJ96Q+signjneMiEeu3eIv1GRTWYbyC0CUOdmQGwcjquJuPuHy5xNOcftU6zpejBUwcuOwc+rmhyQoEuruLBPgdjoOPFH8ywRtd+IaCbMzoyt85VgsRPddDd6ydSiMOpgIDzPVOrURaZGq41ofbXWZPpjU/rKhEBJGZowUquOoccj77tKbPlXdA7HjzYzYSirSmobQsRc3rIQJp3hAtNtuysAjW8XZis81D/
X-Exchange-RoutingPolicyChecked: 
	IZUrC0oejB725aUawNJAWf1LuV7rXM9TOKshz7BMuX3BxARAPje8vY76LaaDZ9s+Sj45oYQX6InlwTBLae5ekWtcN/cIucWgZam1TejT0Mt+XhK3DT91TIkzz4//O7Udn78K9Hg+2SVJ6fw0tZ0h5cIDoeUs9C5oHwzW0QndBCupi2pW23XuzzgAu/kjwRTcf+SrGxxk7nfPwAhp0lb3KygOpUeXSV/C3kARPiASyoesSmahJMun41dXfl3/RZ3E489kbBRPqOA7yjviAwFhdgNmrNJ/t5iQq5jYcPIhd69E/gdpZuIB14xAMjsOJACjt++6vMcMcgav4/Ao3NqY+Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 15:56:13.8363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df398b00-6b52-43ad-0f40-08ded2d248cd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997968
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzNiBTYWx0ZWRfX0qzeu7gRE+gb
 ARSae3jelBtkDbnRmmAJtouvmhYYCZcDulwVRLTxeyciXmK+GDVPQk1h9YZanrh3LXBqq5ukNII
 znJgk2YYUIVr+ZR+1VZLEANvllrfSNtA3bRNmcNykSdNfsA3NBgdst3L9JInQUtx/nNUdyBEswo
 YY1XtMb/SXni1gpumeHl+U4+SmVEXRlCFlLU/DIRefNlPpA8agVacLuZmDSK9h7mQ5CO1Eh/ZcR
 CEpNhyexsq8oAJ9jcn+iYinyHnnObU3kMZF7RfL/n50CWA2mrhjPrUvIjira5Wg7MFRoBvC37Vx
 WGT2TEHikjH0cfG1yG+XsXNYF/jGCJTt5az99vAVaUhpeC96v6VK3BU1W11CvUBeiHrBBbIAImR
 lgVr5SNCVxZdZQPruakrOEZabPIZeHM7tzSylBRMaXOxnTKyTRxF28FMnkwBld4Jc3qZX/5L1Li
 Bmux/vO7e/zGkMKhWMA==
X-Authority-Analysis: v=2.4 cv=YeqNIQRf c=1 sm=1 tr=0 ts=6a3d4fa0 cx=c_pps
 a=L+Py7vYzrJWCdJtBuFK3AA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=nZw0_4I-qZg-WVdd8KcA:9
X-Proofpoint-ORIG-GUID: TTHsWXYf3kKa3hzKp5f9mdcMg70aTiZ4
X-Proofpoint-GUID: TTHsWXYf3kKa3hzKp5f9mdcMg70aTiZ4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzNiBTYWx0ZWRfX51ZVJVQGbJFb
 WO3ZaEh2mferWb5x/oah2xNxW6eS07ty57kmHgMJ2weiwbRuONqPxBKSeM84gxAVEVnBjo2Ht4d
 Tc2r7Tg08/8J0JEsWA2CGTPFCDEjzxk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 clxscore=1011 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250136
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Jun 2026 15:56:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17573

The conflicting firmware packages that necessitate this bbappend are
all in meta-ti-bsp, so will be needed by any distro using that layer.
Move this bbappend to that layer.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware-arago.inc | 7 -------
 .../linux-firmware/linux-firmware_%.bbappend               | 4 ----
 2 files changed, 11 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc
 delete mode 100644 meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc
deleted file mode 100644
index e22047ca..00000000
--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware-arago.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-PR:append = ".arago3"
-
-# meta-ti-bsp packages newer versions on these
-do_install:append() {
-	rm -rf  ${D}${nonarch_base_libdir}/firmware/ti-connectivity/
-	rm -rf  ${D}${nonarch_base_libdir}/firmware/cadence/
-}
diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
deleted file mode 100644
index 5e4fd639..00000000
--- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-LINUX_FIRMWARE_ARAGO = ""
-LINUX_FIRMWARE_ARAGO:arago = "linux-firmware-arago.inc"
-
-require ${LINUX_FIRMWARE_ARAGO}
-- 
2.39.2


