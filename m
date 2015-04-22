Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DF93752A4E
	for <meta-arago@arago-project.org>;
	Wed, 22 Apr 2015 19:15:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3MJF4J3028019
	for <meta-arago@arago-project.org>; Wed, 22 Apr 2015 14:15:04 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3MJF2Rr003778
	for <meta-arago@arago-project.org>; Wed, 22 Apr 2015 14:15:03 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 22 Apr 2015 14:15:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3MJF0Ag003041;
	Wed, 22 Apr 2015 14:15:01 -0500
Date: Wed, 22 Apr 2015 15:14:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20150422191458.GK25236@edge>
References: <1429302346-9926-1-git-send-email-sam.nelson@ti.com>
	<20150420184121.GA23723@edge>
MIME-Version: 1.0
In-Reply-To: <20150420184121.GA23723@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] ltp-ddt: Skip mv of kernel files if no files found
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
X-List-Received-Date: Wed, 22 Apr 2015 19:15:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 20, 2015 at 02:41:21PM -0400, Denys Dmytriyenko wrote:
> On Fri, Apr 17, 2015 at 04:25:46PM -0400, Sam Nelson wrote:
> > - Install was failing if there are no modules for certain platforms
> > 
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> > index 68e1a3c..609b344 100644
> > --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> > +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
> > @@ -87,7 +87,7 @@ do_install() {
> >      oe_runmake install
> >      install -d ${D}${datadir}
> >      install -d ${D}${kmoddir}
> > -    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
> > +    find ${D}${LTPROOT}/testcases/bin/ddt/*.ko && mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
> 
> Should probably do "mv || true" instead...

Sam,

Do you have any issues doing mv||true construct or do you want to stick with 
the find command for any reason?

-- 
Denys

