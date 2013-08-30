Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DE5D352A7D
	for <meta-arago@arago-project.org>;
	Fri, 30 Aug 2013 15:03:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7UF3jjs015979
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2013 10:03:45 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7UF3jNk022825
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2013 10:03:45 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 30 Aug 2013 10:03:45 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/6 v2] gst-plugins-bad: Use new
	PACKAGECONFIG	feature
Thread-Index: AQHOo1o+jWOhK64FK0OBmkPNVJjgvZmt24sw
Date: Fri, 30 Aug 2013 15:03:45 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596F8113@DLEE11.ent.ti.com>
References: <1377633092-29917-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1377633092-29917-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/6 v2] gst-plugins-bad: Use new PACKAGECONFIG	feature
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
X-List-Received-Date: Fri, 30 Aug 2013 15:03:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, August 27, 2013 2:51 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 1/6 v2] gst-plugins-bad: Use new
>PACKAGECONFIG feature
>
>* Recent patch in oe-core allows certain features to be enabled or
>disabled
>  based on the PACKAGECONFIG variable.
>* Use this variable which will obsolete alot of the code in this
>bbappend while
>  achieving the same result.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
>Version 2 changes:
>Update patch tailored to recent change to base recipe in oe-core.
>
>
> .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |   14 ++-----
>-------
> 1 files changed, 2 insertions(+), 12 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-
>plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-
>multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
>index 8ae8050..8cee785 100644
>--- a/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-
>bad_0.10.23.bbappend
>+++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-
>bad_0.10.23.bbappend
>@@ -1,21 +1,11 @@
>-PR_append =3D "-arago3"
>+PR_append =3D "-arago4"
>
> # look for files in this layer first
> FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>
>-# Disable rsvg which caused gtk+ to be pulled in
>-DEPENDS :=3D "${@oe_filter_out('librsvg','${DEPENDS}', d)}"
>-EXTRA_OECONF +=3D "--disable-rsvg"
>-
>-# Remove the restriction of which plugins are built. Previously
>fbdevsink
>-# was not built which is needed by the gstreamer demos included
>in the SDK.
>-EXTRA_OECONF :=3D "${@oe_filter_out('--with-
>plugins=3Dmusicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECON
>F}', d)}"

I'm assuming that these are removed because of the COMMERCIAL filter settin=
g (I don't remember the full variable off the top of my head)

Should this be called out in the commit message?

>-
> SRC_URI +=3D "file://0001-gstfbdevsink-Fix-depth-value-for-
>GST_VIDEO_CAPS_RGB_.patch"
>
>-# Add faad has a dependency to insure gst-plugins-bad-faad is
>built.
>-DEPENDS +=3D "faad2"
>-RDEPENDS_${PN}-faad +=3D "libfaad"
>+PACKAGECONFIG =3D "bzip curl faad"

I have some question here.  You changed the DEPENDS to faad instead of faad=
2.  I see in base.bbclass the DEPENDS magic based on PACKAGECONFIG, but the=
 RDEPENDS setting there didn't look like it would add libfaad.  Maybe I am =
just not reading it right but did you check that?

Also, why add curl and bzip too?  If needed should that be a separate patch=
 or at least updated in the commit message?
>
> # Disable features that have potential commercial licensing
>restrictions
> EXTRA_OECONF +=3D "\
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

