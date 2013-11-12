Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9E31952972
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2013 06:40:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAC6emvr024140
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2013 00:40:48 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAC6emXa000552
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2013 00:40:48 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 12 Nov 2013 00:40:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAC6eme8029217;
	Tue, 12 Nov 2013 00:40:48 -0600
Date: Tue, 12 Nov 2013 01:40:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Siddharth Heroor <heroor@ti.com>
Message-ID: <20131112064047.GC4510@edge>
References: <8665E2433BC68541A24DFFCA87B70F5B17DA2B97@DNCE04.ent.ti.com>
	<20131112060558.GB4510@edge> <5281C736.2000708@ti.com>
MIME-Version: 1.0
In-Reply-To: <5281C736.2000708@ti.com>
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
X-List-Received-Date: Tue, 12 Nov 2013 06:40:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 12, 2013 at 11:44:14AM +0530, Siddharth Heroor wrote:
> On 11/12/2013 11:35 AM, Denys Dmytriyenko wrote:
> >On Sun, Nov 10, 2013 at 01:24:53PM +0000, Reizer, Eyal wrote:
> >>wifi-direct did not work with the previous firmware released for R8.2 (ol_r8.07.02)
> >>update the recipe to use a fixed firmware.
> >>
> >>This fix is important for the next coming glsdk release for J6/omap5
> >Eyal,
> >
> >Unfortunately, R8.2 has never been submitted to meta-arago - was is part of
> >GLSDK "forked" release?
> >
> >Sid/Mrinmayee,
> >
> >Do you have updated recipes you want to share?
> >
> AFAIK, we picked up the recipes from what were submitted to this ML
> by Roger/Iain. I'm not aware of any other changes.

Sid,

Ah, I see what's going on :)
http://thread.gmane.org/gmane.linux.embedded.yocto.meta-arago/1127/focus=1241


Roger,

Any ETA on resubmitting the updated patchset? Thanks.

-- 
Denys

