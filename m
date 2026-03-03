Return-Path: <danishanwar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E46E67A6D
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 05:59:45 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12111.1772517583568771129
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 21:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=T3H6TCaS;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.15, mailfrom: danishanwar@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEVwCC/SCaH5S9GqFnrYiD107XWaiJoH69EW1+3lKSIDnHvbOcEPMEEiwBPbY4CdL6qZQoV0ofqFGCwonTORNUelggs7Z4QCQY+aO6cJByJR7UAaH3tcV36CCAsQJrQcUnQdCAfm76TinYOsrpUw1OWDMDG2Pa6HPimRdbn0b058g2loc0crYqC+T85hJynt9BTrY7gc86pj5fF+QMSsUiQZ629QPmzBEXgu/lj3RyyKNMPK5q1PN/IygbHTxTStc0N3SnqqI1y/gOrur9hlGHDOT/k5QhaPp9gLLz1nW+YvwV3BzcDwuHZVNeh6jPmhGEjpo60jP7qHWOVTprfLyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILa0LbBgwpCLCisO5uQWnNf8lFJdzrhE6nP4UNOUlqQ=;
 b=maRha1weX3Ks5JFKzWOTwVBJIjVuft4fcSwBLCxW1E3L8vwQqi9GuI1x/bO34yCuQJxP50uR5AyOpz8Jx9l/xjWdKQOZJB0T7IhFLhjEf0FuJj2rpwmQ5NAA7E68amY/LjukwJqhyhPhNqxafleGa8huEAxGwvdRiOHI1HK+dBDJa0GImkLByf2pT7EzUVNvVbPfOy/zz7GgNpQ6mAJXNGme65G2Gif4crHK02qXnJQdCmGgys5XQ4wolBzGp/5Q/EWZKiiaKcsbOfjNdtsd2ghkIbT74uK121+LQJFr79Cd7ydWgvbHFC4ZBK81LIgX72A1kxeEoQUTNpGrk144kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILa0LbBgwpCLCisO5uQWnNf8lFJdzrhE6nP4UNOUlqQ=;
 b=T3H6TCaSn5Tsodhlz7zxY59gPsb1M0igcrz8HqfBm8cM7CCLtnf6yLgYZhQHrHHqT4Zt+aKL/jkHkB2k7S9+JvWxNbK8zFoF6sN/0IyBaEjuYRQ6qXPeu+umH6c04LDpLx3AxDAXsXPIkCQBa+Q1gJKKez5bL7/hG1eBBWNM9WI=
Received: from SJ0PR03CA0266.namprd03.prod.outlook.com (2603:10b6:a03:3a0::31)
 by IA1PR10MB7446.namprd10.prod.outlook.com (2603:10b6:208:447::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 05:24:31 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::4d) by SJ0PR03CA0266.outlook.office365.com
 (2603:10b6:a03:3a0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Tue,
 3 Mar 2026 05:24:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 05:24:30 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 23:24:28 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 23:24:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 23:24:28 -0600
Received: from [172.24.231.152] (dhcp-172-24-231-152.dhcp.ti.com [172.24.231.152])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6235OPg31535977;
	Mon, 2 Mar 2026 23:24:26 -0600
Message-ID: <f31cb559-5a0b-435b-b919-cbf637547343@ti.com>
Date: Tue, 3 Mar 2026 10:54:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v2] linuxptp: Add support for HSR in
 Linux ptp
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
	<denys@konsulko.com>, <c-shilwant@ti.com>
