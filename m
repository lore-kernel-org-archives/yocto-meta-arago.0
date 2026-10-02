Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA85CCA5FDD
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 22:31:19 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.647.1790980278238252660
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 02 Oct 2026 15:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=YhgtJTs1;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=hjQVerlw;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: rs@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 692KAOX91507453;
	Fri, 2 Oct 2026 17:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ZIy2N4b2vfN3nbOb4EqJFtfowHpKeIeYfzoUBzp+V
	xc=; b=YhgtJTs1DvYH9k715WSoLVx4DG8o6nsljOm/6O2wIEgE/EjmEOQygZqjI
	5QOpK4FwfsCGZkvBAubTgVb+kHLfyCrWMVhZK0ak7wJ+zqF7PFToJjOlENPz44zK
	D5eHiUZBfpZCWyXb5PrK0skFTATD3fd5lP8Ve40+aC4q31bbuZig2E20Z3IgXJ/6
	f+MHRg3BN0FTwq0OP8pqJ1Wp5RTp09ODxIPayZhHwsH6yea8R+jeBi2VmQBJZ+6O
	CUYTphT/qvVrpkCVBF446X6SlPWDjjwy2LQrioi1Iq4xZ9xArzPNCsOQhPG0L3jI
	xt56vmFvA/gnB2tL+kY26m5CzFDRw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h2eym2tf4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 02 Oct 2026 17:30:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ygtrm1lhIktRAANd5bhY9NkFFGGekTtuW0a3ePKQliRGjxXbxdXTukWZ3to6vDZGHN7uIBmvOQDePMBYtM+osGlaVCYkO0hO2c34K7EuGiHK9JuGb+zWpw4BNYFOcjzkuOCnyoAon6gbYm65ehSQwCXl+b8ABVodUT0K+yIkvZEtSC94gCCCp1Eu5im5l9QXhBN8XETZ98CmIvQLd+HmXSyr5HfrcSPfa0dhtJV0v4+XF4vuJfBPzT1cig8Stz+uqwwnVussBvW/0eXDt5bkfroxFhjO0KOqH+9SFTRmYkoQRiveQA6lVvXAmnBz+iT2jF8Hfu8G4kZ6FPdlRFoV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIy2N4b2vfN3nbOb4EqJFtfowHpKeIeYfzoUBzp+Vxc=;
 b=lV7K1Zg9tH+HKX/iApH1lwr954i75Vhtt8hM7mzJ5Rw0KXE8rzLnn/gRlEZOfLdf8ovOEwzl4S9eGphw7HGqunwHN8i4J0XIZiji7D7/+XLOZImVlsyCwxJxCissES9uoH9S+BbgB/NCEuitrRqsouxLrHA5APCLFDicLDxwYMk/Xq0nvKS9C7fhnYZEaZ/XQloJUhe6iNAbzpLHZhPytOWYVC600wMOCnVGxqcfGPB4gGj7CR0sESIx01n0AgsioQLySefU+OK9g/OrJO/B0vKCszI3WMnK2oSel/GYyWCPwLw+QYZSogbyQV8GscnB0MhLjSC5NdmmPXZlbI/CBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIy2N4b2vfN3nbOb4EqJFtfowHpKeIeYfzoUBzp+Vxc=;
 b=hjQVerlwYuQsf65dhdTjKzM/ok7kKVYlUIsXk4OG5oaEgwdK4uEBpuqAcQrBltO95rYPz8wFvKqBVECO0jshZXD1YGToAmIXxu6FreGi9XjPhYOBcYMPfnz1OHT00sMXdg2pSrIQczFVPrDzFj7OvRzOEh/h6IZRhSsqOOIcgGE=
Received: from BN9PR03CA0658.namprd03.prod.outlook.com (2603:10b6:408:13b::33)
 by DM6PR10MB4219.namprd10.prod.outlook.com (2603:10b6:5:216::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Fri, 2 Oct
 2026 22:30:16 +0000
Received: from BN3PEPF00022BC0.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::95) by BN9PR03CA0658.outlook.office365.com
 (2603:10b6:408:13b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Fri, 2
 Oct 2026 22:30:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF00022BC0.mail.protection.outlook.com (10.167.248.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 22:30:16 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 17:30:04 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 2 Oct
 2026 17:30:04 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 2 Oct 2026 17:30:04 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.75.60])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 692MU4pM3896078;
	Fri, 2 Oct 2026 17:30:04 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/wrynose][PATCH 2/2] weston-init-arago: set WAIT_CARD_DEVICE_COUNT
