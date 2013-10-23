Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C7E885299B
	for <meta-arago@arago-project.org>;
	Wed, 23 Oct 2013 18:34:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9NIYVlf025262
	for <meta-arago@arago-project.org>; Wed, 23 Oct 2013 13:34:31 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9NIYVbM020309
	for <meta-arago@arago-project.org>; Wed, 23 Oct 2013 13:34:31 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 23 Oct 2013 13:34:31 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Rini, Tom" <trini@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/3] udev: Add rule for automount (and
	handle	removal of) SD cards
Thread-Index: AQHO0B1pxUCdsTHJckS+lj+StTfHpJoCnL+g
Date: Wed, 23 Oct 2013 18:34:31 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597D4106@DLEE11.ent.ti.com>
References: <1382552778-29138-1-git-send-email-trini@ti.com>
	<1382552778-29138-3-git-send-email-trini@ti.com>
In-Reply-To: <1382552778-29138-3-git-send-email-trini@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] udev: Add rule for automount (and handle	removal of) SD cards
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
X-List-Received-Date: Wed, 23 Oct 2013 18:34:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Forgot the PR bump

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Rini, Tom
>Sent: Wednesday, October 23, 2013 1:26 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 2/3] udev: Add rule for automount
>(and handle removal of) SD cards
>
>Add rules to local.rules to call /etc/udev/scripts/mount.sh on
>insertion
>and removal of SD cards, to mount to /media/mmcblkXpY
>
>Signed-off-by: Tom Rini <trini@ti.com>
>---
> .../recipes-core/udev/udev/local.rules             |    3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/meta-arago-distro/recipes-core/udev/udev/local.rules
>b/meta-arago-distro/recipes-core/udev/udev/local.rules
>index d0b0216..45c3a46 100644
>--- a/meta-arago-distro/recipes-core/udev/udev/local.rules
>+++ b/meta-arago-distro/recipes-core/udev/udev/local.rules
>@@ -19,3 +19,6 @@ ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*",
>ENV{MODALIAS}=3D=3D"?*", RUN+=3D"/sbin/modprobe
> # Create a symlink to any touchscreen input device
> SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*",
>ENV{ID_INPUT_TOUCHSCREEN}=3D=3D"1", SYMLINK+=3D"input/touchscreen0"
>
>+# Auto-mount any SD cards
>+ACTION=3D=3D"add", KERNEL=3D=3D"mmcblk[0-9]p[0-9]", SUBSYSTEM=3D=3D"block=
",
>RUN+=3D"/etc/udev/scripts/mount.sh"
>+ACTION=3D=3D"remove", KERNEL=3D=3D"mmcblk[0-9]p[0-9]",
>SUBSYSTEM=3D=3D"block", RUN+=3D"/etc/udev/scripts/mount.sh"
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

