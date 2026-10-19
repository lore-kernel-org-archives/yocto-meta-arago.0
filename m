Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62014CCF2E7
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 13:56:05 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35250.1792418164622088658
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Oct 2026 06:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=SWb8gLTY;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=UfK8Kt58;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69JBUr5i3096130;
	Mon, 19 Oct 2026 08:56:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=k1XEwL9Gk8Q+PG1IxzNcnEHYkkxsCwWUyBwfNCv9h
	5A=; b=SWb8gLTYvx8LU+8LJ8WrV2nraBjObPKD9mEZmmX2keVUrS2wmA1DKx3zR
	cOFWLVb4GlpClYp7lk6k6aoKtA9bCSAOi9ntC/25rSybiHSlOfrjYpByyVkXAZOQ
	EpxMJfhjh/94cLx/xS87NOOC8d08lmpHDOqvzhnDy61kiUpet3t341r1JnaWV2hn
	a7MSst1Dpsqkf9q4GAbJFdqVNinrTEqrNZByKABgvIbsOovs6zw/vmxm51C1IVSL
	O8mOhyTD6tP2rsQnJHQ5dXVvx5qTwVFEsO+mJZEBORX7pwCyi8S5+dNDjY9AwyDt
	iL5USyEAn+nSG7hGfV40Y8Qqr6DoA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013004.outbound.protection.outlook.com [40.93.201.4])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hdjda8wfk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 08:56:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDbP6N/gGdGxC1nf1l+OPYfj0SIrDS4LZ43EkWqanyndmGSn1cG7uA/M4aZu7aKSsTJiTTDhQW/8J2qSWcTG0wVIF4Is04HLYNRrhOsaCoCAKPNbeW9IMur4qRofACt4XjmXiYWRxg2lzAzkVXE487oUGYn78XE4ch7SyXk3FZflwvQ7tEersZHtOmxPneBuf2i2ctrDdKXF47vxEHOF+YyXLLhV2AASaCPDwX7nfWSc0K6aUm2xHGovaLlYeAlqWBgtl3qAhK4pbj1PWrS/QQ2ERYMM6hxz9QPGNwI5QmGiYqxgHbtrqghNmVQFD0L3Gjs0A6BuwDF9zmdQdWAZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1XEwL9Gk8Q+PG1IxzNcnEHYkkxsCwWUyBwfNCv9h5A=;
 b=EJFSUb9h8WFSphQUkjG7OWHOl10aG61SeHzAQpDZlpVkw+ocw//0gm9JiOVKJbk1QhXzIsj4+vwXJM4E0JJtUPue3ZcBETDTVw0G+oRIwhD/OfTlP+1//QeKwjbWVb4g+g9nmjMuv+a6yYDyo55qMRHjyqdDebBJzyFfLCYtco8j4damz6A7XoShLi2jhjxyje/BX+p6k5ppwM+ui4sNGJnU7Ee775TuBX1OiifJ9RsVGJBnt+pRuJlEHF3kzIijMBIj2YzXbWvpoei7C2DBhA0Za7Qk039vrOchbFXugaxKn6NimijHguFGVqIPT2YIcWgrEEzVCkXMXm9hHzpoQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1XEwL9Gk8Q+PG1IxzNcnEHYkkxsCwWUyBwfNCv9h5A=;
 b=UfK8Kt584joeM6RAMFrPJ0cXX7p5UxHlDCd0NnwQ6GiK1M0lwqJlhX7kLygpElVX7N2IAhy4T1PK/3YpXmsitUL5St79dAXazHCo89tl6NO2rPzRGctPDBctNOxjnRF2Xh4TI9+MXg++oyi8xYbvCIG5kgihz7mwi4/HM2bWb/orIR6mAQn1EeIDYEqgMaVVtv49YxOf563Pn6xjG6b6kiG54w83ttaAt0nmJIJsJh5n648jjebpxutdET6eY97AUlfsVRKHZMYWtFuVIaO9GTKCIrty+r7SFEPOWpefuLL2/3hicRIY9JUOY8V5I0OFWWlHcazA1JeXiIu5mP8rzQ==
