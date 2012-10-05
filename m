Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5427F529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 13:15:39 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95DFcjI003480;
	Fri, 5 Oct 2012 08:15:38 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95DFcb5011559;
	Fri, 5 Oct 2012 08:15:38 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 08:15:38 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] gconf: Remove gtk dependency
Thread-Index: AQHNosJj95kMh7Vb1EOOHB+SSiTBT5eqsW+A
Date: Fri, 5 Oct 2012 13:15:36 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015924807B@DLEE12.ent.ti.com>
References: <1349420072-21985-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349420072-21985-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] gconf: Remove gtk dependency
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
X-List-Received-Date: Fri, 05 Oct 2012 13:15:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:55 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] gconf: Remove gtk dependency
>=20
> * This patch mimics the patch "gconf: Disable gtk support" that
> has been
>   applied to oe-core master branch. This patch can be removed
> once the
>   patch mentioned above has been applied to the denzil branch.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-gnome/gnome/gconf_3.2.3.bbappend       |   14
> ++++++++++++++
>  1 files changed, 14 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-
> gnome/gnome/gconf_3.2.3.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-
> gnome/gnome/gconf_3.2.3.bbappend b/meta-arago-distro/recipes-
> gnome/gnome/gconf_3.2.3.bbappend
> new file mode 100644
> index 0000000..ce85ced
> --- /dev/null
> +++ b/meta-arago-distro/recipes-gnome/gnome/gconf_3.2.3.bbappend
> @@ -0,0 +1,14 @@
> +PR_append =3D "-arago0"
> +
> +# The below changes are meant to mimic the patch
> +# "gconf: Disable gtk support" commit
> 6facee8443966b646cd1e72f14ae13e58a13f621
> +# The patch mentioned above has already been applied to master
> and has been
> +# requested to be pulled into denzil. The below changes can be
> removed once
> +# that patch has been applied to the denzil branch
> +
> +DEPENDS :=3D "${@oe_filter_out('gtk+','${DEPENDS}', d)}"
> +EXTRA_OECONF +=3D "--disable-gtk"
> +
> +# Clear GTKOECONF variable to ensure gconf isn't configured to
> use gtk
> +GTKOECONF =3D ""
> +GTKOECONF_virtclass-native =3D ""
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

