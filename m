Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5E9C61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 21:27:37 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7104.1788211655347002423
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 31 Aug 2026 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Mhuw2lrh;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=hdsQSfDB;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIS7551444697;
	Mon, 31 Aug 2026 16:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Q/BcZbIKkXvgem/LzWzCER6wRxSmeCCGv5YgOQ7lr
	Lc=; b=Mhuw2lrhUzCHY39F9OOZwv1+poejtswZJDRrX38PNWNn5vH4P/BILb8DS
	4WvvRpZxKyj9idv3ZrALM6f87elvPVTG+pqnwT0YO2s1y0QxkhihUHJ/2dfRavzQ
	GyNtprxj6MqWl97yrTMwgwAnOvEzG3aP3LeuSlAhrOZf5NpkqYrfrC8oZiXxqHXs
	0gdzSHImCM8YyDLyqDX1QJt2vnAvMRVLt1ZEy57nskWPZ/nI4sHS/QYQizLImQyN
	nr5ZT+JqgAYkATSuCICFlcQpXCrfjQL3+3Yu5ki7rxZCTSpFKoZlkz/smbBm6XeF
	NuBdRgqpGFutIIjneUyMQAw3COTOA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gcejq0y15-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 16:27:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7UqpisxeCXE/ogD4RT4G/9oo/G7WIZibZMZ95FX3F0NRdZDqkXe2Kp0t2Heq4u9MXY4scSqfob0EkOP+RIavFgHVoNCezQ8GmU/zrF8S/tp87Un5C20EBKJ6l5z9u/JvqeiUyVpfbGF13y6H+/ixJ/PpuwhvQqWAQIZ8LrFCKHCjeGWjQqXBUSNgStOopmaOenyrD5lhO5vnk0bnQFQxySOwYPPH2bT7g/kCpLlBkSGPCQxE17OyRk7yNWK5CpL5/ENB3C82YVVlHZJHvbubXpiX+iqhmDnwEqWAtjUAAXIrrygAONBtH+J0FKDJ7OPQ+oeqOg4Q0WavdYCMTpgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/BcZbIKkXvgem/LzWzCER6wRxSmeCCGv5YgOQ7lrLc=;
 b=rlGtoZzmejxTyr5qeuKD4HpmVdkarAB48xBVAqxH5RYakiblHBYaBh0r1JzyHo1JO3v/mwcHliQ8ssYyJpas29EgzqwA5uIYNeOSGnCEPxVC9LL1GjxTcARHyuHRe8nFmWdNpsIOS/Gn2KloJgAyapE27OLHGMVhyNaVyMAMKaAFL4M0d8XDO3N6ySxs3p3QOvDCSM96YsC//LcTFpL42EIVMLSdFA18IlllJ643FPkmX4gSJYdKJU+NC6UGPjHwm1IcPAjY5h/bUn5h6PS7rL34KkCX6tf3A9dwlc9eS4RNoHm2eO8e91V0RS3oz5yD2jdyzoG1igAzAdDVHCYesA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/BcZbIKkXvgem/LzWzCER6wRxSmeCCGv5YgOQ7lrLc=;
 b=hdsQSfDBb4Jk5/69bGexgExCjHexbSUPs35y7ZrTKGPKfm7PC9AOes71q16+VvNK+VIWfWe4A25xR84BIvUvMCug/Y7G+6xnMqOjJJtcWUwMehcl1fMfPvQL8pMts2rQvZCaeCspoNY5tbu3AKKkV7boqygqeIPvgshIzFJ3J3pRDDNDx0MCpBygKQpkyxz+FmX6xXlxkIo8sPUyHAlafKbnJdoeJxV0OfDZKSw2shu7puZc3UFRCS3z1uAhynbU/TeBr+nuZLaPYqEHSuCGm9fx3o7jboettVVzVh+l3iPmU1btvKCUDdEZfVQ4DApQR28D78ngGtE2x20BJ0EH+g==
