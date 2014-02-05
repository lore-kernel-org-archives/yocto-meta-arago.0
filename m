Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8542E529AA
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2014 19:24:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s15JOfUM014209
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 13:24:41 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15JOQAs003590
	for <meta-arago@arago-project.org>; Wed, 5 Feb 2014 13:24:26 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Feb 2014 13:24:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s15JOQ4w006133;
	Wed, 5 Feb 2014 13:24:26 -0600
Date: Wed, 5 Feb 2014 14:24:26 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Etheridge, Darren" <detheridge@ti.com>
Message-ID: <20140205192425.GU18784@edge>
References: <1391197703-29424-1-git-send-email-chase.maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED1015993D972@DLEE11.ent.ti.com>
	<20140204005129.GE18784@edge>
	<CF956B779D819D41BBC043B7082161D547CE0C@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED1015994658F@DLEE11.ent.ti.com>
	<1A80A2FD7F34484786E5DF71F3968B6941E8B45D@DLEE10.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <1A80A2FD7F34484786E5DF71F3968B6941E8B45D@DLEE10.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/2] branding-glsdk: pin to GLSDK libdrm version
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: <meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2014 19:24:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

All,

What is the consensus here? I see that GLSDK uses own libdrm which is based on 
2.4.41, but is fetched from git.ti.com (the recipe is in meta-ti), while for 
AM335x mostly we'd like to update libdrm to the latest upstream... Is use of 
branding an optimal solution here?

-- 
Denys


On Tue, Feb 04, 2014 at 10:43:21AM -0500, Etheridge, Darren wrote:
> Actually devices like AM335x (DRA7x works with existing libdrm version, 
> although 2.4.41 is a year old now):
> 
> Two reasons for needing the version bump:
> 1) tilcdc DRM device is supported (this commit - 
> http://cgit.freedesktop.org/mesa/drm/commit/?id=6e8f868e034531b66a215e4e6d978b43b58b92d0)
> 2) Pixel type of XB24 is supported in modetest (this is the correct pixel 
> ordering for AM335x hardware added here: 
> http://cgit.freedesktop.org/mesa/drm/commit/?id=fa2925aa342158037ef972f3ef095442fb1fe430)
> 
> 
> Darren
> 
> > -----Original Message-----
> > From: Maupin, Chase
> > Sent: Tuesday, February 04, 2014 7:17 AM
> > To: Hingolikar, Mrinmayee; Dmytriyenko, Denys; Etheridge, Darren
> > Cc: meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [PATCH 1/2] branding-glsdk: pin to GLSDK libdrm
> > version
> > 
> > Mrinmayee,
> > 
> > What is in your 2.4.41 version that makes you need to pin there.  I ask
> > because Darren has reported needing a newer version to work properly with
> > devices like DRA7xx.
> > 
> > >-----Original Message-----
> > >From: Hingolikar, Mrinmayee
> > >Sent: Tuesday, February 04, 2014 5:05 AM
> > >To: Dmytriyenko, Denys; Maupin, Chase
> > >Cc: meta-arago@arago-project.org
> > >Subject: RE: [meta-arago] [PATCH 1/2] branding-glsdk: pin to GLSDK
> > >libdrm version
> > >
> > >Hi all,
> > >
> > >The libdrm in GLSDK is based on the 2.4.41 version from upstream.
> > >A preferred version is required since a 2.4.42 version is present
> > >in oe-core.
> > >
> > >
> > >Regards,
> > >Mrinmayee
> > >
> > >> -----Original Message-----
> > >> From: Dmytriyenko, Denys
> > >> Sent: Tuesday, February 04, 2014 6:21 AM
> > >> To: Maupin, Chase
> > >> Cc: meta-arago@arago-project.org; Hingolikar, Mrinmayee
> > >> Subject: Re: [meta-arago] [PATCH 1/2] branding-glsdk: pin to
> > >GLSDK
> > >> libdrm version
> > >>
> > >> Ping
> > >>
> > >> On Fri, Jan 31, 2014 at 07:50:39PM +0000, Maupin, Chase wrote:
> > >> > Mrinmayee,
> > >> >
> > >> > Can you comment on the below need for 2.4.41?
> > >> >
> > >> > >-----Original Message-----
> > >> > >From: Maupin, Chase
> > >> > >Sent: Friday, January 31, 2014 1:48 PM
> > >> > >To: meta-arago@arago-project.org
> > >> > >Cc: Maupin, Chase
> > >> > >Subject: [PATCH 1/2] branding-glsdk: pin to GLSDK libdrm
> > >version
> > >> > >
> > >> > >* The GLSDK prefers to use the 2.4.41 version of libdrm from
> > >> > >  meta-ti so pin that version in the branding file.
> > >> > >
> > >> > >Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> > >> > >---
> > >> > > .../conf/distro/include/branding-glsdk.inc         |    4
> > >++++
> > >> > > 1 file changed, 4 insertions(+)
> > >> > >
> > >> > >diff --git a/meta-arago-distro/conf/distro/include/branding-
> > >> > >glsdk.inc b/meta-arago-distro/conf/distro/include/branding-
> > >> > >glsdk.inc
> > >> > >index d1c30f3..b33b21d 100644
> > >> > >--- a/meta-arago-distro/conf/distro/include/branding-
> > >glsdk.inc
> > >> > >+++ b/meta-arago-distro/conf/distro/include/branding-
> > >glsdk.inc
> > >> > >@@ -2,3 +2,7 @@
> > >> > >
> > >> > > # Use the SDK supported kernel and kernel version
> > >> > > PREFERRED_PROVIDER_virtual/kernel = "linux-ti-glsdk"
> > >> > >+
> > >> > >+# Set the PREFERRED_VERSION of libdrm to the glsdk version
> > >for
> > >> > >the
> > >> > >+# glsdk branded builds
> > >> > >+PREFERRED_VERSION_libdrm = "2.4.41"
> > >> > >--
> > >> > >1.7.9.5
> > >> >
> > >> > _______________________________________________
> > >> > meta-arago mailing list
> > >> > meta-arago@arago-project.org
> > >> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

