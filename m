Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2809552A9C
	for <meta-arago@arago-project.org>;
	Sat, 23 Aug 2014 04:01:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7N419oK003523
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 23:01:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7N419Gv022176
	for <meta-arago@arago-project.org>; Fri, 22 Aug 2014 23:01:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 22 Aug 2014 23:01:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7N418jW016846;
	Fri, 22 Aug 2014 23:01:08 -0500
Date: Sat, 23 Aug 2014 00:01:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140823040107.GD23523@edge>
References: <1408713923-25284-1-git-send-email-a0393906@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C702016@DFLE08.ent.ti.com>
	<24B88602B5904F49971CAF899152529B7EAB1F@DBDE04.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C702056@DFLE08.ent.ti.com>
	<53F74ED0.3010403@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C7020AA@DFLE08.ent.ti.com>
	<20140823033936.GB23523@edge> <53F80EF0.1070602@ti.com>
MIME-Version: 1.0
In-Reply-To: <53F80EF0.1070602@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "R,
	Karthik" <karthik.ramanan@ti.com>, "Devshatwar,
	Nikhil" <nikhil.nd@ti.com>, "Cooper Jr., Franklin" <fcooper@ti.com>
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
X-List-Received-Date: Sat, 23 Aug 2014 04:01:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Aug 23, 2014 at 09:18:00AM +0530, Karthik Ramanan wrote:
> On 23-Aug-14 9:09 AM, Denys Dmytriyenko wrote:
> >On Fri, Aug 22, 2014 at 02:24:20PM +0000, Cooper Jr., Franklin wrote:
> >>
> >>
> >>>-----Original Message-----
> >>>From: R, Karthik
> >>>Sent: Friday, August 22, 2014 9:08 AM
> >>>To: Cooper Jr., Franklin
> >>>Cc: R, Karthik; meta-arago@arago-project.org; Devshatwar, Nikhil
> >>>Subject: Re: [meta-arago] [PATCH 0/2] Adding support for Wayland for DRM
> >>>backends
> >>>
> >>>On 22-Aug-14 7:34 PM, Cooper Jr., Franklin wrote:
> >>>>
> >>>>
> >>>>>-----Original Message-----
> >>>>>From: R, Karthik
> >>>>>Sent: Friday, August 22, 2014 8:44 AM
> >>>>>To: Cooper Jr., Franklin; meta-arago@arago-project.org
> >>>>>Cc: Devshatwar, Nikhil
> >>>>>Subject: RE: [meta-arago] [PATCH 0/2] Adding support for Wayland for
> >>>>>DRM backends
> >>>>>
> >>>>>* This is good to go into the master branch
> >>>>>* Would be nice if this can be back ported onto dora.
> >>>>[Franklin] I'm assuming you really need this in dora correct? The reason I
> >>>say this is currently your patches as is won't do anything for you since newer
> >>>versions of the wayland recipes exist which means those newer versions will
> >>>be used not this older version. If you really need this in master then I would
> >>>suggest updating these patches against Wayland 1.4/1.5. I have pending
> >>>patches for Wayland 1.5 so if it is accepted I would rebase those patches off
> >>>of that version.
> >>>
> >>>I actually meant daisy and not dora.
> >>>Yes, I agree but when its intended to be used I was thinking about setting the
> >>>PREFERRED_PROVIDER.
> >
> >>[Franklin] Due to issues with Qt 5 we need Wayland 1.5 so going back to 1.3
> >>won't be an option in master atleast for am57x. So unless you absolutely
> >>must use Wayland 1.3 I would recommend at least in Arago master updating to
> >>the newer version of wayland so we can stay on the same version.
> >
> >Franklin,
> >
> >My understanding is that GLSDK team has done extensive testing and validation
> >of the patches against 1.3 and up-porting them now to either 1.4 or 1.5 is out
> >of the question due to time constraints.
> >
> >But I would agree that from maintenance point of view it would be much more
> >desirable to have a single version used by all our products.
> >
> 
> To add, migrating from one version of Wayland to another also has a
> lot of underlying dependencies especially when you consider hardware
> accelerated graphics via DRM. So there are lot of other components
> that we have to add support for and you cannot consider
> Wayland/Weston as a lone component. GLSDK was earlier on Wayland
> 1.0.6 and then moved to 1.3.0, there are dependencies such as SGX
> DDK and DRM (both userspace and kernel) that have to move together.
> 
> If you are only considering minimal wayland support - that is fbdev,
> and not using multiple display/desktop sharing and support for EGL
> etc. then migration is kind of easier.
> 
> This will be useful for those customers who are interested in these
> other features and using DRM.

Thanks, Karthik,

Even though fbdev is still the main engine on other platforms, like am335 and 
am43x, we are slowly moving towards DRM support. And EGL/SGX is a bigger gap 
for sure.

Anyway, what are your plans on migrating to Wayland 1.4 or 1.5 with all the 
corresponding dependencies?

-- 
Denys

