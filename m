Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5588.1793910611594613025
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 12:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mE2SZPuF;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=gF9oUWBG;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Hh0k91677061;
	Thu, 5 Nov 2026 14:30:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=vODrvAtBXb6oOtTgJtyvMbcHgJCk4kzK7a3GCGmwX
	Ag=; b=mE2SZPuFQQJVru5c/UeO+4DlrJdh87mdZGuR8wZTzqsWSOLQRnkK7P9U+
	slNIL83Q4wR9JPN9hXPRZXpjQ6rG0CW+/EPEBLbcqVFM8nWoL3dv9ISekKapDDs7
	bbZEIGn+FiewT159vX5LQtkZVbMVX7YIPOU4MzluefToO8e0k7itWqLlO1dEj9X+
	GQf+TX6l9R2pnieN94KWtddR2X1jpDPnWCOctJTAD6lXHkxUSA19XMDon6RWzRys
	p89FYd2VoVE7NzRGIVrS6abLCvfiG0mbaqeSi8yvTooi7PonT12oDey8Bps13bWM
	fCJOgG+RkPf7zp4GHOnzAbB7cIDnQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hrqhuuudv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 14:30:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ep4lCqBV6NUvrZpN+zma1fFG3/6mbsQKfS023HYyVKg4dhq/raXMFxgqwbElMQV3W4mjTSq3DYVDiya7LmWCzgdy4HfNwhBG8WjI5YCPpRJK2sBdTeiUBcV/sipyyjOIvQvU5X1GFIhhONBlmts1BDQc/bJDAaCEj3vQZPO+03JCmpi8YlzA+mvz0xrJUSMMYVfrSW2aDeLAm8Fquak+9eLUKP5NJ85gC/cWQoGGzagfq44scoSkayBHSAdIkcaKZPsgA0AxFZA09si/CkfRQMoOM9EriStodIAT5wYMAL6+jBtPIDG0eS9CTtXNvfJaaqnwR/EAxJKowcfI6wgKjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vODrvAtBXb6oOtTgJtyvMbcHgJCk4kzK7a3GCGmwXAg=;
 b=M4b6a0/gdeOOx6ta78/R+CicTdaqvqaC3o0ac1eo3QOEcA3mdas+R63Gpy8TEeEAkEq5Q2Af4rKH/m3l1M5Z3jGEGLrkzhRBf7fLjuI3hG7fUW9hiA6JYMJ19ziaZyEoV/sqaGekZKiFQ1g25l+nvXzgF1fheAB71suibLYOZMpL5gwmg1EBb1OrNKPZ8Z8sX+p9LT810ivJ+/+Sr4xD6t18cN9EZiuQp3UZ7AMa6ctpKuZYTibm6XgZd/iB/Zm0MKI21fJtsyyuk0sZzPLyp/xSAizLFji5S9sKJIzwTtRUgpM3CXBMJHgGmnFWGHs30j7P4DwBcT0mFS9M3s1Mhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vODrvAtBXb6oOtTgJtyvMbcHgJCk4kzK7a3GCGmwXAg=;
 b=gF9oUWBGGSDcxAh6A3vgE9glCk0Zb853It6LJrVAbOpqL7XyRw+uHXSUfwjWfSJd3Tdnju2Bf2WcEuzXdZnYfLtfvwGT8uMWKGd5QowqNv2Na+/AbNFy+O02oqgpba4aoMsNYYFF2tR8VxuEfZXMbQtQco3s+qNjCXIfu3pTBIvCO6axB/w3AtETkAu2fBe+m9rkd7Igs1b8W4mIwnDE3BJyBUdOGIE433LXpPzfpl9ETdRC2ojDqlu0peLljEWS4mu2vCbxYK2Vn0iXqIiKAaQ8g8UpR9YtBQmg9qVowUjfWUahh/Dhqg5YsYrlR5shG0UZ4VX4gn1HCLozF01cfA==
