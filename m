Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6589.1793913339224443773
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 13:15:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Ao6bLbpS;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=NgrC1sot;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A5L834Z1810422;
	Thu, 5 Nov 2026 15:15:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=zWqV2kFFmdAsiUxAJC8xkZ5xQrAZbp44oewmsBff5
	Z4=; b=Ao6bLbpSAjXTYPBgmSblPB/jTjQpy3MHzDV4LWl8mOSvg3gTuEyvY+ifx
	cWsgZOL2XCRsseVIQTpiK6I6k2ZYN8KTHiwcH4GKVCYU2jLeE2k3DEkfS1auX97g
	mDhf0bzfyqvtoX30rHUbkRUnuEABn/bauMA/eJgwsmbZR1CyChqd2uzqAQV6meGG
	N2/bcgsHi+dMeinXVjWaU5AdamzKi2CBzgaBaQn4MyUzExAoB3nSUVtRbtip7gep
	XdP1MLMfclqbv6llhw+qNo6P3s5O0gGg7u8tl4crdmj35uLYa83+BQ/AfUlyLrvW
	y/zwxM7VKnrX8nXJAkSbqxmCRt8hQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011020.outbound.protection.outlook.com [52.101.57.20])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hrq6tm8t4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 15:15:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGuOnB9K/p0qJeX4CGgJ2DTb/DFHk2bcDa+tspavgIm/ekuob0FDAUp8CA+GXbgJFyhFpjMH+985tF+z/AzihV/CKKg5U8G35fTljTkXj8YDU7Jo3zWhhV4p7nqA6OUayseryUeYMKeCLcRN5ipy21VZflqFcPXQeS3iQOPBVQOWfpoOyBbSl43h2wvcq5KOmxytO8//mrZe/A2UbPKgekf43DyV+xZnfouamGWSCu4QE4nHfNe8cddr1sSiiYqVTNo709nZlsVmHGtExWi0q3hdHykyGVn+HbuJVtJP7IBIqo8RMR2/3YmwBFqB16FiuCluqAAIwpLzbzMUrbg/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWqV2kFFmdAsiUxAJC8xkZ5xQrAZbp44oewmsBff5Z4=;
 b=OBZOnOSVvK7BO8dwOiBE5IevKoZO6hOJkcLXSp1E53jv1XBNuv6kn8YBsfyoq0pfcPIEK2DGDCh3srw/81hL84L5GPaJTYz0eBzMA5JK00D4Yh2DO/ZAiBDYQojpTbF8A04tF77IhxGHh4CPc61sPCq11wJlMfmeN3Ly1Ii4lFdLgwNIYGw/Hyd89tnZ0qy/lomiZdWO5HyNhzOmQJ61euyTIHd8+pILaWIq48RqLG711I9bfX1+xIMuXbgySF4akDUyb9taSExyiLf5SErQKyKR8C8ZbBQH+KAuCbZo6dm6WQau0L39wRgG+/aLf0rJ+xs3t9lHDrVQ5QYgfOUWqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWqV2kFFmdAsiUxAJC8xkZ5xQrAZbp44oewmsBff5Z4=;
 b=NgrC1sotbACK9aQiibwQWJeEOR1X2Vq+RvYf7w6TV9C9nHCefoFcRoe/ngvHArLrZJSLvh890IjPG7vGVuqWUGwQZSFbmSTqJSuPrM9mB3wyclKMHNI2nuG2z/0nVNJije4KEjVGjoz8wsk9dGuzbigtzCjOvyznH+tsQRtQpatFWqhIJS1a9E1K0YLfTFqFI8PfgJ55NqzrH4Bi+VWymgyQLgk+kHKilmZWvRHuQ2mYwdgwpJKn7inmkS51vUI1+8ORB2dbI7wexcBvhryGRrURJM+T9DCTrv0by/yyMThNlNxl5pI1ochJdNsNOUQIMUHRg+11/wje/+BEL0KwzQ==
