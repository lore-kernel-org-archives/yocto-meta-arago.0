Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 703E052093
	for <meta-arago@arago-project.org>;
	Thu, 14 May 2015 22:10:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4EMAoYm017848
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 17:10:50 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4EMAo6J026744
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 17:10:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 17:10:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4EMAna7026079	for
	<meta-arago@arago-project.org>; Thu, 14 May 2015 17:10:49 -0500
Date: Thu, 14 May 2015 18:10:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20150514221048.GI30969@edge>
References: <20150430200816.GT29290@edge>
 <20150508215609.GQ8462@edge>
MIME-Version: 1.0
In-Reply-To: <20150508215609.GQ8462@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: RFC: turning off cortex optimizations for nightlies?
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
X-List-Received-Date: Thu, 14 May 2015 22:10:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

BTW, I was told not to disable optimization for now.


On Fri, May 08, 2015 at 05:56:09PM -0400, Denys Dmytriyenko wrote:
> Any comments or objections?
> 
> 
> On Thu, Apr 30, 2015 at 04:08:17PM -0400, Denys Dmytriyenko wrote:
> > All,
> > 
> > I'm considering turning off cortex optimizations for nightly CoreSDK builds. 
> > Currently I'm building 8 machines and besides some machine-specific packages, 
> > most of the packages get duplicated into cortex-a8, cortex-a9 and cortex-a15 
> > arch-specific directories - each is about 1.5 GB.
> > 
> > Disabling cortex optimization will of course drop performance slightly (few 
> > percent, if I remember correctly), but besides size savings, it also saves on 
> > time for rebuilding those packages 3 times. All of them will be designated as 
> > armv7a and built once.
> > 
> > Any concerns, comments?
> > 
> > -- 
> > Denys
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

