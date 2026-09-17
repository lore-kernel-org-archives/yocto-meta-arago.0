Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B195AC88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 09:26:36 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35249.1789637189694623424
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 02:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=KK4NHCWr;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=hJmZWUSD;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: y-hegde@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H61XdM1002964;
	Thu, 17 Sep 2026 04:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=cZ0CaSBvH9xdJEy
	MhwysZcajcHMO/hMRYu2MRTFElto=; b=KK4NHCWry8YB1G9aKL8xutf0Z3i2ZeC
	Ldm2ItokOjpsYMwrVjM9406BPHldLkADk5BgsqK/fdP2CFdinIxSGdcZbHF76P3E
	CQsX9tmL9OI20eNhTnJlpgG75N/r1VqX5EUI5u1FNw7CvWFZUGYgp4JdO/QkWxIz
	mc5rLsaZTDGasxtNQxjKkGOWqickFVSW83SJt+wlpkD+oMrIgv+maGcz837i4a0s
	LkAXJIK5pzicjeLYZJQHv5BLLZqwFCYj4ysi2NsbBjp1DcCCeKYYhZMQxpRZDloe
	URSqtoB8MfUTxBUrdYmPqSpnNYnFmt3NjIPJcNNNDN/z9B7AxS8p+0g==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011041.outbound.protection.outlook.com [40.93.194.41])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gr4wnk5xe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 04:26:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gT9ZJFcSmC10MBPtKtbCksxGOVo5GiDLAcQypAm1fDAJNYTlUhbJNspvwxRuk+yM/eozVag9Bv8PMl84wY4BCoP5951w/0gSuEJUXBvkVCeKNz0BZvJe1W7ak1osQi/IW6rYyCJCCxQG1m+FrHT4uzrc1DDv7crdlu0rI/UOj5yYDaoyA3hvauRdzKCDs1UjprhTglrdiJzhgXdFAW3Gz9/Xy/iJ1JwdseTDPErN/7zkM3M00i6yDDuRBp2HPV2X2R4ngU5wqHSlGzKlqdwdc1NQ5Krs5tG3q08k30ZFoffAu1LeGGRJNmq+C8o00TI/zEsbbZxPOpAXxVq0c+jHbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZ0CaSBvH9xdJEyMhwysZcajcHMO/hMRYu2MRTFElto=;
 b=aDKQ5l17KhuedqTo40dII2WM4hDjUJH/4NPesEAc/bpyEM+dU/8JcU0SJO1A9WOQapaZJbsP9uCt244RCECQdPFG4Fz+CNST8bUi7yAl7t4eeipksd+4pTizl9P12ZIODQIErPEabcHegiWqVQ57KMI3O1v46Bx0K7aEvRbXKabd2oy5/aqVK4p0T1+IKoYXKi990XApLgc2c8WD2rWdSN5pQ/7nLw7zKhJ4MQ6+TeIQJudGzNhd3M+hKpYHEJSHGBTnQ4pTnDY+5J9Q6blzoCPFnA2w2nHTG34qyzKqox2xw67JXcJRG1tp9xsCzeXWCfgZUCivcSET7C27H8d2mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZ0CaSBvH9xdJEyMhwysZcajcHMO/hMRYu2MRTFElto=;
 b=hJmZWUSDD9365lixnQvEJuzIx1rhcQM2ZECd3oYwiMwm829QxZ+uxETIpduCvJcrv/en5HQbiA5d7+/OBRae5z/06GRc48vbYdKENK+fyjv5eTMM1trW9BHc4GTZuCmz1/gM+My9mevGRfQb55AnVhGGLYnIzpxJfAqvtkQt4kM=