Received: from BN9PR03CA0877.namprd03.prod.outlook.com (2603:10b6:408:13c::12)
 by IA3PR10MB8614.namprd10.prod.outlook.com (2603:10b6:208:57f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 21:15:32 +0000
Received: from LV8PEPF00000066.namprd03.prod.outlook.com
 (2603:10b6:408:13c:cafe::d) by BN9PR03CA0877.outlook.office365.com
 (2603:10b6:408:13c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 21:15:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 LV8PEPF00000066.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 21:15:30 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:15:03 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 15:15:03 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 15:15:03 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5LF37A4079472;
	Thu, 5 Nov 2026 15:15:03 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id C548A2C86; Thu,  5 Nov 2026 15:15:02 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] check_yocto_rules: Remove telnet daemon scripts
Date: Thu, 5 Nov 2026 15:15:02 -0600
Message-ID: <20261105211502.3128177-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261105204708.1308999-1-afd@ti.com>
References: <20261105204708.1308999-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000066:EE_|IA3PR10MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: c2753b94-1fd8-4f0d-712e-08df3b81ec21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|18002099003|22082099003|10067099003|261026140227099003|261028144727099003|261009223027099003|56012099006|261022105027099003;
X-Microsoft-Antispam-Message-Info: TBWVm0sqUCkpR5zk4z1SE7ViFkXG1/TeXSC/RkUfyd8m1mX8fVXw7m/HrkxwE+rjEDtnrFr7xV2d3lF94IZChYZQUPRChH3cR1gpypQt9Fw7GI298VxoaBcjBK/+Kqs4WnS+VoY+OOmltxhkZVgiKSyzpxNRVIx+hH6Q/uj8pquFKfoFzA2ZlghSHf5KAB89wS2OMBkCw/qebrHXPuO0WjKrED7qIKs9qKQ/47aO2G8pYtSjUMh8H2raUhZ8YLdsy886w2f6gh0PUrpe6SKbwsUx5P5y/QzB0xO/4oGhyV8P6664WEWnKVcTn13IAiUn7e4/I4U4sOJNbqItGlvCUz2FG8o1JCbTtfryTfazEEAMGWSdDPLvCK8lgtUC1WRdWMyzcDu/mycjHHotU+KqL5BHCWmzEYMEZ+UUG5mpE43ZSgkPWgDN1zr5WA4tLlqFot1ioV4IQAJ6dpbzw5vB72mX7SeNOq0+a8Pmf8baX5UKSzAy6g8/GzgNO+GyjrhOhBOs3jgd6rFJ88t2lBxRkdQ6jvpTSwU4DapFKdhcG6St2DwRNbab3KxQYwhzkjFI5KZlCEN7JND03a07c87whO7y87sxzpU8yr9lozfvPsyfBxFv4RMyAFYK3AooRpJiUkeit3O1BwjR+jIZt6WVBUU4T8y4qSzt+weJV5tU1HoGW/jHr2W18VHMtSd53mo7ln8NB6KzQH9WcEeedLsXgQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(18002099003)(22082099003)(10067099003)(261026140227099003)(261028144727099003)(261009223027099003)(56012099006)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VX0WdVPj29S8ggEdlpO9UCVE3j7AlesqFZKVIlw/KQ67IoOkgjSqN11lO8UWmiraBhnBcU64fseECSXuC1XBveesj+DgqgKbt1D9ZSQWPIBe4n9ffpVQi43pyYdFPV5Dmoyz2zqMWExh5WqYUoHMiBssl8qoolR/7PQ7/mbSzaJyheJ5XVRi3GYSQvWlogVK5LsAuEW90t/sDOUEZdoFEzqUTjmCm3OuvC2g7BIW8JSsHp/+ZKtC4nFD8uO6OfQ9HFGVJnlasmcswTuTkqjTJPmxh8dZyuAKzpapnXCCKxaY3fqqEGlknzQOUOmamNKlOZyy1nOXq/BAU54Y35KgfvREtVeXtUFRCpSDv3zTv83ZXxV6slEA/9rb8Q9bOiOMzTzcP49INXILs9ATBeGmBeO6l5cxxWhWk3DP+M1JRCHy0Wu0czg1mzovJ+edDTz4
X-Exchange-RoutingPolicyChecked: n0ngC/cD8cWphY/xoNXYkD8R+tdmTwS4FZkPBOSKCSfEf1vUO6SjI0J7mSW0rLzBiFtM+Qk6+FKkf1/8ySDMdZxJUwpa+L67UyT8M+rVL1OUZU/GAKEkNROPbYrDH0j4cxpAtRLnvl3yhq+mRABLrjvLyp30vpaHC0diUfUw3e6yj3pCbzjWzKZK27rhB+/q7FjSRXzkbPFJ6VmskXtnsDSraSSzramtVWFm54o6omzdWBkO4F+y+og/GLh+N+iD1hSIMBpM+EkoQkSiwCm9rqLngnPo3lJnTw4jhn5toX5YD0786OI8RRkbrcqDrHn72CX5sTQcmmD+LNEI4gLi7w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 21:15:30.7119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2753b94-1fd8-4f0d-712e-08df3b81ec21
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF00000066.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8614
X-Proofpoint-GUID: hg-5Pqx26_C4NUrJMzYpNmi4WReqHIb0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfX0PGRAaOwGxQg
 Lb2LS2AzOQ/+z6OtmhblwYpnKLKa2Uh2Ainh0YzAKILX3aix/38V3DAt+iV8+y0m/+seXJDK70D
 //oQ4/2KB+PSEbKVw6TtLbxrvDYe+Rc=
X-Proofpoint-ORIG-GUID: hg-5Pqx26_C4NUrJMzYpNmi4WReqHIb0
X-Authority-Analysis: v=2.4 cv=Q6xHcI2a c=1 sm=1 tr=0 ts=6aecf1f9 cx=c_pps
 a=pqTWcw9xC4/AVWcamW/T+Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=3-sleTWlrleUEEOn0poA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NCBTYWx0ZWRfX2RYuZtRZgPjw
 TH8kb7y982SO8FSBhlrjrU7JFjvYHcQC+/6GoUdZRqixy70rwi6xP/GrLokeNKBpBc65bOY1qhr
 ns2f2RlXkp032TWvV5tpEV4IFGTeNDxy35BCE5g0wzfCgrlQ8ay7UajrCsuEV3mYSrDZq5tG304
 ZyZYy35VSUGe48DS7k+bkMPLWFbx29dxi1w+ueIT5l6Ps1WBtrcOnlBBhkB4yVj3criX4aaqX8a
 VnjYmcTpTtBFWdLeH6cT3TD6V8hVzSrqXtsAoTfFhoXKZO9mSfUA0XecAif3xiOv8DVViSK84ui
 pWGcV2MyjObKJ9bgLvItxzxzp8yeEzu1lsR8Gw16cBi4pcvgY1CT1c6iztmmdrgrUsnXMjNWHg9
 XfIkQNjulcMG9HwMAysTzgI9waFMvgrhFq0Y2vHfXPJikBP4iphgusnLAz91DnqmzRoRUhdNVRm
 0V5GUG+PDkRTEb6ojzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050084
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 21:15:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17772
Content-Type: text/plain; charset="utf-8"

meta-arago / na / 20261105204708.1308999-1-afd

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
- Patch Series: [meta-arago][master][PATCH] check_yocto_rules: Remove telnet daemon scripts
- Submitter: From: Andrew Davis <afd@ti.com>
- Date: Date: Thu, 5 Nov 2026 14:47:08 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a30346fb0748dd0a8c71f33db27c616bfd325094

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



