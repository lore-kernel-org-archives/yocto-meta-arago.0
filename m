Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA16CCF2E5
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:21:41 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35905.1792419697587936926
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Oct 2026 07:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=CW1ElXJP;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=T9UGdEGl;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69JDwArW3374509;
	Mon, 19 Oct 2026 09:21:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Vp1Puu3SeRr/Tdn/rfyeuQOWG4npjBqO+hIDTjk+7
	xk=; b=CW1ElXJPY3qQnaGhSxKcOYRi9m24Pbdm+1rhW8O+FAPGPY+wJwWEHVRYQ
	ALufCmDryTAQ1yXB3Qxwhglime0+uT9/1TAGeBgIo1U/Ike+7vNk3dRakutuo3A5
	3U8q5PMSygoupHlce20SHwp3dnz3bR2BR4o13KFCaDEdkf1v479hrsU4RyWxYbs7
	cBS6Hwn8ob5rIE3+Un5+m6kD8w7p3+gqi6Ksinpt3YFWB/S8q+A2ScgXZkdph6vZ
	Ph4AUWQvBsCUCsRvNzgnh0wojQlB4WjKadhjCnMDr6bFKLjUDMSj4J8kxK6IyVFQ
	dJBGk2NZOmwQ3AhxrILgTu5EqLNVQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012035.outbound.protection.outlook.com [52.101.53.35])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hdjda92y5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 09:21:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0b/lFiXi8iU6opx89irOYIRY1R13ybqRu2gG72gln2jSOTnbD6t9Qc6Sx3EjaXS1Deb0ncp7e45psAB6aV+XSwkHYqID95nC1iZerUmoXduAA5gpQNO5GguMTTXQDPkfaX0DH4StQ9KWyh7x1f6A1hWb+kdG+wDEyUJdpxBlkDA5jP20pBNZP2rYNNDqRNk5Fb9C13FYx651GCjXn6vMkAV0ICeWFkSkYWw5ysnqWnB5fwe/b3RELJ1/H8NbmI6q0kNqbYvNtUk+vxTXhNndEKz1SwTaobT2lUw1VPi01WpfNfVU93DQopYlgBj4slIy645M789JBcM4fqF2scFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp1Puu3SeRr/Tdn/rfyeuQOWG4npjBqO+hIDTjk+7xk=;
 b=mS36p9pxBOuy0slMY+OAY0tdIw3wVQAsdTB8HkyFHCN+cihPVJrrqP8ZvgK/ITj3ZMChOsSEluBM31AWMCu24xr8f2Hrib2SHSmrCGBKOizp6ht21e/KXfqM/nLyptyKujpajuBWHA3XCm9HsQz+xeMafPDq6/lR4AVa5f4hwTYeZrCD7GXX6E/f52jDp/mFjB/r7KmXqltA3Bsy+JknTeBx20+r52P3NvSn8An8uhljm9CwcSCnpBu7P+OrcyJxGqc2/yiZ4yWJeajEHt8yKUs7dTt5TCvNxOztpQpiKeOigR1cbLg21kcF5rS2qDZsRSCUWCqamKqr5XI5rrK0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vp1Puu3SeRr/Tdn/rfyeuQOWG4npjBqO+hIDTjk+7xk=;
 b=T9UGdEGlUW1VfA3uTTY9jrjmbgw/vpgUXmCZYetfRBSXojx/UjvrYxzJOdJc7t6Q7DXT+qpcuDNImgY0hoS+EPVPjDgVA+Bh5j2w+fqMTEWvCS6vLX3DKJ5TKweu+jNqYSE2Qz3eBtaqu8CoXDkTGmiBNK3UEe5daRNEYD6H9ezQKcCu3ZOr0VpN7BuCojdPw3hx9TIzelFkwFrHepCm95KLFpQA5e8cOhGS9h4EGrNKGg6iQO3fWX05uE3yRf2Rz68UhWh+MjiGOb2aUPFzJoOXjI7n/4sVQKzw4e6c78e2/h6NBfItTniDjV0iQBXrGYA8bqykBEhlwek44nAWcA==
