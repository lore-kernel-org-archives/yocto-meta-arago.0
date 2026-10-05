Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371CFCA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:03:13 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15923.1791190983797185634
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 02:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=P8IgoTMP;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=Llb6su1p;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: j-sahu@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6957duGU2341523;
	Mon, 5 Oct 2026 04:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=+beAx8HJA6OZi
	aRZWQfPgClmWD52QvgXoS8pZa89HJg=; b=P8IgoTMPazZYlRqS1RzTFuyJ8spjS
	9pF7MZOZrDQs7+fZ/X6KEsqU6w6j3hNb/wkzDp1f8UGGuCBcktj9ou95RmJq3RIL
	XarBvK5Y9d6eTaY+vmQJa+/S97MKe/1kjOdqP9IhCtahUqKt70FrE+fhoumwuwyC
	/VxJMfuu/lw4YG6xXAFCr08tv1WDJVTr0b3E8XGJ163tk3ndcMyy4EbBGi5MP9Y7
	P6gFkLXEqlz8DOzGVmw5lu8M8MlBcyArXjyLpjjvX6iG/aQxWwfDh25D0gOFvl60
	WWYAmOMsIffOo08CDFukOTBAid2TUJtboE2Wgk1fNwSxrwvGfS6QitlFg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012019.outbound.protection.outlook.com [40.107.200.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h3gup4hta-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 04:03:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4JEVZyN5p8eje3NzIhlMtBs9s+PiMoWnbGAqwNQA/otmtBIon7NiLZF8ur2Vr7uwA3YoqILWBjlmVyYlWc4OqxLFN/i/2JT0Y+8DcScSE7EqEifmvM9zs3EWLWXZsydIy25ufh6pFctiw+dDZeuKhRNK/sxnX3SmIWrJBQneeCPvl5cSVxN3w2hhh353PmnSyASRIYExxJRT62st8ZLOtpiqYrpHIo0Fmth4iI5O2ChKD8eq1vfO4OdBbxjV4VyWVnEyINTgY/ndueR0aBjJZN//sO1z4d52T8zL/3hlyv0wOZiaf1xofzq83RyNVDbQrqMdbNejYi5M745u3fxcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+beAx8HJA6OZiaRZWQfPgClmWD52QvgXoS8pZa89HJg=;
 b=a5j0k1wHledEj9483j8brM7vt1mWOYfqwE6iGvEWYWfE7tRVqjiHmkqHN0SF1qEJtU4wdisfffU2ao4o2EzqF1Rc+Piu6XjT1GvQ9nPmIIFU65uo2ox/TO0/pf2HaVUfFWC1pBJ89qpmJt8vb/nQWk3cx7ToMYvI+mnNVmjPpgxItTxlBnzhaBzhG5aOFWY5XTwPMqmLgHz9PThoF2rSkfkRprMN/a8jerQAB5Z3rHBNGRZkFBqDI/ft64vyxh5JeCyRrZVGZFycKrR+lekh4dkuOnOuXGuS0wMB184M0x2h4AGeztQN6ag+pVaGwuKia0hXPB5i6G5+FG1QzQYFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+beAx8HJA6OZiaRZWQfPgClmWD52QvgXoS8pZa89HJg=;
 b=Llb6su1p8CVrCxYTQaONhtytXF5Rj9nB7IlOTpmi87Pa4ZEpPLvW3RzlkfmuWQ6+WAXQVD4WfdSRkT1xPICXCd5evO0M1UlNq9GhnWsl2UzfVVSgiOd0scdPSGDkGC4mJ6ODcMkxYaxO31is83icWGr6S5usoxBdmJbqg5mGJUA=
Received: from CH0PR03CA0312.namprd03.prod.outlook.com (2603:10b6:610:118::21)
 by DM6PR10MB4251.namprd10.prod.outlook.com (2603:10b6:5:21d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 09:02:58 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::49) by CH0PR03CA0312.outlook.office365.com
 (2603:10b6:610:118::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 09:02:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 09:02:57 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 04:02:15 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 04:02:15 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 04:02:15 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.159] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69592DIr822298;
	Mon, 5 Oct 2026 04:02:13 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][master][PATCH] onnx: fix do_install SOABI suffix for CMake 4.4+
