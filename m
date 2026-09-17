Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C13C982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 09:21:56 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35193.1789636909817348578
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 02:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aUHmHjoJ;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=KCxcAwqN;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68H872sn892033;
	Thu, 17 Sep 2026 04:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=Ov204VAHMHuOvXF
	Nz+YRRXJDqBvxV62VD/e1fyWRycU=; b=aUHmHjoJ1eWd0OX/3dgh4jZmtDZ5HT7
	k7sDEFQGA3qz0FCpOZw8P2DcdyO+4bjt00bjsMKnRpeFjhlvIT2d7g3N2HX2yy91
	m3OU1f49UsMHGwC56+DQTj22F8ShjRPTi6dKfHbgEojp28jVufLBUn2Ai32hPajX
	tBuU/P9nxOebjm2vHrVPyxKYcQREBsS7HzqLBq433GtU4wH8S4IN7NfGHOTbTqu0
	v8oObQBFBOm1hUWLFPdxlBiu04G722XSFI26HaK3AyhGEsGxKWTPGcrQNPnL10Rd
	j0+Uo6dixHUX65DB9byAOMuICie/wqI0LfI1DZpVE4ti0dNAzaFaVBg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011066.outbound.protection.outlook.com [52.101.52.66])
	by m0380145.ppops.net (PPS) with ESMTPS id 4grcds0cud-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 04:21:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1yJ1KNiq4+C4nPm/M3LyD3BCQkKtifWf3yGp2dzoUSeo4ukcSfG5g162hWDh/hpQPHvMdVR/aputkkbq+1YmkRBshT5x1FFWhfWR/r9uw5ZP5LlhGeNEfI6KNzAl7evvEvu31YUHqReDnm/P4h4UeQ6v8AtwZ9jSL0w7eDHiwnTrT1q9fiTvT+jlU5ggSa4dlsjV3Tz46SJ7eA0OigH7AW46XVXM4k9bqLriObwok6OCrWu2n1Zd7ZR1Qfk1HVmdmkHuM/qbmzX9MjesxrIqQaZCicCSGow1ruGsD482g67A2Kc0wp6e2yAsYlaYaXmo5koXNlvDCKtFrRjNdOkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ov204VAHMHuOvXFNz+YRRXJDqBvxV62VD/e1fyWRycU=;
 b=ys1coMUPj+EJxeEuXRUWihUHHkjWujPUKsHfDvK4tvORVbcQ3ltRAcOBH8FARDhQ3V9ICTPI3pLy4JpFB7LOTNagbHNlfnQ7ctYwewR4ZLBvAPC+eLJwqnbqq0+q5PzoMz04SMcX5xqkv82zO+tO5ZrdaTgA23el2MfXBSbZZpFOLbrQpAc+4E9ueaYvYLs5Ww5cMamBCz94vDo9Mjm9kbiISKT6d+6KEUnuN0AN386m/bVydzgLFpU6HEXQYk4wiCfzCxuqHsO518jqhwgB5Qr2qDFevqv3MXeboyeEAKyCOFHTazwEWSfEhu1ldCDRSyq8N6NMvBk296GV1pqLfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ov204VAHMHuOvXFNz+YRRXJDqBvxV62VD/e1fyWRycU=;
 b=KCxcAwqNRT7yLpHSL7OpXIi4kbHi8kF6xxLFSMTNKzTLTX3zCemHBoCDq0V0kHRCTXuuuLbgK5LeHO8LH5rNxC/2y6+ujE68FGv0jPHoavz5RDPQwxO/hL5kspD5IPih1X5QIKjwpYqHgmyI9eqHNNc6OKnyB7+Ikbn3k6YZ1Ew=
