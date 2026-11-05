Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5983.1793911518264423084
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 12:45:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Mep3uG1w;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=kPP3pZfl;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: afd@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A5Hgq4x3093094;
	Thu, 5 Nov 2026 14:45:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=kx9qyk64JZUxt
	+ZzIP+fWXbO9sSM1sqcExA3pmUzcC8=; b=Mep3uG1wjj5qLaJvghEEf17d0uk1M
	6e15jw4Bo43VqztGjHC9JseTYXOULoqBD/fnkeyeBLIa9JqK1B6sz51SVZez7AFd
	/tlXWyBRnNrTQIwxHHnX9ex6MtnHsCIvyymHm9W+NQBnSsqW3h3BLYfIdPm/EuLp
	cwJDxPs32M+z1PhWnhyDrQYH6UTdPVvJFHUNwC2W5WzEQLZxNUUNpP0y53ecYA/F
	DnTQwjn98fkC8Xa7fH6SOkQoHG4PTGWhEyh0g4IzCkLTUyN5hSg9NZr3WCiZxhNk
	QXRxIlPTikCqpGt5xQCoDZYCYipegfmHBzAZu8EJy44573wYzpecuyVKw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010067.outbound.protection.outlook.com [52.101.56.67])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hrgp9pmrk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 14:45:16 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViGEZJf51q93/1M4+Ueh9IUB2dhCbs17StXsk4/5hH534RHrIhIgmsVqVm8GWRJ0b8/Uqv78vl1mTakOeaeQsjMlBQuBiEMln1fj08SFuEflAlUrVCHFnJdvnscC2cLUzmCOR31O6opSZ80LNFg7Pcgsa0veikWeMvfC33eMVvkXMKFxov925XUq0eyI/B667XkAsSzR6tNLdu2coB+Z6pldraQmMGPPdGwoTySfxI9jRYD/xSqD46C9+S4uPxmkvGjMOOpx6mThkJGkh8tfvChz6BzxdeekOdTIi2iVIYUE09ZL6UrYm6lSAJplJCuuvxPZbqUsRyq8wv4MWYS8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kx9qyk64JZUxt+ZzIP+fWXbO9sSM1sqcExA3pmUzcC8=;
 b=VVd9T9nvS7ip9rmkLZB7PsczwxKltDUBrzAJ+YLjmbxuzDdv3jxzFmzbM9ZSVWr6ODneJHGUGf94r2vskx+J3oaiElHT1WnV2y2EB7JeWF3NUK0M8ESHF7BZ7Kys3ZtVtJ1I+AZhNOSbysRNo7ESwNoRHeNwUyEwS7MPRPYV13brYDcjrlzmneIISskCAhfFFURcG0dxP3tBLkagkjFzvn9IoZXG+IXlMQRm3S5b8N45SPfa4/MxpBXDG+jZ3DL/metJGFNP9yZgfFcSCV1JVJ9ZVGZF9XCul9CGTvrZanh6G2OokCflCKPaQu66jwG/XN+uO1QbzD5sgRG+pNQKBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kx9qyk64JZUxt+ZzIP+fWXbO9sSM1sqcExA3pmUzcC8=;
 b=kPP3pZflPg4OYW+YU5lmDUiZSu9TbAnrGoLbynL44ftad4k6b77wgh4hNE+peGAUON3QQ+jLB0mBU8RBUxSMUKtnHK95MI8E9aLRQKo9y+T69cpafhaI9tFpCC92dxQf7U1OXmQCxc6hsLr+7QGt9mu0hO6YABQyjpMN3tHSmoY=
