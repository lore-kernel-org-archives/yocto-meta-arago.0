Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 43685529B2
	for <meta-arago@arago-project.org>;
	Fri, 20 Jul 2012 19:19:59 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6KJJwPh027119
	for <meta-arago@arago-project.org>; Fri, 20 Jul 2012 14:19:58 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6KJJwnU024867
	for <meta-arago@arago-project.org>; Fri, 20 Jul 2012 14:19:58 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Fri, 20 Jul 2012 14:19:58 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] qt4-embedded: Update version to 4.8.1
Thread-Index: AQHNZgmPkPA427Pe60a+6rHrfS0o/Zcy1ZcA//+3CCA=
Date: Fri, 20 Jul 2012 19:19:57 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C274372@DFLE30.ent.ti.com>
References: <1342741925-3980-1-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED1015914C6AB@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015914C6AB@DLEE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 1/2] qt4-embedded: Update version to 4.8.1
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
X-List-Received-Date: Fri, 20 Jul 2012 19:20:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can you point out which section looks managed and clarify what you mean by =
having a correct newlines? I will double check but by looking at this email=
 I didn't see any issue.

-----Original Message-----
From: Maupin, Chase=20
Sent: Friday, July 20, 2012 1:39 PM
To: Cooper Jr., Franklin; meta-arago@arago-project.org
Subject: RE: [meta-arago] [PATCH 1/2] qt4-embedded: Update version to 4.8.1

This patch looks slightly mangled but maybe that is my mail client.  The go=
al is correct but the line returns look wrong.  Can you verify your patch h=
as correct newlines?  Aside from that=20

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
> bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> Sent: Thursday, July 19, 2012 6:52 PM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH 1/2] qt4-embedded: Update version to
> 4.8.1
>=20
> * Updating qt4-embedded version from 4.8.0 to 4.8.1
>=20
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
>  .../recipes-qt/qt4/qt4-embedded_4.8.0.bbappend     |    5 -----
>  .../recipes-qt/qt4/qt4-embedded_4.8.1.bbappend     |    5 +++++
>  2 files changed, 5 insertions(+), 5 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-qt/qt4/qt4-
> embedded_4.8.0.bbappend
>  create mode 100644 meta-arago-distro/recipes-qt/qt4/qt4-
> embedded_4.8.1.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-
> embedded_4.8.0.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-
> embedded_4.8.0.bbappend
> deleted file mode 100644
> index 462a746..0000000
> --- a/meta-arago-distro/recipes-qt/qt4/qt4-
> embedded_4.8.0.bbappend
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
> -# For our distribution purposes we only use LGPLv2.1
> -LICENSE =3D "LGPLv2.1"
> -
> -PR_append =3D "-arago1"
> diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-
> embedded_4.8.1.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-
> embedded_4.8.1.bbappend
> new file mode 100644
> index 0000000..a2dc984
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt4/qt4-
> embedded_4.8.1.bbappend
> @@ -0,0 +1,5 @@
> +# Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
> +# For our distribution purposes we only use LGPLv2.1
> +LICENSE =3D "LGPLv2.1"
> +
> +PR_append =3D "-arago0"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

