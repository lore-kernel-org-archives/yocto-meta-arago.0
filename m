Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BE6CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 14:39:34 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15088.1790779168318628990
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 07:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=fDaWCLIK;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=Pw8BGG2b;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1XsX3890198;
	Wed, 30 Sep 2026 09:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=251cbkeLQhlAl
	ACpj68iqPayHKv/AJOlZRLRJVUojR0=; b=fDaWCLIKmaRZzFObgR15RdcTmeCJx
	QSdoSkbmfwPb9dxutaZr+U+mRURKYrKuxp6WbK0XXqEdvWLLWskZCVFPX1m68rGJ
	Dtr+L3buRivs2bQa2iGEYoGTDRRcW90mMO/OEe6oLBcGWphz6g8XzsUeQFhTs+S8
	dnzDPPFq384eMuH11gfLvL/WHLLL2fxhDujsWa55yOKmm0wlL84bBc/hSHZHr+Hv
	bhspxdqytuEdFNR59dpOw+Gs9Jxs2tNd7RpGi+PyfA55CP4HATURGqe2F99728Tj
	b/fG+xbx6Ib/L/aixmZb28Q+FyXnGDrh2UB+SAHKbDuj7eZ40FLSJq+QA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s21e7m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 09:39:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyYbvbESVrslqd7ufB/5P0lot3wNJeRZHNeWtlplFXP5E6BxdDPF0U1Pz5OOWGPjbuGXQ8JEHYLIhSVYTjTJR7ygzljscO1Ob8ROJnhByzQlWM/WsNHhvPVLxHQxaNKuT+3lf20R8JvBEduprED8hz7l4SydOuVKSo69dQshIQPK6T3NVdaD7YTqxofHMcKGj8GKlp4OGQ8NCBQBMM3V4rxiYoiTua3OkrF7v21awOlyl1/dMx4Cvx1AZSpEuW5iPEY2E48F9WE/Yh5MJs+zZTAlsDPntnXhvyTO+WvSOEmR0jk1st0WCsp7f/ZuTxoKLCmUyBWf8NW5MOCSxgLwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=251cbkeLQhlAlACpj68iqPayHKv/AJOlZRLRJVUojR0=;
 b=XNoGknGshl8+1AjxkhVf2Y4Hf0IXctVVMiqe8MGhrp9JALlPqj0fen2qgt0NjMIewkQ4T9wO7kkecMSeoVq3slv2XX6DKEH8+8RxWjOHbeWLbdnuE/u6qAKej8TkOJYfaltYmuJlwyChClDdrd34VXzwvMCsyB44ULmwb0Wu1cakwkn3o7nSQcdxJuFG2dP0vSsuyf/mfYgZMh/QZBRhoWq2/bPr9eRntCn9zPmOTYoEYM18ghOdJbhhV9iR6bgSNVxRSnJpx6zqMf7pckKhswE/KeoXbjSJdx1+dYhisC51ppjoel++nhIgAVsiogpsyiy61Zm3qkZJqrqKar0GTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=251cbkeLQhlAlACpj68iqPayHKv/AJOlZRLRJVUojR0=;
 b=Pw8BGG2btvctQznKKjxiN4s6P0FpWp3ZFA7wIhcUZ2sUxTeqex1a/hJ+X3ZWRlMuIMt+fu0/R6JHrhUB9ietwPir1OsZsYB7C5jjLo18O9EtwcpIClaGol/7Y8sh5y3FaKn93VMglqJZDm1+ehlBfh3hycPDlsM5D+o32vUMZJ0=
Received: from SA0PR11CA0125.namprd11.prod.outlook.com (2603:10b6:806:131::10)
 by DS0PR10MB6973.namprd10.prod.outlook.com (2603:10b6:8:14d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Wed, 30 Sep
 2026 14:39:15 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::34) by SA0PR11CA0125.outlook.office365.com
 (2603:10b6:806:131::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 14:39:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:39:15 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:38:55 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:38:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 09:38:55 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UEctrt3304802;
	Wed, 30 Sep 2026 09:38:55 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xBvSR-00000000jrA-2MIT;
	Wed, 30 Sep 2026 09:38:55 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] open62541: upgrade 1.5.7 -> 1.5.8
