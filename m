Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1AAC7EE2F
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 14:44:13 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.61049.1686581051580669466
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 07:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N+bMo3ts;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35CEi67w030449;
	Mon, 12 Jun 2023 09:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686581046;
	bh=oiWCCA7HJ5C8KJlS2TR1x7tOWfv7ZrzlxvML8QO5tf4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=N+bMo3tsaI+fdxnyjU5cOtsKfUlbbnqAKuFQkuu5HVyS2jMDzrCL72//Cmd/gOz9g
	 QmB0jve58+ByxZdIi4YWfdw1xcO+FgmvrFB/LmcC3kVRRfP0PuKFRQnW0YwDyJfnc5
	 yNX4LpeGk972rpWv8C8Iuw5kob+dYZFsCgDnTT4s=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35CEi6ub015412
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Jun 2023 09:44:06 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Jun 2023 09:44:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Jun 2023 09:44:06 -0500
Received: from [10.249.33.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35CEi6gw054151;
	Mon, 12 Jun 2023 09:44:06 -0500
Message-ID: <ff2fc4c9-9f1e-2da6-40f5-b0fab349f455@ti.com>
Date: Mon, 12 Jun 2023 09:44:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago][master/kirkstone][PATCHv2 0/3] Fix some
 configuration options for systemd
Content-Language: en-US
To: <rs@ti.com>, <afd@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230609192415.3210941-1-rs@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230609192415.3210941-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Jun 2023 14:44:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14592


This patch series does not apply cleanly because it assumes your 
previous patches were applied.  But we are not accepting those patches 
until the identified issue is resolved.

If this patch series is independent of that series, then please resubmit 
this series on top of current kirkstone.


On 6/9/2023 2:24 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Fixing up some systemd stuff. Using the auto getty generator built into
> systemd instead of the external oe-core getty service.
> 
> Also drop the duplicate/invalid useradd entries in the systemd append.
> 
> This should be all that's required to squelch the endless serial getty
> start/stop logs for systemd. There's probably some work required for
> sysvinit as well. Should just be setting SERIAL_CONSOLES_CHECK =
> $SERIAL_CONSOLES or something along those lines.
> 
> Still not sure how I feel about having inactive serial console
> definitions in a bsp layer but if we don't define it at all then oe-core
> will just blindly assume we wanted a console on ttyS0. That's especially
> problematic for the init systems unable to generate getty scripts
> automatically. SERIAL_CONSOLES_CHECK at least fixes the sysvinit
> behavior.
> 
> Randolph Sapp (3):
>    systemd: drop the useradd params
>    arago.conf: add serial-getty-generator to systemd
>    systemd: move packageconfig appends to distro config
> 
>   meta-arago-distro/conf/distro/arago.conf                  | 2 +-
>   meta-arago-distro/recipes-core/systemd/systemd_%.bbappend | 4 ----
>   2 files changed, 1 insertion(+), 5 deletions(-)
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

