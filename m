Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CE54F52972
	for <meta-arago@arago-project.org>;
	Sat, 23 Aug 2014 03:39:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7N3dcWE024078
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 22:39:38 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7N3dcwg017911
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 22:39:38 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 22 Aug 2014 22:39:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7N3dbc5003137;
	Fri, 22 Aug 2014 22:39:37 -0500
Date: Fri, 22 Aug 2014 23:39:36 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20140823033936.GB23523@edge>
References: <1408713923-25284-1-git-send-email-a0393906@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C702016@DFLE08.ent.ti.com>
	<24B88602B5904F49971CAF899152529B7EAB1F@DBDE04.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C702056@DFLE08.ent.ti.com>
	<53F74ED0.3010403@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7020AA@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C7020AA@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "R,
	Karthik" <karthik.ramanan@ti.com>, "Devshatwar, Nikhil" <nikhil.nd@ti.com>
Subject: Re: [PATCH 0/2] Adding support for Wayland for DRM backends
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
X-List-Received-Date: Sat, 23 Aug 2014 03:39:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 22, 2014 at 02:24:20PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: R, Karthik
> > Sent: Friday, August 22, 2014 9:08 AM
> > To: Cooper Jr., Franklin
> > Cc: R, Karthik; meta-arago@arago-project.org; Devshatwar, Nikhil
> > Subject: Re: [meta-arago] [PATCH 0/2] Adding support for Wayland for DRM
> > backends
> > 
> > On 22-Aug-14 7:34 PM, Cooper Jr., Franklin wrote:
> > >
> > >
> > >> -----Original Message-----
> > >> From: R, Karthik
> > >> Sent: Friday, August 22, 2014 8:44 AM
> > >> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> > >> Cc: Devshatwar, Nikhil
> > >> Subject: RE: [meta-arago] [PATCH 0/2] Adding support for Wayland for
> > >> DRM backends
> > >>
> > >> * This is good to go into the master branch
> > >> * Would be nice if this can be back ported onto dora.
> > > [Franklin] I'm assuming you really need this in dora correct? The reason I
> > say this is currently your patches as is won't do anything for you since newer
> > versions of the wayland recipes exist which means those newer versions will
> > be used not this older version. If you really need this in master then I would
> > suggest updating these patches against Wayland 1.4/1.5. I have pending
> > patches for Wayland 1.5 so if it is accepted I would rebase those patches off
> > of that version.
> > 
> > I actually meant daisy and not dora.
> > Yes, I agree but when its intended to be used I was thinking about setting the
> > PREFERRED_PROVIDER.

> [Franklin] Due to issues with Qt 5 we need Wayland 1.5 so going back to 1.3 
> won't be an option in master atleast for am57x. So unless you absolutely 
> must use Wayland 1.3 I would recommend at least in Arago master updating to 
> the newer version of wayland so we can stay on the same version.

Franklin,

My understanding is that GLSDK team has done extensive testing and validation 
of the patches against 1.3 and up-porting them now to either 1.4 or 1.5 is out 
of the question due to time constraints.

But I would agree that from maintenance point of view it would be much more 
desirable to have a single version used by all our products.

-- 
Denys


> > >> Are you suggesting that this recipe be made machine specific because
> > >> of the dependency on omapdrm?
> > > [Franklin] Yes
> > >> Am not sure about the machine names used for the other catalog
> > >> derivatives of dra7xx or other SoCs that use omapdrm, it would have
> > >> to include those machine names as well. Any pointers on that?
> > > [Franklin] From my understanding the kernel for am57xx-evm and dra7xx-
> > evm aren't the same. There are probably patches missing between these
> > kernels that these Weston/Wayland patches depend on. So applying patches
> > for am57xx-evm would probably cause problems. Until these kernel patches
> > are pushed to the integration tree so they are available for am57xx-evm I
> > would just limit it to dra7xx-evm. It would be simple to include am57xx-evm
> > at a later time.
> > >>
> > 
> > Ok, I have had some discussion on this topic with Chase. So he might be able
> > to give some pointers here.
> > 
> > >> I will take care of mentioning the branch in the email header if its
> > >> specific to a particular branch.
> > >> Thanks for that pointer.
> > >>
> > >> Regards
> > >> Karthik
> > >>
> > >> -----Original Message-----
> > >> From: Cooper Jr., Franklin
> > >> Sent: Friday, August 22, 2014 7:05 PM
> > >> To: R, Karthik; meta-arago@arago-project.org
> > >> Cc: Devshatwar, Nikhil
> > >> Subject: RE: [meta-arago] [PATCH 0/2] Adding support for Wayland for
> > >> DRM backends
> > >>
> > >> I'm assuming this isn't for master since currently daisy in oe-core
> > >> is using wayland 1.4.0. Which maintenance branch is this specifically
> > >> for and it will be helpful in the patch title that you specific the
> > >> branch these patches are meant for.
> > >>
> > >> For example if these patches are for dora:
> > >> [meta-arago][dora] [PATCH 0/2] Adding support for Wayland for DRM
> > >> backends
> > >>
> > >> Also since your mentioning omapdrm please make sure these drm patches
> > >> are only applied on devices using omapdrm which I think as of now is
> > >> only dra7xx-evm
> > >>
> > >>> -----Original Message-----
> > >>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > >>> bounces@arago-project.org] On Behalf Of R, Karthik
> > >>> Sent: Friday, August 22, 2014 8:25 AM
> > >>> To: meta-arago@arago-project.org
> > >>> Cc: Devshatwar, Nikhil
> > >>> Subject: [meta-arago] [PATCH 0/2] Adding support for Wayland for DRM
> > >>> backends
> > >>>
> > >>> There are some issues with the current omapdrm (kernel driver) and
> > >>> related dependencies on the TI platform such as dra7xx.
> > >>>
> > >>> Weston version 1.3.0 has been very highly tested and is currently
> > >>> shipping to customers who are using wayland with DRM backend. This
> > >>> patch set brings in support for Weston and also includes patches
> > >>> that help resolve some important issues in the Weston. These issues
> > >>> are specific to TI platforms and cannot be submitted upstream.
> > >>>
> > >>> Karthik Ramanan (2):
> > >>>    wayland: add support for version 1.3.0 for drm backend
> > >>>    wayland: adding support for weston 1.3.0 for DRM backend
> > >>>
> > >>>   ...tor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch |   26 ++++
> > >>>   ...e-Include-option-to-search-in-include-drm.patch |   47 +++++++
> > >>>   ...urce-prevent-input-disable-during-repaint.patch |   34 +++++
> > >>>   .../0005-temp-hack-to-enable-weston-1.3.patch      |   33 +++++
> > >>>   .../0006-weston-drm-Enable-multiple-displays.patch |   43 ++++++
> > >>>   .../recipes-graphics/wayland/just-scanner.patch    |   36 +++++
> > >>>   .../recipes-graphics/wayland/pattern.png           |  Bin 0 -> 1846 bytes
> > >>>   meta-arago-extras/recipes-graphics/wayland/profile |    9 ++
> > >>>   .../recipes-graphics/wayland/terminal.png          |  Bin 0 -> 1005 bytes
> > >>>   .../recipes-graphics/wayland/wayland.inc           |    5 +
> > >>>   .../recipes-graphics/wayland/wayland_1.3.0.bb      |   34 +++++
> > >>>   .../recipes-graphics/wayland/weston.desktop        |   91 ++++++++++++
> > >>>   .../recipes-graphics/wayland/weston.png            |  147
> > >>> +++++++++++++++++++
> > >>>   .../recipes-graphics/wayland/weston_1.3.0.bb       |  148
> > >>> ++++++++++++++++++++
> > >>>   14 files changed, 653 insertions(+)
> > >>>   create mode 100755
> > >>> meta-arago-extras/recipes-graphics/wayland/0001-
> > >>> compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
> > >>>   create mode 100755
> > >>> meta-arago-extras/recipes-graphics/wayland/0002-
> > >>> Makefile-Include-option-to-search-in-include-drm.patch
> > >>>   create mode 100644
> > >>> meta-arago-extras/recipes-graphics/wayland/0003-
> > >>> input-source-prevent-input-disable-during-repaint.patch
> > >>>   create mode 100644
> > >>> meta-arago-extras/recipes-graphics/wayland/0005-
> > >>> temp-hack-to-enable-weston-1.3.patch
> > >>>   create mode 100644
> > >>> meta-arago-extras/recipes-graphics/wayland/0006-
> > >>> weston-drm-Enable-multiple-displays.patch
> > >>>   create mode 100644
> > >>> meta-arago-extras/recipes-graphics/wayland/just-
> > >>> scanner.patch
> > >>>   create mode 100644 meta-arago-extras/recipes-
> > >>> graphics/wayland/pattern.png  create mode 100644
> > >>> meta-arago-extras/recipes-graphics/wayland/profile
> > >>>   create mode 100644 meta-arago-extras/recipes-
> > >>> graphics/wayland/terminal.png  create mode 100644
> > >>> meta-arago-extras/recipes- graphics/wayland/wayland.inc  create mode
> > >>> 100644 meta-arago-extras/recipes- graphics/wayland/wayland_1.3.0.bb
> > >>> create mode 100644 meta-arago-extras/recipes-
> > >>> graphics/wayland/weston.desktop  create mode 100644
> > >>> meta-arago-extras/recipes- graphics/wayland/weston.png  create mode
> > >>> 100644 meta-arago-extras/recipes- graphics/wayland/weston_1.3.0.bb
> > >>>
> > >>> --
> > >>> 1.7.9.5
> > >>>
> > >>> _______________________________________________
> > >>> meta-arago mailing list
> > >>> meta-arago@arago-project.org
> > >>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

