Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5207.1793783206252869733
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 01:06:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=CrvRX9Ke;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=AFagdU4p;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A48Iw2E3486828
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Nov 2026 03:06:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=riJqlqQrI9WwtoAWpbC0Wj+nVRxwGqgPKALyZV06z
	tY=; b=CrvRX9Ke+1eXF/bgMXi6Bb+YvWUFmxwU8djmwW85KBBNrlq5x2uFmJ7Sb
	OZ+v6qWVtO+1yWPg2WZoz1Fh6JroyrxsYwZ7EI06A9yyqDs+y5Jf5jLbKLoOlf/B
	hCXp9p8dAd4Tuh/6M4Iw+Dx9Wh36u636szuZaJAJ/MJ2KbCuMbj0VrVPtpaIEOVv
	mGQ8YyOBNQD6s2dsUDQTQ/jVDP69z1WZZUVC8y9oLB6X0hBXfayxR9cvZ9DKq3lH
	x6SIlGkwHBHhd0HzPpOmiDa7gI8zO7e8VhJgpkzahII/pXbuSK95G6yyQfbJewrU
	AYKEGULdpLagAvcdwg7qMpKd2KqXQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hqnf541km-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Wed, 04 Nov 2026 03:06:45 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cL3i7VBxGW2cQAG+kAknrUh6dgEsrOWkhuLLUXhzYS9TDnBerUYPdFjaGM1g/j0JzLC4XlroB5bDavDi0O3QUC9dMaeCLf1tcE4Y5rVqutIm1t8hsEabGHIzw/0gZ0UWapgVsLluS6je+SbMeMKIAUFmBtmcWWXN5bTS5+evj1lJ9yGWfZPJmlb5u3jDlFRs/PC0Rpk+HoY3193tTBMZW+A3aXyYdRhGpbsfoK671BNCKWXlMfGv5i7weAXui6UKm2VY9Oj9nKPChhVF+EW6XsIQeqd1FmFelisPAdcPk+BJ3m2o7AlBkzsHqMZWgvPbH1fYNY3N8Yicho9kLjLopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riJqlqQrI9WwtoAWpbC0Wj+nVRxwGqgPKALyZV06ztY=;
 b=UbdKQP87G77VbxfkTcFhDTQRPlP30ZZh1qezW7RXDMeHBVFDnyfF5FVswYCpzD8g1IFnqtTzkEJfEOaFC1kAjN/cU0tY+mZ2bbfyjTvnYi9fNuc/6NJ7+6eLlborYGJEtgiz2P6aDp8Lu5jqLrTiJfZNM8v+QxfBhPNR55BvhgyYp47Xvif5jSUBgHv7c9Z/NtU7eUQCJ7OmIwSTLRBSGngtY1E14kiSMDCOVwxi/+rH8NpjdruTh5slPaQT1sWmWIoP8eG7RFo2NeLdgycYSF0wFr+4Hda1EC6KkKNeRjV0C9qGni61YVkdcLKXtCDw9cg3Cs9RPNiIvKZ9NrP3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riJqlqQrI9WwtoAWpbC0Wj+nVRxwGqgPKALyZV06ztY=;
 b=AFagdU4pZHThiBfWKQ/b0VSIqRnmG1VHRt3jfPKvjP9FbXyw73FMdKMh82xDzxmbsPn9Ir0JenfLV8V3rf0jueZK0NdzzqIkchzoJDwb5wKyGUJxMXrUvUHtAVGkY/v3ExxGUajT4abEAz9Tw1advlASweTXXSnvz5Qsl5w3Jwn544tzh8QO5qINHZ46V2R54ZAcTJmIHIhqO7FiUtc8RBIX0eoG+oaHkoHgzFTaq5GoZt29dU/welAx8WmDBE0qT+YA8hsl39wQPe3PXQbnv1POZ6LeeKZyVQV/J7AaK0Lg0DsF4FymMtkmZvKt9kw/fToNKSMy0NaEgoWCwwIVpg==
