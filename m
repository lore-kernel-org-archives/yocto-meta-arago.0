Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C224D52A5A
	for <meta-arago@arago-project.org>;
	Fri,  6 Feb 2015 21:21:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t16LLrNC014575
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 15:21:53 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t16LLpvv001502
	for <meta-arago@arago-project.org>; Fri, 6 Feb 2015 15:21:52 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Feb 2015 15:21:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t16LLoov015620;
	Fri, 6 Feb 2015 15:21:51 -0600
Date: Fri, 6 Feb 2015 16:21:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20150206212148.GE12366@edge>
References: <1423248896-20699-1-git-send-email-sam.nelson@ti.com>
	<20150206203038.GB12366@edge>
	<4F9216F96E5DF9428610502835A9F49058110A2A@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49058110A2A@DLEE11.ent.ti.com>
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
X-List-Received-Date: Fri, 06 Feb 2015 21:21:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 06, 2015 at 04:04:27PM -0500, Nelson, Sam wrote:
> 
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, February 06, 2015 3:31 PM
> > To: Nelson, Sam
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [PATCH] branding-mcsdk: Adding MCSDK branding
> > include file
> > 
> > On Fri, Feb 06, 2015 at 01:54:56PM -0500, Sam Nelson wrote:
> > > - To control preferred version and providers for MCSDK
> > >
> > > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > > ---
> > >  .../conf/distro/include/branding-mcsdk.inc         |   20
> > ++++++++++++++++++++
> > >  1 file changed, 20 insertions(+)
> > >  create mode 100644 meta-arago-distro/conf/distro/include/branding-
> > mcsdk.inc
> > >
> > > diff --git a/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > new file mode 100644
> > > index 0000000..d023b67
> > > --- /dev/null
> > > +++ b/meta-arago-distro/conf/distro/include/branding-mcsdk.inc
> > > @@ -0,0 +1,20 @@
> > > +# MCSDK branding configuration
> > > +
> > > +# Use the MCSDK supported versions
> > > +PREFERRED_VERSION_libnl = "3.2.24"
> > > +
> > > +DISTRO_FEATURES += "x11 opengl"
> > > +
> > > +# Java preferences.
> > > +#PREFERRED_VERSION_openjdk-7-jre = "25b30-2.3.12"
> > > +PREFERRED_VERSION_icedtea7-native = "2.1.3"
> > > +PREFERRED_PROVIDER_openjdk-7-jre = "openjdk-7-jre"
> > > +
> > > +PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
> > > +
> > > +PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
> > > +PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
> > > +
> > > +PREFERRED_PROVIDER_jpeg-native = "jpeg-native"
> > > +#PREFERRED_PROVIDER_jpeg-native = "libjpeg-turbo-native"
> > > +PREFERRED_PROVIDER_glibc-gconv-iso8859-1 = "nativesdk-eglibc-locale"
> > 
> > BTW, I don't think this last line is correct ^^^
> [Sam] 
> Are you saying this is not the right option to choose?
> I got :
> NOTE: multiple providers are available for runtime glibc-gconv-iso8859-1 
> (eglibc-locale, nativesdk-eglibc-locale, external-arago-toolchain)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match 
> glibc-gconv-iso8859-1

Hmm, I think that the external Linaro toolchain recipe should be fixed to 
provide that as well. But for now selecting eglibc-locale is more correct than 
nativesdk-eglibc-locale, even though you'll end up pulling and building eglibc

-- 
Denys