References: <20260302103515.848554-1-danishanwar@ti.com>
 <20260302204051.GF11121@denix.org>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20260302204051.GF11121@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|IA1PR10MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: 1593a8d3-f7fe-4bd7-6910-08de78e52552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	p8asX+ZcVd9SZuk50WQuIG4sEYX2CiiJt9otRewf4z/QmH8mc6Qwed8412vSbtT4bNUUcu/5IaTovNW84uox4HQHGpwzkxjRY3fk9g8aG5QPw04rWE+oOF3JPvzV33qG4YOBM+oBEcXv2dBHt+30Na3zRGZ2WBRoMhIvUVyELvaohf4fqPOh4faN1ogfvsttQany98lDSFUwNWgpozcnoSLGMyvOYR+zGFusU8NFJebhSek5lnulCiOOWHF/y84yGf/vRGqJEsucZQHaUfRT6r/Jaz24++vDpEdXMvDco6o0EzLwDtjMrXRI8rfy2LXJuUv0PYWtA9RoLaXlG8UE68k8GCATyWaHog1uXhyy6BmLxIA+d7yclTRZOW4pymvBYkPq5emRz/QZ97BP/G4bOLv0AU++iHX7yjFF7hmU9moXIp8Yu43jg66em1rtGstFCTKlCeAXQjbMBEhf8fGbFICRbgGhSNX7dUlB5EqKKk5BanBj0GoaaIwBctZsbFBQC6XkNjP39g41tRjalAk6wegAqbhCLkQaMZPVGNwtb0nhUN6X7L2Q21x51gXlkWMZOAbOQyY8wqrvb9BvLqGi+xrnW3qlFQgmiCkp9DtAtZ2mYoLUJp7YzUQiFObi3VEUEPHQY7kiLbPDniKss1k2SgrrE5DABDriVlLE/bbByG2IBwsEZ3Va0EZ9++tAaugw43udpaBbFoBpK4Pu7F5N7YnJ9E/bU1I+8XxRE2yyKyNE3ZfZYFUigiYE1P51hh03gz1OfPN9NMyVa1bLNsbXsg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/IP2jax0TLrC+5AxeSH6bzw6U/gsctCa3KJyiHzKEFEGETWOK0+/N2/DgwA/vdqbErDJtF8oZhEDOZvXY5BcUBHHrvphk9ZoMqfo2eAwGxyTSoQiimMyf/WKttDmPOpr75B52+nRTt8Jdgu7u48gIbN6foomnkF3goohiM+xGNyXvvY+U2pdKHenOF8uqXqQCcAgZKcFOr+q2ETxA1W9PKZ4Gkum42ytl/8QIEqSFij31iRcnz2MGivQoNPi4O5lVzVggDfKdl0LKZQHhYdGgKyij4o8dc2ypQvty507igXwp6yGYpuGgf/hEMI2rWKtaXOVgsBqd423lAExBdCT2Lt4sAL/jN/+nxLpq+O79uDiNQsmxuVyBLS6PsBrK90zKF0gq8NpB2bMpjp+4MWgb5XMkVorZNLAR5BKWrJ9+URitcLKl4w/ha4cwyyooxCB
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 05:24:30.0884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1593a8d3-f7fe-4bd7-6910-08de78e52552
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7446
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Mar 2026 05:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17185

Hi Denys,

On 03/03/26 2:10 am, Denys Dmytriyenko wrote:
> On Mon, Mar 02, 2026 at 04:05:15PM +0530, MD Danish Anwar via lists.yoctoproject.org wrote:
>> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> ---
>> These patches have been posted to upstream linuxptp mailing list.
>> https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00013.html
>> They are currently under review.
>>
>> v1 -> v2:
>>   Added Upstream Status in each patch.
>>
>>  .../linuxptp/linuxptp-arago.inc               |  19 +
>>  ...age-of-non-PTP-packets-during-socket.patch |  81 +++
>>  ...d-dataset_comparison-type-IEC62439-3.patch | 217 +++++++
>>  .../0003-Add-PASSIVE_SLAVE-state.patch        | 275 +++++++++
>>  .../0004-rtnl-Add-rtnl_get_hsr_devices.patch  | 120 ++++
>>  .../0005-port-Add-paired_port-option.patch    | 175 ++++++
>>  ...-a-state-engine-for-redundant-master.patch | 519 ++++++++++++++++
>>  ...ouble-attached-clock-hybrid-clock-HC.patch | 444 ++++++++++++++
>>  ...orward-packets-both-ways-in-DAC-mode.patch |  37 ++
>>  ...guard-in-case-PASSIVE_SLAVE-attempts.patch |  37 ++
>>  ...w-to-forward-packets-in-LISTEN-state.patch |  61 ++
>>  .../linuxptp/0011-raw-Add-HSR-handling.patch  | 567 ++++++++++++++++++
>>  ...Add-sample-configs-for-the-HSR-setup.patch |  96 +++
>>  ...2p_dst_mac-to-avoid-IEEE-802.1-reser.patch |  47 ++
>>  .../linuxptp/linuxptp_%.bbappend              |   4 +
>>  15 files changed, 2699 insertions(+)
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-arago.inc
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0002-port-Add-dataset_comparison-type-IEC62439-3.patch
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0003-Add-PASSIVE_SLAVE-state.patch
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0004-rtnl-Add-rtnl_get_hsr_devices.patch
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0005-port-Add-paired_port-option.patch
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0006-fsm-Add-a-state-engine-for-redundant-master.patch
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0007-p2p_hc-Add-a-double-attached-clock-hybrid-clock-HC.patch
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0008-tc-Allow-to-forward-packets-both-ways-in-DAC-mode.patch
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0009-port-Add-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.patch
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0010-tc-Allow-to-forward-packets-in-LISTEN-state.patch
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0011-raw-Add-HSR-handling.patch
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0012-configs-Add-sample-configs-for-the-HSR-setup.patch
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0013-configs-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.patch
>>  create mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_%.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-arago.inc b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-arago.inc
>> new file mode 100644
>> index 00000000..17819cf3
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp-arago.inc
>> @@ -0,0 +1,19 @@
>> +PR:append = ".arago6"
> 
> This is the first submission, why is it .arago6?
> 

