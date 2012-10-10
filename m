Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 05AEB52A10
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 20:08:40 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9AK8eUh007061;
	Wed, 10 Oct 2012 15:08:40 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9AK8ecb013228;
	Wed, 10 Oct 2012 15:08:40 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 10 Oct 2012 15:08:40 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] u-boot_2011.09-psp04.06.00.08: Add
	Arago	specific tweaks
Thread-Index: AQHNpx0gbY3xKgTqmUCNJVmW/Rn58Zey98pg
Date: Wed, 10 Oct 2012 20:08:39 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015925767F@DLEE12.ent.ti.com>
References: <1349898999-485-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349898999-485-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 1/2] u-boot_2011.09-psp04.06.00.08: Add Arago	specific tweaks
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
X-List-Received-Date: Wed, 10 Oct 2012 20:08:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Wednesday, October 10, 2012 2:57 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 1/2] u-boot_2011.09-psp04.06.00.08:
> Add Arago specific tweaks
>=20
> * Set the PSPREL and UVER variable. These variables are used by
> the sourceipk
>   class.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../u-boot/u-boot_2011.09-psp04.06.00.08.bbappend  |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-
> boot_2011.09-psp04.06.00.08.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2011.09-
> psp04.06.00.08.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-
> boot_2011.09-psp04.06.00.08.bbappend
> new file mode 100644
> index 0000000..9871300
> --- /dev/null
> +++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2011.09-
> psp04.06.00.08.bbappend
> @@ -0,0 +1,5 @@
> +PR_append =3D "-arago0"
> +
> +# PSPREL and UVER are used by arago-source-ipk.conf
> +PSPREL =3D "04.06.00.08"
> +UVER =3D "2011.09"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