Date: Fri, 2 Oct 2026 17:29:54 -0500
Message-ID: <20261002222954.3580000-2-rs@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002222954.3580000-1-rs@ti.com>
References: <20261002222954.3580000-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC0:EE_|DM6PR10MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: ae308b6d-b950-4863-831d-08df20d4bb8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|10067099003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	1yLlxf++lNRVkFvEvBWix3kFLf8UYctZY/GZlgq4fMi5ZCi4BCezzqtVjZAsaSYe7G1CAlcVGvKV0y4X++JwuKqyjMsPm46CsUdLdps6Na5utcJK4QDDDouNaZoKa291x4nuUl2ca2E+mGSo7EA7Dk5FOsIKqPiGWtt02J8vqAJPiwaVZtZVpnNZdtFLovSrye3ajmcTds8+suwXLBmlMcy0v2QjXLEPgr8fOrU0CpaPT9Uc/4NtqWlFKRehT65hLY6zefg4D8GR2aLs45pFHH8uVesG2vgIkR4K3RWR2nMjYzzj+nG3vTwmoZVNoop3jVXeePxQO3tRnfnjtxMocUqkhaMe7lYjb13vU6Mz5CBPy5ovPIcWqjRWqO7o5hmnYqZ79XJly2rwbYJga8K2ZVfASzWW4fT8zkWOSiWGSF+e/vpUTdMuUlnEUGAf+8fKS+dqTtfHoPOFuCSmXer1CN2ptBW172tDtJy1vRvCktf4CuFyOMGJZBvCbZuIlgnStD+13Ahbu/+gVtJYE/ftxaUvLeVPxCwBkCS6PVM48g7qpMeDvik+uYBOfAsAZNGkhQ+kKU1KBQ9d0bg26wdC83D4IbuXvMftouxHqTgoZUh3RA2XZN4FygqNXLuoPXMGRjohj4TR7U8zZbTe/SL58CDxB0N0OlvzbYOTcTzZAsHvmcfa+5x7ByKajbT2LxD4ZNIKgvr6hAPlLGr9LFm5mg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zKGLfD5Zc7R9aE5rPGkdssc7YlcTAyf7TjR/97jOsenBb5617pAPIBe+VJcsXxZxUm3ks2fYHyoCdoA7AT8HXjjZilBKIeYylYzVV7qqiMOXuAy/tPMVqglLoLv3dvE1sLCyUg5CbWAK/PIIh+zNqvy6/B8flioukB//MEE6Xa6twlencCGcjI/aUWVZSaltecMARGu6o+mb2p9Fw/VZKSmc7CnmT2qhLzEF8KmgUQWHNhvCFo7NAR9lQwWtlE485PK3i2FqnrrLd1th991VI+jL1fma91fUPONraeijfVol8lzhf1XwGdd6HATpuswRTXZTVM9XHCBusa5NASp4uf5iF86VdWR4wxZAj96dfSncuBb45jw6o6F87izpBTraQvIZDT8H8UkF/mDLLMtKu8IoV6DDFJl8M4spQXqsMCnTqu+xYKVLzj/58loDZ5gh
X-Exchange-RoutingPolicyChecked: 
	YbnzwwRDhQrEgT34Y4eiqX1v99mqSqKl6esyobEclyWIl9C+ey7+pIctyvpXkcBDtEhAqer8jYBhqAzC/oCO0Xaf+PJarFTqeKzTCTRNnEMctdArcq1wFxaDXBhcUkEyWEjEKuTjk35Svcx9b84Tsg3H9BTquSmRvSM68/CLJzfDodBCvHrh8ZSb2RjuiiQEZmwkXGTMW08oGwTzA+ifY2upHwZGewGY/lrSvZSUKKHJbBF3oPcewYplWTJjaizZsyafsuoMFndg5gf6pAwNIAYrl2WVWbuguomh07pqKgOrrf35zLW7FBivHjumgztpmC8UbLA9MwIohclB9wjPlg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 22:30:16.0403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae308b6d-b950-4863-831d-08df20d4bb8b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4219
