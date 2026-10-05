Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A5ACA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:26:07 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16166.1791192358558239235
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 02:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=NPEzBRY0;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=eNXCXq+5;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6957ls9P2341361;
	Mon, 5 Oct 2026 04:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=n/tjEBwCNbphNixahN8sE5FejJxwG2eAuI7jPpB6c
	oI=; b=NPEzBRY0tE4YMfXNLeMeVEmubrcL0ZExm4vnRVhxyO/r9l0MiGBchVw4U
	PZ7G5EtwKKhKXMtbN1boSZ5CYL/fzfpu5fRjpAuVaY8zKz7GNxQ7Ju92K2TeQIkf
	HwlNmZlJB+aWBIGj9iZLpjxEtdn8IfOrE8uGdwC8F/7v3B68yoLxUEdCPP/W921t
	qE93b8shDR+15kWKXkGIKC5S95AGPihau1te+gAz+u3Mc+SsVl/SqittRI8ryje/
	+UiRCvVHS5mQA6GPfYNnTYa36TMXj+Ab/hEUiHVNc+1DxgnlPwf8mXPKtpgYwzmM
	qSmBPFuAZV2SO64BInjFo23UsQOQg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h3gup4n95-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 04:25:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cn/MPybOcvGT9T8uZz0/6jU3T6dKoXqw/PkmracHq/ItT2xko/7y4JW8PkH8Lh/wcaLSNch1KKa0aKwKgMEih3oHGCTXw7t4lQ+W8sF5kaCRBEvfmXocF/4GFASnONtS4XeKBieNwZZpfRU7vJq+ONmSE0rM1N6RUh5E2a8qt4DHOdd1MDgqLS+NYYIT4MI0s+XkbhNjDIzNI4hxDfsUoA/+MBV3Q6eBtnbNtBLK/9Yw5/r/ZHIw4XUXWrmPTYfJFbHxWhrh05iN8nDH4GnzN7BPFbPd3jWzshTqeD64XOB3ysAxlGz7WkWLgP5vV0l5t5r6g0J7KD8F3zzgbtShxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/tjEBwCNbphNixahN8sE5FejJxwG2eAuI7jPpB6coI=;
 b=g6gpOCS1LcTeFA/0zQtekAkxfn4mTl5UTmXrDLsO2VvpRiJbIxINpO8510yUt7Ug2f8P43EmNB0OcdvXfYgikd3ivIp1/8DUsc2aJGLUw1ggPmCAQDvRFlImu+ucSE9Ey40N5y77kX1BUatYWVAQ8GqmA9omFA7LOq/zJjAJcpaDpI5Dw4zeDjGO4PR6iULotDQAam6yo0/Rjqv86023vULfjLyHlqouuPOYwfgS6u/gCSJQVFpfe2nC5+Fq+A4hNvQcHX39dO2pt+Kq9rHDA66cU/9WKT3SLI9czIHr3x0xuDRbTdbwkRM8acAfIz3yI3JX3JhCHKDZgzzTa12lCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/tjEBwCNbphNixahN8sE5FejJxwG2eAuI7jPpB6coI=;
 b=eNXCXq+59UXlO5CT1MS7DgfY8PRUB0V0ERZnhhm8E5GyXPnyXI598mRYmHdDhBHkxhI466OZh5pdO2Xb+jmnlRN7kp30Y7WBKrFq43Bhjf4KjDmk5lsaEl6CMdRINyC6QAW1XbfIbFNUKngzuCTshxZVs4uTk5SkDllZ0iJsAvmFngxaD1ogSWpuiBd+f+h5owlMI6gFFoPf15wP31nL3AwYW5U4xr6mwMXtJoR9LgymwM/lH7Lz9V/2941f8gyrv44tYcZEHSjSVoyKNjghq2K9y/n8Pk5qiS75Z9tPshuDgEPA5qOcRtG8U8RiLJ+jggO61uoVgTr+9qd2b5B1NA==
