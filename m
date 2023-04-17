Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A53BC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 22:43:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.11894.1681771428873254234
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Apr 2023 15:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LIsJ9PDd;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33HMhi8M100695;
	Mon, 17 Apr 2023 17:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681771424;
	bh=dp6fM2eO8OQUaPtDdKJ+ElhUhRG12tP5hAsBcpP8s7g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LIsJ9PDdRAwS6B7BctYHZ9hb1pPZwanuA4x6VqlTw6fcT3y/qtwSN8pCWmvfdWFie
	 ljYlh5C7NTNuaufjuCWtIFRhkXPBkiTYgLYKgN/+5aYck0SJKDLs6JGCBIUSjCcaLk
	 n0POfPIJAN9Pz3jOLyXLs6Rc2ceArQmNCy1mT+1w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33HMhijg073419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Apr 2023 17:43:44 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 17
 Apr 2023 17:43:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 17 Apr 2023 17:43:44 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33HMhigI009841;
	Mon, 17 Apr 2023 17:43:44 -0500
Message-ID: <05fd037d-f77c-f2d7-7e92-ef11cb395e63@ti.com>
Date: Mon, 17 Apr 2023 17:43:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [DISCUSSION] Weston-Init and non-root weston
Content-Language: en-US, en-US-large
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan
 Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <1241ddde-7f9c-d8ff-2c15-d300f5c5a24a@ti.com>
 <02df0607-5aad-f70d-62d2-ffdce916201b@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <02df0607-5aad-f70d-62d2-ffdce916201b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Apr 2023 22:43:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14317

On 4/17/23 17:39, Andrew Davis wrote:
> On 4/17/23 5:32 PM, Randolph Sapp wrote:
>> Finally getting around to weston-init issue I highlighted a while back 
>> and there's only one real issue preventing us from reusing the base 
>> weston-init recipe -- our touchscreen auto-configuration script.
>>
>> That script has to have root access to setup and reload udev rules and 
>> as we know setuid won't work for shell scripts.
>>
>> I propose we rewrite it in something that can use setuid (perl or c or 
>> something of the sort). I'm currently looking at perl as there's 
>> already quite a few core recipes that rdepend on it.
>>
>> Then we just need to inject it into the runWeston script and adjust 
>> the two init scripts to point at that.
>>
>> Any concerns or objections?
> 
> Why not just drop out that old touchscreen script, it is a non-standard 
> way of doing
> this task and should be removed.
> 
> Andrew

It's non-standard, but that's because there really isn't a good standard 
for calibrating touch screens under Weston. AFAIK this is still useful.

