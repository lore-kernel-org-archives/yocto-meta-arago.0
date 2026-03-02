Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93593E9B358
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 10:21:14 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157472.1772446864710950678
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 02:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=oPnmsagB;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.57, mailfrom: c-shilwant@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJXtPPR7wenKxWNfePPlSFVOfG9T4hAMpFdftIiakJq+vJFDIvpBCkoJs7ZKdTIidfT7AGf9j3MfRTamW4uCgSHvGtiJBemxbnywJYh57Bv1RFWbPemFAK+4M5l+9AlVql9vE2WqNgpaezRhP9ZqlmaOaIFRa2qVm1tH+tFqet/YhDTxMxpgWPdZ6aPPvLA2Jo4t5NFPFPX6nnHGF1Y/n8NoEgfCIoQQHxooHl3G2ZmZZ28ZA5JrELYAhF/C0G3ZQuWoQ8PNhkBqO8BWACr7dz67PrcFN8ad+I7pRcZNGlU8CW7Qq79KsSaohrIWCqFGQMr8mC1Hn/bdxVEGRUXY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRGv4tjoPkO4Y9uD/N8Scb4CsJfY8NLZVF+1+U5qC0I=;
 b=YdGLZldLwZWeVhTjYCZrUhMBZKVcpTYt3xldujpIk8Qg++nQyObQwSc7+s9yGrdQLzcw74gAlM3gj5E9Vr0G3SUEHNUuOXqTrOUum01b4pPSDVoeXSJauosoxtmK/CfSSDNF+CLpEJeeqZXILnPQnOlaFyquO/XPCo7SNBi4f4oVJSW70TXglSaqXeN+vLGuwgIsImIIuELwIPCJlu2NDK8nD9vVXQXnpXHTeWZ0R0kJUXpdD+XJeQTziVogpXRZV5Gu3wwyTmb8N62uQUuUqjzuIgxRrG2n5K5cMqihjeobvmieCfWNNPA7kKQJP1c0rXOeWNLjv8UivOOhxOsw5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRGv4tjoPkO4Y9uD/N8Scb4CsJfY8NLZVF+1+U5qC0I=;
 b=oPnmsagBPzo/7oMl7CKG1FsdbuvlITNRemk3DzFPaEqp6O1UoTqUL+wgVlq6MY8opMYC6htBRWwzmN/eQUb7kC1PLlNRgCsy77AZ4ivVLsPUcsgVuIySoKw+lo0e2gk7JBQ6ZKm6NGGy3LDSZEwj6+yeYEcj8g6yz7/OyT7J/MI=
Received: from BY3PR03CA0015.namprd03.prod.outlook.com (2603:10b6:a03:39a::20)
 by MN2PR10MB4351.namprd10.prod.outlook.com (2603:10b6:208:1d7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 10:21:02 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::38) by BY3PR03CA0015.outlook.office365.com
 (2603:10b6:a03:39a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Mon,
 2 Mar 2026 10:21:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 10:21:01 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 04:21:00 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 04:20:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 04:20:59 -0600
Received: from [10.24.73.51] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.73.51])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622AKvO1606909;
	Mon, 2 Mar 2026 04:20:58 -0600
Message-ID: <e19762a8-b777-4fd0-a55d-226eaaf60f38@ti.com>
Date: Mon, 2 Mar 2026 15:50:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH] linuxptp: Add support for HSR in
 Linux ptp
To: MD Danish Anwar <danishanwar@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<denys@konsulko.com>, PRC Automation <prc@list.ti.com>
References: <20260302095430.140067-1-danishanwar@ti.com>
 <20260302095535.648960-1-prc@list.ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20260302095535.648960-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|MN2PR10MB4351:EE_
X-MS-Office365-Filtering-Correlation-Id: 229ea25f-75bb-40f0-5f52-08de78456759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	PHqCgldQf27vsAXZ9rVjhhrOca4mloC9cJCTK96qHU63rJtwpXQ7aiRrYMJAXZcGOZl2SYCb8oB9sD4dLxMmfeXNGgf0XE9gSFX8f9DR7AAcsPjfe/fA+Xw8W7wrcGXw9WHLL+7mnt48huoSJ94TQNK48JjLzMbhTnx50FgjJ5m6P3jV7ew71L2CxLBuyuSbpDsBKcaqvnrIhUyHBmbpnF6RZB+cKkxVgkmHlE3YqaCjFqZjN2EUYS7vatHRS9A6P/y1VaSnoyAWBKf+CpjeDjgAk5TRFfD8hlrETJHJQIsOc4DEDS7SeaMz+pzRNAH33HFr2O/rjOlVs4tu7Z2hHr2f4+GauT1FDfaGJj+2AcvQ3UTwu9fZSQ30lE6nk/GQ4KHNv6YLZnNo6pwaCruVzodBA7hZm7U5BTW8mOJZP5RdmyAI5GC73XiCerVsTyXblXJipcuB4E6csVhuAZl7kXC3O++zZPZqbWL9TRHAXFYxqE2kUQgRzksb9hzdFKJD35p7cfG6rbsV2JyiFYJqIkggA+CTN2OzqXNBCmtFSVn4RhiJ6/sYdX9gK7t9oX3vUQa8hpogRgTguHrEx8f/8HkVI8SeoHyu3kG3KwZ5/xVZzcGSnmT/I/2vglUFn0ZPe53ACj0vhdYLUpynUhfkBstDr+vyG+04ryCAwTy4xsefT4lt1vsmY45UWwwjsWDrBrIx+oQzOfJZNJ5hxnHxapOIMnyF1CWqA6M8LDYTtQyrmKsYYUH+YIZ0oFF7ryWeIo4ofLUlqRnzqMDdOuSJNpxqLbEcZwZEuds7u18doJARVRa7pUb4SgzEFlxZtCu50ETh4QKS4GwLaSfWOgdH8w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fu08fqAS7ws48ygB5R04WORo0zeEnOPu9TDclAwscDHTXGP4N2zOL1HmSgEXDT1rVydl3D71KhOku+wAH1ipQDeisoGWTdZA6d3pcn0mcyEFKs/zxMV7hSbglVDVhhhIITVxCwOdWhAd9DWNj+aIclqLC6JxAlTcfla7IG6ZLUGXe9t7qXA8BHPpQ8RfNfpqAPawQVIO/dVT8RdLqJLjgUq84zvnh6KMGJDcHLwlqpP9FX0dhTIHXV9q8yu3yAHR8IIRNR2EPesdihtpBIDUuKQdNM4/w15d2a2hT0MQePvmE2b1WQojfMaN0aalCA5JFa27ad/gdbLcbx9scbw84IS6FnOM0EM4I2DZjh4H5fdwjn/zHwHPn+RFPW29SJaEd4+Da6n0wM6BmLVVo6trsQdLkAYpKhZUczZhiHR8WT73nZ/fS3MjrGv8BWOR94/e
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 10:21:01.3805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 229ea25f-75bb-40f0-5f52-08de78456759
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4351
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 10:21:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17166

