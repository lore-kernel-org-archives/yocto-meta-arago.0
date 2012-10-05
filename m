Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 06962529E1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 15:00:41 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95F0fUx016572;
	Fri, 5 Oct 2012 10:00:41 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95F0fNj032298;
	Fri, 5 Oct 2012 10:00:41 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 10:00:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Thread-Topic: [meta-arago] [PATCH] gst-plugins-bad: Remove gtk+ dependencys
Thread-Index: AQHNosKQy1hCt/F0XUibQNAuRlHFF5eqseQggABsfID//7BKYA==
Date: Fri, 5 Oct 2012 15:00:40 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101592486C6@DLEE12.ent.ti.com>
References: <1349420175-22159-1-git-send-email-fcooper@ti.com>,
	<7D46E86EC0A8354091174257B2FED10159248143@DLEE12.ent.ti.com>
	<72FDF4EA-CA62-4179-AD66-9C6ADCA650E6@ti.com>
In-Reply-To: <72FDF4EA-CA62-4179-AD66-9C6ADCA650E6@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] gst-plugins-bad: Remove gtk+ dependencys
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
X-List-Received-Date: Fri, 05 Oct 2012 15:00:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Friday, October 05, 2012 9:45 AM
> To: Maupin, Chase
> Cc: Franklin S. Cooper Jr; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] gst-plugins-bad: Remove gtk+
> dependencys
>=20
> I did need two plugins that weren't being built but the main
> reason I did this is to build as much plugins as possible instead
> of restricting it to some fix list. As a SDK it makes sense to
> provide as much plugins as possible. We took the same approach in
> oe-classic.
>=20
> So with that being said I am not sure what else u want me to add
> to that comment.

If there were two plugins that were "must haves" then it would be nice to k=
now what they were.  This helps to answer the question in the future of exa=
ctly why did we need to turn everything on.

>=20
> On Oct 5, 2012, at 8:19 AM, "Maupin, Chase" <chase.maupin@ti.com>
> wrote:
>=20
> >
> > Can you clarify a bit why you needed to remove the --with-
> plugins settings?  i.e. which plugins were not getting built that
> you needed?  A more detailed comment would be useful.
> >
> >> -----Original Message-----
> >> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> >> Sent: Friday, October 05, 2012 1:56 AM
> >> To: meta-arago@arago-project.org
> >> Subject: [meta-arago] [PATCH] gst-plugins-bad: Remove gtk+
> >> dependencys
> >>
> >> * Disable rsvg and remove dependency to prevent gtk+ from
> being
> >> pulled in.
> >> * Remove the --with-plugins list to ensure all plugins are
> built.
> >>
> >> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >> ---
> >> .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    8
> >> ++++++++
> >> 1 files changed, 8 insertions(+), 0 deletions(-)
> >> create mode 100644 meta-arago-distro/recipes-
> >> multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> >>
> >> diff --git a/meta-arago-distro/recipes-
> multimedia/gstreamer/gst-
> >> plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-
> >> multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> >> new file mode 100644
> >> index 0000000..52739e4
> >> --- /dev/null
> >> +++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-
> plugins-
> >> bad_0.10.23.bbappend
> >> @@ -0,0 +1,8 @@
> >> +PR_append =3D "-arago0"
> >> +
> >> +# Disable rsvg which caused gtk+ to be pulled in
> >> +DEPENDS :=3D "${@oe_filter_out('librsvg','${DEPENDS}', d)}"
> >> +EXTRA_OECONF +=3D "--disable-rsvg"
> >> +
> >> +# Build all the various plugins
> >> +EXTRA_OECONF :=3D "${@oe_filter_out('--with-
> >>
> plugins=3Dmusicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECO
> >> NF}', d)}"
> >> --
> >> 1.7.0.4
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