Received: from SJ0PR13CA0161.namprd13.prod.outlook.com (2603:10b6:a03:2c7::16)
 by DM4PR10MB6134.namprd10.prod.outlook.com (2603:10b6:8:b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Thu, 17 Sep
 2026 09:26:23 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::1e) by SJ0PR13CA0161.outlook.office365.com
 (2603:10b6:a03:2c7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8 via Frontend Transport; Thu, 17
 Sep 2026 09:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 09:26:19 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 04:26:02 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 04:26:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 17 Sep 2026 04:26:01 -0500
Received: from localhost (uda1250336.dhcp.ti.com [10.24.51.123])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68H9Q1m12740890;
	Thu, 17 Sep 2026 04:26:01 -0500
Date: Thu, 17 Sep 2026 14:56:00 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: Paresh Bhagat <p-bhagat@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>, <v-singh1@ti.com>, <c-shilwant@ti.com>, <afd@ti.com>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <s-kapoor@ti.com>,
        <s-sinha@ti.com>, <sen@ti.com>, <devarsht@ti.com>
Subject: Re: [master/wrynose][PATCH v2 2/4] recipes-multimedia: Add PipeWire
 bbappend, service and config files
Message-ID: <20260917092600.fmjv6p2p6s6myl5b@uda1250336>
References: <20260916160547.1287287-1-p-bhagat@ti.com>
 <20260916160547.1287287-3-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260916160547.1287287-3-p-bhagat@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|DM4PR10MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: db19ff1c-1a31-4d86-f30f-08df149dbb7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|18002099003|22082099003|6133799003|3023799007|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	yadSHbnBeTPxwWuvpZ1Wm2FGUNlaZgutNk1XpDgn9mESGHP9oHhxj9hgm+UxP5tHVcAzLBWg+F2hBxIcrRZTlAWJ869/yTC9SEnNT9oKiAb/zsR/ymwDFYZ86BM3nIIFo05AucLbcfCTgfrW98/0diQvf2GNaX8wcL6Ur+XvDBewaIi9ZHkpnvcHJz1oQuMRp5UiWA7PiO8PrkH/AduGn0nm1BbzT8FAuEAvxSiRXyFVxFraKCWcEcWT7XPU4Co5PEl3g9l7mFPU2k1enLmw9Wh/hh2bh3AvIqY3+NNJcKOWUR1qoPLMZkkdZyH81MisrdOu+E2CDV6VKjcZX4mtnEdOKos0SjsISdoanZIJ86bGqtr4j5sL1mqJ9R+1Pudypns4YRkrefridVm6SUbrZCprvegDd3+MnTK/Y2ECEtdbwJYCQfkQyH8L2dXu5vWQdV1ToJDvLGk8GQPsB7rJB0g7gB48SeVKrJvB+8/c0Pfx8UtjDz3mNuq8i9ZY8Vs5CUwf4Ie8PS8KT4J4fQfpE7VI/csbM4ratxAg6xIFkgAxiBixAP1QVIkYAIwCXkUiKIruPdJ2k0UxxaiFragiFHEppMmV/vEslvnISBM8pxAWIm4UjVZLKSNt6bL+uu6CogFQSD0y9euwkp+H/xD8GQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(18002099003)(22082099003)(6133799003)(3023799007)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	h0sng0YyIciVswlNbvwWzXK1qSsLc5DuP1gDZBrLQdBBwCgcIaoD7ERzZIox1k7lA+MVkgTuT4IOL7c/+Z6KiKYZJOSefOb+/ROuE/+IuG7u1a0hvQR4WR5sGVXD40iMmOoK92FzP93r6wbBIkltMRA8QSczNvyHjyCNHVx6TvYoMo4MwXGvud15JMQzGW7kv50Wxo97+10a7Y7e7rm83a6/NShMVEbgHnFAec5SxeyD56Qn0Iy02UXARUP3RBq2r3g/kTsF4Zla6vtBXqYxAFM1KVcbI0w59AbNb6wrJLLGTb9SJNl6l0aqNcLXDU47fDn6npkWDtKDF5Gl+D+2EQD57jSEapTlnACbsbwTOLDu+Vpk8r80QjJl6IuOoqYVWiUemB1PmaRIOp5jWe07afh2K31E8p4WElaWh8Qijdt2eHnWjX/hMsee2H1b0zeH
X-Exchange-RoutingPolicyChecked: 
	12irH0IBFAMVKoB6cui+0t4zpuOGZrg7Yf00gDQgeFJO5SB1FfzUBCcv7CH8wsWHRQTpUy1/mc96tIMX/AnXiAusjJHSBnQrphd/IC044RBRTHABWS18xW2gJtCQw3JiiKw9doXbKNlMe00hziXpfKw54PAcs8Ju0Q6Tj7K05u3zURWIfiaZVPAe4Mq99V3avMRuKCh0bmP5lymsfNH7k0RGesfo6G0J/95HGEwOJYWTXMOLIoopgkjuXKni04pbx29WEnTXX3vy3iq1cG9N554YXDlAohZigUGBoBFz4zWuJJXRo+77IuGWYx82sTfhf8fR+fnhdQh+WvRqN7qh4w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 09:26:19.6764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db19ff1c-1a31-4d86-f30f-08df149dbb7f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6134
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyOSBTYWx0ZWRfXyn3/pTlr9szD
 4Shg2chtwf+QKOzUwMo+JuFBCqHKCGHfydULN8ar5935SZRepR7EqGl6jYC2oWeo3z5MUAV15nE
 whSdYRCKrPZgig8vXfLRlmqyw7/erS4=
X-Proofpoint-GUID: fEs4c4GKr9n58p2m77WswQTeFaRqlN08
X-Authority-Analysis: v=2.4 cv=OPOyTiaB c=1 sm=1 tr=0 ts=6aabb242 cx=c_pps
 a=Ie6vhHcvS3zZlrI9i1bNAw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=e5mUnYsNAAAA:8
 a=1XWaLZrsAAAA:8 a=sozttTNsAAAA:8 a=4YxNGjf1-XRZkW2kwpMA:9 a=CjuIK1q_8ugA:10
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: fEs4c4GKr9n58p2m77WswQTeFaRqlN08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyOSBTYWx0ZWRfXydVyJ9AVoZud
 +Bf9UEuir1dTPbtfiiZCcrwDF44vo5OMZc51tgI2yVKFXg5YWhGZmWRBykOdXU6bRPucBT3R6Ue
 tIt7L68/6mikNo+rl5H2chxfksyoBrISXhAlF0w4C1/5Qo2p6BWv1+FceVREfjvo3XcNSFgiCHR
 N7yZBalOtJo80IV6ovXiu2KWmcklNBdpMxOfAjhLPyZJtiiuo3RQXMvi3n24taguc840h45h3/H
 lKAc6RcHg55q7D1t1LnlgICvl1gl3TrLOUCcYQ6PG/kVF2Bqyn/X3MwqtQ+dB5cL1AztLi4uIJn
 h/AzppwLDzxd2XHuBap+cWhYwT95mNiKcg5++R0Ntlar1/kgFhFnnOtkDlomWZ3pknNQ4eXDFQt
 YMXRf7KA5G+5voZO9CD665FvV1r0zSHooQnJvfTQjrfgy2jep6hg4rV6O2trSBsTzkA6kdagZI+
 9CuTh8sT3YEPblZK+xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170129
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 17 Sep 2026 09:26:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17683

Hi Paresh, 

On 21:35-20260916, Paresh Bhagat wrote:
> Extend the PipeWire recipe to add platform-specific ALSA configuration
> and service file. Service file added to start PipeWire as a system
> service with proper socket dependency.
> 
> Add sink and source configuration for 8-channel audio playback and
> capture on the AM62D2EVM as the default configuration is 2-channel.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../pipewire/pipewire-arago.inc               | 28 +++++++++++++++++++
>  .../am62dxx-evm/90-pipewire-sink.conf         | 17 +++++++++++
>  .../am62dxx-evm/91-pipewire-source.conf       | 17 +++++++++++
>  .../pipewire/pipewire/pipewire.service        | 26 +++++++++++++++++
>  .../pipewire/pipewire_%.bbappend              |  4 +++
>  5 files changed, 92 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
>  create mode 100644 meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
> new file mode 100644
> index 00000000..6545c364
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire-arago.inc
> @@ -0,0 +1,28 @@
> +PR:append = ".arago1"
> +
> +FILESEXTRAPATHS:prepend := "${THISDIR}/pipewire:"
> +SRC_URI:append = " file://pipewire.service"
> +
> +# AM62D-specific config files
> +SRC_URI:append:am62dxx-evm = " \
> +    file://90-pipewire-sink.conf \
> +    file://91-pipewire-source.conf \
> +"
> +
> +do_install:append() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +        install -d ${D}${systemd_system_unitdir}
> +        install -m 0644 ${UNPACKDIR}/pipewire.service ${D}${systemd_system_unitdir}/
> +    fi
> +}
> +
> +do_install:append:am62dxx-evm() {
> +    install -d ${D}${sysconfdir}/pipewire/pipewire.conf.d
> +    install -m 0644 ${UNPACKDIR}/90-pipewire-sink.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +    install -m 0644 ${UNPACKDIR}/91-pipewire-source.conf ${D}${sysconfdir}/pipewire/pipewire.conf.d/
> +}
> +
> +FILES:${PN} += " ${sysconfdir}"

