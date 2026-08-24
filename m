Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B7BC5DF9B
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 12:44:14 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15635.1787575449097948189
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 24 Aug 2026 05:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=HqQhRZN8;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=w+kcsIyN;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBQ3Xi3131185;
	Mon, 24 Aug 2026 07:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=s25MvrvY2b4aJ
	75qmA9j5qbReAkShnpkKG9ST576LO8=; b=HqQhRZN8nsjIpAPis0Un1va335cAV
	ZaKyPW2O1z3MQZE0MCRqozceIqud2DiHCgruE1qS61i1aYKpNg/g52Ob/D1Mw8hp
	XMwpP55gyEo0X3vPI8RvDWcIIniFwT8AcP/ch/qQ1GSCFNTFv4qCggOvwvS1u28K
	e+WYMCckXTqrS7yXJSfD5LUuXXe/uam4i2FaMZ6kXrIlGwCs6qJp29JF2dI6ooLo
	y0JYsg228nPrm/yM8xmEuUTbBDQ6HHDEAfJC8ikC9VFd8utjAmPBJmaDEdgLumiL
	SJ6cSRQRl/1VwrCaC6nIlWENpYpLxcWXnOQHdNzhduY2wqu6yOZ+12DbA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g8d1fawc2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 07:44:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAoTIQEBtfU6GrHEKSAscyJFZgsgcctCjQ5Ik3UPBy18R6KzPGNE9PlgCJJZD+TPPXH97AeldZ0FlVpIqV1PjIAu1pkWPxYqFmyMBMzY90LKOvjhKdgjkJ08DLHoNQ5aVDTADRhL5llSYYwBXPnQ2uEOgH+8k27EeVPfdZIAAVJikYCnkkwj/Wla7OS1LJUIka2LT4DwsLcWK/aOjDY1Lg5raNXzi2wmFAzcRwVxIVdSNV8LLLZZTbTM7ldTyvEEVmN1JSNRxDb1RrKCNXXECuDanQU1G8n+8E2WVAWQ3PMMJkqr09q+njsuAo7e34mk0JQHyxhlYBZwRBN9tn4RHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s25MvrvY2b4aJ75qmA9j5qbReAkShnpkKG9ST576LO8=;
 b=kRuPfioCEw6MTRHNvT/Dx+NiPdXpu7HqLkE45T0GLvAEsjbN/moCHpt0WvWh9eTMinIed04PMO51tiuZbdwehHnOyugIonXsy2eZXbjGhZBT7ELLYttCL31HWvlTQa4hPNF+CpJ2QzYJGAJdFhdLO8HGOemBqHOWjMVosWK+C4dcbNNTIVfYLSBuIr/RwHQiAkKRrPYnSMiVkh/1wB2ArbFU+6XozO+8AU0LCaMAM0IheoJJjujY+kvlMhs+gGiqYfhP290VvaiZup0skS35QyjErtSB7PQLaZ5AMXfMc0IPA0iRZlXVIu6Xe8TZZD01Z+jWaxqlqmomoN9zxs3Kuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s25MvrvY2b4aJ75qmA9j5qbReAkShnpkKG9ST576LO8=;
 b=w+kcsIyN7ml80P6OpUBFahK92kqPHND1EiQFpsFWxZDf5wSXMk1BoFoW2lEglpuPE1ZbwkUXmNXgPPyhB6AE9DrxEZBN0NelHBhFjXeNQEzki36AEIE5jZVPBELwnXI8pM86Zm5vV1kFIgwUCE/poXSRxVYJMZl0ipD4dVPvSNA=
Received: from PH7PR13CA0022.namprd13.prod.outlook.com (2603:10b6:510:174::24)
 by PH0PR10MB4518.namprd10.prod.outlook.com (2603:10b6:510:38::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 12:44:03 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::43) by PH7PR13CA0022.outlook.office365.com
 (2603:10b6:510:174::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Mon, 24
 Aug 2026 12:44:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Mon, 24 Aug 2026 12:44:01 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 07:44:01 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 07:44:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 24 Aug 2026 07:44:01 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67OCi0Pl3083227;
	Mon, 24 Aug 2026 07:44:00 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <v-singh1@ti.com>,
        <c-shilwant@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH] recipes-core: arago-core-bundle: Simplify DTB filter for am62dxx
