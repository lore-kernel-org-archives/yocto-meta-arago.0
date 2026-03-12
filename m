Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD78106ACDA
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 18:37:13 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1741.1773340625221174762
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 11:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=fc2ax7qm;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.20, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMh2jD9zSI2pM47PV5ZE6RHO3chJCyPWHo54ITDotWLIgpL9Xqgr18McdZGW0a5Y83viXRMNQF7kn8VPGbYv/2H1nlu3TBTdgl5xw3mfm64c0s1YOZQmDMbroqz5ubfWP2TKLPzi0QoQKi0LloqjEwpqrL56MGFkJeCO/cPxfmdVRtjgBxnPwpdW1fE2/C+zNJKAi8eAwlUYOz6gHBt16M1Yyt02PNRTLJoCyySRIqr2b1H2IqYqXXV+PvrdDj8W3mHbjetNyenrwWh37GdcCaEZFkfXQo5s0c9Ce1H6nOdat3pb7gcZslb++G6YjhcgksuXm73TGldvqyueyAOFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9xx3FyK4S/drrYBZZkrcvxinbfljguCNwsqEg2d90o=;
 b=keSnsPuR179y/S2BgbHMo1Cs3Gk4O5yVdDOHeWTIM0huTGMIdXBCIk64VdoKmYi7gjJDWcMUt9TNfKjLZ+bMF36c5w/hLr1ra5dp288g9V+p1bAA6wjNGBUQSb+hB9KNcqJgRV3Iv855o3G/8LwEl529rvwqDCbXLwETpRIWoOObCp7YvOXyeJCd/6ZxoRldqRf+72kHV76xnJCghE/0avftT/n49BIFSmfnvFGFsVX6NtYH+2hqM77iJY8KEflSdQdm+dsX91R31KdXY4qNYDkgZgY3+qq2DLl0Ev2tblSFMz2Ypf+XWx9xCQWAYzraJDfhrDD+wc5ngzCofjJu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9xx3FyK4S/drrYBZZkrcvxinbfljguCNwsqEg2d90o=;
 b=fc2ax7qmQXCEdPz+X9cQqXGXZs8m/uPtnyAYI3gOKMSg/u7Mh7+eLfl2jsBPo1auW/hVltlfRFAyj34erJyqoI7FXfm5MOIXzoeGBgF1DG5tyb4rle5LSEWERWwLrrDW+yq+FAJkWmL2er97CDJMGe+5bXnrV6T2J12/Qw6ahaw=
