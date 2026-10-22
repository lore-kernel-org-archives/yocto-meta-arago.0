Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.627.1792703885985062003
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 14:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=YM68bqcp;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ob051S7s;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MHtCa81030517;
	Thu, 22 Oct 2026 16:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VbdRZpx8pQQvY+NuY0RqcLsHxZxxRSCB3nyNYPXLN
	d4=; b=YM68bqcplwOqODnyikMTAVZsMLAyowG651RVnkOk77EZsrDXGFbu4WxHt
	6G3QbUWtSXtoTPQpCuyeE6Y4WCsUnc3kslOsH5zjhM+MPL9YTsstTE7hqretTs3/
	6VUrLk8RP8U2T2MJaNY6d3i9x+QX4vq7Lsx5Q2GAgPmS3Q8z+aqJrAoUmbC4L/kw
	sVoeyh5qlf4Cqx6HNLN9FZoT0vZn8tZRTCSWCqZ8osUvriFUWRUpcw5171Dbct8M
	WWZluB0kaQt0eK06JHp4FhS6VHUoe7mPszOjnbX2ANYngX7Gdn+wZr7qj6xS2aIa
	2DehRuFSccVbRiVpkz+dmIs9m/Q2w==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011068.outbound.protection.outlook.com [52.101.62.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hfmg02f2e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 16:18:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5HPiFv4q115caBMLzRAvczsNlGZ/5e2SinqmjPpeRQohfFteiFwHrY40kdZQGLSbDAqv4XDK+YNChFlCHWpQYWO6A73qfFTjn4mSiN4x06pMYFh9skuqs6oiFklMhl9sPr1FUR7I09pN+zleDOthjox5aBQqMa1fipB7yRiCzmvl18oBYEBXJpbosWoCcKPByKgaMMKlxglePikK7Y6bHlyI0AhqD07ObWD1NcFF3rJo1GCIFV95c+/qbLxgFtGHEKOo7nafP41lxnUkASrV7qimThUtg2mJ3j28dweb1Q93/7QggblfmdE/eYUlRMki8snAIB4eilZhbKtcj09QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbdRZpx8pQQvY+NuY0RqcLsHxZxxRSCB3nyNYPXLNd4=;
 b=g51LxtY0FwVxo4WOpnHxl4djzpH9ESsjXcaEJnYRAX5KbSsOp6jE9hpsKG8Ui4NkxVjdpnv6kBX7M91YLaMM23ZozfFwMcvi8y8Va7idoJDoO8tCOgYJd5XeVC6mk5pB7LWukROISquZsuEKsYRtcUBRPcO7p9lL7hPycuQj1cAOexSt1MCwFYvt0KzDwL0mdmfiXwCYqOz3C3fv9aUwVy4WJRd+Nk0nns11XN/iVXHwVYyVlGm9JbH0iPKkC74rBQYAmLntUn/aicCSw1WOy7uxbLl92ePfb2dvdEa0Cc9O/Lvub2/lrPJ3YnYSaWcX8wBOjgfpGliZACDQVKqtNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbdRZpx8pQQvY+NuY0RqcLsHxZxxRSCB3nyNYPXLNd4=;
 b=ob051S7sHKMfEiGnDoOBGq3NDc15k8GtdF0LnFDcNeWV1Wza01QSxj3ynr9UAx7AlMPMssBXzu8jK4AhjOBndtRicymX5eIzrwDNNCL7jtb7avOjF6cufkZw6BNGHnsWZNqvEZo/lchDGz90y2GPPJGAAEstdz6h4hkR61u9A3HabHZgF5VUWzwNE12sthVaKSUNl5t7mK8S/pDfHj0OT/soOwYEQR+h4lfj7yGd/TdYFjUdUeRXeV/3kCrHawTmGsKxHow4g0lRvugBtA+wnl+Rx5bjYC+9nRKb0pCbcI6SLi7ubY4L1XWU0O+X/E9h0SAxSz7rHazpgQ4M4vOxkw==
Received: from BN1PR13CA0027.namprd13.prod.outlook.com (2603:10b6:408:e2::32)
 by CYYPR10MB7651.namprd10.prod.outlook.com (2603:10b6:930:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 21:17:43 +0000
Received: from BN7PEPF000000A8.namprd05.prod.outlook.com
 (2603:10b6:408:e2:cafe::12) by BN1PR13CA0027.outlook.office365.com
 (2603:10b6:408:e2::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 21:17:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN7PEPF000000A8.mail.protection.outlook.com (10.167.245.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 21:17:42 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:17:11 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 16:17:11 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 22 Oct 2026 16:17:11 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69MLHBYl2110203;
	Thu, 22 Oct 2026 16:17:11 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id CEFF2142E0C; Thu, 22 Oct 2026 16:17:10 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH 1/2] meta-toolchain-arago: Remove unneeded ; from SDK_POSTPROCESS_COMMAND
Date: Thu, 22 Oct 2026 16:17:10 -0500
Message-ID: <20261022211710.3619934-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261022205110.3697140-1-reatmon@ti.com>
References: <20261022205110.3697140-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A8:EE_|CYYPR10MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c2ebaa-8e92-4475-f1d1-08df3081e92e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|261009223027099003|261022105027099003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: b1LExAjISlbU18EvmSnzqjImx/eyanBPQEP9mB3XsbgoyFFAHi9m/AVOSAKF3CxMLIkOmzSeky2TvSnkQ2bgvKvRQppPf7vrAqzKS3kbodXnkC9i4GGlgA+OnlNHwz2pjjPL2Sjn1VD6A3+EMAfn8oeEbBrhC9IVTnaPNIyq1YcfIxrNBX36duyiyae05/3Eew5f2M7W0CvJpdJ8WxGk1i9kD4A7H1Q1CZvzXLs8qHOcJeza1hcajNPH1uXV0yFhIiGHrQbuHGzG338pbLfOm/rchNkR+jUxmqOlz4c7CvYd+7kh9mQUJGQrn1NPpe9KMv7a4nfy97X9cwIId+UQSB+YJ4nx68KERPWJUlx58RFLRskLNubd3wBDQw5D1b/cET+kv9yLcEvV7QG29dz/r5JxEF7McoEKiz/+Y3JqSHPMpEtQKBiIyPJt2sTWmiXnA+shTTPCkHGk1eGM9ahXI0DqYNdsdjwr06lqvD3V/OnUdUUGW1hAmZl9Dd/6rkHcK3mI4hsgGu/ctZgZKSQ6Yf1jTwigmkZhOe0viRx6XqY+QsVT3TOMDIHMVnqR3gA6HE4ZVC1LscxO36MQw3ZllC2clY1OJ8UP6GIP4ezBxe3uDmJcP1G/X7doYospvPDPildhgjF/I2HFPrkeDuvrPKNl/8cpb6ib5jxq06D1A39Quiqnx+Y3Xnghmem4Sd25l76Xrx8JzkE+XUkA3YVrCw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(261009223027099003)(261022105027099003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 57Zp40tNshPbTsj+O/gqL5b7/w9ZjCpj9lSyjVPkwqL497kWjkqU4oTNzWcMt9Ock7dwQ4XijAemz02jlAzoIUYScgD8X0BxUqZYAMxnm1b4hoDCXbmIN80+ZKwoEjQ4o52BVwMeJnuTgqJTLQUv2STRBUGFrVn/HMNeIxw0a3JgvAl0bllcXkmBFfVsZdaV0YoUjDEfh91BkFawdnziwFke+7hazWvV0NIJm4OzshJv2hDzar4ygLlaBcW3PgdvbstiPatO14pkWl9thL8jR5SVkOJ25SNIOLFHBixtbLJizgzwgTqD9s8tRuoshc1hfzJclyNaIzPxIQe35nAYUoX+2zof7j9wJZNWo32CrtTRSdgPCLrjgY4vG3+8pD0RCFkBa4dI2OoG7i+zRieD6bMNGFBh4Lyfc2GPUtMpXKk6v0D1hHFvqWut7vAdq+ab
X-Exchange-RoutingPolicyChecked: 0HbBiL8ZVoc399NF9vlekCujnIhEH/9+9Lqt7Opy9yp6Pi21Q/OZCbH6DEV5K7KLDvD+n0lnh3whqBFmeApdk9iXRGiEhXfnmt6iCTOQX6e/5mlrKrFeO5usH15WLxMh63nuGTLB8QH6s2YLklsZxsFvG0EA59KSHJumkJUzSZogCiGIqX1Rrslfx6+sBt6U/6+LLmqr9+AfI87bfJ4pzFhifnFoAc4MUsqrc1W7Vqv4e6St4rTx3QuUsL8wPd5mBf61n0w5HzaIUOfXkqwwt377zewd1HzRKuG7gmDSbrBLm9TWkYeBEPyLsC1Fi3JWeGETxQqfJTlK/SpNtoYv6w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 21:17:42.9827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c2ebaa-8e92-4475-f1d1-08df3081e92e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF000000A8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7651
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NCBTYWx0ZWRfXxR49kPtZdQg1
 oZ4UpplcCZ6acHfD+FdVXm0b0HJkxW0loMMYfEsT9+E3mqWgsIsJ4Yc3fkIqMErJjupiR1YdeBX
 qmLMdsMeRr2aYrh72WXZhxfry0SXUKwSoyj8f4cPyVehqDG2EHttAvZYIpJSluXLsI6Yru1+wVi
 LML2aZ66ii2Sgd4xF9qkJfe1Loivxii4cFSLyAlihaO9cYza92lp063oYzG13Fq+EW3As1JbqYO
 hITqGASLPYYq821n0wIuWWcMHRLxGWOe7Lji+Z5LwKujTOsdArSUs1M4KmgnnHPTvaPD+5zD5Q6
 dS2doLDATMGI2yBDtdh9BBhSkBuBTBsnIhQ5QO+X4NLi2r7Lw5rU2ctPeQ0SJPdwg3cb5+sTGWW
 Cu+LxUrc4naM+K6tlLbVrc+BeZkNgWosrjx4sBiEb62QjQNGS+6RPBnNN7jDsBJARbEMnsfiTnE
 BcLGvexGAArYyyu118A==
X-Authority-Analysis: v=2.4 cv=QIL91QLL c=1 sm=1 tr=0 ts=6ada7d8b cx=c_pps
 a=q0rL5DqQyazLQqY8Xi1ihA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=dMlzE6ArgDxlR5q3N-8A:9
X-Proofpoint-ORIG-GUID: G_in2Rmft6dAW4HxdTT2xyWRDeF8HxJz
X-Proofpoint-GUID: G_in2Rmft6dAW4HxdTT2xyWRDeF8HxJz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4NCBTYWx0ZWRfX/P0xmfmtbV7Z
 Sq0tWHakUQy7AqJ7mjvqvp7ZdMIv0igjKVt4ejJvaCqacUK3AOmI9SGFo6fJRh6RmvWR6rSQHtx
 UPh7pblvb21724lFjVOQh5r5H/dO69k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220084
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 22 Oct 2026 21:18:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17752
Content-Type: text/plain; charset="utf-8"

meta-arago / na / 20261022205110.3697140-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH 1/2] meta-toolchain-arago: Remove unneeded ; from SDK_POSTPROCESS_COMMAND
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 22 Oct 2026 15:51:09 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 1912869b354840f1bb3e52d9019b4dcf2ec117c2

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



