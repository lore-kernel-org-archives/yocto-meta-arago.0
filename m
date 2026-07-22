Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91B5C44532
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:06:49 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5078.1784740004964746194
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 10:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=nmQXP2Pc;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=nJpjaHzE;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66MFiQWa4144577;
	Wed, 22 Jul 2026 12:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ZAoydrIRbg3JEQHZJTjxXSTu83nUrWd5bbxTHI/X9
	T8=; b=nmQXP2PcmEAkuY0GlaoFFRTz8BB6rh7wzXO4OXPgUjvCP+SMJys9VOrZI
	TxcwaZLOXwcG8bDdmkTL3zZJNx+Q1jNzTCnBU2ippARoGtyoN9gTY1WLDsCSQtoE
	A4whWFLmDYV7/TxhxC6P/H7BkJzXB9dFJHKeh5u9SnXkA35JCobZ9Ddm2SmZ5CfY
	pE4g5QZqtOagBq42tPfwwMwrJGmAGMBomWTmhQtRXUSWJhsTFgdfaba6dypkSxmP
	EyafussOpdaEw/MFvV/E4V+BjggzOcoOzGZ7stC7gC/MgZol72PhiSomRlCizTZG
	+DNIafOC11WYH+nI1QeJKpnNt+2rw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fjw549x55-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 12:06:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eySuRWs1IndOisPWXwuDze9q/hAhAt2voy88WnpVQ3B+oCZdN67UIubPZimbDSfVtMxTsFMWvnpGefmhUf9/UN+wKboefmVXK6Gqo/yn/LGH2hTiYrdDRQ59rHYLK7I9R+YzFGFB/H1guN5R7kibJzDgUWAwD7U+mdUH+U5xM653IqhKYjtoKZHNaSUA+mt3fJ1nrJgqFc2ME84mF0krEV7v36V/Y8aPaRzC9O6Y3B1HYJNnZsrt8qilta5TswXeJKEKpVACd8BltZJtpduhqDikoRB2ZJIgnG9XuyKwtHHYdwZgheHalJWk4sJHzwmGfBYP75ePE7ViX3qB3dVX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAoydrIRbg3JEQHZJTjxXSTu83nUrWd5bbxTHI/X9T8=;
 b=UNza0tHxD12PiwdxixufchUxA1RmWE7rcFsm7kzrT0ETuCkyepKTQQXfEkHVIDuUMmo9Ac2pHt+KOcaZ82/1QvTMvbQiZx8Lu0OuLHHTVSqCQo3LVoBHHhKP68LvvrFk47j4WSioBYuIa4N3WShh1bvJWHG1XiT7gMQD9IHAjo2GJswW2ktj7iBtV1ts05yCSEwICfs87CwQpAeWJD34phfMLOpjUABXjrGReLW2sGpuJaWLlDSqUg9GZNk/8h1x+piatDG0Z2G1jTmWmP1xjGtrbgvbXHEeFEFx0MeuOvt54NbVBGBU9rqhBpJnm+lMJuAKPGirXrRE9FHyVnEyHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAoydrIRbg3JEQHZJTjxXSTu83nUrWd5bbxTHI/X9T8=;
 b=nJpjaHzE97Qw+Dfm26HJ9/nnKzrRBI8kYvsy9LSMqyqYvP4TZsOmCiGJ0t6KFI3w5rLvxXAy0lW2KSgmv58R8rHRZg8UNrO3tEpf3nfvqYb5D+eik4yxUUaBidUZRWUZSZXtCYADS1YQSJiCUy6ReueUV/kuStX/o6KrPycgu9hnIzK+EEu35TPdO2Sbp7IvhywbzZm8z4MgYUc8i+ValWpR8EJt28I95y/QAGeLNw6l1rSekCg06SjEV+MDaXsm1uyJ61/6cA4Dt2tZXiLhJHCYCObXopUSSFi1md6Rcl5O0wI/+CqJa1I7qTzV3wz6RTXVBBxxE7Ajrf5oVu/WDg==