This is my first time submitting patch to meta-arago. I am not aware 6
mean in `.arago6`.

I just looked at the code for iproute2 [1] (as there also custom patches
are being applied) and followed the same syntax for linuxptp.

Can you please let me know what should I use here?

> 
>> +
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/linuxptp:"
>> +
>> +SRC_URI:append = " \
> 
> There's absolutely no reason to suee :append here vs. a simple +=
> 
> 
>> +    file://0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch \
>> +    file://0002-port-Add-dataset_comparison-type-IEC62439-3.patch \
>> +    file://0003-Add-PASSIVE_SLAVE-state.patch \
>> +    file://0004-rtnl-Add-rtnl_get_hsr_devices.patch \
>> +    file://0005-port-Add-paired_port-option.patch \
>> +    file://0006-fsm-Add-a-state-engine-for-redundant-master.patch \
>> +    file://0007-p2p_hc-Add-a-double-attached-clock-hybrid-clock-HC.patch \
>> +    file://0008-tc-Allow-to-forward-packets-both-ways-in-DAC-mode.patch \
>> +    file://0009-port-Add-a-safe-guard-in-case-PASSIVE_SLAVE-attempts.patch \
>> +    file://0010-tc-Allow-to-forward-packets-in-LISTEN-state.patch \
>> +    file://0011-raw-Add-HSR-handling.patch \
>> +    file://0012-configs-Add-sample-configs-for-the-HSR-setup.patch \
>> +    file://0013-configs-Change-p2p_dst_mac-to-avoid-IEEE-802.1-reser.patch \
>> +"
>> diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch
>> new file mode 100644
>> index 00000000..ea0f968c
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/0001-raw-Prevent-leakage-of-non-PTP-packets-during-socket.patch
>> @@ -0,0 +1,81 @@
>> +From 5afe386619bfcded393fd5a9ea5d7c9bbcf05823 Mon Sep 17 00:00:00 2001
>> +From: Cliff Spradlin <cspradlin@google.com>
>> +Date: Thu, 2 Oct 2025 18:37:54 -0700
>> +Subject: [PATCH 01/13] raw: Prevent leakage of non-PTP packets during socket
>> + init
>> +
>> +There were two problems with the socket configuration sequencing:
>> +
>> +1) Calling socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL)) causes all
>> +ethernet frames from -all- interfaces to be queued to the socket,
>> +until bind() is later called.
>> +
>> +2) The BPF filter is installed -after- bind() is called, so ethernet
>> +frames that should be rejected could be queued before the BPF filter
>> +is installed.
>> +
>> +This patch reorders the raw socket initialization so that all
>> +configuration happens before bind() is called.
>> +
>> +Signed-off-by: Cliff Spradlin <cspradlin@google.com>
>> +Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> +Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
>> +---
>> +Upstream-Status:
>> +Submitted
>> +  Submitted to upstream, waiting approval
>> +  https://lists.nwtime.org/sympa/arc/linuxptp-devel/2025-11/msg00007.html
> 
> While there's no specific requirement to have this before the --- line, it 
> still must be in a single line. Same comment to all patches.
> 

Sure. I will address this in v3.

> 
>> +
>> + raw.c | 22 +++++++++++-----------

[1]
https://git.ti.com/cgit/arago-project/meta-arago/tree/meta-arago-distro/recipes-connectivity/iproute2/iproute2_%25.bbappend?h=scarthgap-next&id=ee4d898485d9474abacf8ec092e61fdfc0efa348

-- 
Thanks and Regards,
Danish


