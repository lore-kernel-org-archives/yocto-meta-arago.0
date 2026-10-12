Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DA9CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 20:11:12 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3613.1791835867315923631
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Oct 2026 13:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=D6PI6jEn;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=uT3p4Jo9;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJP0D43026313
	for <meta-arago@lists.yoctoproject.org>; Mon, 12 Oct 2026 15:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2kD9puuI6TqRG7pokT5aCcZ18m9cQqUMTQBXKg2a6
	SY=; b=D6PI6jEnFJZFlzoN9tWKcApPIDIok8U+a7n+sDyidz1EtZIs4QbouztlT
	/nu2faQziLly3OcFfNwWbeWQOiIO1dxjdreSK18ZY4k70bvfobp/DReo2jexVOSR
	JOvdPYg4xfcGlR9lrbUtITS7SxHND+mDj3VT7oXegfeQ4JU4JuR0I1jFjn+pR3Wq
	zUYUobNf8ECr9fEviJ3CAoQpZvle7wWi4Pq5jNbal9XbVgykFK+ABpX+tn0rflT5
	oYjp42gmHxHk99hvyHagNVjFy3UkTKJpIoncgF+1bc+VkStfFFkg23YlmHaxFTN/
	SFJ3y67HVuExUox4IVeSWhVdB1LYA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013029.outbound.protection.outlook.com [40.93.201.29])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h907ntm06-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Mon, 12 Oct 2026 15:11:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0tco64ITC+n4dc8x0gGiTbAmpFjX1+Y+E1VqCkV47DGOd5P9XfnTeLSlgLNfsjdSSLV8rjdqlOmHMvAmrC34gzqdjwlVuqXDTuH3uJtRJIwHKJ7dPfXFWYw9EONmQKIuuK+e7yuy0Gci8tZDydIsgn0Tg8GVeVZ9Z4A9AWeGWFJRT8Afvn+fX+SlIlrnq00Ct9cF2FQEeGfJ7SVBmwn2Nc51bnhxx5tzymxSEcC9eATP9epyQOYR5FPC1CN1kP3hvhcTszEKuBpMjqInChyd8MTCppJDwwOHakl6e2NipMmwhjxOncrYonxDk6KN2XeFRmr2a7VJwnlErCHNTeF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kD9puuI6TqRG7pokT5aCcZ18m9cQqUMTQBXKg2a6SY=;
 b=eeOjHPiWDFRV3HwNtr8VPF6VRhDfzhMrB57UPjPBlzgQXIjUEhPiRH5vIBW4CpO8bUNqn77dgumYdUGcAB+Flj+Il/Aej3YZ7IPa1rQwyipq2xnlrsaXzDgUdqaHxjzEMw752O+8sIFSA4hVQ8wD0jwMZSaooTv3EzDZM3+ugdpnlQYA08f1KCnrggEKQ8BSeOzAs4hjnwXpMr1S/UKJEFhikDaqMoMbeu7L+U2VBNa4S+fcqNaYlT2viJGjBaoNHxyvXzngiSQ0DB3iR6tfYygx6QcLPcBZbTJXG7loEknEMy0nLwihPy0d2LBsGEMZMHClPKEjhrDOnlQ8SmdwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kD9puuI6TqRG7pokT5aCcZ18m9cQqUMTQBXKg2a6SY=;
 b=uT3p4Jo9NJp1Kh5uT5nYEYi1+bj7P5Sz3zaf9fvZt5SoLhfHLDpzbeBIJAK55q1PVtV0+erM+3bwc2nUx/7as1NEo/hkW0S4m9YSome3eb/eIViYg0+sZ0acfVDICR8kTh2TE8u9390TNOu2Ub26JFYNr13UuEWJzDZjrNwOELwyKHui5YQHOkNgKHcqhOEEEATXA+zW3IF2YnJScivJSMv6odBZu7MYaUb4q3NyZhz7w+4kNUDdA0jCo0Kei82/cM79oIZHajHGJ4FSA7DxVVTNhX6cj0Kmk94JEPadOsOulYE/tI9Q0F8bVxezCm5rhdOa0wNsIfDPhSdQQInhOA==