Received: from PH7PR17CA0072.namprd17.prod.outlook.com (2603:10b6:510:325::20)
 by DM4PR10MB7507.namprd10.prod.outlook.com (2603:10b6:8:187::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 14:21:29 +0000
Received: from PH1PEPF00062F25.namprd02.prod.outlook.com
 (2603:10b6:510:325:cafe::ad) by PH7PR17CA0072.outlook.office365.com
 (2603:10b6:510:325::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Mon, 19
 Oct 2026 14:21:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 PH1PEPF00062F25.mail.protection.outlook.com (10.167.243.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 14:21:27 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 09:20:36 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 09:20:36 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 09:20:36 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JEKald870732;
	Mon, 19 Oct 2026 09:20:36 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9B41B9A9C4; Mon, 19 Oct 2026 09:20:35 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>,
        <praneeth@ti.com>, <v-singh1@ti.com>, <j-sahu@ti.com>,
        <y-hegde@ti.com>
Subject: Re: [master/wrynose][PATCH] wireplumber: Remove set-audio-defaults service and script
Date: Mon, 19 Oct 2026 09:20:35 -0500
Message-ID: <20261019142035.2616694-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261019141339.3884587-1-p-bhagat@ti.com>
References: <20261019141339.3884587-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F25:EE_|DM4PR10MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: de110e34-c592-4b45-f007-08df2dec433f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|6133799003|18002099003|22082099003|13003099007|10067099003|261009223327099003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	6y0K/gj3MNwh+vg3K8t6LiKYBsrguffNvft3N83xwfWMOg5D2Y1pfBiYj1/hSNhW8FOzt6hWhlALf6R374S2H7Q51VWKYzXb6wP4HL8Y9zDWQPqZA5EwbnnJ0zJzs+R/aMeJMJK9Px6bfC9YBVEw4Hkj3f+Jr+/3bBSvE4e+dZeXxyMgUVB3aqFZMp4Oe3bcy/Ip7Lg/YxPw2myjJc6MCJBZKk2A4r3jx9b+XjtnZBWdWtk96pjGE8AMAKpAatvS8m4KgCzslhvnNyuWhfIVRxxgS6dCYki5TutCXC2KT6KfkUPAJqoq7TS2t6+HNNJwX7QR5aEDGOBjz3WdnL0aQqFq1FcsZ2yhV2SR+xN6Tit+4T9nlI6+WH58UUE5a5M2ZCo1S7dq4Sg26xkZQO7aFs5Ly41v/hVIrk+943ERYHDiD8UUdneEFuxDmIVjnafeISSFKkdPwcyVe4+ublkrfdDbjdk32UkbL99EVzsO4BSGFkTSrqhwxjOBithBQ1UBijevoxiVC/UwHG5GM2EyralDI1uT8v/RGEEFD7FVdcUSl7wzgacvm9/05fgIcr2TmZ2mhYrCZMCrPlk+tF45EsUP84rk2r+x7/2gVi+JQ4kxXgBInUFUapZukPCNo4gwK3cPP4+7s516k3RYsO7b1Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(13003099007)(10067099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	c27eO4c8Ydw9F2FdJzKK53uKhl3IaKaDC09NyIYbZ2of3vN1J6xo8WzMy7P2NUXI2KbAXx1Ag5wVHLz7+9ECLqwSSwLqB+wI/uuyL60JGCO3x1B6O3FoHpdz5kkuKutmR/kZJG2ikCc/TaRtbiVWdFZBYPSbasa/1jKGiVsvSxrjNNxZ+0bmPHn/iZvb11O9hK7hLHzzYJkM/E81yxLBC5mwqIukOj9hCodB8+goKtZDSEVImDMlo6NamGen41fGAlRWIxbNSOX5gYe5EOS/Kers/05wZBtw6dJlroPB7gYrrIkASPQbJRdhPAkz204EgHxiyQ2c2KOcOhQEZh3d+L8uEAJ9QJ3idTV3w0F4Z5Dso1syXcNsJJLJmFLiraIccUcHXXYPC8E6IH7xzBPWhQBooBXzFMT8DqkPzHC8jDtRrPNbdOf9rSFrtBvSYTZW
X-Exchange-RoutingPolicyChecked: 
	ODlfavIA/Gnp0NRgJ/hjZ/+448Hs9Xku3vYMZ7ZzkKFV59dW/uknTUmK7DU4AIWEIa+00DZTf7NZtHk2arpVD8efAHj9/RKxqSSEkGWjG6I2RZ8Atfs8StADZNqNEavIk8/NboHTBLKmNEtevTqcuM/9DyHx/gx4+ewPnAl2jXzARTjeGC8GSY9VbsfToPLwgffLNoKAzfQlp+3rbnOAaPwUd9RWc4CYqgl3c0E4nl5wDDrH1H9HKL+ROg9JNIyC19yxhPuHJSZaisMhT7PqKIbXNebiCjJdMNjeQv/iNsdyv3iKecBVm/jSyeLgmqRO8pSK8VtmPPZWfgfpB+Iu1Q==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 14:21:27.2661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de110e34-c592-4b45-f007-08df2dec433f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	PH1PEPF00062F25.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7507
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX/aAWtzFEUbOc
 IhYvhnnct0rb7kf/XfvZrabV4YN9+wCYJmmVaLfh56+A8dRcbI3+1A4G58p9B3SE2SAha2+pGZj
 J6fmutE9df8kLpUHZo6NfIofv9l5smdDqdc9JeWvN1yOQ9bnDcLLcWxaEn1shU9KZm/XmNvwC2R
 lMRxLm77StIYjG4UMPy8VMkMG8813QKhbn10rV1qHG/+UFfi/YOaDj8cjC9I2kUvCXfkTVoZPhs
 Pp5+pjnhDXG7CDX0MgiVEhq5SM+/6P7jh2gc0PZZe/tBYrQK1QWmHDWe1V3zM/ksKg9LCbMenBg
 Z9ENHeDCSjZUfK20YTHj6SoSfJndzqDMvJtnqOwMPPxDbIIH7PmhXVFUC0aAwYm2ymOBGf/5jIW
 QsHCAgrrnaUTC9Kzzj6PPuaiMCG5QMUPHkXmpC5dJQ6XcBFvCTd0aZ3Zac/QCo0OJiCxXVxxfbz
 HWWiZZmnP2Z6N/10cPw==
X-Proofpoint-GUID: UbifEz7RH7yN0S0AcBdclmSOQrsHXg8m
X-Authority-Analysis: v=2.4 cv=HPNWhYtv c=1 sm=1 tr=0 ts=6ad6276d cx=c_pps
 a=3/9ZW+mBBPtU5+OO10+n1Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=tzc2XBMAbaPT0kmcck0A:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX4fPvMzI6DXXv
 U1yBtzStTtdVBKv54hOHeod4K7iNFrXHDD+8w8M0w7HTwcGHQ1NhOoHYLFHprzcAPsjgISM8mp0
 me87AeEPSSRxlq2ormtxuQzO7FB84TY=
X-Proofpoint-ORIG-GUID: UbifEz7RH7yN0S0AcBdclmSOQrsHXg8m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190056
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Oct 2026 14:21:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17747

meta-arago / na / 20261019141339.3884587-1-p-bhagat

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
- Patch Series: [master/wrynose][PATCH] wireplumber: Remove set-audio-defaults service and script
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Mon, 19 Oct 2026 19:43:39 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6e638ad365aba36a489ac1daea6ea47fbc3a2e47

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: open62541: update 1.5.8 -> 1.5.*
- Commit SHA: 695bf97d454f228cd234b86754bbbb2c8c8142a4

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] wireplumber: Remove set-audio-defaults service and script
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Mon, 19 Oct 2026 19:43:39 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6e638ad365aba36a489ac1daea6ea47fbc3a2e47

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Brandon Brnich <b-brnich@ti.com>
- Commit Subject: gstreamer1.0-plugins-good: Port SIGSEGV Fix During Caps Negotiation
- Commit SHA: f01417105845c74d793e9324449edf18ba6f1d6e

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty.bb:10
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
    
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty.bb:11
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887

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




