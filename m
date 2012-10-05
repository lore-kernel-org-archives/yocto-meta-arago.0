Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1ACFB529D2
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 13:20:37 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95DKaQW000649;
	Fri, 5 Oct 2012 08:20:36 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95DKa29016865;
	Fri, 5 Oct 2012 08:20:36 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 08:20:36 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] pulseaudio: Remove console-kit from
	pulseaudio-module-server
Thread-Index: AQHNosKTDgl2vicbNkOzce/YimD5r5eqso+A
Date: Fri, 5 Oct 2012 13:20:34 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015924817A@DLEE12.ent.ti.com>
References: <1349420150-22115-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349420150-22115-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: kwU= EI3g Lcec L63h MdxF MgHv NAkR PZ8w P/is RbTX RxSe
	SBXo Tfai VuB4 WUMi WU51; 2;
	ZgBjAG8AbwBwAGUAcgBqAHIAMgA3AEAAZwBtAGEAaQBsAC4AYwBvAG0AOwBtAGUAdABhAC0AYQByAGEAZwBvAEAAYQByAGEAZwBvAC0AcAByAG8AagBlAGMAdAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {DF986BAD-1DD5-46F1-A54D-52A6FF0787AF};
	YwBoAGEAcwBlAC4AbQBhAHUAcABpAG4AQAB0AGkALgBjAG8AbQA=; Fri,
	05 Oct 2012 13:20:30 GMT;
	UgBFADoAIABbAG0AZQB0AGEALQBhAHIAYQBnAG8AXQAgAFsAUABBAFQAQwBIAF0AIABwAHUAbABzAGUAYQB1AGQAaQBvADoAIABSAGUAbQBvAHYAZQAgAGMAbwBuAHMAbwBsAGUALQBrAGkAdAAgAGYAcgBvAG0ACQBwAHUAbABzAGUAYQB1AGQAaQBvAC0AbQBvAGQAdQBsAGUALQBzAGUAcgB2AGUAcgA=
x-cr-puzzleid: {DF986BAD-1DD5-46F1-A54D-52A6FF0787AF}
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] pulseaudio: Remove console-kit from	pulseaudio-module-server
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
X-List-Received-Date: Fri, 05 Oct 2012 13:20:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:56 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] pulseaudio: Remove console-kit from
> pulseaudio-module-server
>=20
> * Remove the required dependency of pulseaudio-module-console-kit
>   when using pulseaudio-module-server. Pulseaudio-module-console-
> kit
>   brings in consolekit which can not be built in an non x11
> environment.
> * Due to X11 not being apart of the DISTRO_FEATURES, recipes such
> as libx11
>   and its dependencies aren't built able.

I think you mean buildable

> * pulseaudio-module-server is used by the bluetooth demo.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../pulseaudio/pulseaudio_2.1.bbappend             |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-
> multimedia/pulseaudio/pulseaudio_2.1.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-
> multimedia/pulseaudio/pulseaudio_2.1.bbappend b/meta-arago-
> distro/recipes-multimedia/pulseaudio/pulseaudio_2.1.bbappend
> new file mode 100644
> index 0000000..0ddc49f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-
> multimedia/pulseaudio/pulseaudio_2.1.bbappend
> @@ -0,0 +1,3 @@
> +PR_append =3D "-arago0"
> +
> +RDEPENDS_pulseaudio-server :=3D "${@oe_filter_out('pulseaudio-
> module-console-kit','${RDEPENDS_pulseaudio-server}', d)}"

I know you commented in the commit message but any objection to commenting =
this line directly in the recipe as well?

> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