Received: from BN9P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::33)
 by IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 17:06:37 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:408:13e:cafe::16) by BN9P220CA0028.outlook.office365.com
 (2603:10b6:408:13e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 17:06:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 17:06:36 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 22 Jul
 2026 12:06:36 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 22 Jul
 2026 12:06:36 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 22 Jul 2026 12:06:35 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66MH6Zsm105453;
	Wed, 22 Jul 2026 12:06:35 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 776499ACF4; Wed, 22 Jul 2026 12:06:35 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] libyang: Fix CVE-2026-41401
Date: Wed, 22 Jul 2026 12:06:35 -0500
Message-ID: <20260722170635.109694-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260722170120.3071307-1-reatmon@ti.com>
References: <20260722170120.3071307-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|IA0PR10MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: f13760b9-f539-497f-5b55-08dee81396f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	3elLbf8LuTxblMk2pJwjb8rujDMKRXqloZxd9jhDrXr6XYRyaAWo+HexRFxg6GQNatwHbxajfGwzzeJ8gaXc4DNLtSoPKDKzVzDfrmrtj2/ppC1EIiS63/jytTYXgpZG3gJzNaNc4jtORWdN1/iGjv4eVpXbaH7hhzaIimCMpJH6QmbdJCJxC3VWZAUHC/36qZPk1aco2g9rKsh1KHVi0NjTC9KaHCaLX1i2kpONWe2mq8FXxkYbUW3uu/wi1khTK8g/oBhXWIDoYvm7TnvZiw4yd0C1NAYg5XMGrhvZ/TvJm3iwr0q7zf/3raI+LNnYUeSVaI5EkHa2uzpyLzx/O0as9FcwgcueB5qS6UHtkXLyNNjBpu4iie3jGsIztCOSnFr3erDJQsnvUQ8pKrf8F1CTTS2PwSQMkM/I9Qqiv4/AztGSBWpBY8sKWlc5G3iy2X7kALT6AMuJPR4dg2X/awcX0v8w7d01+Sa7ogN8IczBNDbNgBFZWHrRUsa1C3sEQMI5K/gPK6aeC0vYSYavRYFZtSjpIJWEbOo3l+dBRp5AF24JIPcdfc5vxkIqTUwY5EqUVq2xtZVdhbPn4G0HHVYWKth5X8VBQdpQxSHzVzM7Hp10twl6JGpxMA2FMuFLSdHy+RXXZItoRFCTaYD9827xYMa+kOjEe0jRSrrMW7CSiDxzPJT/w6rO+j+cR4TKg71Pyn1TBgE723PjhYhNbA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	b05qSUVPhG9T7G48Nr1eovMXg3hnGn+Ea41mzwVKNx2mOj0WYOv677tN3yCSfXTiJh/P1DZL5SVqeO/tCxXQVjCJb/GWmMyUp/JYNetnKog5bL2NDt38EHTEekER0rcrmnJfg8zofs0jqiWRPTc+L64MgclFj33wmDi4YW46qO4gOVOuvQxFokzoixptS+jXDrGi1O5NTW/ZE4CsyOK9xL+QxIRu0YmUEvQL1jAXjOkH4O2XYAJ9xQw7yUrdUtbJBWGN62owkYAdqksMgw0ll27pYznArIfIR1CLzjmiDuAB07glm13hqRQLqYUK31Le7AsRTRdMRZDshN5oajHDFp0AKVrEVFruKQighE19TUv9hZujnYjTiHSJljlPwhf9agVardvwlSXDIDmGOBCrn581uUHomLjAGj9GKVsyCe8hlml2Oa8p4++ieazRgA5f
X-Exchange-RoutingPolicyChecked: 
	D7b40iFcTwBSOypDnpz0ThACmZgsKw598FTE3LX1tbnS7rhGv4WegB/BrlyfxEhfuo4FK1uIoUXwyiShaoRhjTjt0S2609pvghDtaMq9hlYZnVHEs/QW9c2MPL/c+sp3rryyMCNCXWSvZcxN7LxnNpiwkSOjDLKeB9H7Vk/hQKztc8KYr2b4yJQHJCjYQyrOWElCIeakzKkFXcC348mYDP2GcJ+IGBFSbMGluCojL3AkLW8nOiIZh8h1n8ZdHr/zWxn9z4zym4z2hB+XHpMrYoItDikk98MNG9PVyTMEeipJhcaiU0FgP8T7fq76eo9SRFymX2ftiAoDut6amsB70g==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 17:06:36.6418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f13760b9-f539-497f-5b55-08dee81396f2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7325
