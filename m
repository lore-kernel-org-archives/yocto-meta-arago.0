Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D50CB529B5
	for <meta-arago@arago-project.org>;
	Wed, 19 Aug 2015 17:20:04 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7JHK4Ff014804
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2015 12:20:04 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7JHK3UT010063
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2015 12:20:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 19 Aug 2015 12:20:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7JHK31H006929;
	Wed, 19 Aug 2015 12:20:03 -0500
Date: Wed, 19 Aug 2015 13:19:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150819171947.GJ6542@edge>
References: <1439552740-15530-1-git-send-email-j-stiffler@ti.com>
	<20150818205706.GD6542@edge> <55D45FD0.4020507@ti.com>
MIME-Version: 1.0
In-Reply-To: <55D45FD0.4020507@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] tisdk-image: Use "TOOLCHAIN_SUFFIX" to find devkit
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
X-List-Received-Date: Wed, 19 Aug 2015 17:20:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 19, 2015 at 06:52:00AM -0400, Jacob Stiffler wrote:
> 
> 
> On 8/18/2015 4:57 PM, Denys Dmytriyenko wrote:
> >Jake,
> >
> >This one didn't apply even on daisy - I didn't have much time to look at the
> >issue, but maybe you have an idea what's wrong?
> >
> 
> 
> Denys,
> 
> I developed this patch in the fido context, and should apply cleanly
> on the master branch.
> 
> On fido, there is the commit
> 1ed881223402fdb1ab7f4ffe444d8b4e7f67cb34 to make the SDK filter
> stricter. This has not been implemented on daisy, and causes the
> patch to fail.

Do you need this fixed in daisy?