Received: from SJ0PR13CA0228.namprd13.prod.outlook.com (2603:10b6:a03:2c1::23)
 by DS4PPF39B96FD28.namprd10.prod.outlook.com (2603:10b6:f:fc00::d16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Thu, 17 Sep
 2026 09:21:37 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::52) by SJ0PR13CA0228.outlook.office365.com
 (2603:10b6:a03:2c1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.7 via Frontend Transport; Thu, 17
 Sep 2026 09:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 09:21:35 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 04:21:01 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 04:21:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 17 Sep 2026 04:21:01 -0500
Received: from localhost (uda1250336.dhcp.ti.com [10.24.51.123])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68H9L0Z12734388;
	Thu, 17 Sep 2026 04:21:00 -0500
Date: Thu, 17 Sep 2026 14:50:59 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>, <afd@ti.com>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <s-kapoor@ti.com>,
        <s-sinha@ti.com>, <sen@ti.com>, <devarsht@ti.com>
Subject: Re: [master/wrynose][PATCH v2 3/4] recipes-multimedia: Add
 wireplumber audio configuration
Message-ID: <20260917092059.uxdzlghs52lwbnpt@uda1250336>
References: <20260916160547.1287287-1-p-bhagat@ti.com>
 <20260916160547.1287287-4-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260916160547.1287287-4-p-bhagat@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|DS4PPF39B96FD28:EE_
X-MS-Office365-Filtering-Correlation-Id: 97675bce-ddc6-46eb-c101-08df149d1250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|6133799003|3023799007|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	xzkcWCoHavDQmwcqlmRUtIf5btE5IW21DMD9mimm7Wu5ifmOWc6sT4mtn/7JgAKS9msPs7f9miMMBhuZjR58D9nikh3+BOwEwIt5co6qC9HSFefgohUTW4i5GRc20rmjMkli3opeAhbyD7pbEU8eAITnvuiADWzfhF0zGFj/AV3e+5UcHorU9DX/mQgyD2PpZhZYhAMJO4tx/3TcLCg/fMoqjcCGsWxnRkr/JDN8IX52th7VYW41owDNEo0pC1EdytWDi6/mUWEkUjakd3b3L7TjZaGUULFAxlx/UIOWBzLdLthM/XjUwqtv5hYMDUMykt8hWgOfglTjOzgxujM01EKtSgrS4Tdz2/IfVnOU5mk+rBHa76CMyxdSrS2uLuPI1JmqDDGNP1bQCzeMRdeNpfmWl0bPKiQPbp1ZnjCWlHKapCpRGVUU3PcPidEaZrEUIUgxwqtXaXmunK8t02qpSWRKB1ajGJncrWoqrL2y8OOr3Xz/qvbFSwr94Kz9tRP+M9D5tKfqVTGyNIE4jLoCOF3LnxKQdxLCMORVLZnNHCDtTRal1HUKSf78sHVit9MkkPjZ+OLcKSYnLB9CYB9DOCtlClSmVzVKaTORm3wOvWODeHpVI2fsB5y+VmlXRpzUxg0tLCEVh+maur8kXBNYrg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FqBRNcazKEKB+n1Xqckdxu76rq/gmlPqBgqIBBMpfhIORjqrQpP3kcrszmoweg09x4b08DBPlcFdWJDj9TUTLDMnjnstooC52Wutf4DI0kv4ityprmnelhBZYyJ6hkAHDiQtFc460eahm3FaYrWUrfHCgfPcDSf9f0tu+6anXRASGkM/J1pAk7vmC/8liSZOplNHpmihpe7CsoS4yR8v5NmSKge+XWMfsPmtr0iC1mQk7jxmaSCC666FcajMqiu5PpTqTBIy4vpzx37OpVtqVwTIzvFRFBwq+dvMYW8TybA7oQxw9UXEw0VimkixkjTiJRBAcmTUYHdq5pbr6OLtARLOJ0ed4/BJeP9CpFUOpMxcx6owDjegEdGmS/Ol6Me32l4onUXmQtuFN5vEbJzbtIewKBbc05pKmwcOWAg+M6cazGHQ5xyH4igkPMeIHLSW
X-Exchange-RoutingPolicyChecked: 
	SdgG+Xllo0Fu5g2Pl3AgNpbuLIZ3C/UXeGEN3X3wt0Ab8gDObWFgYyfmH/T5mOTc2+TxApmzFRWqIY75PyTaSrhPhbsqQf0ZtowFR1mS+FkeEYHGEPTQWqrFm7yHQbFKBBYk9+lFC5zdF4iYpPDJNyt6aItJFobR4NhmTbDntQLXNMIm8uTCNdQk5Wm74LJdOgX+yDyP8Lgmt9vmbdTctIf6jJdb/rmZxZEBDn9T2PP0fwXS10WYfNGXlnu10Pwqu79COHG9NOywJIjWzTfs2yI6Biezi5LKTP1vXn7jWLWlSONh9csfY3F72/bXqbSVgYjaa2VSxd3E8EeZMfC7iw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 09:21:35.8270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97675bce-ddc6-46eb-c101-08df149d1250
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF39B96FD28
X-Authority-Analysis: v=2.4 cv=ZfGIpcVA c=1 sm=1 tr=0 ts=6aabb12a cx=c_pps
 a=IzBZuH+2DL2Wyeknq0uBXA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=e5mUnYsNAAAA:8 a=1XWaLZrsAAAA:8 a=sozttTNsAAAA:8
 a=NJa33is7fccks0xoRA4A:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: YpX1Id_JgQgZZw-T9BvnZQu8YN6XD8oC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyOCBTYWx0ZWRfXzWoESu8DCwVa
 UgLvpIPTS6YUqd5fR9erecDmXZqoVESMAZ+JRY3GLxp1n/8PHx0qmTlPmVOwDulhuEz2DmnBF7Z
 tSEgtP8Rm0xV83ep/qMAZ6vUZ1K17S/+N2l1cDT9t+0YltgGNGQiEiOBQnQGwWKHtv91ljQEjx6
 UfSjqySEI5KqQPCcC2a/Bd+Dxf8Fc6197sMw5SH3X3w7oLhMpqzwdXV58vwZlJ/nWhen7pvJppW
 bv+K372cqMD9EQCtwCrIIXbk1DPhvMTTpw1xElyh20INCKmaUnuOJZIsLsnLYZFA4E/IPI9ClYD
 QcnjAUHOBkw5SEgpXWTQOLxvfZ7dMv4lHUvYRB0c/yVBuujIx0m9KtcNUX73soKK/5wR80QXaQe
 Jk4WHYLTqKEY8hOyZdsofR/hsD2HqsiHHH21keNo4/eMElFxnuTjoR6vDE2c06OiUz/zFquGBsX
 GZK0FtKhQcraceSaFGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyOCBTYWx0ZWRfX2BoDNe0oH84N
 tzgdUh9wbdwAFJaIb/Q6DbCkKgIpzX4NIFL+l2P0kBWddoJHZSHjLdajntFoLBXijROkkRQKV/b
 O/eTyU7ghfd0fxHNLL3BbansBPTq5ho=
X-Proofpoint-GUID: YpX1Id_JgQgZZw-T9BvnZQu8YN6XD8oC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170128
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 17 Sep 2026 09:21:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17682

Hi Paresh, 

On 21:35-20260916, Paresh Bhagat wrote:
> Extend the wireplumber recipe to enable the session manager on all
> plaorms and provide AM62D2 EVM specific audio initialization.
> A set-audio-defaults.sh script is packaged to configure default audio
> sinks and sources at runtime, managed by a dedicated systemd service
> that runs after wireplumber starts.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../wireplumber/wireplumber-arago.inc         | 25 +++++++++++++++
>  .../wireplumber/set-audio-defaults.service    | 21 ++++++++++++
>  .../wireplumber/set-audio-defaults.sh         | 32 +++++++++++++++++++
>  .../wireplumber/wireplumber_%.bbappend        |  4 +++
>  4 files changed, 82 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
>  create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
>  create mode 100755 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
>  create mode 100644 meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
> new file mode 100644
> index 00000000..c90107b4
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber-arago.inc
> @@ -0,0 +1,25 @@
> +PR:append = ".arago1"
> +
> +FILESEXTRAPATHS:prepend:am62dxx-evm := "${THISDIR}/wireplumber:"
> +
> +SRC_URI:append:am62dxx-evm = " \
> +    file://set-audio-defaults.sh \
> +    file://set-audio-defaults.service \
> +"
> +
> +do_install:append:am62dxx-evm() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${UNPACKDIR}/set-audio-defaults.sh ${D}${bindir}/
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +        install -d ${D}${systemd_system_unitdir}
> +        install -m 0644 ${UNPACKDIR}/set-audio-defaults.service ${D}${systemd_system_unitdir}/
> +    fi
> +}
> +
> +SYSTEMD_SERVICE:${PN}:append = " wireplumber.service"
> +SYSTEMD_SERVICE:${PN}:append:am62dxx-evm = " set-audio-defaults.service"
> +
> +FILES:${PN} += " \
> +    ${bindir} \
> +"

