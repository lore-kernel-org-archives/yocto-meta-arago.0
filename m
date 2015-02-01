Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E6CA752090
	for <meta-arago@arago-project.org>;
	Sun,  1 Feb 2015 01:25:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t111PM7l000554
	for <meta-arago@arago-project.org>; Sat, 31 Jan 2015 19:25:22 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t111PLcx022994
	for <meta-arago@arago-project.org>; Sat, 31 Jan 2015 19:25:21 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 31 Jan 2015 19:25:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t111PKWs031020;
	Sat, 31 Jan 2015 19:25:20 -0600
Date: Sat, 31 Jan 2015 20:25:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20150201012519.GD2883@edge>
References: <1422659974-29180-1-git-send-email-sam.nelson@ti.com>
	<20150131025415.GB2883@edge>
	<4F9216F96E5DF9428610502835A9F4905810D6E7@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905810D6E7@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] libnl: Add append recipe to expose private files
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
X-List-Received-Date: Sun, 01 Feb 2015 01:25:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 30, 2015 at 10:50:20PM -0500, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, January 30, 2015 9:54 PM
> > To: Nelson, Sam
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH 1/2] libnl: Add append recipe to expose
> > private files
> > 
> > On Fri, Jan 30, 2015 at 06:19:33PM -0500, Sam Nelson wrote:
> > > - Private files installed are needed to allow xfrm extension of libnl
> > > - Version 3.2.24 already have this patch
> > 
> > Why do you need this, if you have 3.2.24 already?
> > 
> [Sam] This is needed temporarily to patch 3.2.22 as the arago preferred version is currently
>  3.2.22

Can you do PREFERRED_VERSION_keystone = "3.2.24"?


> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > >
> > > ---
> > > This is needed temporarily to patch 3.2.22 as the arago preferred version is
> > 3.2.22
> > > ---
> > > ---
> > >  .../recipes-support/libnl/libnl_3.2.22.bbappend    |    8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >  create mode 100644 meta-arago-extras/recipes-
> > support/libnl/libnl_3.2.22.bbappend
> > >
> > > diff --git a/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bbappend
> > b/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bbappend
> > > new file mode 100644
> > > index 0000000..4885c7d
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bbappend
> > > @@ -0,0 +1,8 @@
> > > +PR_append = "-arago0"
> > > +
> > > +do_install_append() {
> > > +#   Install private files to allow libnl extensions
> > > +    install -d ${D}${includedir}/netlink-private
> > > +    cp -r ${S}/include/netlink-private/cache-api.h ${D}${includedir}/netlink-
> > private/
> > > +    cp -r ${S}/include/netlink-private/object-api.h ${D}${includedir}/netlink-
> > private/
> > > +}
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