Adding the whole ${sysconfdir} folder is not recommended, list
individual files instead. Also limit this for only am62dxx-evm. 

> +
> +PACKAGECONFIG:append = " pipewire-jack"
> +PACKAGECONFIG:remove = "jack"
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> new file mode 100644
> index 00000000..f22ed291
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/90-pipewire-sink.conf
> @@ -0,0 +1,17 @@
> +# PipeWire source configuration for AM62D.

Nit: Typo source -> sink

> +
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name           = api.alsa.pcm.sink
> +            node.name              = "alsa_audio_sink"
> +            node.description       = "Audio Output"
> +            media.class            = "Audio/Sink"
> +            api.alsa.path          = "hw:AM62D2EVM,0"
> +            audio.rate             = 48000
> +            audio.channels         = 8
> +            audio.position         = [ FL FR FC LFE RL RR SL SR ]
> +        }
> +    }
> +]
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> new file mode 100644
> index 00000000..ac7635de
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/am62dxx-evm/91-pipewire-source.conf
> @@ -0,0 +1,17 @@
> +# PipeWire source configuration for AM62D.
> +
> +context.objects = [
> +    {
> +        factory = adapter
> +        args = {
> +            factory.name           = api.alsa.pcm.source
> +            node.name              = "alsa_audio_source"
> +            node.description       = "Audio Input"
> +            media.class            = "Audio/Source"
> +            api.alsa.path          = "hw:AM62D2EVM,0"
> +            audio.rate             = 48000
> +            audio.channels         = 8
> +            audio.position         = [ FL FR FC LFE RL RR SL SR ]
> +        }
> +    }
> +]
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
> new file mode 100644
> index 00000000..c26bf93f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire/pipewire.service
> @@ -0,0 +1,26 @@
> +[Unit]
> +Description=PipeWire Multimedia Service
> +# Ensure kernel modules are loaded and udev has finished device processing
> +After=systemd-modules-load.service systemd-udev-settle.service

