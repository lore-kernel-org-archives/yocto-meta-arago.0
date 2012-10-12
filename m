Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4C73A529AA
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 13:45:52 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CDjpb8028049;
	Fri, 12 Oct 2012 08:45:51 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CDjprX013389;
	Fri, 12 Oct 2012 08:45:51 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 12 Oct 2012 08:45:51 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] linux-am335x: Add Arago tweak to
	linux-am335x	recipe
Thread-Index: AQHNqDersoSUqDCxgkueajC5en7Dape1rzFQ
Date: Fri, 12 Oct 2012 13:45:50 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015925C362@DLEE12.ent.ti.com>
References: <1350020378-11548-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1350020378-11548-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] linux-am335x: Add Arago tweak to linux-am335x	recipe
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
X-List-Received-Date: Fri, 12 Oct 2012 13:45:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 12, 2012 12:40 AM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH] linux-am335x: Add Arago tweak to
> linux-am335x recipe
>=20
> * Append linux-am335x recipe to use both the setup-defconfig and
>   copy-defconfig include files.
> * Add KVER variable which is used by the sourceipk class.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../defconfig                                      |    1 +
>  .../linux-am335x_3.2.0-psp04.06.00.08.bbappend     |    9
> +++++++++
>  2 files changed, 10 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-
> am335x-3.2.0-psp04.06.00.08.sdk/defconfig
>  create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-
> am335x_3.2.0-psp04.06.00.08.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-
> 3.2.0-psp04.06.00.08.sdk/defconfig b/meta-arago-distro/recipes-
> kernel/linux/linux-am335x-3.2.0-psp04.06.00.08.sdk/defconfig
> new file mode 100644
> index 0000000..f8cbc03
> --- /dev/null
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-
> psp04.06.00.08.sdk/defconfig
> @@ -0,0 +1 @@
> +use-kernel-config=3Dam335x_evm_defconfig
> diff --git a/meta-arago-distro/recipes-kernel/linux/linux-
> am335x_3.2.0-psp04.06.00.08.bbappend b/meta-arago-distro/recipes-
> kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend
> new file mode 100644
> index 0000000..3f7b524
> --- /dev/null
> +++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-
> psp04.06.00.08.bbappend
> @@ -0,0 +1,9 @@
> +PR_append =3D "-arago0"
> +
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> +
> +# KVER is used by arago-source-ipk.conf
> +KVER =3D "${PV}"
> +
> +require copy-defconfig.inc
> +require setup-defconfig.inc
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

