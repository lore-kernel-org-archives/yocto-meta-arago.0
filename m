Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A5AC15298F
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2014 22:44:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0VMiplv007796;
	Fri, 31 Jan 2014 16:44:51 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VMiotY002627;
	Fri, 31 Jan 2014 16:44:51 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 31 Jan 2014 16:44:50 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] base-files: pre-create /run symlink to
	point	to /var/run
Thread-Index: AQHPHsCDAnXTI4PrpkyNj4qUijphdpqfboQw
Date: Fri, 31 Jan 2014 22:44:49 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C617A57@DFLE08.ent.ti.com>
References: <1391198997-31679-1-git-send-email-denis@denix.org>
In-Reply-To: <1391198997-31679-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] base-files: pre-create /run symlink to point	to /var/run
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
X-List-Received-Date: Fri, 31 Jan 2014 22:44:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I like this approach a lot to fix the last mount.sh issue.

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Friday, January 31, 2014 2:10 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] base-files: pre-create /run symlink to poin=
t to
> /var/run
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Make it available on the first boot too, otherwise the first boot may fai=
l to
> automount SD card partitions. Normally, it gets created on the first boot=
 by
> volatiles init script and stays there on consecutive boots.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/base-files/base-files_3.0.14.bbappend        | 11 +++++=
+++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/base-files/base-
> files_3.0.14.bbappend b/meta-arago-distro/recipes-core/base-files/base-
> files_3.0.14.bbappend
> index c0ab069..4d831fd 100644
> --- a/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappen=
d
> +++ b/meta-arago-distro/recipes-core/base-files/base-files_3.0.14.bbappe
> +++ nd
> @@ -1,4 +1,13 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>=20
> -PR_append =3D "-arago0"
> +PR_append =3D "-arago1"
> +
> +# Pre-create /run symlink to point to /var/run at build time # This
> +normally happens on first boot, but may be too late for automount, #
> +which tries to create mount-points in /run # NOTE: This step is not
> +required in Dora and up, due to reverse direction # of symlinking
> +between /run and /var/run do_install_append () {
> +	ln -sf /var/run ${D}/run
> +}
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