Received: from DS7PR05CA0098.namprd05.prod.outlook.com (2603:10b6:8:56::8) by
 PH7PR10MB6483.namprd10.prod.outlook.com (2603:10b6:510:1ee::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.12; Thu, 12 Mar 2026 18:37:02 +0000
Received: from DM2PEPF00003FC7.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::7f) by DS7PR05CA0098.outlook.office365.com
 (2603:10b6:8:56::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Thu,
 12 Mar 2026 18:37:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DM2PEPF00003FC7.mail.protection.outlook.com (10.167.23.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 18:37:00 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:37:00 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:36:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 13:36:59 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CIaxwv2815797;
	Thu, 12 Mar 2026 13:36:59 -0500
Message-ID: <74ef7585-301c-47f7-acc2-e6f201918adb@ti.com>
Date: Thu, 12 Mar 2026 13:36:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] meta-arago-distro: ffmpeg: Enable
 OpenSSL support for HTTPS protocol
To: <t-lannynd@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
References: <20260312164411.324150-1-t-lannynd@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260312164411.324150-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC7:EE_|PH7PR10MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d861c8-68e6-4fca-c44d-08de80665942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|4022899009|376014|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	TJadiItYsgVnTTafTm7CDDIYB0W3wV+niXkxuUfDzBmO376IHD+mw3B+hi2tCyzXuIJ1uIy3/7hpiVUPyoZahbk4cTu2HASmUpANxlUP3DR23Z5w99nFyDqW+HT4FE39iqRNp2hX7Xyaw9lKbFuniIDJrQm7K5LA34Xdxn2H93HqW12MEHxgEDMh3D9ZT4kzpS6K/FMT9DJfw8Qs/QPrCk51FQrWGMGomt3kjTFJ7nTx/ZaALmKKnD/YZkb8LXjeuNjrcCGWn/n+5i0YMtmcwS1VDGSK5NuDVL/T1JflBh7grP3Qn8+Q54EbnNLLVuaeNvP6bfKjqfgX2Vw0jjKqVyeCxipHGsXPoTszAgnW4ojf9TxCC7vjys5VMcVII+76b/+FviVm0P4YLU7JrElSlWs1a1q88+tGIr64EtspRGUkrRdLdG3Qvfwdx0UTyGtJPGnlb5hJX9xbl+aaGyyym+n3qD5gKJdQS9i5GZ4C99ZV7kaOS8r4aIH3FFPDdEGa25yFW2v3sgKR8UU8LYQBdHDRwKXkNIjaGaTX3jSek7p66u6my419rj7D/WPsIE+QMqhuGBZ+lLNaRsH0wmEYCWtRGnrxpUGvb+5EnlvhsJEsUuw00PocveLFqsUCsr+HHl2bVbHxYjggnZh2414fFTPXVHc2u02gulttmbmpXya3hTC1c5AdNCr+Ksz/RnMLxVpjEN7Z3TDjRADv6gmIeN0RY4Z4kSmdJdpkMCfRsjk=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(4022899009)(376014)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	slux39sJU68ukrvdCYwR4WOdCUQTDcv7wQ0n2ZlxrWsWmTzaknVG7sTlcNvP4o01VIZ0+O6iyACw3i+Bj/Q7m2mz3cj0jaa5RmHuv8i5n+G/NjO79N+GU0B8b08BWA+yJve+/8XGDlWVp0TihMnlOfsVd//5exqzVoJy50Xz90hhwMhKARIl0rr4un064+V5aKx38uTNb7L1To4PSf/dQUBBgc1WZlonWOtsFdJ94bXXhlQkxX/XMCiOE+7a4GUctcNnVfQEnqr+TKGCxUATR6chidbBXMIZetAsRKwx7m59gGCYPC23cxpUpwGgH8+pQg58d5TVhYTwxZRWzVRpUpbgV77FxaacfBrfmYaBO/hMJa1EyW3LToDJJlMcNmaE1Fqwdcvso/98UpL3kMgcyRkkcQ1oMWjhg0+49rS1ypEXvfPuoTvK3JswXcZyFloX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 18:37:00.4759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d861c8-68e6-4fca-c44d-08de80665942
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6483
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 18:37:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17327

On 3/12/26 11:44 AM, Thorsten Lannynd via lists.yoctoproject.org wrote:
> Add bbappend to enable OpenSSL in FFmpeg PACKAGECONFIG, allowing FFmpeg to
> handle HTTPS URLs directly without requiring external tools for secure
> video streaming.
> 
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
> 
>   meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg.inc        | 4 ++++
>   meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend | 4 ++++
>   2 files changed, 8 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg.inc
>   create mode 100644 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg.inc b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg.inc
> new file mode 100644
> index 00000000..5741ed6f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg.inc
> @@ -0,0 +1,4 @@
> +PR:append = ".arago0"
> +
> +# Add OpenSSL support for HTTPS protocol
> +PACKAGECONFIG:append = " openssl"
> \ No newline at end of file

Check your patches for trivial issues like the above before sending.

Also simple PACKAGECONFIG adjustments like this can be done with a
single line inside arago.conf.

Andrew

> diff --git a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
> new file mode 100644
> index 00000000..d1c6e9b3
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
> @@ -0,0 +1,4 @@
> +FFMPEG_ARAGO = ""
> +FFMPEG_ARAGO:arago = "ffmpeg.inc"
> +
> +require ${FFMPEG_ARAGO}
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17325): https://lists.yoctoproject.org/g/meta-arago/message/17325
> Mute This Topic: https://lists.yoctoproject.org/mt/118282384/3619733
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 