Date: Mon, 5 Oct 2026 14:32:07 +0530
Message-ID: <20261005090207.855638-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|DM6PR10MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: 67327adb-d766-48c5-d5a5-08df22bf72ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|56012099006|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	v6BeenNLGro2YNj89kB1BeFhwd+sirnUl2++kKO7KI48JDON0fIK/n7X4fycVSv7SMjFu/eFSqhkOuh9ZMTuuByTbJWBmc+NABxYi7LmJUkQD6+2oVHWo2Ay4RKLpQbWnY0LUNvs0rByuqCU/HnuhqnqZcEY9kanw60Z110gz2UHt8CbMY105lAg0/pjW5rND86UKbhmVCFvGSpn/1br9p1gdICnBL4MhHLsACY6clWx/z+/pqftNKNYigr52qtS8gVrWDnmduqdKwUizJF0lNRevtWlkXdW01SQO255ZT73tanAzNSQL1Jq2eR9WUCmudeApPXINXkOWi3zeoxrRtXGki1Dgp5kFYdBA0Acbpx/u/Mm1N4nnMn3P9ZrfcQtPQRcr9/JYK4+OAFJkmmCAf/5aqOHCDwNjStMhCmDm+SMVVt1qhfSwQzoxiTXSF5QI3fdlD97Ac0eDTWBlkpIY/82e1N+OuG1dTkfnwi/eNbk7dkM2YUEJ1C5da4SC8R4gU23WNu+WrSXyTWiRxtM6+k0w4QXoSiAq9EMb1Y4trpj4i2a8yE9zpGUNR1WiCB4fbhob5jZQU99n0xCOOh7EdUkWDm01RqmtwMu6zp9q5krAJZPFggw88Xvax9QYhM7epay1SFBM7+aB7r7JgBIIeUHG6s44Q29EDh7y+5NvfM=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(56012099006)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fwUEN4vnngVxiLMuOuiPpuXw+teVQkVh8XQCbkMoTv8G0uhVI1Um2ExYDxleoBELy0eGPBGpcloluV+wrUX/psuG7iGv4EKaVd5ZcDez56zQQnbUiquhpp0wSVAmnld93quPLgRx0LT9elLz5xY67B9AVy3NlO5xoin41JyEuCG3vft9Gn/jzBOXBJ6+BR87LBI6/Htg8+w/K76h5qGU+IQz8Pu6ekJm02Ncxiq6Yq9ZUUk2wF+kbC8fXOytn7oIOpEcCxt5uqRMI6S6kLri1vF+eHqWkpW2AUDHGMisD05TWUcbh/Eo1ePtEtveRTpMD7NXT7KDP2yioM/HQA6aFvxagExyfaZ9Uy3QF0uIhw0pF6WujAv9VHvBg/Ej5UVkujwCLbzQyX9HfGAOB6CyR96vlQA6aAId8+f7dUl0fHsHPIYow9eSOYzOmnJogFf0
X-Exchange-RoutingPolicyChecked: 
	v194HjLjWe8uGslNpgg+RTRMXBVZnL+a/tFXO7z74x7PM2eHEJghgi+04p0Sk+2nqgP1rfkE2jhA4ALxZMhjrkTl4q9PUxy3pXkK//xEgJ4OrQTAb3ic4iSHAmizRGQPsDhPH0W97FAuypH6kZcnSuoouhuNwrwvI+7IDFh+gTbKZteQ3n7Nt8c4XcAi6GdAz1q+08gnUPozPaH7+70kVV0V2WxCm3Lg0Rh8lGqYSu9e8z5Yc2AjmgUSyEpvSpuiwjt9kGPud/yFbURp/YVi4tbY7JkSlirXdnK0prJnzxHeW3gQi7HETh2hUVPYji6LjHZOhReQnJ+xKXgnOssZ4w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:02:57.1010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67327adb-d766-48c5-d5a5-08df22bf72ee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4251