Received: from CH0PR04CA0048.namprd04.prod.outlook.com (2603:10b6:610:77::23)
 by CH3PR10MB8213.namprd10.prod.outlook.com (2603:10b6:610:1f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Mon, 31 Aug
 2026 21:27:30 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com (2603:10b6:610:77::4)
 by CH0PR04CA0048.outlook.office365.com (2603:10b6:610:77::23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13
 via Frontend Transport; Mon, 31 Aug 2026 21:27:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 21:27:29 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:27:29 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:27:29 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 16:27:29 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67VLRTrY752615;
	Mon, 31 Aug 2026 16:27:29 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 999F79ACF4; Mon, 31 Aug 2026 16:27:28 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>,
        "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] open62541: update bbappend for new version
Date: Mon, 31 Aug 2026 16:27:28 -0500
Message-ID: <20260831212728.3648801-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260831210210.1908432-1-denis@denix.org>
References: <20260831210210.1908432-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|CH3PR10MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: 375382cf-ddbd-41af-842a-08df07a6a992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|10067099003|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	ynfaRf077vrHmMg0ulgU9uXIzHLAn5c7oxq+63Dhm7uqWqKwcLXXZxDebWJ6di8e2rXl3NHGSacLIWjuzQl9RX37nQySsa5pjNzzGGpyoO6b/rochoonIssRg9aVUlnevDxpneEfBVHtwZpUIfVtzvVXbzOIzUeA+aOCG+jGtkcDwXqqg2WWEpmqzjS8XB8yRXnNTNcuxIBNOrs74/czS6uq8/VGJPjpca+2C32H8vJsbLUR3SDs91PXw51dWfLx0AUXHo/iCKZxOr7fmpMqya+ZbMAAoFTrixXU1uLAm6dvWqJvzmsQ+28J1m9VrNGr7IeG1iAx+opN+PwZszPxADtK8/N9qw8kXqUi0L7k7dA+hhVmxEwCNdsbKE/ba24Z9Dyoq7Um2g2plYyqSd1yEQbo6JoYj35kDgBmcjNZqvMKkv8NaAcTTq8SmKIKxBJ36dufKraOpTOyiDu8m5fYz9ytOeaDhuuPatypBYGzr6qiAAHnG4Si6Nhbcg5qWEaxg2v0rgf/ORQ0RCoI2qifbKChUCAZ9RYZBWoKYfF30VKsXUZ4UqIqmliqBrWewzljDFQc0GfBVOveGjLyTIoj9mGZP4Y7rjb5LMlXwSN1hPE6tX1aOlhXaK88+bRHYTlomx9pnhJwVAkAxmSB87bjeA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nK43CJoinUPdhzsem5ReFos8gSj6vS/yqDGRPfAJ1PaCtraf3aXzn47Xom1kStQLV+aglm4QCAGpoLRhLszJ735bur1I+Lu7qXsFdfCzJgLM06LuY22rHjvDucKXQDuBg5KyjTE0+RH1vL7TYzb24Cm6vIOOHbm9LuqzZtEnG8bdQDyPLojH7ay/13QQOJuWJBL5GiW9FHLPXQG445NqjNPZwinTft7QQAHxh9dDD2HZPbcyp1fGMQYA2JQC1G/8PLcrFJBbm2TBcDvcVo7bUNIG7VpT2k/tBHPNzaSHT909Nz7K8sfNcPbyynwlNLBDoxWi72K//1Mik6BcT6msr8FDKdXB97fW02a8fU3O40G0o9ak06C8kWHuhXVQSyvYCvUsSDHQEfBVvfeF15DwNwyIis3EuoZT2txUIeqD3QY23qXmSBhUb2+/31F7Hkfd
X-Exchange-RoutingPolicyChecked: 
	NUSbOOHETdO/FvdBE2s16Qs16RpxHErYj6IssvFJXsAsYg9zsIABIMiUojcNQVEzZhTy+bXCU9GCu0acGhBAkMnjrsjJtb7G8ZhxZEjlYHYPQnChpiSXlG5bLb0v4UN0hMcac33R68Nio7orjI37kBk5rO8rzb1FuVr4WKXvbSwSnMYJUFKnMtomdtUkh4KMGMbLhroTISRWNQa1NqMADCVP/w5idXsf1UDE13Tw7pjDFUM2Rqxkn8Cgr+Zk+evYvqRUaIknJIV4ViUsNnwR/3V7bQyVXHpskEh+3+9Kwu4yp8ZJGTMRCTRIlCVvHZtynRwCGEu6P/Od+p+0IoaI4w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 21:27:29.9855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 375382cf-ddbd-41af-842a-08df07a6a992
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB8213
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE4NSBTYWx0ZWRfX1AC5sh52wBDW
 qQ+4MWyM+kPv83F+29zIa5TLRKeNtQmz2egzumN+oKXQsref3F/wBb1BCUOF0mbL46WzGi/oe3f
 58zQYQP7Z6y88uuT4kmmqigUyNounzs=
X-Authority-Analysis: v=2.4 cv=b6eCJNGx c=1 sm=1 tr=0 ts=6a95f1c4 cx=c_pps
 a=CgODY3tvNtn0KPtxrBvszw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=0gcC27t9AAAA:8 a=k-42gJp3AAAA:8
 a=sozttTNsAAAA:8 a=XJo2t3GQRGK5_4UurC4A:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=f5sM90hAhNS9OGT-JDKn:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE4NSBTYWx0ZWRfX/jurtx7CvG93
 HlTeWNJtgGX707S4tnfSc/JXTeZ1mAZn/KjPGaQXTyqf/Yi0yRDlaao6LpKWEZQW1xUWpAz8RzG
 6dXzD0wbh5vBdrekEkzG7xwJQFrDBykO5StLIiRBeEEqZorvqRbIItSUJgN734FcrnFbp4tJnXq
 NTHS149v+4Q9DZdKR7p6gvvqQvFKE4eeiNoi1hAsPIFGK6nsYNlhdVJzHdxzxuRs4U0vhLkIAu7
 YQ7FFAa5Gzn6rS1dBjEc2s7gon/KprIuE9mnixTzlh6UflJw7NlDxxIIfSnuU35FgdGa5COcVPP
 dh0rgOlVQV8IK1AybNxZSC7+M4xyT6M6XbtPOnBtGbrdDsk82b1DPha6erq/+Auj2Xjw3Vrnd8v
 5iZsNN2tpp4PyS2AOGEKeARkJLna736a0Gt8EJUOR0LQRhfb5JW+wHTRxLP/hzirhds+THR5g4d
 NLgT8dWyIRWn7t/KPpA==
X-Proofpoint-ORIG-GUID: JwzESR1DRqCEiLTyf9DnPAeoD15QgRBv
X-Proofpoint-GUID: JwzESR1DRqCEiLTyf9DnPAeoD15QgRBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310185
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 31 Aug 2026 21:27:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17636

meta-arago / na / 20260831210210.1908432-1-denis

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH] open62541: update bbappend for new version
    WARN: Commit message does not include file/recipe name: open62541: update bbappend for new version. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master][PATCH] open62541: update bbappend for new version
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Mon, 31 Aug 2026 17:02:10 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b9990e10f96279889b0ca784872881cf200d7436

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: recipes-core: arago-core-bundle: Simplify DTB filter for am62dxx
- Commit SHA: 664e57be59c22fa01922444e2869d7cb71870900

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
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================

ERROR: Multiple recipes found for mesa-demos
    oe-core/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
    meta-arago/meta-arago-distro/recipes-graphics/mesa/mesa-demos_git.bb