systemd-udev-settle.service is not recommended [0]. Use appropriate `.device` dependency.

> +
> +Requires=pipewire.socket
> +
> +[Service]
> +LockPersonality=yes
> +MemoryDenyWriteExecute=yes
> +NoNewPrivileges=yes
> +SystemCallArchitectures=native
> +SystemCallFilter=@system-service
> +Type=simple
> +AmbientCapabilities=CAP_SYS_NICE
> +ExecStart=/usr/bin/pipewire
> +Restart=on-failure
> +RestartSec=2
> +RuntimeDirectory=pipewire
> +RuntimeDirectoryPreserve=yes
> +User=pipewire
> +Environment=PIPEWIRE_RUNTIME_DIR=%t/pipewire
> +
> +[Install]
> +Also=pipewire.socket pipewire-manager.socket
> +WantedBy=default.target
> \ No newline at end of file
> diff --git a/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
> new file mode 100644
> index 00000000..dc32422b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/pipewire/pipewire_%.bbappend
> @@ -0,0 +1,4 @@
> +PIPEWIRE_ARAGO = ""
> +PIPEWIRE_ARAGO:arago = "pipewire-arago.inc"
> +
> +require ${PIPEWIRE_ARAGO}

[0]: https://www.freedesktop.org/software/systemd/man/latest/systemd-udev-settle.service.html?__goaway_challenge=meta-refresh&__goaway_id=2f5c485c56371e4d518938d3bebe4b33&__goaway_referer=https%3A%2F%2Fwww.google.com%2F 

-- Yogesh 

