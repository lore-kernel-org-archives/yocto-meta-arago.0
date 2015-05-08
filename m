Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id ED03852093
	for <meta-arago@arago-project.org>;
	Fri,  8 May 2015 21:56:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t48LuAWp025146
	for <meta-arago@arago-project.org>; Fri, 8 May 2015 16:56:10 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t48LuAfs002069
	for <meta-arago@arago-project.org>; Fri, 8 May 2015 16:56:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 8 May 2015 16:56:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t48Lu9aJ026814	for
	<meta-arago@arago-project.org>; Fri, 8 May 2015 16:56:10 -0500
Date: Fri, 8 May 2015 17:56:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20150508215609.GQ8462@edge>
References: <20150430200816.GT29290@edge>
MIME-Version: 1.0
In-Reply-To: <20150430200816.GT29290@edge>
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
X-List-Received-Date: Fri, 08 May 2015 21:56:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Any comments or objections?


On Thu, Apr 30, 2015 at 04:08:17PM -0400, Denys Dmytriyenko wrote:
> All,
> 
> I'm considering turning off cortex optimizations for nightly CoreSDK builds. 
> Currently I'm building 8 machines and besides some machine-specific packages, 
> most of the packages get duplicated into cortex-a8, cortex-a9 and cortex-a15 
> arch-specific directories - each is about 1.5 GB.
> 
> Disabling cortex optimization will of course drop performance slightly (few 
> percent, if I remember correctly), but besides size savings, it also saves on 
> time for rebuilding those packages 3 times. All of them will be designated as 
> armv7a and built once.
> 
> Any concerns, comments?
> 
> -- 
> Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

