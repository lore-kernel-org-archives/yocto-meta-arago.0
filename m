Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F339C4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 02:05:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.3167.1712973953470871961
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 19:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=exrPliKQ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43D25k8L058731;
	Fri, 12 Apr 2024 21:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712973946;
	bh=5LzDondSj7wq03WpXbtn4aq0Up4NR760P7dCSpOM2RM=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=exrPliKQXuiqz8ybcqcxV3PaI/cIE7dOCvZlTZNCBh9LxZSC+FvaHjzI/lPWMasdT
	 rWmTlZyHVXmy0qV2CJKTKUqDI264jWK+Wj76k5dWe9MQ7sIMFVLbHwU4QyirBhXf/X
	 CTpmYbHYIG5YfQCSiRLtG720TYbkSa++sOiUyM0Q=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43D25k34006682
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Apr 2024 21:05:46 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 Apr 2024 21:05:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 Apr 2024 21:05:46 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43D25kwI034849;
	Fri, 12 Apr 2024 21:05:46 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 12 Apr 2024 21:05:46 -0500
Message-ID: <D0IML3E3KHGA.2FKN91Q2W4JY9@ti.com>
CC: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
Subject: Re: [PATCH] weston-init: remove my qol patches now
From: Randolph Sapp <rs@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: aerc 0.17.0
References: <20240412221240.254965-1-rs@ti.com>
 <20240412222040.GB28791@denix.org>
In-Reply-To: <20240412222040.GB28791@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 13 Apr 2024 02:05:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15273

On Fri Apr 12, 2024 at 5:20 PM CDT, Denys Dmytriyenko wrote:
> On Fri, Apr 12, 2024 at 05:12:40PM -0500, rs@ti.com wrote:
> > From: Randolph Sapp <rs@ti.com>
> >=20
> > This reverts commit eab6e84b752b0341d1c1627527c99fa68c90bb52.
> >=20
> > The changes introduced in this commit were accepted into oe-core and ar=
e
> > no longer required here.
>
> Which branch?


Sorry, I sent a follow-up to this saying to ignore this version because it
wasn't tagged properly. Sorry again about that. The offending commit is on =
the
master and scarthgap branches. Here's a link to the proper copy:

https://lists.yoctoproject.org/g/meta-arago/message/15270

It sounds like you may be hinting at some syntax I'm missing about indicati=
ng
branch name in the revert message, though...

There's not anything I'm forgetting is there?


> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > ---
> >  .../wayland/weston-init.bbappend              |  8 --
> >  .../wayland/weston-init/weston-socket.sh      | 20 -----
> >  .../wayland/weston-init/weston.ini            | 73 +------------------
> >  3 files changed, 4 insertions(+), 97 deletions(-)
> >  delete mode 100755 meta-arago-distro/recipes-graphics/wayland/weston-i=
nit/weston-socket.sh
> >=20
> > diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bba=
ppend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > index be6b534b..4d5db58c 100644
> > --- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> > @@ -5,18 +5,10 @@ PR:append =3D ".arago12"
> >  SRC_URI:append =3D " \
> >      file://weston.ini \
> >      file://weston-launch-calibrator.sh \
> > -    file://weston-socket.sh \
> >  "
> > =20
> >  do_install:append() {
> >      install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-l=
aunch-calibrator
> > -
> > -    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false'=
,d)}; then
> > -        install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconf=
dir}/profile.d/weston-socket.sh
> > -    fi
> >  }
> > =20
> >  FILES:${PN}:append =3D "${bindir}/weston-launch-calibrator"
> > -
> > -GROUPADD_PARAM:${PN} =3D "-r wayland; -r render"
> > -USERADD_PARAM:${PN} =3D "--home /home/weston --shell /bin/sh --user-gr=
oup -G video,input,render weston"
> > diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/wes=
ton-socket.sh b/meta-arago-distro/recipes-graphics/wayland/weston-init/west=
on-socket.sh
> > deleted file mode 100755
> > index 86389d63..00000000
> > --- a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-soc=
ket.sh
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -#!/bin/sh
> > -
> > -# set weston variables for use with global weston socket
> > -global_socket=3D"/run/wayland-0"
> > -if [ -e "$global_socket" ]; then
> > -	weston_group=3D$(stat -c "%G" "$global_socket")
> > -	if [ "$(id -u)" =3D "0" ]; then
> > -		export WAYLAND_DISPLAY=3D"$global_socket"
> > -	else
> > -		case "$(groups "$USER")" in
> > -			*"$weston_group"*)
> > -				export WAYLAND_DISPLAY=3D"$global_socket"
> > -				;;
> > -			*)
> > -				;;
> > -		esac
> > -	fi
> > -	unset weston_group
> > -fi
> > -unset global_socket
> > diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/wes=
ton.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
> > index 8596346a..b9610fa8 100644
> > --- a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
> > +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
> > @@ -1,10 +1,5 @@
> > -# configuration file for Weston
> > -
> >  [core]
> >  idle-time=3D0
> > -#modules=3Dxwayland.so,cms-colord.so
> > -#shell=3Ddesktop-shell.so
> > -#gbm-format=3Dxrgb2101010
> >  require-input=3Dfalse
> > =20
> >  [shell]
> > @@ -12,74 +7,14 @@ locking=3Dfalse
> >  animation=3Dzoom
> >  panel-position=3Dtop
> >  startup-animation=3Dfade
> > -#background-image=3D/usr/share/backgrounds/gnome/Aqua.jpg
> > -#background-color=3D0xff002244
> > -#background-type=3Dtile
> > -#clock-format=3Dminutes
> > -#panel-color=3D0x90ff0000
> > -#locking=3Dtrue
> > -#animation=3Dzoom
> > -#startup-animation=3Dfade
> > -#binding-modifier=3Dctrl
> > -#num-workspaces=3D6
> > -#cursor-theme=3Dwhiteglass
> > -#cursor-size=3D24
> > -
> > -#lockscreen-icon=3D/usr/share/icons/gnome/256x256/actions/lock.png
> > -#lockscreen=3D/usr/share/backgrounds/gnome/Garden.jpg
> > -#homescreen=3D/usr/share/backgrounds/gnome/Blinds.jpg
> > -#animation=3Dfade
> > -
> > -#[launcher]
> > -#icon=3D/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
> > -#path=3D/usr/bin/gnome-terminal
> > -
> > -#[launcher]
> > -#icon=3D/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
> > -#path=3D/usr/bin/weston-terminal
> > -
> > -#[launcher]
> > -#icon=3D/usr/share/icons/hicolor/24x24/apps/google-chrome.png
> > -#path=3D/usr/bin/google-chrome
> > -
> > -#[launcher]
> > -#icon=3D/usr/share/icons/gnome/24x24/apps/arts.png
> > -#path=3D/build/weston-0lEgCh/weston-1.11.0/weston-flower
> > -
> > -#[input-method]
> > -#path=3D/usr/libexec/weston-keyboard
> > -
> > -#[output]
> > -#name=3DLVDS1
> > -#mode=3D1680x1050
> > -#transform=3D90
> > -#icc_profile=3D/usr/share/color/icc/colord/Bluish.icc
> > -
> > -#[output]
> > -#name=3DVGA1
> > -#mode=3D173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
> > -#transform=3Dflipped
> > -
> > -#[output]
> > -#name=3DX1
> > -#mode=3D1024x768
> > -#transform=3Dflipped-90
> > =20
> >  [libinput]
> >  touchscreen_calibrator=3Dtrue
> > -#enable_tap=3Dtrue
> > -
> > -#[touchpad]
> > -#constant_accel_factor =3D 50
> > -#min_accel_factor =3D 0.16
> > -#max_accel_factor =3D 1.0
> > -
> > -[screen-share]
> > -command=3D/usr/bin/weston --backend=3Drdp-backend.so --shell=3Dfullscr=
een-shell.so --no-clients-resize
> > -
> > -#[xwayland]
> > -#path=3D/usr/bin/Xwayland
> > =20
> >  [autolaunch]
> >  # launch the calibrator on startup if a touchscreen is detected
> >  path=3D/usr/bin/weston-launch-calibrator
> > +
> > +[screensaver]
> > +# Uncomment path to disable screensaver
> > +#path=3D@libexecdir@/weston-screensaver
> > --=20
> > 2.44.0


