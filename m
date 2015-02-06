Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C1DCF529A4
	for <meta-arago@arago-project.org>;
	Fri,  6 Feb 2015 20:42:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t16Kgj0b002897
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 14:42:45 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t16Kgic6007289
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 14:42:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Feb 2015 14:42:43 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t16KghKa006507;
	Fri, 6 Feb 2015 14:42:43 -0600
Date: Fri, 6 Feb 2015 15:42:43 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150206204243.GD12366@edge>
References: <1423248896-20699-1-git-send-email-sam.nelson@ti.com>
	<20150206185948.GA12366@edge>
	<4F9216F96E5DF9428610502835A9F4905811091D@DLEE11.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7FB1BB@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C7FB1BB@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Fri, 06 Feb 2015 20:42:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 06, 2015 at 03:32:42PM -0500, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Nelson, Sam
> > Sent: Friday, February 06, 2015 1:51 PM
> > To: Dmytriyenko, Denys
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
> > include file
> > 
> > 
> > 
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Friday, February 06, 2015 2:00 PM
> > > To: Nelson, Sam
> > > Cc: meta-arago@arago-project.org
> > > Subject: Re: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK
> > > branding include file
> > >
> > > On Fri, Feb 06, 2015 at 01:54:56PM -0500, Sam Nelson wrote:
> > > > - To control preferred version and providers for MCSDK
> > > >
> > > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > > ---
> > > >  .../conf/distro/include/branding-mcsdk.inc         |   20
> > > ++++++++++++++++++++
> > > >  1 file changed, 20 insertions(+)
> > > >  create mode 100644 meta-arago-distro/conf/distro/include/branding-
> > > mcsdk.inc
> > > >
> > > > diff --git
> > > > a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > > new file mode 100644
> > > > index 0000000..d023b67
> > > > --- /dev/null
> > > > +++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > > @@ -0,0 +1,20 @@
> > > > +# MCSDK branding configuration
> > > > +
> > > > +# Use the MCSDK supported versions
> > > > +PREFERRED_VERSION_libnl = "3.2.24"
> > > > +
> > > > +DISTRO_FEATURES += "x11 opengl"
> > >
> > > I assume x11 is to make Java happy? I don't think you have x11 env...
> > >
> > [Sam] Yes it was to make Java happy.
> [Franklin] I thought I remembered that the mcsdk were meant for headless devices.
> If so I would recommend taking a look at the discussion here:
> https://github.com/woglinde/meta-java/issues/45
> 
> Pulling in x11 and gtk seems painful especially since you're not using it.
> Anyway it's something to look into if it is indeed meant for headless devices.
> But its ur branding file so my above comments aren't meant to block this patch from being accepted.

Well, as explained in that tracker link you provided, pulling X libs for the 
build doesn't necessary mean you'll end up with X component on the target. 
Yes, disabling AWT is a nice touch, hopefully it gets integrated into meta-java


> > > > +# Java preferences.
> > > > +#PREFERRED_VERSION_openjdk-7-jre = "25b30-2.3.12"
> > > > +PREFERRED_VERSION_icedtea7-native = "2.1.3"
> > > > +PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"
> > > > +
> > > > +PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
> > > > +
> > > > +PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
> > > > +PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
> > > > +
> > > > +PREFERRED_PROVIDER_jpeg-native = "jpeg-native"
> > > > +#PREFERRED_PROVIDER_jpeg-native = "libjpeg-turbo-native"
> > > > +PREFERRED_PROVIDER_glibc-gconv-iso8859-1 = "nativesdk-eglibc-locale"
> > > > --
> > > > 1.7.9.5
> > > >
> > > > _______________________________________________
> > > > meta-arago mailing list
> > > > meta-arago@arago-project.org
> > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

