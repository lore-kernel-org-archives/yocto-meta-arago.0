Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 98831529BD
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 14:29:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EETQnZ010279;
	Mon, 14 Oct 2013 09:29:26 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EETQI0000957;
	Mon, 14 Oct 2013 09:29:26 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 14 Oct 2013 09:29:26 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 0/9] recipes: cruft removal and seasonal
	cleanup
Thread-Index: AQHOyHVX8ePSUAQ7h02/2viz/DHneJn0QoGA
Date: Mon, 14 Oct 2013 14:29:25 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C575524@DFLE08.ent.ti.com>
References: <1381710923-22471-1-git-send-email-denis@denix.org>
In-Reply-To: <1381710923-22471-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 0/9] recipes: cruft removal and seasonal cleanup
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
X-List-Received-Date: Mon, 14 Oct 2013 14:29:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

This goes for all the patches in this patchset.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Sunday, October 13, 2013 7:35 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH 0/9] recipes: cruft removal and seasonal cle=
anup
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Remove no longer needed locally overlaid files and bbappend modifications
> when corresponding changes were merged upstream.
> Update the README files to the current dylan setup and dependencies.
>=20
> Denys Dmytriyenko (9):
>   ti-crypto-examples: remove empty no longer used bbappend
>   chrpath.bbclass: remove local copy, as dylan now has all the fixes
>   relocate_sdk.py: remove local copy, as dylan now has all the fixes
>   init-ifupdown: move init and interfaces files from netbase to new
>     init-ifupdown
>   gst-ffmpeg: move to gstreamer directory to match upstream location
>   gettext: remove local bbappend that got merged upstream
>   libjpeg-turbo: update local bbappend with upstreamed fixes removed
>   python-m2crypto: remove since upstream meta-oe has newer version
>   README: update dependency information for dylan base
>=20
>  meta-arago-distro/README                           |  17 +-
>  meta-arago-distro/classes/chrpath.bbclass          |  97 ---
>  .../netbase =3D> init-ifupdown/init-ifupdown}/init   |   0
>  .../init-ifupdown}/interfaces                      |   0
>  .../init-ifupdown_1.0.bbappend}                    |   2 +-
>  .../ti-crypto-examples_git.bbappend                |   1 -
>  .../gst-ffmpeg_0.10.13.bbappend                    |   0
>  meta-arago-extras/README                           |  17 +-
>  .../recipes-core/gettext/gettext_0.16.1.bbappend   |   3 -
>  .../recipes-core/jpeg/libjpeg-turbo_svn.bbappend   |  10 +-
>  .../python/python-m2crypto/install.patch           |  24 -
>  .../m2crypto-0.20.2-openssl-1.0.0.patch            | 713 ---------------=
------
>  .../python/python-m2crypto_0.20.2.bb               |  27 -
>  scripts/relocate_sdk.py                            | 219 -------
>  14 files changed, 24 insertions(+), 1106 deletions(-)  delete mode 10064=
4 meta-
> arago-distro/classes/chrpath.bbclass
>  rename meta-arago-distro/recipes-core/{netbase/netbase =3D> init-
> ifupdown/init-ifupdown}/init (100%)  rename meta-arago-distro/recipes-
> core/{netbase/netbase =3D> init-ifupdown/init-ifupdown}/interfaces (100%)
> rename meta-arago-distro/recipes-core/{netbase/netbase_5.0.bbappend =3D>
> init-ifupdown/init-ifupdown_1.0.bbappend} (79%)  delete mode 100644 meta-
> arago-distro/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bbapp=
end
>  rename meta-arago-distro/recipes-multimedia/{gst-ffmpeg =3D> gstreamer}/=
gst-
> ffmpeg_0.10.13.bbappend (100%)  delete mode 100644 meta-arago-
> extras/recipes-core/gettext/gettext_0.16.1.bbappend
>  delete mode 100644 meta-arago-extras/recipes-devtools/python/python-
> m2crypto/install.patch
>  delete mode 100644 meta-arago-extras/recipes-devtools/python/python-
> m2crypto/m2crypto-0.20.2-openssl-1.0.0.patch
>  delete mode 100644 meta-arago-extras/recipes-devtools/python/python-
> m2crypto_0.20.2.bb
>  delete mode 100755 scripts/relocate_sdk.py
>=20
> --
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

