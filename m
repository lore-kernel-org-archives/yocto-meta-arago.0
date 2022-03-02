Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3480.1646256660493987903
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Mar 2022 13:31:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3EC6C40C24;
	Wed,  2 Mar 2022 21:30:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IdvBVejDOxYR; Wed,  2 Mar 2022 21:30:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0F762407FE;
	Wed,  2 Mar 2022 21:30:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5ED6E1747BA; Wed,  2 Mar 2022 16:30:53 -0500 (EST)
Date: Wed, 2 Mar 2022 16:30:53 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Aparna M <a-m1@ti.com>, meta-arago@lists.yoctoproject.org,
	praneeth@ti.com, nikhil.nd@ti.com, devarsht@ti.com
Subject: Re: [meta-arago][dunfell][PATCH] ti-tisdk-setup: Update SRCREV to latest
Message-ID: <20220302213053.GM1766@denix.org>
References: <20220225141125.15517-1-a-m1@ti.com>
 <46f32e91-bb5e-df34-6ad6-912a459cf314@ti.com>
 <20220302204340.GK1766@denix.org>
 <47536470-8211-46fe-33ff-1294e4ecbc1e@ti.com>
MIME-Version: 1.0
In-Reply-To: <47536470-8211-46fe-33ff-1294e4ecbc1e@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Normally, bumping PR manually is not required, except in few very specific 
and rare cases. I don't believe this is such a case, that's why I asked if you 
saw an issue with it...


On Wed, Mar 02, 2022 at 02:45:10PM -0600, Ryan Eatmon wrote:
> No, it was from feedback that Praneeth gave in webex teams.  I was
> capturing the comment on the mailing list.
> 
> 
> On 3/2/2022 14:43, Denys Dmytriyenko wrote:
> >On Wed, Mar 02, 2022 at 07:50:52AM -0600, Ryan Eatmon wrote:
> >>
> >>
> >>On 2/25/2022 8:11, Aparna M wrote:
> >>>Update SRCREV to include updates to create-sdcard.sh, uboot setup env
> >>>scripts and tftp support for HS EVMs.
> >>>
> >>>Signed-off-by: Aparna M <a-m1@ti.com>
> >>>---
> >>>  .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb              | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>>diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> >>>index 886a8b55..2e35f6e2 100644
> >>>--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> >>>+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> >>>@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c
> >>>  PR = "r46"
> >>
> >>The PR needs to bump also.  PR = "r47".
> >
> >Ryan,
> >
> >Was there a specific issue you saw with this?
> >
> >
> >>>  BRANCH ?= "master"
> >>>-SRCREV = "42a8379fda829f34c374ddfca0242a479a84d454"
> >>>+SRCREV = "22f4e5af1894a60d9e7d04caf83f26a556c14eca"
> >>>  SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
> >>>  S = "${WORKDIR}/git/"
