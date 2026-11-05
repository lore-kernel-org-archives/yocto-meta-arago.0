Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28669.1793860296865632011
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 22:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=kfoJkLhN;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=NOoWbLo9;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A56UCdw1807489
	for <meta-arago@lists.yoctoproject.org>; Thu, 5 Nov 2026 00:31:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=LiIViyYr1dRUb53sr2ZIVWMTk/PY+2iqh9h42MKpP
	/I=; b=kfoJkLhN1SXZol+teMiZ/ldLb+uJsy6zOnLxtk/e/zZvf48nsYMEto2QG
	vkEHHqVTaRC3k46tB9y0SpGDbe3plRzZ129bN8S8ZeFb+Y1fTK0t/b66iWxaC+Wj
	p272tajsCaERfehuIDYExCIIIgHSlfhbFF4soT9P9gVz3SkW0tLnnjAPkZgIQqWe
	p4fUAb/rJexjhM5DxucpfO9YQWnkVGnYRmha9j8PLhNqTXP/5IG9F+ospg9+fGCI
	/HafLoyyNwTOfmKKNsLWP/1kYiS+OZrtGhbHrpjq49OMRzFdoSWDzMPAMA6N6ZtM
	B+Z29D8mgCT14nGUL+46rn/nYLn+g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hrgp9hju9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 00:31:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFOOTpMcjeT2gzSCIK1HuZ362Jk+TyQJBruzCZPxnZV6IPIgdWxWfqt9DOf8SVA+xIVHlMfgU/O5xxt8aGBcLEkmHGLkuWdoNFBxoXZDInwsEraD9lEf+EYigJkhmJ0Em3wbED05wmzf3/WYWWLeuy/fwEcpvQRQs74qdQSoY0Xpjp9qo9JDyKcVGvSDAe40/Zjz9p+RgFSDfTr2bGg8OTmrRBCFxwAuQ4P5lSXzlCIWQ9baa/lUoUyDieKr5Rac3Ei0kOKlaISKgp1cRGkf8KfUOreDqQw0234fFXjdhqw++CI0AYKhawSp1Xmv2OlwbuCpwgFkJAKFpidEyKVYOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiIViyYr1dRUb53sr2ZIVWMTk/PY+2iqh9h42MKpP/I=;
 b=deRzwJkwCn/tF+I+7uJmoZ/02ffh8dsdv+ag51iWjnvrTQ1eVSJ8TPWk2M7AgXX64qfcMdOYx/pprE50EYVX/I2EfFg6066BUwx8w95TOZeSnYYsncmedMEN/7Vnqm7a1+IiQJw1LamkuZ6mz5RqZXYfthEaJOVKEFaX/fb+rtP/LwuRLI8Kp7nW4tk21jBHv3KCCfVw0S0Tolri509lTmk1NFJQP4BkjjgOVSxGQrUFclEuWkdd7HI3dEbodpBOxEF9JAikEEvjqQ7skHAutkFgmskr5sDi2XPR3Fc3D1YRvsovDWgbcWat7F8a75gLIB6Cv7WEO6elcQWKWZnJcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiIViyYr1dRUb53sr2ZIVWMTk/PY+2iqh9h42MKpP/I=;
 b=NOoWbLo9Cu+o6m8Bs6QukfyNjHK1Wm4wGktqU8yHtGLYRUt21nmS28C6OXO5unl2LG90yC0Aay+UucnzRrZ0hDFpRaan8IEDJ6Kbq7KfJ6rVlPz4SaDY+kU89FsSBXbf/N+VbSQV8nM5QHqOB2h83V4tB2naM6WD8m7+0nfOiWvdM+Rkm205ebuyIqUp+d866j8u4C14A4ZlINSQcVVUbYrMhhdZLHoOb1DKs1/QJYuT452wUO2lkth3bJmHsRQjIQJEpNv9QF+qAxufaqzXPszynE4y6I6fotH5I8qVsq0t0iIEYozqO3jQLbK3oJiqsgZF5V2sijRAUaHXLiB+eQ==