Hi Danish,

On 02/03/26 15:25, PRC Automation wrote:
> meta-arago / na / 20260302095430.140067-1-danishanwar
>
> PRC Results: FAIL
>
> =========================================================
>    check-yocto-patches: PASS
> =========================================================
> Patches
> ----------------------------------------
> All patches passed
>
>
>
> =========================================================
>    apply-yocto-patch: PASS
> =========================================================
> master
> =====================
> Summary:
> - Patch Series: [meta-arago][master][PATCH] linuxptp: Add support for HSR in Linux ptp
> - Submitter: From: MD Danish Anwar <danishanwar@ti.com>
> +From: Cliff Spradlin <cspradlin@google.com>
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> +From: MD Danish Anwar <danishanwar@ti.com>
> - Date: Date: Mon, 2 Mar 2026 15:24:30 +0530
> +Date: Thu, 2 Oct 2025 18:37:54 -0700
> +Date: Thu, 18 Sep 2025 12:58:52 +0200
> +Date: Thu, 2 Oct 2025 10:09:32 +0200
> +Date: Wed, 22 Oct 2025 15:32:22 +0200
> +Date: Thu, 2 Oct 2025 10:34:10 +0200
> +Date: Thu, 2 Oct 2025 10:37:06 +0200
> +Date: Thu, 2 Oct 2025 10:39:45 +0200
> +Date: Thu, 2 Oct 2025 10:45:44 +0200
> +Date: Thu, 2 Oct 2025 10:46:17 +0200
> +Date: Thu, 2 Oct 2025 13:01:53 +0200
> +Date: Wed, 22 Oct 2025 15:42:28 +0200
> +Date: Thu, 2 Oct 2025 11:51:53 +0200
> +Date: Wed, 18 Feb 2026 15:45:27 +0530
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: c2ad80337e651a7c3bc3efd5ec7346dcd2513165
>
> Applied to:
> - Repository: lcpd-prc-meta-arago
> - Base Branch: master-wip
> - Commit Author: Ryan Eatmon <reatmon@ti.com>
> - Commit Subject: arago.conf: Remove temporary hack for DEFAULTTUNE on armv7a
> - Commit SHA: 58966cd5a2d433b4c915e652f21f2e2b2475ec21
>
> Patches
> ----------------------------------------
> All patches applied
>
>
>
> =========================================================
>    check-yocto-repo: FAIL
> =========================================================


can you handle the below errors reported by PRC & resend a v2


--
Chirag


> master
> =====================
> FAIL
>      ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
>          meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch
>      
>      ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
>          meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0002-port-Add-dataset_comparison-type-IEC62439-3.patch
>      
>      ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
>          meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0003-Add-PASSIVE_SLAVE-state.patch
>      
>      ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
>          meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0004-rtnl-Add-rtnl_get_hsr_devices.patch
>      
>      ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
>          meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0005-port-Add-paired_port-option.patch
>      
>      ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
>          meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0006-fsm-Add-a-state-engine-for-redundant-master.patch
>      
>      ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
>          meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0007-p2p_hc-Add-a-double-attached-clock-hybrid-clock-HC.patch
>      
>      ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
>          meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0008-tc-Allow-to-forward-packets-both-ways-in-DAC-mode.patch
>      
>      ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
>          meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0009-port-Add-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.patch
>      
>      ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
>          meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0010-tc-Allow-to-forward-packets-in-LISTEN-state.patch
>      
>      ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
>          meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0011-raw-Add-HSR-handling.patch
>      
>      ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
>          meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0012-configs-Add-sample-configs-for-the-HSR-setup.patch
>      
>      ERROR: Missing Upstream-Status in patch file. (UPSTREAM-STATUS-1)
>          meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0013-configs-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.patch
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
>
>
>