Received: from DS7P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::31) by
 PH7PR10MB6507.namprd10.prod.outlook.com (2603:10b6:510:202::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 20:30:00 +0000
Received: from DM3PEPF000265B3.namprd02.prod.outlook.com
 (2603:10b6:8:2e:cafe::3a) by DS7P222CA0025.outlook.office365.com
 (2603:10b6:8:2e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 20:30:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DM3PEPF000265B3.mail.protection.outlook.com (10.167.23.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 20:29:58 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:29:13 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:29:12 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 14:29:12 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5KTCYX436538;
	Thu, 5 Nov 2026 14:29:12 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 105802C86; Thu,  5 Nov 2026 14:29:12 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] glfw: Remove upstreamed bbappends for wayland support
Date: Thu, 5 Nov 2026 14:29:12 -0600
Message-ID: <20261105202912.2190497-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261105200606.1301901-1-afd@ti.com>
References: <20261105200606.1301901-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B3:EE_|PH7PR10MB6507:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5d9fe6-2318-43aa-0455-08df3b7b8fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|261009223027099003|261028144727099003|261022105027099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bYsX5W8Zx5erCUueJfjB+Lfi1vRADY0m0uApFnh51Ur//2xQZ871STe+1iv0r9Pvvlx6EBmrZ6kJ9nIsrTIrPlqwhft1u95Z0d8gg9nfs1RRMNeBTxs1syqjm9m3MRwjScqOeHPM4wOxzveNwv3KhDJW51w/u2pFlPiSoNR3oXrM0x+7bVMSffvyZSqeGQsT0JJwlQByQ8Ej/nlAuobfBVHPmNSD7LcXUhpICzLoME1z9lImH8f+ZoVgrXYNVGpXgNwc99uzxhUGC6lCNZiZYNKRogXepJ+TCKAHNiMRhuDnI2fTYaGowlLTawjpn/AdoG2F5lyY3+Da3v5FW7VCLkQnWq8Tp+MLP99DNKjcR52P/ynoXIiimnMj4T0SFOT6CB6q5Zhjc6XmC0SzAsvWpBBdNrOpD49DwHZXtg//78gXwpgTK6HeBbdAiwrsEjhWVdlPSIYDzRuZo6HiBUlltKinaDfeZA/yF5YGrTxdZm96bLr91trpFWeBzOJ6tcgOCvS4xF4mWFBja8urwytvrTl07eYBj1XCvETvTCdrK3wea8wyAZ+4GKFdFryCzXN7W3VdPX07P/5+N1nIcFHhhD74ikKuEMskA+Hs9hLiL8iYleVpBfSNa/yHGwaYzQcf5aQZAzqgO/GSBA5QgwZF0i0HnxbZ5+j6YnkWgDEIvaBT87i4QQKmMSP1Tn0kxJLO0LYnMfrAT9DR23rcv0ALmQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(261009223027099003)(261028144727099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: N+91T4OtVTMVWd9H0y3fJL872HM+cP0R+xtd8+wSfyzVu4or2zKLgDKnmws/LNYBmYDUPWHk2gmrdwRM5vtrQwaGGh/sP6/RwqCTn8ueOJWY2+0mIlM92MSVpCcejVsZ/+K7EBFfNoKkze5DGO3/rFRKOIgr/brOvcHCuX2C+tGT6KXzE79fCirWePkxkuDmqVTK/Wrrd92PRgptVul4tg3iPHbOOgd8/N8J7qr+LftwcypaybYGG5L0jwhMENKdAbUdZZjzCO+fCs4cC34J+wlAAuvADgovblfGs2AgLwxu3uY9kFxn64AiHR9v5leP+At0wZxXxMSlRnuNFia93DhDfkMNvJQIdoRNgXSM2Fj1vQE4ylzas/dpiJMIGJzNCkTC3qGsY/XKcYPB6rjNmNoKsq+NX7lrcZvjFvcdIya/JuLUVXJ1jyvZWpHHMkMg
X-Exchange-RoutingPolicyChecked: fJeDZV69XaLNjlRwBZgXKYAw9oFp9EUq3OpA95qjkQ169xImIoG0cZcNizD18zLFZJdnkOx28D+7D6io0ZnyeR/PebQp7BXirE6kUP7MQYQd6XtSizeYdb5sA4gEqTjhWOZLSFnDkGCoKbbw/0jVcwlf4W8qx9jYmSINOir5i3n1+8fn9jsXOAQstgnypvjShHaQV1jmhhHHv36WGAgFOMPZ/T1ktUieMfmInWSVJ9gQiqJGokXKVV1IP9XsRXDh4yw9viXO0Jm+t+BD0dEfnRqSJ802BP4misTi8uVsx0+FsGGaMN8/yvk43j3CltFbNXfxYtBwIwL2KC++Abc2bA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:29:58.7285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5d9fe6-2318-43aa-0455-08df3b7b8fba
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3PEPF000265B3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6507
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MSBTYWx0ZWRfX0up0nvZJzeQw
 yoBFPm+rA9RPe+s0CZH09w0Z0HbuTViKBj1gDX2HatGRAdiT+w/nKmKLQf3MPfcguv8la0b9WfR
 VgCNp2LtKDL5Ts4dmDuSLtP/qP5BmyQ=
X-Proofpoint-GUID: 7I0m3LpqhkqewPJlMgtZabC_qiBmMzvI
X-Proofpoint-ORIG-GUID: 7I0m3LpqhkqewPJlMgtZabC_qiBmMzvI
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aece751 cx=c_pps
 a=nW48Ug7pZPQFPw+wtOhQwg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=2-wz4bcOzzOYC6PQXAQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MSBTYWx0ZWRfXxhapWIvWTBQ6
 7eWOInt5xBn+Vdxk/fgUaLSzHT0PYV0Qq1SIpoyTQMoIpCz/qwNL5f0xL9V4qvPZjsVLFNJiRQ0
 ZhgALzF1Tw0gvS1wlJDUKGtY26vcj0kOV8ZOe59QeqZFB/nLbHRyCdvv+KxCZNOfO1lvXKQ3JEo
 QqXXwyQ/kQlKngdseq0v2fBcqsriGlaYN7DRCmbfgx3k0Mq5SR9p4hNOA8lT848aRuKC0Nrz6xc
 0cYza+47oBr3OBjSsRspVo7W10wNZJU4azdDBpeU4Yg5RJt64E3FIeVj3vRXsx67EJx1zVVwiIK
 V3K1cK0CwryVTmnBjZn5jUhW6snty14XW/Kf85kip1URuydMRoQJ5hmGeINxhW/kIIJwt3lSBk5
 WwtDQLPXZzcyC1Zhd334SGyZTaM8cjgYg8VlMLZkTusfJffKGoiKvVlop7lu8e1IgNrnchnPCbL
 OkvFCGxd7leucO/c+Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050081
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 20:30:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17763
Content-Type: text/plain; charset="utf-8"

meta-arago / na / 20261105200606.1301901-1-afd

PRC Results: PASS

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
- Patch Series: [meta-arago][master][PATCH] glfw: Remove upstreamed bbappends for wayland support
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 5 Nov 2026 14:06:06 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f269a97388fc8d88679275124c10645c9358eba3

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: tisdk-bundle: Remove unneeded ; from *_COMMAND variables
- Commit SHA: 4b006662694490151ff274a7042e42446f2e9268

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed



