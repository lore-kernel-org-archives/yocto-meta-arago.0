Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 0A53D529A7
	for <meta-arago@arago-project.org>;
	Fri,  1 May 2015 16:13:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t41GDkQE031965
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 11:13:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41GDjXg010657
	for <meta-arago@arago-project.org>; Fri, 1 May 2015 11:13:45 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 1 May 2015 11:13:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t41GDjk9026783;
	Fri, 1 May 2015 11:13:45 -0500
Date: Fri, 1 May 2015 12:13:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150501161344.GA29290@edge>
References: <1480745164.301.1430449311116.JavaMail.jenkins@puget>
	<20150501135817.GW29290@edge> <55438D20.6020203@ti.com>
	<20150501151906.GY29290@edge>
	<4B26FB5A64EBA14C87266869E037F958141293D2@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C881CD5@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C881CD5@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [nightly] Core TISDK 2015.04 build 2015-04-30_22-00-51
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
X-List-Received-Date: Fri, 01 May 2015 16:13:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

So, I'm still a bit confused - due to SGX/GLES/Graphics lack of DRM support, 
we enable DRM in the kernel and also enable fbdev emulation on top of that. So 
any userspace apps that only support fbdev (3D GFX) can still function fine 
by utilizing /dev/fb0 instead of making direct DRM calls. But, the system 
still supports full DRM. What prevents other apps from using DRM directly?
Or am I misunderstanding it?

-- 
Denys


On Fri, May 01, 2015 at 11:38:10AM -0400, Cooper Jr., Franklin wrote:
> All platforms are using DRM.
> 
> However, am335x and am437x are using what is called FBDEV emulation. Fbdev 
> is an emulation layer that routes traditional fbdev calls to DRM. From a 
> userspace perspective it appears that 335x and am437x are using fbdev even 
> though technically they are using drm.
> 
> The reason why we are using fbdev emulation and not straight drm is due to 
> the lack of support of drm in our graphics packages.
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> > Sent: Friday, May 01, 2015 10:31 AM
> > To: Dmytriyenko, Denys
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [nightly] Core TISDK 2015.04 build 2015-04-30_22-
> > 00-51
> > 
> > Does this mean drm is supported by all platforms, and "libdrm" can be a
> > platform-agnostic dependency?
> > 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, May 01, 2015 11:19 AM
> > To: Stiffler, Jacob
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [nightly] Core TISDK 2015.04 build 2015-04-30_22-
> > 00-51
> > 
> > I think there's some confusion... Does this link help?
> > 
> > http://processors.wiki.ti.com/index.php/Linux_Core_LCD_Controller_User_
> > Guide
> > 
> > --
> > Denys
> > 
> > 
> > On Fri, May 01, 2015 at 10:26:40AM -0400, Jacob Stiffler wrote:
> > > I see the error:
> > >
> > > make[3]: *** No rule to make target
> > > `../../gst-libs/gst/drm/libgstdrm-1.0.la', needed by
> > > `libgstwaylandsink.la'.  Stop.
> > > make[3]: *** Waiting for unfinished jobs....
> > >
> > > Looks like drm is needed for waylandsink. But I thought am3/am4 did
> > > not have DRM?
> > >
> > >
> > >
> > >
> > > On 5/1/2015 9:58 AM, Denys Dmytriyenko wrote:
> > > >Jake,
> > > >
> > > >gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.
> > > >
> > > >
> > > >
> > > >_______________________________________________
> > > >meta-arago mailing list
> > > >meta-arago@arago-project.org
> > > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >
> > >
> > > On 5/1/2015 9:58 AM, Denys Dmytriyenko wrote:
> > > >Jake,
> > > >
> > > >gstreamer1.0-plugins-bad with your patch broke for am3/am4 platforms.
> > > >
> > > >
> > > >
> > > >_______________________________________________
> > > >meta-arago mailing list
> > > >meta-arago@arago-project.org
> > > >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