X-Authority-Analysis: v=2.4 cv=KqjYSmWN c=1 sm=1 tr=0 ts=6ac367c5 cx=c_pps
 a=jJxBgQE0Gv9vBhouG1T1Tg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=f1hami8VAAAA:8 a=sozttTNsAAAA:8 a=zMAKw1SvCX3pUZVQ-WQA:9
 a=FMFxGtP9trmfb28vA-lX:22
X-Proofpoint-ORIG-GUID: fAme2cx2GpGxu55DQuGUtu1FlJYZbYKO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNSBTYWx0ZWRfXwQNPpDsYTjak
 399uYF2+guZmLPr+wCHxxieypsQxHKJXEE0rh+w8iay2rZCqff0NsLCXJam0Tbs/B4OMOV1Y5R1
 zvHJRY/D+bKyVSGuhQy41aWrs2Gm74s=
X-Proofpoint-GUID: fAme2cx2GpGxu55DQuGUtu1FlJYZbYKO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNSBTYWx0ZWRfX02zyMFDly3by
 DV4NK1rB/R4ZcsSTJCK4pkFTauEakIwkHhHzTmELHc2r+3pEH7kF4Cf7fXB5Lz1W/WlomZ5JUi7
 PTIUl6leVTGG7Wbqpfk+WnJPt5ugNuWORSgOWhveWu/pgrFmvtVE9ZThGrpKAv9UUwOoj1vzBgA
 VDufPwYRBFRaTtbEk7j6nOmLOYn1qpAzp5yhB7E3DBliTeV/ZXwZ7SLK/K1xFHMAZxAIHe6eBkA
 JOPQWeNiRJg0zTMpIfWorCzs4NZVe2/l2YGSN/NyLRaCRdGsCQpo8gXiMLlUWn/r/xXPdLASZ5U
 iZQgjCZLTr3LdIodiyobpE6UARNd+Bv2R/nFD+x5EMtt6Nz2A1RhAWcnhQk0X3N5hw4LTtT4XHX
 LVZ86YGeEF44qtjUm+Y/QVJE00VvE6UqiuZEjPfFWErxfd5SL3NS+YWdFlodfD5UkG+Nps3k1yJ
 PSXn53TFyBoBCVlMNQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050035
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Oct 2026 09:03:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17732

CMake 4.4's FindPython3 correctly implements PEP 3149 SOABI naming for
cross-compiled Python extensions[0]. Python3_add_library(WITH_SOABI) now
generates the proper ABI suffix (e.g., cpython-314-aarch64-linux-gnu.so)
instead of bare .so which causes build failures.

Use wildcard pattern to match any SOABI-suffixed filename.

[0]: https://cmake.org/cmake/help/v4.4/module/FindPython3.html

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb b/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
index 7d27119d..78d2e1d3 100644
--- a/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
+++ b/meta-arago-extras/recipes-framework/onnx/onnx_1.18.0.bb
@@ -92,7 +92,7 @@ do_install:append() {
 		install -d ${D}${PYTHON_SITEPACKAGES_DIR}/onnx
 		(cd ${S}/onnx; cp --parents $(find . -name "*.py*") ${D}${PYTHON_SITEPACKAGES_DIR}/onnx)
 		cp $CP_ARGS ${B}/onnx ${D}${PYTHON_SITEPACKAGES_DIR}
-		cp $CP_ARGS ${B}/onnx_cpp2py_export.so ${D}${PYTHON_SITEPACKAGES_DIR}/onnx
+		cp $CP_ARGS ${B}/onnx_cpp2py_export*.so ${D}${PYTHON_SITEPACKAGES_DIR}/onnx
 	fi
 }
 
-- 
2.34.1


