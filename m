Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 46F5F52A51
	for <meta-arago@arago-project.org>;
	Fri, 11 Jan 2013 15:26:46 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0BFQjVL013630;
	Fri, 11 Jan 2013 09:26:45 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0BFQj5d011153;
	Fri, 11 Jan 2013 09:26:45 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 11 Jan 2013 09:26:44 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] alsa-state: Modified asound.conf to allow
	playback on dmix and capture from hw
Thread-Index: AQHNwrBuW/3LW2liFEiyH9JkJj5VqJhEmrCQ
Date: Fri, 11 Jan 2013 15:26:43 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C35E25C@DFLE09.ent.ti.com>
References: <1352929105-11189-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1352929105-11189-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Gerlach, Dave" <d-gerlach@ti.com>
Subject: Re: [PATCH] alsa-state: Modified asound.conf to allow	playback on dmix and capture from hw
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
X-List-Received-Date: Fri, 11 Jan 2013 15:26:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ignore this patch.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Wednesday, November 14, 2012 3:38 PM
> To: meta-arago@arago-project.org
> Cc: Gerlach, Dave
> Subject: [meta-arago] [PATCH] alsa-state: Modified asound.conf to allow
> playback on dmix and capture from hw
>=20
> From: dgerlach <d-gerlach@ti.com>
>=20
> * By default alsa was set to use dmix for both playback and capture. Howe=
ver,
>   for capture dmix can not be used.
> * Configuring capture to use "hw:0,0" by default which is the external au=
dio
>   codec ic.
> ---
>  .../recipes-bsp/alsa-state/alsa-state.bbappend     |    4 ++++
>  .../recipes-bsp/alsa-state/alsa-state/asound.conf  |   18 ++++++++++++++=
++++
>  2 files changed, 22 insertions(+), 0 deletions(-)  create mode 100644 me=
ta-
> arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
>  create mode 100644 meta-arago-distro/recipes-bsp/alsa-state/alsa-
> state/asound.conf
>=20
> diff --git a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
> b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
> new file mode 100644
> index 0000000..25a9778
> --- /dev/null
> +++ b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
> @@ -0,0 +1,4 @@
> +PR_append =3D "-arago0"
> +
> +# look for files in this layer first
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> diff --git a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.c=
onf
> b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.conf
> new file mode 100644
> index 0000000..f3e161b
> --- /dev/null
> +++ b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.conf
> @@ -0,0 +1,18 @@
> +# default dmix configuration
> +
> +pcm.!default {
> +        type asym
> +        playback.pcm {
> +                type plug
> +                slave.pcm "dmix"
> +        }
> +        capture.pcm {
> +                type plug
> +                slave.pcm "hw:0,0"
> +        }
> +}
> +
> +ctl.mixer0 {
> +    type hw
> +    card 0
> +}
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