Adding the whole ${bindir} folder to the package is not the standard, use ${bindir}/set-audio-defaults.sh and limit it to only am62dxx-evm. 

> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
> new file mode 100644
> index 00000000..191b89f5
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.service
> @@ -0,0 +1,21 @@
> +[Unit]
> +Description=Set PipeWire Default Audio Devices
> +# Wait for pipewire and wireplumber services to be started
> +After=pipewire.service wireplumber.service
> +# Ensure udev has settled so audio devices are available
> +After=systemd-udev-settle.service

Using systemd-udev-settle.service is not recommended [0]. Please use
appropriate `.device` dependency. 

> +Wants=pipewire.service wireplumber.service
> +
> +[Service]
> +Type=oneshot
> +ExecStart=/usr/bin/set-audio-defaults.sh
> +StandardOutput=append:/var/log/set-audio-defaults-output.log
> +StandardError=append:/var/log/set-audio-defaults-error.log
> +RemainAfterExit=yes
> +TimeoutStartSec=90
> +# Restart on failure with delay
> +Restart=on-failure
> +RestartSec=5
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
> new file mode 100755
> index 00000000..49be177e
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber/set-audio-defaults.sh
> @@ -0,0 +1,32 @@
> +#!/bin/sh
> +
> +# Wait for WirePlumber to be ready
> +i=1
> +while [ "$i" -le 30 ]; do
> +    wpctl status >/dev/null 2>&1 && break
> +    sleep 1
> +    i=$((i + 1))
> +done
> +
> +# Additional delay for nodes to appear
> +sleep 2
> +
> +# Find audio sink ID
> +SINK_ID=$(pw-cli info alsa_audio_sink 2>/dev/null | head -n 1 | awk '{print $2}')
> +if [ -n "$SINK_ID" ]; then
> +    wpctl set-default "$SINK_ID"
> +    echo "Set default sink to ID: $SINK_ID (alsa_audio_sink)"
> +else
> +    echo "Could not find alsa_audio_sink"
> +fi
> +
> +# Find audio source ID
> +SOURCE_ID=$(pw-cli info alsa_audio_source 2>/dev/null | head -n 1 | awk '{print $2}')
> +if [ -n "$SOURCE_ID" ]; then
> +    wpctl set-default "$SOURCE_ID"
> +    echo "Set default source to ID: $SOURCE_ID (alsa_audio_source)"
> +else
> +    echo "Could not find alsa_audio_source"
> +fi
> +
> +echo "Done"
> diff --git a/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
> new file mode 100644
> index 00000000..541b2963
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/wireplumber/wireplumber_%.bbappend
> @@ -0,0 +1,4 @@
> +WIREPLUMBER_ARAGO = ""
> +WIREPLUMBER_ARAGO:arago = "wireplumber-arago.inc"
> +
> +require ${WIREPLUMBER_ARAGO}

[0]: https://www.freedesktop.org/software/systemd/man/latest/systemd-udev-settle.service.html?__goaway_challenge=meta-refresh&__goaway_id=2f5c485c56371e4d518938d3bebe4b33&__goaway_referer=https%3A%2F%2Fwww.google.com%2F

-- Yogesh