Received: from BL1PR13CA0148.namprd13.prod.outlook.com (2603:10b6:208:2bb::33)
 by DS0PR10MB998083.namprd10.prod.outlook.com (2603:10b6:8:427::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 09:24:54 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:208:2bb:cafe::84) by BL1PR13CA0148.outlook.office365.com
 (2603:10b6:208:2bb::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 5
 Oct 2026 09:24:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.3 via Frontend Transport; Mon, 5 Oct 2026 09:24:51 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 04:24:22 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 04:24:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 04:24:22 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6959OMGr851420;
	Mon, 5 Oct 2026 04:24:22 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DCA749A9C2; Mon,  5 Oct 2026 04:24:21 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: Re: [meta-arago][master][PATCH] onnx: fix do_install SOABI suffix for CMake 4.4+
Date: Mon, 5 Oct 2026 04:24:21 -0500
Message-ID: <20261005092421.2011663-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261005090207.855638-1-j-sahu@ti.com>
References: <20261005090207.855638-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|DS0PR10MB998083:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fe03d7-a20a-4379-8c77-08df22c2829e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|22082099003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	YwaYCudK+/dUTS8OXmacuFCfe8zEgdaS4sBVcNMnrfVkBL7Xg/+q5nRKTLcF5UiiWWbkbOGj/P5XN15F/hirFKxSzfORZ7WYntY6MsjhY5gMB0ZzvbyubZeHyS3sTcyB76Bee626LJdwZJS+CxQVY8G3HpezynhYwuodHRDgYqCHes6eFwdB/hU7HQ8vg6N2GfMXI2MiVshSoUrdRg7UFYGUHdJpyFGbJxmigHsUjNF9P3iorpAZmGxkgpbFWeGoNupbJaIVKI9MYjze8ma8Z4ISotUrdOzKCxOF71llbXYsbewD+iLysgNZFTbDm1DJ9cgDj9wiY+FQX2LEyo1GE4Wvs1nuMDC6NOkYFW3JzAJXyy1utHzYKtfBSKcXiiwOYiTufgN2C7Gt3sUzMHaI1/WCuhZXKvgDfv+BLL/WOk5k12GBzgBmcl6l7qBPp5tzXJJ7iBmMqhhEpM2Ngb3kvMJoNfnsuBQ6/3POM0eAx0FvrFV9ox60zOgOxUKjp/aLNqk6rl56tqQ+R4XCYAWTkzjI5iqSg+Jq/8r3/s4hWkrAkrRlD4qdxJUF9Bjo5jdENW6Xt/wNrPZsSQJSFwnQ7Ttu7pCfzKtJgQRA3Z5rjkI3cL/uj6NZDGT9s4BJxAL6MBtzQMpPbzV0yFAs26oJE8jeRHwTcjFkoIYye9q5e31fAFaFOyDX5NLYlEV29icA76wnEQWEqf/YmYLTFNgnWQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xg4ZgESMLTPeirH5Qwih1TduKaR/Ex2b0/FL7lNQDo2SjD40WRpToGG2tJ6oLPcwjGG8/kw1E9elWUxtYpK9y/ap6tJStE68sWpPOzfBGkJQlXnTGK6wQGPb7UgfR67yypDKIRhN8+BwLmTtsoqOauh4WB+t6YS9v2IHxakYgYLUF+0ssHLrIoZxvWr+OgXW3VPJyqm2S4YqGLtGIrzgT349yclNasPDBErcbaJj9Fqp54Y7xTejBIc9cIuZj3FSitQZLGv8ysTblsD8XnchO2bQk8aUiWv9BB16sr1JHNykXyJgaXx5mRYMhJVIj7G7iTDRZKVrskgcu9eqHJ7BpI3OPMU7Uxm7lX6e0EZ5Pu1PUPq53jzx5ZGVpyvkVhbr1is260KEkbDdcup4Cl1zCTw0kLcUlnxdYuR1JDHuDX2a9EWqK/9upnSSDamWe6DF
X-Exchange-RoutingPolicyChecked: 
	SNR8mW9iWBLDtnbE4beeLkmj+Jges+cEu4swH1Z5oFQ8T8vKgS5P3WFJA3bZtVllB1jzGbLck8MFNJDNr7AKlgFHoDpVWyRPY4OoxkqIDYM726HnYy+rPikugQ9neejAHPhn4wYW9h+S+eAh2x1rXA3gSIlGIMVT9eUzPzBZIv1MitTldQNGtNuqWeCzZxQbc95GKpcZO1xoCRn5ee2PX/DWbTa8KVLXfGWW+Hu3iWZUU5D0PWVY1j3jXrFLAlL20Caf5D/sYyz7Nn+3lIOuMaUbZjAlxooSZrrs9RER+GCsx2BlYSnTYqP9+0eu3otuF3WDukqVVQdwKjKyFEgqFA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 09:24:51.9093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fe03d7-a20a-4379-8c77-08df22c2829e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB998083
X-Authority-Analysis: v=2.4 cv=KqjYSmWN c=1 sm=1 tr=0 ts=6ac36d24 cx=c_pps
 a=MmwiYf2CWIeG5bfvH5NISQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=TYqZfeI7QP2MZhm-9bUA:9
X-Proofpoint-ORIG-GUID: r9OaL9kTekNKY4Z0wJZQNjmxZyELilsY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNyBTYWx0ZWRfXzEbJseRVVKBe
 KMvhDQnTp/xA1UUjKykToMRzluczhNiwaesmHfVR7kpJsDwlccUdYcw7l9V6UGQxbW2Lh0zH6wG
 5bk+ZQjyN8LV4IIK9lo5wIH/88dGH0w=
X-Proofpoint-GUID: r9OaL9kTekNKY4Z0wJZQNjmxZyELilsY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNyBTYWx0ZWRfX8w2if6r4vssg
 h5mUmCg3NG6oo6wPqJ7vJ86EEWJeD88pqPUxza2ufsb5Jlfk/cDaU/s8cXDynWwvuPB2za1h0q4
 mT4Dwrac9pigr/BEGXt1N+TpGA7mfDv3UijQSIlJzBozRO6wTX83K97UnFVqmyTIfa1jK+LkrMN
 D3JRv+7TsWhtKdniu3r6zcrvWvG0wqW2TqPA4TYNr7FMHpACTbeflVDB1tnGd5+m3hSPPboUuK4
 yuEoarWMAFcb4jRBTFn/w9YilKLTDDP7jEJOR56KQeVZHVk4LdUqN/ZHGhLrauUHJTDybQ+KGiE
 iBkXM7t/SLwr6x7Ebq1qAnzTGpzBF6TTWk7r9s449Wam6B2WNTPJ5D/Zel8OygWJ04XW1azfkGr
 9LsAHXDbtIsEV80A7aCkI2NXKXSERY/9JBHZrINDVGMGZR6Px+MKV91+reHd2nUv0lHlw48VEnJ
 oUYYYOkb7F1Pcwxt8vQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050037
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Oct 2026 09:26:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17733

meta-arago / na / 20261005090207.855638-1-j-sahu

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
- Patch Series: [meta-arago][master][PATCH] onnx: fix do_install SOABI suffix for CMake 4.4+
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Mon, 5 Oct 2026 14:32:07 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9b92587e98377dbba3a58b762ca7ada597a0d1f1

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: arago.conf: Remove "x11" requirement for mesa-demos
- Commit SHA: 2a226d3d7228e03f9fa9e944728161e26a872e82

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




