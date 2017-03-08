Return-Path: <anandb@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 47E4152979
	for <meta-arago@arago-project.org>;
	Wed,  8 Mar 2017 17:22:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v28HLvmi013482
	for <meta-arago@arago-project.org>; Wed, 8 Mar 2017 11:21:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488993717;
	bh=4mEXTvWvN/vOkVTm2pQzEjnHJWNdbWoTaIef71gSNGE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Qs3q6L8sbgSZ2Txd3HMjdODA9Fy3y9h3JbkIWzY4Xc0rGHhOrvPPsbvXNaVtyYXzO
	xxj/ZCgx9ivJcj7G7Q3M8HGH08MLZd4wQq9AAs/wer194Gzj1Lo/LPRnaeu/jrDjxA
	WDLbSiw2TaXj4fZFvV2X5MIxs/RY99L7RidxRFNM=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v28HLoQf026030
	for <meta-arago@arago-project.org>; Wed, 8 Mar 2017 11:21:51 -0600
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v28HLlB7015116
	for <meta-arago@arago-project.org>; Wed, 8 Mar 2017 22:51:49 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.03.0294.000; Wed, 8 Mar 2017 22:51:47 +0530
From: "Balagopalakrishnan, Anand" <anandb@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to
	/dev/dri/card0
Thread-Index: AQHSl+HHv6vdLCNknUmZrPPOHopYeaGKpr6AgACJTus=
Date: Wed, 8 Mar 2017 17:21:46 +0000
Message-ID: <05CF4794C98B244ABDC620C109037622C03EBAE5@DBDE04.ent.ti.com>
References: <1488959905-187610-1-git-send-email-anandb@ti.com>,
	<20170308143621.GM23302@edge>
In-Reply-To: <20170308143621.GM23302@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.56]
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
X-List-Received-Date: Wed, 08 Mar 2017 17:22:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,=0A=
=0A=
We need to review whether the other patches are required or not. This actio=
n will happen over the next 1-2 weeks by Karthik and Eric. Till that time, =
I would like to keep the patches in. =0A=
=0A=
In the meantime, the commented out lines can be removed from the bbappend f=
ile itself. If a patch is deemed to be required, we can submit a new recipe=
 update later for SRC_URL. Is this fine? If so, I can submit v2 with this p=
roposal.=0A=
=0A=
Regards,=0A=
Anand=0A=
________________________________________=0A=
From: Dmytriyenko, Denys=0A=
Sent: Wednesday, March 08, 2017 8:06 PM=0A=
To: Balagopalakrishnan, Anand=0A=
Cc: meta-arago@arago-project.org=0A=
Subject: Re: [meta-arago] [PATCH 1/1] weston: restrict udev enumeration to =
/dev/dri/card0=0A=
=0A=
On Wed, Mar 08, 2017 at 01:28:25PM +0530, Anand Balagopalakrishnan wrote:=
=0A=
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>=0A=
> ---=0A=
>  .../wayland/weston_1.11.0.bbappend                 | 23 +++++++++++-----=
------=0A=
>  1 file changed, 12 insertions(+), 11 deletions(-)=0A=
>=0A=
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bba=
ppend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend=
=0A=
> index d0691ad..36585bd 100644=0A=
> --- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend=
=0A=
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend=
=0A=
> @@ -2,19 +2,20 @@=0A=
>  PACKAGECONFIG[fbdev] =3D "--enable-fbdev-compositor WESTON_NATIVE_BACKEN=
D=3D"fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"=0A=
>  PACKAGECONFIG[kms] =3D "--enable-drm-compositor,--disable-drm-compositor=
,drm udev libgbm mtdev"=0A=
>=0A=
> -PR_append =3D ".arago16"=0A=
> +PR_append =3D ".arago17"=0A=
>=0A=
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"=0A=
>=0A=
>  RDEPENDS_${PN} +=3D "weston-conf"=0A=
>=0A=
> -#SRC_URI +=3D " \=0A=
> -#    file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.pa=
tch \=0A=
> -#    file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \=0A=
> -#    file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.pa=
tch \=0A=
> -#    file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \=0A=
> -#    file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \=0A=
> -#    file://0001-Add-soc-performance-monitor-utilites.patch \=0A=
> -#    file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patc=
h \=0A=
> -#    file://0001-compositor-drm-fix-hotplug-weston-termination-proble.pa=
tch \=0A=
> -#"=0A=
> +=0A=
> +SRC_URI +=3D " \=0A=
> +     file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \=0A=
> +"=0A=
> +#    file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.pa=
tch=0A=
> +#    file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch=0A=
> +#    file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.pa=
tch=0A=
> +#    file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch=0A=
> +#    file://0001-Add-soc-performance-monitor-utilites.patch=0A=
> +#    file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patc=
h=0A=
> +#    file://0001-compositor-drm-fix-hotplug-weston-termination-proble.pa=
tch=0A=
=0A=
Anand,=0A=
=0A=
What about the rest of the commented out patches? Do we still need them?=0A=
=0A=
If we need them, will you be looking at up-porting them?=0A=
If we don't need them, can you please remove the corresponding comments fro=
m=0A=
the recipe.=0A=
=0A=
Thanks.=0A=
=0A=
--=0A=
Denys=0A=

