Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DEF6F529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 13:16:07 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95DG7XM016332;
	Fri, 5 Oct 2012 08:16:07 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95DG7i4012134;
	Fri, 5 Oct 2012 08:16:07 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 08:16:07 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] gst-plugins-good: Remove gtk dependency
Thread-Index: AQHNosJvyNLm2zJLTEytr4IgN1G6VZeqsYuw
Date: Fri, 5 Oct 2012 13:16:06 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101592480AD@DLEE12.ent.ti.com>
References: <1349420120-22075-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349420120-22075-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] gst-plugins-good: Remove gtk dependency
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
X-List-Received-Date: Fri, 05 Oct 2012 13:16:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:55 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] gst-plugins-good: Remove gtk
> dependency
>=20
> * This mimics the patch "gst-plugins-good: disable (uninstalled)
> examples"
>   that has been applied to oe-core master branch. This patch can
> be removed
>   once the patch mentioned above has been applied to the denzil
> branch.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../gstreamer/gst-plugins-good_0.10.31.bbappend    |   12
> ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-
> multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-
> plugins-good_0.10.31.bbappend b/meta-arago-distro/recipes-
> multimedia/gstreamer/gst-plugins-good_0.10.31.bbappend
> new file mode 100644
> index 0000000..6f2a76c
> --- /dev/null
> +++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-
> good_0.10.31.bbappend
> @@ -0,0 +1,12 @@
> +PR_append =3D "-arago0"
> +
> +# The below changes are meant to mimic the patch
> +# "gst-plugins-good: disable (uninstalled) examples" commit
> +# eef5cca4f364545759d8cf624f38e3cd6e8fd295 The patch mentioned
> above has
> +# already been applied to master and has been requested to be
> pulled into
> +# denzil. The below changes can be removed once that patch has
> been applied
> +# to the denzil branch
> +
> +DEPENDS :=3D "${@oe_filter_out('gtk+','${DEPENDS}', d)}"
> +
> +EXTRA_OECONF +=3D "--disable-examples"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

