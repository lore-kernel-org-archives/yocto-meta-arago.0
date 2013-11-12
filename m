Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A565352A7C
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 06:06:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAC65xni023344
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2013 00:05:59 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAC65xcZ027968
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2013 00:05:59 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 12 Nov 2013 00:05:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAC65xbn017880;
	Tue, 12 Nov 2013 00:05:59 -0600
Date: Tue, 12 Nov 2013 01:05:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Reizer, Eyal" <eyalr@ti.com>
Message-ID: <20131112060558.GB4510@edge>
References: <8665E2433BC68541A24DFFCA87B70F5B17DA2B97@DNCE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8665E2433BC68541A24DFFCA87B70F5B17DA2B97@DNCE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Tue, 12 Nov 2013 06:06:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sun, Nov 10, 2013 at 01:24:53PM +0000, Reizer, Eyal wrote:
> wifi-direct did not work with the previous firmware released for R8.2 (ol_r8.07.02)
> update the recipe to use a fixed firmware.
> 
> This fix is important for the next coming glsdk release for J6/omap5

Eyal,

Unfortunately, R8.2 has never been submitted to meta-arago - was is part of 
GLSDK "forked" release?

Sid/Mrinmayee,

Do you have updated recipes you want to share?

-- 
Denys

