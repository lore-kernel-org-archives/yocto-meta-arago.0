Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAE1CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 19:56:36 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5294.1790711789135556724
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 29 Sep 2026 12:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=N3t1JPo7;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=RNANRRmq;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TFbEdU4076836
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 14:56:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rHJKeztveiNMmiRkzT4fJeMM3/ywrwamfO2AAAMHM
	Sg=; b=N3t1JPo757fnNfa7RqBN1Ve9w6RUtm1SwhjiPTLEb94M1rwMX+1S1fCEr
	BswIgpvHA8DXKYPNRIKf6MA8+fMnJro+9FRHKhwCBFYrFDTPU3sIW6bIu9ggx6b8
	/TetqWVfL38A/R4AN6R4W2BTs1ppyhGhCQf6dYlTDEKiUM9Jtp6ifN2lifgFDJzR
	4wuwm37g90ur9OKQlUZMl3/UyU7MyYOXynvffWj8aAHTRkeUScVAuMSPVT/DCzuJ
	kU/gXtrEJKNEbH2vWRJ09td4YeZZ8awXCSq0peZacGm71CicR5BxJnA0fQxqOkoK
	WOWiJJ2svLVBW52NQNbujFHpJw5sQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011060.outbound.protection.outlook.com [40.93.194.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h03adedfg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 14:56:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IU4OHaJfh6ktb2MX/GIqTZ1Grh7rt67kNwQWfjDQGfXd30ht9v7/6E+VGA7xkzJss/lezFbvHFPdbyWZYfUU4Us16q3nMiX1uAT0SecqiGj+c37DNJL4A+gqQr2eZTk0fRczT+o73abfRS0yo3NQvwgjHiTajie9ok/6sAh+LEeUp6Dsv5ymArFj0kQPA+RhuR+tbODSNEzdSAognU7Zu0zjQUstdgUlrECGtb3tN5O2bOz+D1iznffY5aPQykbZnHSGWFeNQKSck6sff+VGWQ9rUw3UwEpmfyxU5qvnuqUFP0kiCik5JTVHa5IUUwitoa4Hb5l6Njk0U9k+OgEGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHJKeztveiNMmiRkzT4fJeMM3/ywrwamfO2AAAMHMSg=;
 b=wGBQohEIVMF1uqPuFAeayFI6wJs2i5y1qa/T5W00064oH+YPgk6berQ6qPa7uGL0DCEn5LUc9cRnrj2cm281T2/ysi2AcmMJgl12Y1QZ/Qks/VZhYrxBfIw5/9/ng75fgDknO5cU7K3Stdlmtk134pJ+gKqFFlGonxjfA38HYgEIFXyjRZmM6y9azmBmpobexInajnamu0wgThHxEzDW58UqZSdNLAsPcReFI6HKvxgoX/7E4bmxasIxXwsvDV3ZDbyW+BJyCjqfkK4LGTxq3SFCwJmxjehw/dSDp76noF14dKhWI+/+nclFf2V0UVVKEG94TPpnFW1ty3JgS/jSMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHJKeztveiNMmiRkzT4fJeMM3/ywrwamfO2AAAMHMSg=;
 b=RNANRRmqK/oX3T9QQOjayziKZTKiPtKDd1mtjisxZDE3hdXmWi0GLaYWcS0LlNIcIZWL+x249qLdNk5I0W8v0MUjPSukfvEepVb1xU0kxZXKVHUGo64RPfWG+PCcmk9IKbkzeHRgHGaBBrv9hrnEJbirba+Xr6Za1l0axCJ/++iSHjS0HMfl4Q2cmPFLDwJ3Q5jYcvkH/SrPR16MJKeapfUoR0XQCJEDI5hzF7FNMQOE8qwFc14Y3B51Bp/EN8TTZjCjzNcaqYIOqp+Ei1Zuge/2omj/+4pjlZ6+Oy5Egze704P5sINscf+lVtvxSy0y8FpqIYSgsCHFqR1otxhurg==
Received: from CH2PR19CA0008.namprd19.prod.outlook.com (2603:10b6:610:4d::18)
 by IA0PR10MB6890.namprd10.prod.outlook.com (2603:10b6:208:432::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Tue, 29 Sep
 2026 19:56:24 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::35) by CH2PR19CA0008.outlook.office365.com
 (2603:10b6:610:4d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 19:56:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 19:56:23 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 14:56:08 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 14:56:07 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 14:56:07 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TJu76J1673314;
	Tue, 29 Sep 2026 14:56:07 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3F3379A9C3; Tue, 29 Sep 2026 14:56:07 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <detheridge@ti.com>,
        <b-brnich@ti.com>
Subject: Re: [meta-arago][master/wrynose][PATCH v6] chromium: restrict force-h264-youtube extension to supported boards
Date: Tue, 29 Sep 2026 14:56:07 -0500
Message-ID: <20260929195607.2566959-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260929194855.2797852-1-t-lannynd@ti.com>
References: <20260929194855.2797852-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|IA0PR10MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ecf4f78-c531-46d0-3f1c-08df1e63bd3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	gnIoBTeNhaTAI5L8+JMYM4FNKRHOKncFy8Ybf1HYu0F4qUtoruIlbBCeN9I/0ENMPBP3RZqJHs6hr9DcvQSIFUR2XVbOGcrT7QePaSu3Io+0ouZm0ejxTUs9sDwO8G3rHjzlOLaBwgAYXifcJXD2xt9JyxHQAZ4Gp2B1X+XmyoO09hZXHrsIOEMYjk/Quf6d2cAOqbYkr+//54UFLWDIj+IllewWRad+delNz1iqnfPmPgil0l5qx7/Ze7sB6x6eabgax2MkqKPjvoa+MiO7KyLxsEYI6/AiYUIrhOkub6/fGjuxuFv4aa3OUbsa5YZdO4BteOYpOrZ6QLphy7+hzqM/muxDpUWLltAwCOt7Ojbh7ayGIwkKomuFU0WPx2Aj76yC4ywZLmOKPQW+kcMuKAUHi5plKzbzu74/PC7U+SW+tiTgmJdhAKYfXhG0wYQSp/HOYy6LlReC8wKtQNpN8mxSkqI24To4yb72frr009LLp5GU/lxfNPd1RSh2wDqQ42wy+x5zePqG1uPnGOxXeMPwvauecmPmwI3y7CxL07zOKc7rFM95Zn907qLEDbP+S5u9CcT+h5rnVUo39UCYtXP/kzUKOt673HS/lNCMu0AQCoXPCBv1kWJ5TWSq+z9U0qT/VO/4fGx+fMe1u5JUx1Kyv/P1CwTvNu9LDEXxb40uI50/LsQH2gcBgmmNtXheysl6Tvhtr45zdY9d/CdcVQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LbBovtRFA5TcAD7K72gUHtlctoy98uoZnV1Eb5WTOWIioCbD9U+OEQiZt71alAoCNsqr6s216o1GlALAN9YmdVgyRM7aRU3S41tbsBSd6l7ioJDLZuzEWhl3ZNiiodakrMz2QxaRr+I9hvCS6RYXFGHOo7s8sa7dN3Mmy6K+2QeWQui0zFgcPHhIt7sAOnR8t0NaoSu6PHKblRv4AoSmmIO2bzCR9au+wtE7tl31MLw2wUPhXEqpn3zu7/lNK0NoA2Qmk2kSO8O0RVoktedYicvJaPwWdGb2GwG3NxAGkyinhTlO5aqdFWD2oiI3vyJPHxy3VTKlPrc1oYtCHoraj1hiJHLciuAvE2BvMf+/ZBDQF9ukVzl9CQo2kOWaleQ15SMzk5PLOvFkw9bqF0ykKYbSpK66itYLaST8FynMMyPmWh0E66eKfrmsNggpQrGZ
X-Exchange-RoutingPolicyChecked: 
	3bKrbKtozhGA67iZHHSpRwGWnRaoelxM4azZbFep5mSh3m2XSDnaoIutKgRA0KC9KdBNWt6IXcDLSVHxyESn7WI1/1bCWlC4zUHI/NktivYEGxWmmK4F/BebNW1vwcNP7yp2kZmAWHTYsGeAZKa6RY3BIDwIAQs4VQuS67Y9WuLiJWHgGcgT33ZSCZZ7f5IUuUxAFEhgSr/yTNgJaZn3dD90we4DALVZIQ4b3LFKdqy6UJYKGLJFjtk4YNO+PEq7I9Y6wccKfOSZSGoK35Q8Lv8ntvSRBr/xNJpiDn+UebwTNyeHPzmhvRvlFVskAizlUx8G8XI6IYmT9AiJh2MIDQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:56:23.4493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecf4f78-c531-46d0-3f1c-08df1e63bd3f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6890
X-Authority-Analysis: v=2.4 cv=c94+0h9l c=1 sm=1 tr=0 ts=6abc17eb cx=c_pps
 a=kwi3Ow37oS+QRMqxGNLpqg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=RM_rJlpamhP9fblFMz0A:9
X-Proofpoint-ORIG-GUID: VEdssL9GoX8oJAIJYUbe9jKDwiqWh9-P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA3OSBTYWx0ZWRfX5hdDa8yxLhlN
 T7P0ex6xPI83Bf09hBnMPtI7UnOzUonlIT2T9Q+tA5rGjz88Y7LwJunp2a/gIlxibSoK9WDd3og
 4ez0ECq0SN0ZczqWL35PhYZo0ow7oOo09gyBjodtAKYDrDplrn4T4W9dZoAN1SNZyfwkCwtYrEc
 46uAPgJQvoJ4t1XUakxaCh72cUPIiDkjoKRiktsMoKO9CvOQ8Wg2iQ1WZGahjEcGGjTAPDx5hTU
 p7EGJm3Rm8A75qMEevlntmS6h7SPJTuV3vJ2K0ulk95TP0A/bdBQfGKt0gddXjl413WKVV6deiK
 bFrlDdS15xonLtu4m1OXtNj93P4TKPBzpWVIgjrrugYK8m8siqvRkj1PnF/BdLkut5htOTnHwYs
 6E3KxDC+1h+cvZyUBz3ek09pqGiurS9OgTcvCGgupJfpVKSLEQkU5fEQgxfyKGtxfnG05TV4yG5
 upUKasEOeF8yLiRXWvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA3OSBTYWx0ZWRfXwyWPIH7sesla
 o8dXbXA1GiZ6y0yTn5agX8+sJXKPiGKnCdsp/OQrwChWyvZe5jYPSQgnVS+9ZMJ/7kmfrcvF80d
 Y+64DiP437HHMp0zhCIqrs52KcqE9Zk=
X-Proofpoint-GUID: VEdssL9GoX8oJAIJYUbe9jKDwiqWh9-P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290079
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 29 Sep 2026 19:56:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17714

meta-arago / na / 20260929194855.2797852-1-t-lannynd

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
- Patch Series: [meta-arago][master/wrynose][PATCH v6] chromium: restrict force-h264-youtube extension to supported boards
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
+From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Tue, 29 Sep 2026 14:48:55 -0500
+Date: Mon, 28 Sep 2026 13:22:56 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6aca1ebc0b4f683f4cad5152f7ad67fb8737d661

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-world: Clean up chromium inclusion
- Commit SHA: 6e0dd96eebdd75de156536406d0cda78c2f8b572

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-arago][master/wrynose][PATCH v6] chromium: restrict force-h264-youtube extension to supported boards
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
+From: Thorsten Lannynd <t-lannynd@ti.com>
- Date: Date: Tue, 29 Sep 2026 14:48:55 -0500
+Date: Mon, 28 Sep 2026 13:22:56 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6aca1ebc0b4f683f4cad5152f7ad67fb8737d661

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: check_yocto_rules: Add exception for pipewire update
- Commit SHA: cc1013940d3b41154ab5e3e6e82a9b584a02820f

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================
ERROR: No recipes in default available for:

wrynose - PASS
=====================
All checks passed