Received: from BN0PR04CA0208.namprd04.prod.outlook.com (2603:10b6:408:e9::33)
 by SA1PR10MB5866.namprd10.prod.outlook.com (2603:10b6:806:22b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Mon, 19 Oct
 2026 13:55:57 +0000
Received: from BN2PEPF0000A802.namprd02.prod.outlook.com
 (2603:10b6:408:e9:cafe::ad) by BN0PR04CA0208.outlook.office365.com
 (2603:10b6:408:e9::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 13:55:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF0000A802.mail.protection.outlook.com (10.167.245.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 13:55:56 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 08:55:41 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 19 Oct
 2026 08:55:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 19 Oct 2026 08:55:41 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69JDtftB3859552;
	Mon, 19 Oct 2026 08:55:41 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id BFF589A9C4; Mon, 19 Oct 2026 08:55:40 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>,
        <praneeth@ti.com>, <v-singh1@ti.com>, <j-sahu@ti.com>,
        <y-hegde@ti.com>
Subject: Re: [master/wrynose][PATCH] pipewire: Set default audio targets and use S16LE format
Date: Mon, 19 Oct 2026 08:55:40 -0500
Message-ID: <20261019135540.2601128-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261019134921.3848478-1-p-bhagat@ti.com>
References: <20261019134921.3848478-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A802:EE_|SA1PR10MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad76c46-1676-4018-ea27-08df2de8b2fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|18002099003|22082099003|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	FvRdkXa3TUmqDjTqMHSh3NKHlheO8GbTL+Zp7td4F3Eg6SOEmLOUft6B19eeZHM4HuEKTxbp5Z7LL7py9NvKJRzVtNbzGsuxqb3TQ1bR3cG3hapV9mxukcvSN6k6Za02iE120NmBzNTl5/0XdMANMMm9nDv3rii2Ku/uKuPu+d1NSKIhVN9/dDJAXIYnoUyBD32L6ABrfbOBHG3GoPISqltrYOYLYkyUhG+L9szbbghsoNolcgqRkHdrjwVpGlQVk4bLXqdneJ+BqW9Fl5eDfpovGfzu4UEC62lXChhkd6tTiDOJ6KFHwzf1I69ziNRByTV5tv6FhJAximo30xc8Ajbe+tiwYnKB2asC7fHekkGEY51oQ4BpZC0QGN+qBkUm7N0k4zt9FMEAYmwudxwklCZID0Yf6zhqlAEAqjVSGDQ5zxK0GqrVWS7NxqDKv8rHjIsNjdSZgo3Uu0DFtYU1VtEpr2+DU502OzcKuWZhzO69Psrm0avKpC3JVAUredv5M2W53d6lRiosLUdLdC67QUqVdnPl5iqu67KUX/hpqbnFJXKxE6SI4J4k7/iVG/x2BjQIHGrfRxQ/sbnb2/ozQbbBrTSpAVDsu2g0KiICmxpF7+z6R6RYqGFn310NR+scxk3QbkMsAaHpaV/yjJhHen6E4iMvDcj20C0Bitk0snHW2HdheElsdK9bEiMwe3dCIr5UjM4kejbKzrWsGkpF1A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(18002099003)(22082099003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	xwYiM84T6KDUSHwfE06yLyM2z+zoYh2wJXbPyPMuPyhzhW6lAPwUJvipcWAM1RYrOxSN+Uj1uIq1jlqiLWHCPniZGXAcwTp5aQCWCfKIkvnFBijZyCKmk/GpuioHAfl0G7xZrtcnHreQmDz16U+nnFVVy+P47a5qnkL0h0B5raXbFPxEGfe9QlNdNG690isy5MxIrG3xqIKsR/GMo6XV2jkckzbSrywjfxPmeiNgbiFtyRKE6nuJ+Vuhrlh+yuTxozjJ6md+hdPNZ+mKLP9C5tvet3cNyUVX/b0HFnSz0WWafF+51GwCMfcBpqvOojGd8+tESuWQlkqC+IkY8sowABdIuWtTlAuIrKA/FbZrN+85T11fBZRuZAPE6SPGpg3UKY3b7dbSUvH0nJzIv3IGJbqL65pr/cYt6Ye433m3YqfMBu8ZhXZ8/2YYPmttdn4V
X-Exchange-RoutingPolicyChecked: 
	M08sfKEmAJbDeY9wvJ/DG8WJJOM2nE3pkKmY8UjhdEzi5ifbOTfdJyGSskgpV66sfzEJZHjgX5Qc9BoEAoALMyT0DXfcC6UXFAGKfzf5Z5B+wESFaX4PX5H6HauXhsHtidAJ4i/t24rzU/5e5VtOeXYoMjzfIHnLpDP0Wr4CJ3NVlBWPgv6DR/ELhq7tb+7jKw/rhHeCb0OXOGgr2cAxt38pj4+/NrB8DOrDOg0+n/RzEngX1Z9l0ANc7SFtU8Gr5AsXdHPptOP0/o7tRmFKqVYII0+SwYH6zKOX3EPgTS3E6WWlRCyWNHrYiUcRo3Y4ZuzF5osuwetmhybgfAOy5A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 13:55:56.7373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad76c46-1676-4018-ea27-08df2de8b2fe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000A802.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5866
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NSBTYWx0ZWRfX9L/UgcA7rWME
 gitlPD8rx7hDbG5KpF+NcCQ1rvhAgbAjuD24YqO2cG49U7A7t2JKf104z5TxjCglM+iFWPTymd8
 V3RBXSoMjl/4EuI7rka6nKHAeczZS19xjRdJMfUdRR7vxUz1OQXsJ1W9LL0PlUWFe2R87cUl7Yi
 P2joC0WMn+ZDtsk4QqLTYDS8PG+BpHDpLHsPLpLMXKvdt47RSpmVbP8mPhkTNeeXHRUq6eZwcfV
 e3oxQbvDOYr22Cj28WsyUi0pcRvctQSYNLlHEIJzTKIMM3UzdtGEA06FYn+R0I68inaAyQuLZeS
 fuUhemwKM3I6aOqYYxu6XG0lHX+MG5eH4RBnpB7EhgfshJ/LQGMdKiMefjQcipulxiwUs0WRrwR
 lxapETj59uqDWhh/0jwBcdPJfhQ8Y0gyjehCws/7rcDaBH+dBUmJJysVd6dhafxrh0qaDn+ca+7
 Dx5EpFyor1RsM8KTuTA==
X-Proofpoint-GUID: RAePS7834pDL64PGPED-LvF58TZo-4bZ
X-Authority-Analysis: v=2.4 cv=HPNWhYtv c=1 sm=1 tr=0 ts=6ad62172 cx=c_pps
 a=WUa4KgmVXsEXRBJPWwSZ8Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=U_1eR2bSJSja5h42jz8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NSBTYWx0ZWRfXzRX9M1ghphpG
 3IChlWZep0niqBLAfOxurKpSeEziUxoN7mgL7228Ph68Q8MCGPplZxMkWLRG5zSR/FpyUD8kuDv
 NIvOc1uk4D44pnAHm3PNoTE8eOtn+3Q=
X-Proofpoint-ORIG-GUID: RAePS7834pDL64PGPED-LvF58TZo-4bZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190055
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 Oct 2026 13:56:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17745

meta-arago / na / 20261019134921.3848478-1-p-bhagat

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] pipewire: Set default audio targets and use S16LE format
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Mon, 19 Oct 2026 19:19:21 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 15ccc193e9956dfcf78288873fe3286cbe958054

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Commit Subject: onnx: fix do_install SOABI suffix for CMake 4.4+
- Commit SHA: c1fea6ed8db263c98549eadbccf9e24e216e6148

Patches
----------------------------------------
FAIL - [master/wrynose][PATCH] pipewire: Set default audio targets and use S16LE format
    error: meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc: does not exist in index
    error: meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf: does not exist in index
    error: meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf: does not exist in index
    Applying: pipewire: Set default audio targets and use S16LE format
    Patch failed at 0001 pipewire: Set default audio targets and use S16LE format

wrynose
=====================
Summary:
- Patch Series: [master/wrynose][PATCH] pipewire: Set default audio targets and use S16LE format
- Submitter: From: Paresh Bhagat <p-bhagat@ti.com>
- Date: Date: Mon, 19 Oct 2026 19:19:21 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 15ccc193e9956dfcf78288873fe3286cbe958054

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: wrynose
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: weston-init-arago: set WAIT_CARD_DEVICE_COUNT
- Commit SHA: b61dd849b8ea9ba1f875f51249bc2ee42b08c4d5

Patches
----------------------------------------
FAIL - [master/wrynose][PATCH] pipewire: Set default audio targets and use S16LE format
    error: meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire-ti.inc: does not exist in index
    error: meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf: does not exist in index
    error: meta-ti-bsp/dynamic-layers/multimedia-layer/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf: does not exist in index
    Applying: pipewire: Set default audio targets and use S16LE format
    Patch failed at 0001 pipewire: Set default audio targets and use S16LE format




