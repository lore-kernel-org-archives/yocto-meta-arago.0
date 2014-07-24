Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3F91D52A84
	for <meta-arago@arago-project.org>;
	Thu, 24 Jul 2014 18:43:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6OIhJYG030445;
	Thu, 24 Jul 2014 13:43:19 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OIhJ5g015819;
	Thu, 24 Jul 2014 13:43:19 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 24 Jul 2014 13:43:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6OIhJxZ009203;
	Thu, 24 Jul 2014 13:43:19 -0500
Date: Thu, 24 Jul 2014 14:43:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140724184318.GR15788@edge>
References: <1405709522-404-1-git-send-email-denis@denix.org>
	<1405709522-404-7-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C6E9C2E@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6E9C2E@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 07/11] arago.conf: enable Qt5 by default, disable DRM for Weston
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
X-List-Received-Date: Thu, 24 Jul 2014 18:43:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Once we have DRM enabled for 335x, we can use it everywhere. Now 335x defaults 
to fbdev, so it's safer to use fbdev for now, as DRM provides fbdev emulation 
anyway.


On Thu, Jul 24, 2014 at 06:36:58PM +0000, Cooper Jr., Franklin wrote:
> I don't know too much details about Weston but is there a reason to disable 
> DRM Weston for all machines when some may be able to use DRM?
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Friday, July 18, 2014 2:52 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 07/11] arago.conf: enable Qt5 by default,
> > disable DRM for Weston
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/arago.conf | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-
> > distro/conf/distro/arago.conf
> > index def7a42..2686264 100644
> > --- a/meta-arago-distro/conf/distro/arago.conf
> > +++ b/meta-arago-distro/conf/distro/arago.conf
> > @@ -1,3 +1,5 @@
> > +QT_PROVIDER = "qt5"
> > +
> >  # Name and version of the distribution
> >  DISTRO_NAME = "Arago"
> >  DISTRO_VERSION = "2014.06"
> > @@ -20,8 +22,8 @@ NO32LIBS = "0"
> >  DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget
> > usbhost wifi xattr nfs zeroconf pci 3g ipv4 ipv6 pulseaudio
> > ${DISTRO_FEATURES_LIBC}"
> > 
> >  # Set additional distro features to enable Wayland and Weston -
> > DISTRO_FEATURES += "opengl"
> > -PACKAGECONFIG_pn-weston = "kms fbdev"
> > +DISTRO_FEATURES += "opengl pam"
> > +PACKAGECONFIG_pn-weston = "fbdev launch"
> > 
> >  # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
> > PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
> > --
> > 2.0.0
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