X-Authority-Analysis: v=2.4 cv=S9vpBosP c=1 sm=1 tr=0 ts=6a60f8a2 cx=c_pps
 a=FzHw5hv2FvkecWl+Aalm1A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=UVL9wXhN6NU4wXYN2roA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE2OCBTYWx0ZWRfX4NDv6WSuhZYM
 UXTkPkvRjWNipwW1llcHfs61O2k5SDbUTtLM99Qg9NmCdCSe4q/GDgMpTCQimiEJQGbr52YkaeR
 Ucy0xh6zq1T0hdPFuk8dqBc5Ga9iOcY=
X-Proofpoint-GUID: Pml-rts3rWGyhv9TdBxzjGphyWfseFQF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE2OCBTYWx0ZWRfX+JZqQazzjNbU
 NiJ/QIru3hIZG6Q/8g0oqOH0RaeFPN6qYtJP+vtcultPQO8d1E7swTXt48jG8s8zGGfoEiHw+6h
 dWJanOOmACx+6QbujpLfdPcwIlnXbKd66ptXV7GqvrCqYJQh3Ksl6741w+lhzIcQE7vmaEDOjDB
 zBMO6Slkc0v83SA/7lTCBGCjn4JS0O9SnNSsblndhYU+pkNrBvv4tLJTmqIV1WVGqN5EKMR/jQA
 IyPtrUlM5+YYz1Tywv538tTH0oc4B/94Pw6GRtDUbEYkA1BnLeTAF+93dym4GsdKi1jjoiohpLi
 lghd3SEX2P6HEkZ2edIGUsOrQAvzTbqvVTE9L9Qkl5mhJkRsqCXInwNYUc8kMpKCZioiZPszNBa
 AIjXo0nZoqPE3JdET+PCZNpOJ6hcxfeooh6UIgmRP8y7h8rhr4Y2j2EsYK4OFuV544xd5JYStnl
 RCbwg5AVn8+MMYYgwpw==
X-Proofpoint-ORIG-GUID: Pml-rts3rWGyhv9TdBxzjGphyWfseFQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220168
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 22 Jul 2026 17:06:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17595

meta-arago / na / 20260722170120.3071307-1-reatmon

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
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] libyang: Fix CVE-2026-41401
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Michal Vasko <mvasko@cesnet.cz>
- Date: Date: Wed, 22 Jul 2026 12:01:20 -0500
+Date: Thu, 26 Mar 2026 08:33:44 +0100
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d9f05bcd65aaeb72455f193d4a51e18b26329231

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: libyang: Fix CVE-2026-41401
- Commit SHA: 73ab0405254988a501b849d221acf5f468cb8997

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
scarthgap
=====================
FAIL
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx/0001-hostapd-change-conf-file-for-better-oob-startup.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-connectivity/open62541/open62541/0001-CMakeLists-do-not-install-git-directories.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-connectivity/open62541/open62541/0001-tests-fix-typing-of-size_t-in-printf.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
    
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-arago-extras/recipes-extended/sysrepo/libyang/CVE-2026-41401.patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




