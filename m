Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3497A52ACC
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 20:07:56 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95K7tUf005826;
	Fri, 5 Oct 2012 15:07:55 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95K7t0W010848;
	Fri, 5 Oct 2012 15:07:55 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 15:07:54 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] pulseaudio: Remove console-kit from
	pulseaudio-module-server
Thread-Index: AQHNozRNhUUMJQE/Z0ir6COfTPJgJ5erI66w
Date: Fri, 5 Oct 2012 20:07:53 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159249577@DLEE12.ent.ti.com>
References: <1349469034-8348-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349469034-8348-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: AAJj A3MH CYed DlRc Dw/9 ExJl JgnM Jw1B KgoD K0PC LCZQ
	NefH RHmJ RKUp S1Fy W94Q; 2;
	ZgBjAG8AbwBwAGUAcgBqAHIAMgA3AEAAZwBtAGEAaQBsAC4AYwBvAG0AOwBtAGUAdABhAC0AYQByAGEAZwBvAEAAYQByAGEAZwBvAC0AcAByAG8AagBlAGMAdAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {7293DA48-F766-4582-8330-D9AD0F7A5CD4};
	YwBoAGEAcwBlAC4AbQBhAHUAcABpAG4AQAB0AGkALgBjAG8AbQA=; Fri,
	05 Oct 2012 20:07:50 GMT;
	UgBFADoAIABbAG0AZQB0AGEALQBhAHIAYQBnAG8AXQAgAFsAUABBAFQAQwBIACAAdgAyAF0AIABwAHUAbABzAGUAYQB1AGQAaQBvADoAIABSAGUAbQBvAHYAZQAgAGMAbwBuAHMAbwBsAGUALQBrAGkAdAAgAGYAcgBvAG0ACQBwAHUAbABzAGUAYQB1AGQAaQBvAC0AbQBvAGQAdQBsAGUALQBzAGUAcgB2AGUAcgA=
x-cr-puzzleid: {7293DA48-F766-4582-8330-D9AD0F7A5CD4}
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2] pulseaudio: Remove console-kit from	pulseaudio-module-server
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
X-List-Received-Date: Fri, 05 Oct 2012 20:07:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 3:31 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH v2] pulseaudio: Remove console-kit
> from pulseaudio-module-server
>=20
> * Remove the required dependency of pulseaudio-module-console-kit
>   when using pulseaudio-module-server. Pulseaudio-module-console-
> kit
>   brings in consolekit which can not be built in an non x11
> environment.
> * Due to X11 not being apart of the DISTRO_FEATURES, recipes such
> as libx11
>   and its dependencies aren't buildable.
> * pulseaudio-module-server is used by the bluetooth demo.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Update typo in commit message.
> Added comment about the removal of pulseaudio-module-console-kit
>=20
>  .../pulseaudio/pulseaudio_2.1.bbappend             |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-
> multimedia/pulseaudio/pulseaudio_2.1.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-
> multimedia/pulseaudio/pulseaudio_2.1.bbappend b/meta-arago-
> distro/recipes-multimedia/pulseaudio/pulseaudio_2.1.bbappend
> new file mode 100644
> index 0000000..2fc3ce6
> --- /dev/null
> +++ b/meta-arago-distro/recipes-
> multimedia/pulseaudio/pulseaudio_2.1.bbappend
> @@ -0,0 +1,5 @@
> +PR_append =3D "-arago0"
> +
> +# Removing pulseaudio-module-console-kit which depends on
> console-kit.
> +# Console-kit has x11 dependencies which can't be built do to
> Arago being a non x11 distro.
> +RDEPENDS_pulseaudio-server :=3D "${@oe_filter_out('pulseaudio-
> module-console-kit','${RDEPENDS_pulseaudio-server}', d)}"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

