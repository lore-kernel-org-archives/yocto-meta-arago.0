Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C48B152986
	for <meta-arago@arago-project.org>;
	Wed,  5 Mar 2014 19:55:28 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s25JtSK5006963
	for <meta-arago@arago-project.org>; Wed, 5 Mar 2014 13:55:28 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s25JtSdg010906
	for <meta-arago@arago-project.org>; Wed, 5 Mar 2014 13:55:28 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 5 Mar 2014 13:55:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s25JtRkD021890;
	Wed, 5 Mar 2014 13:55:27 -0600
Date: Wed, 5 Mar 2014 14:55:27 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20140305195527.GC22125@edge>
References: <1393802295-7212-1-git-send-email-sam.nelson@ti.com>
	<20140305030635.GT22125@edge>
	<4F9216F96E5DF9428610502835A9F49057F4C2B9@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49057F4C2B9@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] arago.conf: Update preferred version of binutils to 2.23.1
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
X-List-Received-Date: Wed, 05 Mar 2014 19:55:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Normally, yes, those would be better places for preferences. But, in case of 
the toolchain components, it's not that simple...

I would still like to know what you are trying to fix with this. As far as I 
can see, 2.23.1 is already being set as a default binutils version in Dylan. 
Are you seeing an error or a warning w/o this?


On Wed, Mar 05, 2014 at 12:41:55PM -0500, Nelson, Sam wrote:
> I guess the arago-prefs.inc or branding-xyz.inc is the right place. Please 
> ignore this patch.
> Sam
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Tuesday, March 04, 2014 10:07 PM
> > To: Nelson, Sam
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] arago.conf: Update preferred version of
> > binutils to 2.23.1
> > 
> > What are you strying to fix here? Moreover, arago.conf is not the right place
> > for that...
> > 
> > 
> > On Sun, Mar 02, 2014 at 06:18:15PM -0500, Sam Nelson wrote:
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > >
> > > ---
> > > - 2.23.1 is available in oe-core/meta/recipes-
> > devtools/binutils/binutils_2.23.1.bb
> > > ---
> > > ---
> > >  meta-arago-distro/conf/distro/arago.conf |    2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> > distro/conf/distro/arago.conf
> > > index 76254f2..a789e89 100644
> > > --- a/meta-arago-distro/conf/distro/arago.conf
> > > +++ b/meta-arago-distro/conf/distro/arago.conf
> > > @@ -70,3 +70,5 @@ LICENSE_FLAGS_WHITELIST = "commercial_gst-
> > ffmpeg"
> > >  PACKAGE_ARCH := "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-
> > libc-headers}"
> > >  # Need to include the new PACKAGE_ARCH to the PACKAGE_ARCHS
> > variable
> > >  PACKAGE_ARCHS += "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-
> > libc-headers}"
> > > +
> > > +PREFERRED_VERSION_binutils = "2.23.1"
> > > --
> > > 1.7.9.5
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