Date: Wed, 30 Sep 2026 09:38:55 -0500
Message-ID: <20260930143855.176265-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|DS0PR10MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 92904b2c-5662-42f0-1246-08df1f0099f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	XYsDb9UEp9M1uOh4lDo5wGezz+EAWzqmPTKBO2uDGLlL30ik8/6vMxHMAtt83k62Mg/SVDk4kP4VGpb5PyUW2KJzWHtCCfpcXeBhKIL52BjTSCHG8jJaHx894mVyTJgf2O12oFIti6DXEuMg6a64OH/0JwCu43B/tPyL3LrxZ7W+UUf8UCsGWQgCzEZNDOCN5CumWPB9SZVHrCHd3fzfza5Y8pcRm1JpQKboFoF243zsmX6eXWepr5PMLGScXjufe7sJ+DelMy3WN13Kq+vMzFAMHhR94wRSlrieeq9D8dTw5nz6x4HTLDJe7F4ZBWd+U+uo9CQxxIsq8vNfWf/5SPGc2WTS8mhzDir8GHEJP2J/NnqT+usTrV/UJAAfB+tsCdSQNweMYWd/6vdmNqDfkDTbxfV/BKYRfCcJ9XIUM2+Khx3Pk7nm9hBww7SoG4m+s6EWA788vxexhqAXNL7kkbknZzM9UmodvZ7/UM+mPbrlnIkAg78imhDKtSUhMkgH1r/QX6yJyiiN2Jvv6sKIJgneSrhFwHwUiBVDCmIuvnopxqnMrNaRIjKykhTg8pVNLyga8TR6ztYMOhrt7Lr7ucVbEYvU+5tP0+VKrwZZig5Nt4Y97lYu1KslxI8nm0KrbcG/X+2u3glchenATOsAcYW2LJwL3olC4P+rTN+gXfM=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	f9f8QoFd1miKA+N5JgihuVYQ+OFj5n/n1rXIb9WPJ6hjyRYpCldQOViBOcyiHF4OMso2tHtskpMiW7CSRwu64dSKVP2D5mADmlynpq+0lnogsy/S2Aoa6a1IpxVG6UdDggSEPiUKlnuhFBabbk3x0QX+ZrhU3g4Zk5kbYgT+sq8fgPEXg/EFy+iwbn9oH/koTu+KRMFq1bOTqGaW3dQFckS9WZK6PdTeyArPNToBccE4tfe4xk3wacceI84EYWIoBToeDQR4h7M5lxmK/cYp6izRN+Xiicp4DdC97TIZVSNxA67Tsj148/7veAI9wwLO36WNl94U9unJYuDcbn1L+vcShkglN4uLFZRc14jtytAOOVKQEm5MtF/xl6WpCuJs5Cvb5vqXz6GlZbcftQpYKbfp7pV2dIo28RbA0K+IavnPYUCjEtjeBWHVu5aQ+XZQ
X-Exchange-RoutingPolicyChecked: 
	PtqoAWXkvx61A5CXlffgTr2V6IhVwQv0co3DZ/GFTX8+grjOiVg9aTFHueDV3QK9h9XboGNxAwA/hqgaCAQ8n1YXULYo2HptIYHRuM+IdN3d+YsUDoOEHwOFaPLGcidJe8tuHTHX1LopldKuKytWu0RTMzLelkSADH+3dh8eR9u8SsUg2pvcshcvbbOARgpspDP1bRs24KarBL2Uok3dI4t7yKR8/vY9Ub2DvoAB+5Q/ohuhD0XC8xGSVR7Z7azrfgQb8CO+bZCDqsZ9ELxcDjyCN/eXAHhgB+3csFJN97T19f/YUKD9LgLNxB1W8xQw5Efzw1LBRBV/g1wZPeZq1g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:39:15.2782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92904b2c-5662-42f0-1246-08df1f0099f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6973
X-Proofpoint-GUID: jLGj3dG-Ozai_cfCh_u5BBIwOlwRo8ca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfX+OM9YEB/YZDm
 09JjNVd7erUCA1qXCzRjST2OhUlRW0VdjjdJX2qLzxhsC+AsdzdRsUmtpwhm1NkKZ2CXLLXVMAT
 5J5hQg0BpmOIOAEBiIQORF3hNvU0gaKIw337AI6iBU6fxxJQPRooqC2+xK0wq0OvI1opZBLiDou
 s5wXfg5ArpcPGf9luRV6hxOuIj7zyWgpctuzT6EvCAhIL3Dwq52O+XMsWeeLp9IofZ4uBfJ5xPp
 YMzUR/LifW+hBWJ50qLc39+T8N8ePvMEDyyxY/yv8sd8Ehj3kDFhcw7LWd0Sm8zXh17A80NP2fZ
 rhUnowVncdH4w4PBxdk3RHKfiZQxy8diojKGCUl0Y+aUTOlQeyOvYvD6I3sUbzcHJporO/xOM0X
 z2ZlYYWWygsENTnK79ZSobQ1L69m3lmAW+tmp6vL9OCtoSFiYBIUc0PC0eqopHyEnZ6PPAwImTG
 ANzvqnLorbqHUO83xkg==
X-Proofpoint-ORIG-GUID: jLGj3dG-Ozai_cfCh_u5BBIwOlwRo8ca
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd1f1e cx=c_pps
 a=PWz2vMGk566g1z9MD32Dlw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=u941yjJuevAzILXbKhMA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OCBTYWx0ZWRfX2OPp+FdByQz5
 bN/w323pFx+7SYsfHDHEuJV0SwbMh/ZgzuujtfgCjSQmTRvlVWZRYfXSU5z0HQofNL4PXC51qRb
 RK0HEhCZYkZ1YhXJkrWzK1Mjz9dBqkU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300058
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 30 Sep 2026 14:39:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17716

Match the version change in meta-openembedded [1].

[1] https://git.openembedded.org/meta-openembedded/commit/?id=8cb8daf961891cf6aae75411c346af9e0a856883

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{open62541_1.5.7.bbappend => open62541_1.5.8.bbappend}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-extras/recipes-connectivity/open62541/{open62541_1.5.7.bbappend => open62541_1.5.8.bbappend} (100%)

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.7.bbappend b/meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.8.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.7.bbappend
rename to meta-arago-extras/recipes-connectivity/open62541/open62541_1.5.8.bbappend
-- 
2.43.0