Date: Mon, 24 Aug 2026 18:13:37 +0530
Message-ID: <20260824124337.2611340-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|PH0PR10MB4518:EE_
X-MS-Office365-Filtering-Correlation-Id: 1386874a-7ae3-41b2-5d40-08df01dd600d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	68SztgP2ruNHVMqCcFsp9nn4gdJfE/t2+kBOhpDj2VsAVbLRWc/SGNbDUmrDQFbiRE7PRiCOhM91ptkaSUtR0ngUMew1F+XeONU2apFXFktob5kJejxZqu83q61FTRs18lTJT3POcxLS1JmNLaAv8+4Mulq/n+yixjZGzQ458Tf9ONRFv50V2/kVpzOSFT3tG9kA0DJmX8CRXU8aSLMXajHjU3+gguN3hLpt1Bw8EdGa6g7qMYQPi3+3qOr8BO8189As/LiMeBGYq3YB7lUgzu8JbRnWWD8ISD3gcUZ9T+mrERy2bDh80KZ/CsxVXwGdCB5KoF74xLjNXmvtKoPJKcen85l0ui8Bouf1CxHBe+yXJO7IROWEuEqvXjFJUF31W9jXoRTmc/L5Ct0j4kGYVg80FlfUU63ZN7AobyyWYOodQLmvXUAIIP8sp15gU/cl5bEJtVci8xi34n5+rM1EOlyX5QIt90iy4NfEPCTIliSlFjztBXZTzqJenPxSRdofz4Fpa6Qcl3Su5FWrWAXVDqq6UZZqBnzhwaZcfs82aCsZxMkWWfsI9VaYc5ujWul+OV6Z4D4qYGaMxhjvGyTAyqrGNmi7zFbS9M058J6E9hnYgf9OGHFo+hD37RpMdNqKheoCdGGYsYF9HOJqhAjG144e9YvUOkfziMOuQzAgeskzDPIbMnrc2/uuh02b9/VzwFK8QB/0azNagYaT78+q+A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	k3EQBROTIjij+uMKcx3X2GJNOQBCG3b+u59hTKFVlpYOodmg3CwrCdqT86sROaIPKgP46L4lSwQQEosOe1d3LQCj0QF48Q3h1FbO4Bj6wSfxe9tys83hjeRCi17AFiBDtPiyyXQlqd3/9/TbdijnNxwTklkBqoIfw2EOHvaEf15o5rTpumLr3wCgZPuoRKhns6+CwjnP/kXoq2w5rn4pT5uaWoAI473s5FTCgAmpa0LJahrH2+JvrthBXklMbCfPW30mjmUivEgXTANVEYVhUuADDE1okvI6wYETDx5Yx6z/zRbR/osVjlAYu1u7E9ULMeIpFNfAnWuGR9majNts/+DOOwGsTW4xRlVwXVbCpQqYnfMDWgQUxMEqFXfwb0K6eNYXFVte140Pxuhj6XBxTBoetdvWMWPeWyQUXeQABexborTwVtwyJITvZAIUGm7R
X-Exchange-RoutingPolicyChecked: 
	nJmx6dw93u2KQe2HELnASy0AOH0c1arEG9XqnKaFbF4EXRPnI7uRD8pFY9JrCx1bvekAvVDZMrbMft6kGKf07WXiPapudl1k36t65ElFW4KOGYico4gGorVtoXUqqsTOR7aBAMXR3fMFJGdkqvkfISwwfT3IGiIDn5rHWrI7Qy7K2cxa5vDdwPqCpZBWb7NQErAOC1N9S2iXit8PebrQcXcriM8xIaEykM0zNubDn1YCE9TR7xeqcrWjEtL+wBIUw80IaG3ub0kvdyE2fsEJFKDV8xI4Y83PHzL/AmLRxjy5yYQ84P2yDbhhEX/U2Q/kKhnTGwpvxbMa+oCnz1Euow==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 12:44:01.9954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1386874a-7ae3-41b2-5d40-08df01dd600d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4518
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwNyBTYWx0ZWRfX8c36/fB5bYvU
 vNnwQgjwkpqTgOU1D2CChE3LKq5ZxBR2IupUY/VCUT5oXi/QKPTnGt+VFWaZlgONFxnFkVcxbPF
 4jm0Dyuf7Yj8rvEFPVgcgJ8hn8wfeLOWRU2wiWmBjfglEp2j5wzBAPQasl5fp4UAoKV6LryBMyF
 OotHU06xz2Q2c3ARNxbjxRWOAfYo5408LzqOnxr6RBK9iWG3ZbSUmswOEioFitI8N7RmlqgvrET
 iBQl1ZRiyv+oORM0AuZGyMS0K6s297aiWskhZQJ7t1gdfiEv2RVHC4RgEiIv/cu5K0awAx7KBI4
 wILY9Hc3WOL+jD5bShifZyPvaqX3GkqEpjZpiy36HlfzELI37ebwaq+64ASkxvUwjtGKJySn61j
 glnpiWfGkaWKGIxLrj3BPcwfYsKtoeICliRQ/piZHTLCvhG9EmIA2VgaFpJmFpxDQWpaxwrt8M4
 xMoyeN29ewKdAVF4OBg==
X-Proofpoint-ORIG-GUID: 2o9Oj_hJzitcE7Vd1JpT3eoXd8huV3vd
X-Proofpoint-GUID: 2o9Oj_hJzitcE7Vd1JpT3eoXd8huV3vd
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a8c3c95 cx=c_pps
 a=ASIy48nXBLRhVdclknX/jA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=Jkm5S7o1HbKbMYsY-mAA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwNyBTYWx0ZWRfX+473wlVV1Gcj
 6VOcncyhlYAx7l9bi7Sjatm4RAlGX4ST/BrUYzyn5txKDUrXtQOu1LKCrEfiLxJNZUgtpWS6kDa
 ranZdizp8xjh2n9S4L+WKStQbz9y8Io=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240107
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 24 Aug 2026 12:44:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17605

Use k3-am62a7-sk as a prefix pattern for am62dxx to match all dtbs
required instead of listing each one explicitly.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-bundle.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-bundle.inc b/meta-arago-distro/recipes-core/images/arago-core-bundle.inc
index ae2c5b1b..1c79bba1 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-bundle.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-bundle.inc
@@ -34,7 +34,7 @@ DTB_FILTER:am62xxsip-evm = "k3-am625"
 DTB_FILTER:am64xx = "k3-am642"
 DTB_FILTER:am62pxx-evm = "k3-am62p5"
 DTB_FILTER:am62axx = "k3-am62a7\|k3-am62x-sk\|k3-fpdlink\|k3-v3link"
-DTB_FILTER:am62dxx = "k3-am62d2\|k3-am62a7-sk-edgeai\|k3-am62a7-sk-rpi-hdr-ehrpwm\|k3-am62x-sk\|k3-am62a7-sk-e3-max-opp"
+DTB_FILTER:am62dxx = "k3-am62d2\|k3-am62x-sk\|k3-am62a7-sk"
 
 # K3 SoC system firmware configuration
 # Maps machine types to their firmware naming variants for prebuilt-images
-- 
2.34.1


