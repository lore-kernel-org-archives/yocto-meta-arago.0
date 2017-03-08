Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 2D53D52980
	for <meta-arago@arago-project.org>;
	Wed,  8 Mar 2017 20:56:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v28KuJ6E007898
	for <meta-arago@arago-project.org>; Wed, 8 Mar 2017 14:56:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489006579;
	bh=fsNsfVPGFtRUR+xxzBEPsBatnWOzrX1Mf144Ck7gR9M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=bC9HyoSNMgf6J+zOhq/+YTCYz8Ew87ZvKNSLezq9mxL8kPMmNGvHJ4CJ+q8VVflmy
	eirIqIkBWkFtiEC2dGDi8b6QxEoXPvmEToCC+Pc39YIm6j49jTT0ZzW9aQGm77rkV3
	YSJW09UALaHJ5S/gbHCK7UU8NDRR391aXOFrLWMQ=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v28KuEYI002871
	for <meta-arago@arago-project.org>; Wed, 8 Mar 2017 14:56:14 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Wed, 8 Mar 2017 14:56:14 -0600
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Balagopalakrishnan, Anand" <anandb@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to
	/dev/dri/card0
Thread-Index: AQHSl+HHv6vdLCNknUmZrPPOHopYeaGKpr6AgACJTuuAADilEA==
Date: Wed, 8 Mar 2017 20:56:13 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A25350812@DFLE09.ent.ti.com>
References: <1488959905-187610-1-git-send-email-anandb@ti.com>,
	<20170308143621.GM23302@edge>
	<05CF4794C98B244ABDC620C109037622C03EBAE5@DBDE04.ent.ti.com>
In-Reply-To: <05CF4794C98B244ABDC620C109037622C03EBAE5@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/1] weston: restrict udev enumeration to /dev/dri/card0
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
X-List-Received-Date: Wed, 08 Mar 2017 20:56:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Anand and Denys:

I have confirmed that all other 7 Weston patches are still applicable.

0001-weston-Enabling-DRM-backend-with-multiple-displays.patch : still appli=
cable, need a minor update
0002-Weston1.9.0-Allow-visual_id-to-be-0.patch: still applicable, resolve t=
he EGL config problem (LCPD-9399)
0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch: still appl=
icable
0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch: still applicable
0001-udev-seat-restrict-udev-enumeration-to-card0.patch: still applicable, =
it is what Anand just re-enabled.
0001-Add-soc-performance-monitor-utilites.patch : still applicable, TI-spec=
ific changes
0001-compositor-drm-support-RGB565-with-pixman-renderer.patch: still applic=
able, Tomi has submitted this one  a while ago, but it is not              =
                                                                           =
                                             available at Weston 1.11.0.
0001-compositor-drm-fix-hotplug-weston-termination-proble.patch: still appl=
icable, good enough as long as the connecter id/crtc id <64
I did submit this patch to trigger discussions, but none has provided a bet=
ter solution.

Should I submit another patch with all other patches after Anand's patch is=
 applied? Or should we replace Anand's patch with this one which covers all=
 Weston 1.9 patches?

Best regards,

Eric
                                                                           =
                                                              =20

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Balagopalakrishnan, Anand
Sent: Wednesday, March 08, 2017 12:22 PM
To: Dmytriyenko, Denys
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to =
/dev/dri/card0

Denys,

We need to review whether the other patches are required or not. This actio=
n will happen over the next 1-2 weeks by Karthik and Eric. Till that time, =
I would like to keep the patches in.=20

In the meantime, the commented out lines can be removed from the bbappend f=
ile itself. If a patch is deemed to be required, we can submit a new recipe=
 update later for SRC_URL. Is this fine? If so, I can submit v2 with this p=
roposal.

Regards,
Anand
________________________________________
From: Dmytriyenko, Denys
Sent: Wednesday, March 08, 2017 8:06 PM
To: Balagopalakrishnan, Anand
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to =
/dev/dri/card0

On Wed, Mar 08, 2017 at 01:28:25PM +0530, Anand Balagopalakrishnan wrote:
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  .../wayland/weston_1.11.0.bbappend                 | 23 +++++++++++-----=
------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git=20
> a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend=20
> b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> index d0691ad..36585bd 100644
> ---=20
> a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappen
> +++ d
> @@ -2,19 +2,20 @@
>  PACKAGECONFIG[fbdev] =3D "--enable-fbdev-compositor WESTON_NATIVE_BACKEN=
D=3D"fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
>  PACKAGECONFIG[kms] =3D "--enable-drm-compositor,--disable-drm-compositor=
,drm udev libgbm mtdev"
>
> -PR_append =3D ".arago16"
> +PR_append =3D ".arago17"
>
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>
>  RDEPENDS_${PN} +=3D "weston-conf"
>
> -#SRC_URI +=3D " \
> -#    file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.pa=
tch \
> -#    file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
> -#    file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.pa=
tch \
> -#    file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
> -#    file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
> -#    file://0001-Add-soc-performance-monitor-utilites.patch \
> -#    file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patc=
h \
> -#    file://0001-compositor-drm-fix-hotplug-weston-termination-proble.pa=
tch \
> -#"
> +
> +SRC_URI +=3D " \
> +     file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \=20
> +"
> +#    file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.pa=
tch
> +#    file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch
> +#    file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.pa=
tch
> +#    file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch
> +#    file://0001-Add-soc-performance-monitor-utilites.patch
> +#    file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patc=
h
> +#    file://0001-compositor-drm-fix-hotplug-weston-termination-proble.pa=
tch

Anand,

What about the rest of the commented out patches? Do we still need them?

If we need them, will you be looking at up-porting them?
If we don't need them, can you please remove the corresponding comments fro=
m the recipe.

Thanks.

--
Denys
_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