Received: from PH0PR07CA0078.namprd07.prod.outlook.com (2603:10b6:510:f::23)
 by CY5PR10MB6141.namprd10.prod.outlook.com (2603:10b6:930:37::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 06:31:31 +0000
Received: from PH5PEPF0000002E.namprd04.prod.outlook.com
 (2603:10b6:510:f:cafe::82) by PH0PR07CA0078.outlook.office365.com
 (2603:10b6:510:f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 06:31:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 PH5PEPF0000002E.mail.protection.outlook.com (10.167.243.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 06:31:30 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 00:31:08 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 00:31:08 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 00:31:08 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A56V7BH3738077;
	Thu, 5 Nov 2026 00:31:07 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 2613E2C92; Thu,  5 Nov 2026 00:31:07 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
        <prudhvi@ti.com>, <r-sharma3@ti.com>, <devarsht@ti.com>
Subject: Re: [master/wrynose][PATCH v2] arago-image: remove splash for am62lx and am62px
Date: Thu, 5 Nov 2026 00:31:07 -0600
Message-ID: <20261105063107.1581443-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261105062738.2899847-1-y-hegde@ti.com>
References: <20261105062738.2899847-1-y-hegde@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH5PEPF0000002E:EE_|CY5PR10MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: e4fbcae9-aba3-4bed-7e34-08df3b066db6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|10067099003|261009223027099003|261021121427099003|56012099006|261022105027099003|261028144727099003|261026140227099003|261102123227099003|261022075727099003|261022115727099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: wkuIOZLS4/t6VIWfQsLkdAjXcqdj0DK1fgtS/U4MJKwKmtZnnNDgZS/3BJdMiR+nmekexTBKgv3Bu/kXsFZJUjGRf+k4ig/pSOfA8xi6UzS3yLX8CNhH/IGwag8i6PMTXP0QqKtGlHXYPMuBevdqrMIjZfYdxTHuzqGDiN7vJP5Zlljzo4EcRPm5fvwDsvCF1q0i6B7JA+5h2v6iWBDBYysWW1CGbrsBPWy7JUTa77TvPnymx0+33bL+zL6oHmBRaRDdGZpFEJaMlGLqLmg2R7/LBKpZeEslip2XHI+aUEaNepecEUEqZfsqObzp6/sqazDEWtvaSqiSN6aup3KxlNVgy0ot67NZU8cJUUANDCUq/wR240foOPtrfV4jcMHrqOJXi7dHWECgvxL+LoXMr3h4pU1vl1rAQG1QeGDbgiTghjKO9jPzmr7Dm++x+MDpc1iuMvGcgiyOuwY/5gYO1xx3XrUsYPEPGh2NSXdZxuzgr5yCmWGr7mhK1YFH9s1omMDwRrnZ1KtFOzH/WMg4bsDE2KkonjlchYm8fVc6xWN1mlCHkXSZrCstozseyTaDnWfzZrJsg2AxeybMsvcUGitcwQeYO92QGaJfylk9TTAiqTfVMc/D7zeTUqzsKtTCgJ3bpxZX6HT0dUJtk+1PXg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(10067099003)(261009223027099003)(261021121427099003)(56012099006)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(261022075727099003)(261022115727099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: r2iPYzzSYKkQNPYe8yzbLTUqMZM3Vj6DUBm+vYe2fnNXF19625bkQJFeDxNvXw5msKgXmEt7aw7S8EXetkEkx5Z1e5whvJZJiXyIL4J2ejC9i2vJPDkR6U09lmOHAKSwFJvF+RS8zfqxqmRa+LlHcFtdRlVDwQYGH0lgLAQwdOtV8b3GMOfHGzqmyeVtW/9ey5mfk/2KWxWJ+KJYjyWEOE9jClWQBOIiP4iBlweOMs/MKlI/DMQPhzT9qD2Ni22kpDpkN4MFsmaOuge72ejutMLXugYfQHQY/YioLaYV2zfh6bS7KGWHvHHAptBOp8BoFikenWgJ26G3rrQRsLZh4tJfvyqLeq4YKgoNJu8yL1UijdZAEnbAktKcEnTv/YiJPZGpTn4wVCJxCq0Ce5Y4gDh5ChEjZwykUdUESIhkTED0d6fEWUZ1Uw3jr8HK84nX
X-Exchange-RoutingPolicyChecked: SKy3nrL+5Eid0gjfGbRhSf9ry9c45pxTqFKTriooPuq4l/vrrH+Smfezxj6txsZWQqGOEaL2MD9sc6ZUOuaK1qP6mwDaCQSp2pUca/48mV5cP0O4fT1WLtfYYd4bZJjg2vw6xyAzenRuPowGyAb0hExujh/yrkbyGLmTy4KAM3ITmbJyCKAmPG9VyQ3c7A6hzCnvxyWqMOHx2vDX/Q8N0goKpXtZNC11rqv2V+oK4I6dxXbcDGWLMvUh5GmLU5YhLTvjDEh1AkOD/fCC4JYM8kMsi6q1BMFxtmQjCA4WxSvqxpPf7Fc80kWaquIMNW129etoUVyWbeWu7ZbvTPlD7A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 06:31:30.5381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4fbcae9-aba3-4bed-7e34-08df3b066db6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: PH5PEPF0000002E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6141
X-Proofpoint-ORIG-GUID: Xo_z6P8I8DICphfXNPgFCNu4ge24FtHN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyNSBTYWx0ZWRfX0YCdemNnYYck
 LMUDMnxAbsp50/FItVwQqYJOrSKEuM9prbATkL4zT9xuJZ8r3Jo6M+tm/ncwLU9Jo1esx4iJUz5
 xXNgLfpnEAj4hZPnI/l0+rKoVbG6UXk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyNSBTYWx0ZWRfXzegADwRJuO+T
 EFM83ew/ctmD9LFdjUyzvLoH7vNtfOpmfXuAXFeaTaP60JHJOvmFOGT++NIC3AcM7E6GywM1sK/
 g42LlfAtGRVPL6inAEhEAF+GFpjoyACRgrQieWLtB6CVMD0Jdl/ON80WegrgLc2hZZ+1DFmw7yo
 gFquRlK/vqwVZgzovbGyhKjBB0XwG9gZgjyJg7rM5GMMHwQLB5dyIIPwS4dKmn4kNHHpzdr17m5
 z0WT0q2u12DemFNO2HzKYVM7OjQytxd870Tv9g98OvIaIhzHz2FTTE34S/CnCx5xz26/3Ofg42s
 uq9/r1RxoNB05aTqYQHWn92e4JEz+XabdDTYNT9/Gr5lVW7J6qROkyl2FoawfF5fVcxbnaR65Ol
 ErcWOIOGso/0jpQMMAjmY9W4xhK62e/L6tcix6oq0dFfppXQSBjSTllysAOfzMaaWO1kgQKXxAf
 xJjgPGT0Od5TKwHL5uA==
X-Authority-Analysis: v=2.4 cv=D+jSufRj c=1 sm=1 tr=0 ts=6aec22c7 cx=c_pps
 a=0Qqeoa/8LQ4SOC89qm8Uhg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=qU-z2VHmC2IYIMb5wSoA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: Xo_z6P8I8DICphfXNPgFCNu4ge24FtHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050025
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arago@lists.yoctoproject.org>; Thu, 05 Nov 2026 06:31:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17760
Content-Type: text/plain; charset="utf-8"

meta-arago / na / 20261105062738.2899847-1-y-hegde

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master/wrynose][PATCH v2] arago-image: remove splash for am62lx and am62px
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH v2] arago-image: remove splash for am62lx and am62px
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Thu, 5 Nov 2026 11:57:38 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5b9769870d7458e8ca6fc0a576ac50553785a71a

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
- Patch Series: [master/wrynose][PATCH v2] arago-image: remove splash for am62lx and am62px
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Thu, 5 Nov 2026 11:57:38 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5b9769870d7458e8ca6fc0a576ac50553785a71a

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



