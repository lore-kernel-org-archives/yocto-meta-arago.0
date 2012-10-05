Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A2D90529D2
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 13:19:01 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95DJ01p000471;
	Fri, 5 Oct 2012 08:19:00 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95DJ0N7014793;
	Fri, 5 Oct 2012 08:19:00 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 08:19:00 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] gst-plugins-bad: Remove gtk+ dependencys
Thread-Index: AQHNosKQy1hCt/F0XUibQNAuRlHFF5eqseQg
Date: Fri, 5 Oct 2012 13:18:59 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159248143@DLEE12.ent.ti.com>
References: <1349420175-22159-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349420175-22159-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 05 Oct 2012 13:19:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Can you clarify a bit why you needed to remove the --with-plugins settings?=
  i.e. which plugins were not getting built that you needed?  A more detail=
ed comment would be useful.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:56 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] gst-plugins-bad: Remove gtk+
> dependencys
>=20
> * Disable rsvg and remove dependency to prevent gtk+ from being
> pulled in.
> * Remove the --with-plugins list to ensure all plugins are built.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    8
> ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-
> multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-
> plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-
> multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
> new file mode 100644
> index 0000000..52739e4
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-
> bad_0.10.23.bbappend
> @@ -0,0 +1,8 @@
> +PR_append =3D "-arago0"
> +
> +# Disable rsvg which caused gtk+ to be pulled in
> +DEPENDS :=3D "${@oe_filter_out('librsvg','${DEPENDS}', d)}"
> +EXTRA_OECONF +=3D "--disable-rsvg"
> +
> +# Build all the various plugins
> +EXTRA_OECONF :=3D "${@oe_filter_out('--with-
> plugins=3Dmusicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECO
> NF}', d)}"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

