Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7629D52A3F
	for <meta-arago@arago-project.org>;
	Fri, 20 Feb 2015 02:56:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1K2tx5l000667
	for <meta-arago@arago-project.org>; Thu, 19 Feb 2015 20:55:59 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1K2twnp001497
	for <meta-arago@arago-project.org>; Thu, 19 Feb 2015 20:55:58 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Feb 2015 20:55:58 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1K2twJn022151;
	Thu, 19 Feb 2015 20:55:58 -0600
Date: Thu, 19 Feb 2015 21:55:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20150220025557.GG31287@edge>
References: <1423248896-20699-1-git-send-email-sam.nelson@ti.com>
	<20150206185948.GA12366@edge>
	<4F9216F96E5DF9428610502835A9F4905811091D@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7FB1BB@DFLE08.ent.ti.com>
	<20150206204243.GD12366@edge>
	<8F29D6B095ED194EA1980491A5E029710C7FB287@DFLE08.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F49058110B5F@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49058110B5F@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] branding-mcsdk: Adding MCSDK branding include file
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
X-List-Received-Date: Fri, 20 Feb 2015 02:56:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Coming back to this discussion...


On Fri, Feb 06, 2015 at 09:29:48PM -0500, Nelson, Sam wrote:
> > > > > > > - To control preferred version and providers for MCSDK
> > > > > > >
> > > > > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > > > > ---
> > > > > > >  .../conf/distro/include/branding-mcsdk.inc         |   20
> > > > > > ++++++++++++++++++++
> > > > > > >  1 file changed, 20 insertions(+)  create mode 100644
> > > > > > > meta-arago-distro/conf/distro/include/branding-
> > > > > > mcsdk.inc
> > > > > > >
> > > > > > > diff --git
> > > > > > > a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > > > > b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > > > > > new file mode 100644
> > > > > > > index 0000000..d023b67
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > > > > > @@ -0,0 +1,20 @@
> > > > > > > +# MCSDK branding configuration
> > > > > > > +
> > > > > > > +# Use the MCSDK supported versions PREFERRED_VERSION_libnl =
> > > > > > > +"3.2.24"
> > > > > > > +
> > > > > > > +DISTRO_FEATURES += "x11 opengl"
> > > > > >
> > > > > > I assume x11 is to make Java happy? I don't think you have x11 env...
> > > > > >
> > > > > [Sam] Yes it was to make Java happy.
> > > > [Franklin] I thought I remembered that the mcsdk were meant for headless
> > > devices.
> > > > If so I would recommend taking a look at the discussion here:
> > > > https://github.com/woglinde/meta-java/issues/45
> > > >
> > > > Pulling in x11 and gtk seems painful especially since you're not using it.
> > > > Anyway it's something to look into if it is indeed meant for headless
> > devices.
> > > > But its ur branding file so my above comments aren't meant to block this
> > > patch from being accepted.
> > >
> > > Well, as explained in that tracker link you provided, pulling X libs for the
> > build
> > > doesn't necessary mean you'll end up with X component on the target.
> > > Yes, disabling AWT is a nice touch, hopefully it gets integrated into meta-
> > java
> > [Franklin] Maybe for the very specific x11 recipes but pulling the generic gtk+
> > package I'm not sure things will end up being as lucky. The changes
> > mentioned in the link specifically drops the gtk dependency. Also adding X11
> > to your distro features I'm assuming will affect quite a bit of recipes that may
> > pull in additional x11 dependencies that they may have avoided otherwise.
> > 
> > Anyway I was making assumptions so if that isn't occurring in their current
> > builds feel free to ignore my crazy rambling :)

> [Sam] I tried the patch mentioned in tracker link. But I see libxt 
> libxinerama libxrender all depend on x11.
> So not giving anything useful.

But according to the comments, it skips building AWT and removes GTK 
dependencies. Plus the build is faster. Do you want to include it?

I'm wondering if libxt, libxinerama and libxrender require 
DISTRO_FEATURES += "x11"...


> > > > > > > +# Java preferences.
> > > > > > > +#PREFERRED_VERSION_openjdk-7-jre = "25b30-2.3.12"
> > > > > > > +PREFERRED_VERSION_icedtea7-native = "2.1.3"
> > > > > > > +PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"
> > > > > > > +
> > > > > > > +PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
> > > > > > > +
> > > > > > > +PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
> > > > > > > +PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
> > > > > > > +
> > > > > > > +PREFERRED_PROVIDER_jpeg-native = "jpeg-native"
> > > > > > > +#PREFERRED_PROVIDER_jpeg-native = "libjpeg-turbo-native"
> > > > > > > +PREFERRED_PROVIDER_glibc-gconv-iso8859-1 = "nativesdk-eglibc-
> > > locale"
> > > > > > > --
> > > > > > > 1.7.9.5
> > > > > > >
> > > > > > > _______________________________________________
> > > > > > > meta-arago mailing list
> > > > > > > meta-arago@arago-project.org
> > > > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