X-Proofpoint-GUID: eFc-yetKzt7lkKu812XWlbWNjw5gKDMT
X-Proofpoint-ORIG-GUID: eFc-yetKzt7lkKu812XWlbWNjw5gKDMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA4OSBTYWx0ZWRfX2xf5NcgfIwXu
 zNiuhLjCVWB8HKs9515nDleq/N5H/jLVyYL/Vgtw2zyjnBwL0jcsH4IKCFWmMFBwv2L/HkvsXEW
 Gtsoqqyyxa7R/3c+YUgUuu5ejYxch6TT5aqesSiZC8doeO6KwgUnWxpUIcI8YhsHHPC2lw0r95T
 Y9C3fxGipWOU0xkKBwTKhX42HKbD7E0P86z7epHx21rLm4aleXzXFAZpHUV64b6chu0JXm+Kods
 D4JK5X5xTZQYw713N6kZNEXPwLH32GSCJ3R3BX87HeigsKYXPJlqsNxEgEqZqYq+2K29/EitG/B
 rGDoYdRoLogppSm72CH7AYIkJT01BCttlwntfiEuDef++ns16SE17XjcNM5zsXfhugOCcVKsXad
 XX/ANq+3d3XaSyz709YjJg2moJHrxDguc8VunlPvZEIJtT0UstfVQd/1SU7GSSngr9WjN8EVSVD
 ww+k1s0Te7C6jOXHbUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA4OSBTYWx0ZWRfXyoiXOxCVhv99
 eSmUEzwP5bXbfXZAEh+RCkrsVkXq3DfbA/oys6kXNFBVx6pq70UEU+7LgSRz0mG8L3R0Nz4y69L
 WbI1nc1P/PVCQ3Rq6gxXPOHCzPwhF8U=
X-Authority-Analysis: v=2.4 cv=UeLE26SN c=1 sm=1 tr=0 ts=6ac0309f cx=c_pps
 a=QW6cWtaKxEx5aDBFEJsq+w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=OrP6vAGO7OGq39zjsq8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_06,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1011 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020089
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 02 Oct 2026 22:31:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17730

From: Randolph Sapp <rs@ti.com>

Update the emptty configuration template and define
WAIT_CARD_DEVICE_COUNT for this usecase. We're not doing anything with a
remote head or fake display right now, so a default value of 1 will make
emptty wait for tidss to initialize. In the devices with a GPU we should
set it to a value of 2 to ensure both expected DRI devices are present.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/wayland/weston-init-arago.bb    | 12 ++++++++++++
 .../wayland/weston-init-arago/emptty.conf            |  5 ++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
index 484d25e18661..1a649342bd16 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago.bb
@@ -23,9 +23,21 @@ PACKAGECONFIG[use-pixman] = ",,"
 DEFAULTBACKEND ??= ""
 DEFAULTBACKEND:qemuall ?= "drm"
 
+DRI_CARD_COUNT ??= "1"
+DRI_CARD_COUNT:j721e = "2"
+DRI_CARD_COUNT:j721s2 = "2"
+DRI_CARD_COUNT:j784s4 = "2"
+DRI_CARD_COUNT:j742s2 = "2"
+DRI_CARD_COUNT:am62xx = "2"
+DRI_CARD_COUNT:am62pxx = "2"
+DRI_CARD_COUNT:j722s = "2"
+
 do_install() {
 	install -D -p -m0644 weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
 	install -D -p -m0644 emptty.conf ${D}${sysconfdir}/emptty/conf
+	if [ -n "${DRI_CARD_COUNT}" ]; then
+		sed -i -e "/^#WAIT_CARD_DEVICE_COUNT=/c WAIT_CARD_DEVICE_COUNT=${DRI_CARD_COUNT}" ${D}${sysconfdir}/emptty/conf
+	fi
 
 	if [ -n "${DEFAULTBACKEND}" ]; then
 		sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
index ffe1a3c26f64..4c4ac453bb96 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init-arago/emptty.conf
@@ -20,7 +20,7 @@ AUTOLOGIN=true
 AUTOLOGIN_SESSION=Weston
 
 # If Autologin is enabled and session does not start correctly, the number of retries in short period is kept to eventually stop the infinite loop of restarts. -1 is for infinite retries, 0 is for no retry.
-AUTOLOGIN_MAX_RETRY=-1
+# AUTOLOGIN_MAX_RETRY=2
 
 # Default LANG, if user does not have set own in init script.
 #LANG=en_US.UTF-8
@@ -75,3 +75,6 @@ SESSION_ERROR_LOGGING=rotate
 
 #If set true, environmental groups are printed to differ Xorg/Wayland/Custom/UserCustom desktops.
 IDENTIFY_ENVS=false
+
+# Number of DRI card devices to wait for before starting the session. A machine with 2 GPUs may want to set this to 2.
+#WAIT_CARD_DEVICE_COUNT=0
-- 
2.55.0