Received: from BN9PR03CA0477.namprd03.prod.outlook.com (2603:10b6:408:139::32)
 by CH3PR10MB7908.namprd10.prod.outlook.com (2603:10b6:610:1d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 20:45:14 +0000
Received: from MN7PEPF0000014E.namprd04.prod.outlook.com
 (2603:10b6:408:139:cafe::42) by BN9PR03CA0477.outlook.office365.com
 (2603:10b6:408:139::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 20:45:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN7PEPF0000014E.mail.protection.outlook.com (10.167.254.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 20:45:13 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:44:58 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 14:44:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 14:44:58 -0600
Received: from ula0226330.lan ([10.249.37.218])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5KiwYS839909;
	Thu, 5 Nov 2026 14:44:58 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH] bash: Remove time command workaround
Date: Thu, 5 Nov 2026 14:44:58 -0600
Message-ID: <20261105204458.1308514-1-afd@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN7PEPF0000014E:EE_|CH3PR10MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c4952b0-317c-4983-db22-08df3b7db11a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|10067099003|18002099003|261026121527099003|56012099006|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: cIfeMMVPjnLmsKK4AIzhYD2evILcft6xO4XTsIKhYCj6lf4mWwAZcwwCLs7YoTNM4z2PGqJMFj38w8x9xkzpNwBhjrlRJtUpUfTBm8+gTgmIA3HXkZptOGsD35ZvJCYyJ68GCna5hoywadtVWxTopX60wuQlUnvCBVz3wTouLKvFukrLpTDcatGCWvXo3OWOodxZRgbOB2wOR3B5CdyXczXJvj8n1VtP1QRCU0VObkqQ0FtsVVmlsjaUUg4kqRYH8rzP0nwlkdX3kgBqJ4sQWRgQW3aoHQqRYQK1eguTUtn2lTggjizMZ0pLdh9Q95Li6gqchniOHsszuWJj8JOdqQLepuYKQ/U8ha83zzbTjeE+JUdCiILW5vJcnKQVjLqQTyGJl/SuQUd/FpOO+qrYYwSIylgZFiqiHUWuVj9g4laJarK/LX2dkveHNrsYHFDYgGbuNTeGqlN1VMl3boWr8EaMHdgap/pUO7ej1nJe3v/ZfGhasvi/xQIR/bubxRkYnUpKuiIvTPn492oW1Tp2qGqiKA1Iz8/c5q2h/VxhrCJcAbpstCqhwaKyzxRLW2o7tZmdZKp//aL/wmX91kNG9rIA6p2i79QAcZzRlNXcUX7fBda5Zts2E1tccfTTGwPJiVkj1cpb4pmZeZxI1shr5BGIEYJ2tTprsrT6qkfSI5FkzJYgkKYUK9Pn01uJ1XthJtQbBru/pHP7cubv+1CXdg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(261026121527099003)(56012099006)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3qtr454LGodkUSCWJ2i0n3fYU4ROKxk9QRRHDf7CtfjyPED200oA/UkKBqu0eCNaEUdCrippqT1PmB97VM+uvvxBpWR8N8zFe07gKKS5tY+LMbHNY5xKErMPbpZx9NwFaMiXpIP89+bgcC8+W09yD3ek052axI5qLBOaVvAu3vehQQmILyjpEJqM88kjyMtFzF3EfOh54G8hGNqrJjRR3T17eKr8RVy40CXhHUAEJgGJ2m3xvW8UwFRRqDbdMWliKaH4M4qg6jzHo0VmIF4XqfCS5r4LdANj9fAV4pWP2Cje3yPpCmfIC0qHyZa0Dl71basNa6rPIK8RBLaZ3iQ4v92je70uS68ctE10V8Svvg6W+nsbNcqFMBua/l7qcXNbP7GIcWlo0pPt8SE/Ah5PwYB+JeYo7xLV4+ln7GgHSsGB38bLaTkzgFM7l8gto48t
X-Exchange-RoutingPolicyChecked: fuGnyuGjD+6xWUvLuNr5uIlh2DXRE/S0kU1SLm/PuGDMrDwPyWRgldCjgdQQ3Zpl/hy5vz68mxb2KL12A5/Q+gAAtaylGhkbzEds5Zj4fDiVAasstxUAcr4qYvLb/tjAXiqMjfjQN8oKwR7nnqVxUW0fR7x5Ulxq94k0dZLYh3is+MOose60xqVnTDxXxXBxCSOAJaUZCxUv1hsJuz3amF7QEO74pZcd9RydPYeBK65d7dJoJc8hfjTSYtPrZktxilBxDQni+L2qoET/CBQyKzM53gRJAS2hyrYemTNdLLTBZWvR2c3sopaJYF9Iww4gU82QMc36K/E3TXel0co1UA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:45:13.7032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4952b0-317c-4983-db22-08df3b7db11a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN7PEPF0000014E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7908
X-Proofpoint-ORIG-GUID: wOUV99CCdOzAYhk0Db-Pb7XzrV4UpMox
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX5mkj/odj053Q
 1Vtd5qehst6baY3eNXv4P9oYDpWir3WZ9YNQYwFKmmOL2hJ4nCN7iVaXeRk9tJzoUebf55cCi2t
 geEAFymbfDboen9Ve8GawZEpHxl3JX8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX8FhHLFwWCG3c
 K7NqaBhFeAtcEeBzh1muvvJ8k5JfB6SCg2PyUEBZpB1JZ2Hi1bD24olREakbN3lauFEn0x670N6
 Cn5JCF8rG0g069vgGD8j1zW0ZPxZmjVcFg6tzud3m2G/P7N82yTjGUC4BNMfy0j0sdzI+GvVLaa
 YOUd4PKn5C57XbAOnvr3abM/kL2kg1clXL1lM/BYYKd2KwqkrtNFEKu/ap+Bh2Mp9h+XIKVSzQ2
 eDBsG+RRNj47JdNVXa8YjpZx5MdU+BhOdzODlO3nyVEroM+zGFMnNnXm8Zh+djZTrzx9ybd4AXP
 gSMX1/8/ZiY/qpliZiGm6JINBm8ikM4rIv706VvoguW7mwo8Spm5hYtWcN551Wo2vqUpsCI7Rzp
 3JTAYGAaQ1fOnhTBHy7vUKj0Xweu5/e8t3ChJg33rPqnHmHi24iiBuRhPNsKdlyn9N2Ip+249Ya
 4WTJRTLI3VRB7mtbuoA==
X-Authority-Analysis: v=2.4 cv=D+jSufRj c=1 sm=1 tr=0 ts=6aeceadd cx=c_pps
 a=rvqTtZJOg9Ha/t6LIbsz2g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=itzbkAuf9y1i4uueJt8A:9
X-Proofpoint-GUID: wOUV99CCdOzAYhk0Db-Pb7XzrV4UpMox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 20:45:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17766
Content-Type: text/plain; charset="utf-8"

This was added so the underlying "time" application would be used instead
of the BASH built-in command (which doesn't have -v option). The correct
way to do this is to either directly call /usr/bin/time or to precede the
command with a backslash (i.e. $ \time -v). Remove this workaround.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-arago-distro/recipes-extended/bash/bash-arago.inc  | 3 ---
 meta-arago-distro/recipes-extended/bash/bash_%.bbappend | 4 ----
 2 files changed, 7 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-extended/bash/bash-arago.inc
 delete mode 100644 meta-arago-distro/recipes-extended/bash/bash_%.bbappend

diff --git a/meta-arago-distro/recipes-extended/bash/bash-arago.inc b/meta-arago-distro/recipes-extended/bash/bash-arago.inc
deleted file mode 100644
index c837e5e3..00000000
--- a/meta-arago-distro/recipes-extended/bash/bash-arago.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-PR:append = ".arago0"
-
-EXTRA_OECONF += " --disable-command-timing"
diff --git a/meta-arago-distro/recipes-extended/bash/bash_%.bbappend b/meta-arago-distro/recipes-extended/bash/bash_%.bbappend
deleted file mode 100644
index 768b3925..00000000
--- a/meta-arago-distro/recipes-extended/bash/bash_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-BASH_ARAGO = ""
-BASH_ARAGO:arago = "bash-arago.inc"
-
-require ${BASH_ARAGO}
-- 
2.43.0

