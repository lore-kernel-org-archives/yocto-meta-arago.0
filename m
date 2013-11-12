Return-Path: <heroor@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 56BBF52986
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 06:14:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAC6EGpU000951
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2013 00:14:16 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAC6EGHW028399
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2013 00:14:16 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 12 Nov 2013 00:14:16 -0600
Received: from [172.24.159.173] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAC6EExD003320;
	Tue, 12 Nov 2013 00:14:15 -0600
Message-ID: <5281C736.2000708@ti.com>
Date: Tue, 12 Nov 2013 11:44:14 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>, "Reizer, Eyal" <eyalr@ti.com>
References: <8665E2433BC68541A24DFFCA87B70F5B17DA2B97@DNCE04.ent.ti.com>
	<20131112060558.GB4510@edge>
In-Reply-To: <20131112060558.GB4510@edge>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] wl18xx-firmware: fix p2p issues
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Nov 2013 06:14:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2013 11:35 AM, Denys Dmytriyenko wrote:
> On Sun, Nov 10, 2013 at 01:24:53PM +0000, Reizer, Eyal wrote:
>> wifi-direct did not work with the previous firmware released for R8.2 (ol_r8.07.02)
>> update the recipe to use a fixed firmware.
>>
>> This fix is important for the next coming glsdk release for J6/omap5
> Eyal,
>
> Unfortunately, R8.2 has never been submitted to meta-arago - was is part of
> GLSDK "forked" release?
>
> Sid/Mrinmayee,
>
> Do you have updated recipes you want to share?
>
AFAIK, we picked up the recipes from what were submitted to this ML by 
Roger/Iain. I'm not aware of any other changes.

--
Sid