Received: from BN1PR10CA0006.namprd10.prod.outlook.com (2603:10b6:408:e0::11)
 by CO1PR10MB4609.namprd10.prod.outlook.com (2603:10b6:303:91::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 09:06:42 +0000
Received: from BL2PEPF000352D9.namprd02.prod.outlook.com
 (2603:10b6:408:e0:cafe::5d) by BN1PR10CA0006.outlook.office365.com
 (2603:10b6:408:e0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Wed, 4
 Nov 2026 09:06:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL2PEPF000352D9.mail.protection.outlook.com (10.167.254.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 09:06:40 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 03:05:59 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 03:05:59 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 4 Nov 2026 03:05:59 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A495xdD1853674;
	Wed, 4 Nov 2026 03:05:59 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 0237F2C86; Wed,  4 Nov 2026 03:05:59 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
        <prudhvi@ti.com>, <r-sharma3@ti.com>, <devarsht@ti.com>
Subject: Re: [master/wrynose][PATCH] arago-image: remove splash for am62lx and am62px
Date: Wed, 4 Nov 2026 03:05:58 -0600
Message-ID: <20261104090558.2330077-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261104090001.2133882-1-y-hegde@ti.com>
References: <20261104090001.2133882-1-y-hegde@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D9:EE_|CO1PR10MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: e4cdfc03-3b3b-4413-69d6-08df3a52f0c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|56012099006|260925021311599003|260925022911599003|260925021911599003|261102123227099003|261009223027099003|261021121427099003|261022105027099003|261022075727099003|261022115727099003|261028144727099003|261026140227099003|10067099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: XKmhLnRu0FUOOGhCYz/G0fnC0n6vJQqBAqlpq0YYYpywbLo8dSvaIk8axjwmRLnTY98wp97wWnA4GBq3K9tIsy7Q/0zyrv4MVf11lUwTcs0mIPNQQlGn77oXvPO6v9fkEif0C4AsmY0JyM+6TZbxeJ4dTBIo//MLFAaSZ7mvxQA2x7rBbIdXvVsD3rfd4Tl7XRo+fvhS44STDUrHMEaldgTjM9afENIKspFiUkFCqJLdzJqV71pAnOvNAOVf2aImBzzI4xM129LDMGu4bUNebPM4aXnYqcsjCwNzy1FwMvmpcJJC+BAqboACCgasXQNqqnKlsPg0JtZx6Pcld0/+ipJZQ7CZTysGHcddRiVTXPgZqc4lkL13Iu3WeIlEwgcDNEe6nkM9/jgReN/GcGauX00NZGpPtDvMmJSQpH5cTXloZXNzBOxLCn0YEmw6K5rAUFLlh0NctPtZowGaPKQd7jBndvGhBk5leKHc40zu1lM9Wdke0befQRAOtkNcbgkKxe3cNha+gk5o/YkTic5K5zLytcdb7OklRDj08DQcmKi2j+B8mRWs07xmISOCG8z8JoZ7WW6L9xWZSYsNz++fcOpvty36ZirdUbKbNaFd90JvMw0IuntHd54obX4+723n3IOaQ6qyZVf8PL6nQltq1A==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(261102123227099003)(261009223027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261022115727099003)(261028144727099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zPgxVrtggIVkfc2Nm2XbZCvK2n2r7NFjiS0Fav1lKUa22VlnBzVKQQAPtkpWeqU+GkuJ/dNjjvC62Boun/5/KznHtPZspuGnn8oBZIwvmkJYsAwC3FGnn0exzY1Yx6cuk2PNxS37j4WbLy11QrcLu5DBPuDOLrvH3VQC3VyjUQ8mWXFCVSBYcBRLSnKI9L0k5+HVfVT78AAvf06JDlkpkNY2GIa/Pizo5dFGYiL6ylImatYLYXzo4BsAvPkvFgrrMAi1alxN82ZQqpaJroXzGt3zGUiRkbQz4TWRyMrhvZf6Jh99zTog1zN9DQXgrp4Bpjxey1wpHdnNGNvvOWR9/ValQoT3fSHCvty9zD0Vc0JZsJshJ9ZYiR0VpzIjKBNboWuoh/fyH06g+3P9ClMo+mA6IbJfKv7DtSkca7AgsZZPqQf0Mk7raovBcpa7oeIu
X-Exchange-RoutingPolicyChecked: CvK+y4NHQIqPhqvBj7UOtgaxKGHukSCfvGXpWSHxITAayI7CaOEwyMVsSO6wc7JVgkCiFxmUWB8sXqA+en2hIjSdthvIEvscmBbUXGuptfqj9fppP4M/dKL+OteSoXWSnmBVgyrEkKlsBxouMMrid/EkIoSo5RnqjPd9vctCbB0XKmsUxioY+I7vnzqSxOMFmJGDXmPiUMsTfIUDR+Rmw8U1GUec8db+yvbxfZs25JOm8U1jWZhmy80vFlz1mdOcjj2mHNmQ1ro8aBKkac8A5ZEXBDQAXrDp1IFmRfM4kc6OIgikut//AyJVn1RvK7grTvNDcj0hkL8N4qvXJEVVZg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:06:40.9730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4cdfc03-3b3b-4413-69d6-08df3a52f0c2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2PEPF000352D9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4609
X-Proofpoint-GUID: pjA_K3631Zw1q1wxZOjnKqwluYdOwYp2
X-Authority-Analysis: v=2.4 cv=XcYcX455 c=1 sm=1 tr=0 ts=6aeaf5a5 cx=c_pps
 a=rl9QZQJB4f+cLtFzzj7oTw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=skrhTLLSevFR6P_rWP0A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: pjA_K3631Zw1q1wxZOjnKqwluYdOwYp2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX6gs5lf/tBAei
 ajZ2oG2KzbxFEv0MzDiOl9nVJMWvuU+sQAaaeOVbpUq7X3s/KkBHC5TmoJNy2Ak6JlG2V1H3ZVB
 l5gC/wcPSRYUmXjgvbw8CsSLq9K4l9M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX70Z+aGHBtwYh
 ftDQmZcTK0z3rGO5wfuMxFWhV2yBXhitCCBpmi3U9l8l5hR4/54W5Jqk4UnarRPKPbWCcnuHwQc
 TX0BUkhQpmlcszIjcsY1PLE7d0XvIgvOZpjrcJtHcn/r7fWICtUxfh2MVnqod29yCwgmqyIBwZA
 D2WN/iOG9FkURvFfVYfgOW7F92wCfA7I7miveUF4JoJFGyCFP1Mn7Wfz627pkZCt77MvX+T/d3p
 S2I3yzDBUfereeQxwFdqs6gcCnDDgg+jBzEfJJqmsuQ+3VsthrYOT4VdSqRMsx2QQt8L1djve04
 LhCIS0cYDRVMJ09Uv9gNcCYBPe3AM63TR0OWofh9lgLfGUVl4h69THYW2GZwm2Td/Y8oPbWMbIU
 cN/nAg41mmw6Pd+3XqWUyCJvCeVuQZJYmUBknptsBD4HxKY3E9slYhXVPWzArfyzhOuRG3G7d4N
 LNrCEBTrBqprC+kSo3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040035
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Wed, 04 Nov 2026 09:06:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17755
Content-Type: text/plain; charset="utf-8"

meta-arago / na / 20261104090001.2133882-1-y-hegde

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
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] arago-image: remove splash for am62lx and am62px
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Wed, 4 Nov 2026 14:30:01 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 45eec07c2960095699c025a1f922c75f25634ed3

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: tisdk-bundle: Remove unneeded ; from *_COMMAND variables
- Commit SHA: 4b006662694490151ff274a7042e42446f2e9268

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] arago-image: remove splash for am62lx and am62px
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Wed, 4 Nov 2026 14:30:01 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 45eec07c2960095699c025a1f922c75f25634ed3

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: wireplumber: Remove set-audio-defaults service and script
- Commit SHA: daccd2a6943b3c785c606987292a0431d586f7b4

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
PASS

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