Received: from DS2PEPF00004553.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::51b) by DM4PR10MB6885.namprd10.prod.outlook.com
 (2603:10b6:8:103::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Mon, 12 Oct
 2026 20:11:02 +0000
Received: from CY7PEPF000000EA.namprd04.prod.outlook.com
 (2603:10b6:93f:fff6::106) by DS2PEPF00004553.outlook.office365.com
 (2603:10b6:f:fc00::51b) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Mon, 12
 Oct 2026 20:11:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY7PEPF000000EA.mail.protection.outlook.com (10.167.247.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 20:11:01 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 15:10:42 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 12 Oct
 2026 15:10:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 12 Oct 2026 15:10:42 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69CKAg3p2115828;
	Mon, 12 Oct 2026 15:10:42 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 170BD2C8E; Mon, 12 Oct 2026 15:10:42 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Brandon Brnich <b-brnich@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        "Darren
 Etheridge" <detheridge@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [meta-arago][wrynose][PATCH] gstreamer1.0-plugins-good: Port SIGSEGV Fix During Caps Negotiation
Date: Mon, 12 Oct 2026 15:10:42 -0500
Message-ID: <20261012201042.83150-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261012200509.848642-1-b-brnich@ti.com>
References: <20261012200509.848642-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EA:EE_|DM4PR10MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 10102d2b-a136-42f7-ed4b-08df289cf032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|6133799003|18002099003|10067099003|22082099003|13003099007|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	JSmdAP1KWvn/GIEdX1D5Z6mgwFgc5J+AOTJVGAHEwvmQhEgplH52X/9FoOsDihqjc1OJeWu9bpb/6sCNkAreWMSK/UQe5znsSraPg1UciJIXS5GhnCr7uQ2LEzi4vaXN4EJU3hH0e8E5r+HDVLrw7nHnxzXbLplS5vbWDsm8ruQk2GrcoSn43vFvJtPCH85x0hG0cw45f/jvErIP6Wf+VXgMG341TUGsNCPyjuIee6ML1dRQ6M543czMfV2O56E7WgofQmUOg6gJxGbkelZoIwp/mMHXdbDD7vypXOpVC10wKUT6xbB3SpyV/I5zjx8uGWsJRnT0kzHsaXJDTuCwOrdsh3aP9/s1adC82BOLlZVowGqzczrUKQMcgh6fdoM3eTful3s80KsKyNQu1yh6d/dHhd6qST2cexRi86bcG7SvsGAyZeV83RMSYuAaMnCwuq7ZQw6IzJCJaTCoV6cYXNNzt/asryKuZJGFpswH0mC6nh0FuigkyPftHxIsf5/r0L2+30c72bfZniPfEvKLXDEcXpHU4Wh0oCg43WAXqjVV/6rt72T0C0i2Y60CoMchvhnWIGcnKAp0vGMYp0GQkSnQhdLZIcOEsWs1piSf+aTuok1SS6cC6cSWEAZckHAm0sOic9keKyWUJMUkRp7dCw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(6133799003)(18002099003)(10067099003)(22082099003)(13003099007)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	N44lBvLdLpnjefVuaDtlkfVvbR92wTHBrqkjMI2WhTPM2CdX3Tf0NHnGY8hgurw7sh93fS+o3Ny2CI9+xLhp/cLdd4eR0D05+f2OG8J65KprKnece1NNm7sQPaF1oUCxWiMvhHzYwHO6C83xw9nnhYNytcZgTS5YUp4cK92wRKt7IsQU0xhDN5nQtVOq06xRQ0jB45UjGkcOxna0H181ucJVv1r5ZI+TzUcUek083dUtrrHmk+SlMUXCQN8xYp646035QkqqksR3fF5YzmtBw4RBg4ney4kMEOWPdVrbrq4OAfatxBUM7d4+5JOHbwqZDuPlIZVtIM9oLi/Za69QjhAlKlS8e52b0MsGsqfTZBDZJj2ZdM9AZDkohz6IvXwKOamswICBejY6IigLQXyXbbiihb0Q2CUDwsoaMF/SjggVQvqmIN442vMa8ibr/9b/
X-Exchange-RoutingPolicyChecked: 
	Ow+FvZ1X7oWnC9VAIt0496EXUe9yBtYMnUt0L2AylkRHN0ZAEBU3iEYzlvkQOdWwbeAN6vyKxOLg2hc9w+kONoTulBZL139RdXd4Fv1XKs8ntDShU7hlhVtcb0KuYAWG1JWslSwMv5YjASes4m+Hb3VdUCF5JLKfXKimIBBcgKUjTGUQYZMQ3rgHS7bY3mgrLN+pST+IgCiRBjrYk02GWQf63BTY94SZPv4SwoZ8mh3yxLzrkIx2TD92lDWtLcvVMxRHF1NkfW+dU8UC/UjUAZ+47Ieku5xdEtDXIYgRMhzke9HY2qP7KDxd4Jy1DUf9V5IX3l+I36yUsdMvwgCTHA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 20:11:01.8911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10102d2b-a136-42f7-ed4b-08df289cf032
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY7PEPF000000EA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6885
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA4MCBTYWx0ZWRfXxjEYXI8oWFLe
 WVSd/2gUxWr/arkiOnoLCovpDtZonOMfHjw6b7IG7jJNY5fwhxWRqbpuoFPGYnT2I7IfxvzBF7F
 tgxGn6ha7pGrv76m9c8mlGkV61OyTDE=
X-Proofpoint-ORIG-GUID: HLrhdlQc2a9QljT0OwREyAhbqmQl0MkS
X-Proofpoint-GUID: HLrhdlQc2a9QljT0OwREyAhbqmQl0MkS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA4MCBTYWx0ZWRfX9bYNox2kSw4b
 7k17OKCG7UfUvRap1ZiZrj+q2okKAXY0K06U3/dTvbYSJkNI16qxZrFrfnirvc2hRAGCZtokSxL
 R9cDiqsCsXf4GF5ccDwDfTM3NSV6bQLoDtq7XaLLu4rVgMCG669BqF+OqqtDC9iIdOLm3oU++VP
 OdXwsY1tqLxZ+YhuorXQN/D++Unvt+pReTJ0/RJEnp1zDQCJ8/h0cYZI5hfWSeDyv+3J0RPJr4B
 47qvCKACNaPJQElErBLvAcGPGT0YUVj0OBFoYk6qkAMLnRLjFf0iPSXq480KklnUt07DweXD1qa
 8iSz5Mk/n6LhPqdnxIRL5q9QiZGNPThuuM/y/2I590JychxxPEslB2e42rf9+f/PbiMCzAI+8MB
 3aWP2AITsw6oQGoZa33+0hfoVyYJTGhwczLtOtoS0KidaZ36xDntl0PBQyRlnf0Ap4a7ngcDrHI
 EC+3hbzyzA9DD1GDAHw==
X-Authority-Analysis: v=2.4 cv=Aa0kjHXG c=1 sm=1 tr=0 ts=6acd3ed9 cx=c_pps
 a=jY48VJWlCesAGUsWasdw0A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=8AirrxEcAAAA:8
 a=TvsYT2WicHyose1SvL8A:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120080
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Oct 2026 20:11:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17740

meta-arago / na / 20261012200509.848642-1-b-brnich

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
wrynose
=====================
Summary:
- Patch Series: [meta-arago][wrynose][PATCH] gstreamer1.0-plugins-good: Port SIGSEGV Fix During Caps Negotiation
- Submitter: From: Brandon Brnich <b-brnich@ti.com>
+From: Qi Hou <qi.hou@nxp.com>
- Date: Date: Mon, 12 Oct 2026 15:05:09 -0500
+Date: Wed, 23 Sep 2026 15:31:30 +0900
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9632b11ba70756aa5fae718255aa38072f6e7025

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: weston-init-arago: set WAIT_CARD_DEVICE_COUNT
- Commit SHA: b61dd849b8ea9ba1f875f51249bc2ee42b08c4d5

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
wrynose
=====================
FAIL
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty.bb:10
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
    
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty.bb:11
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




