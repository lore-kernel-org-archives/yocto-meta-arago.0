Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BA51652A21
	for <meta-arago@arago-project.org>;
	Fri,  4 Sep 2015 22:40:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t84Me6T4005130
	for <meta-arago@arago-project.org>; Fri, 4 Sep 2015 17:40:07 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t84Me6pP007142
	for <meta-arago@arago-project.org>; Fri, 4 Sep 2015 17:40:06 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Sep 2015 17:40:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t84Me6Mh008144;
	Fri, 4 Sep 2015 17:40:06 -0500
Date: Fri, 4 Sep 2015 18:39:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150904223950.GV4305@edge>
References: <1440665234-1913-1-git-send-email-a0393906@ti.com>
	<20150829002529.GP26662@edge>
MIME-Version: 1.0
In-Reply-To: <20150829002529.GP26662@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [daisy, master] omapdrmtest: Update SRCREV with bug fixes
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
X-List-Received-Date: Fri, 04 Sep 2015 22:40:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Karthik,

Can you please rebase this change against master? Thanks.

-- 
Denys


On Fri, Aug 28, 2015 at 08:25:29PM -0400, Denys Dmytriyenko wrote:
> This won't apply to master/fido - please see the fixes already there.
> 
> 
> On Thu, Aug 27, 2015 at 02:17:14PM +0530, Karthik Ramanan wrote:
> > The following issues will be resolved with this update:
> >  * viddec3test: move a global variable to demux structure
> >  * vpe: Correct the colorspace field
> >  * display-kmscube: fix race condition for buffer to face mapping
> >  * vpe: Pass correct colorspace to s_fmt ioctl
> > 
> > Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > ---
> >  .../omapdrmtest/omapdrmtest_1.0.0.bb               |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> > index 5ed1783..5d17409 100644
> > --- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> > +++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> > @@ -6,8 +6,8 @@ DEPENDS += "libav libdce libdrm libgbm omap5-sgx-ddk-um-linux wayland"
> >  
> >  inherit autotools pkgconfig
> >  
> > -PR = "r7"
> > -SRCREV = "a2f483ef833ce7a6f3e0b975d9e49267960b288e"
> > +PR = "r9"
> > +SRCREV = "152713c45d7972ed08f506255c43ce7ff634a9f5"
> >  
> >  SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git"
> >  
> > -- 
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

