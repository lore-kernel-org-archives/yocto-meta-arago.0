Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CB8CD529D9
	for <meta-arago@arago-project.org>;
	Fri, 31 Oct 2014 16:59:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9VGxROP000793
	for <meta-arago@arago-project.org>; Fri, 31 Oct 2014 11:59:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9VGxRD1028222
	for <meta-arago@arago-project.org>; Fri, 31 Oct 2014 11:59:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 31 Oct 2014 11:59:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9VGxQ4e012895;
	Fri, 31 Oct 2014 11:59:26 -0500
Date: Fri, 31 Oct 2014 12:59:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20141031165926.GJ25408@edge>
References: <1414770194-24178-1-git-send-email-a0393906@ti.com>
	<1414770194-24178-5-git-send-email-a0393906@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C75CCD7@DFLE08.ent.ti.com>
	<5453B65D.502@ti.com>
MIME-Version: 1.0
In-Reply-To: <5453B65D.502@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "R,
	Karthik" <karthik.ramanan@ti.com>, "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [for master v3 4/4] weston: v1.3.0 for DRM based backend (additional patches)
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
X-List-Received-Date: Fri, 31 Oct 2014 16:59:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 31, 2014 at 09:48:37PM +0530, Karthik Ramanan wrote:
> On 31-Oct-14 9:38 PM, Cooper Jr., Franklin wrote:
> >>  inherit autotools pkgconfig useradd
> >>
> >>  DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
> >>-DEPENDS += "wayland virtual/mesa virtual/egl pango"
> >>+DEPENDS += "wayland libgbm virtual/egl pango"
> >>+
> >>+COMPATIBLE_MACHINE = "dra7xx-evm"

> >[Franklin] Can all of this work on am57x? If so can we add that machine to 
> >the compatible field or maybe set this to the generic SOC family?
> 
> Franklin,
> 
> Potentially yes, but note that the kernel needs to have all the
> patches for the DRM module for everything to work. So I have very
> conservatively set the compatible machine to dra7xx-evm for moment.
> 
> I also had a look at the x15 board today and it seems like the multiple
> display support is not present on x15 (correct?). So you may only
> need a subset of the patches here.
> 
> In a few weeks, I will try to bring up the weston 1.6.0 with the DRM
> backend. At that point of time we can remove this and may be that
> might be more suited for am57xx.

Karthik,

That would be great if we could consolidate on a single version of Wayland and 
Weston! Please let me know if you need any help with that.

-- 
Denys

