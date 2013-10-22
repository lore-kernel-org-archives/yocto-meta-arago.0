Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 10C865296F
	for <meta-arago@arago-project.org>;
	Tue, 22 Oct 2013 17:44:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9MHiETD018934
	for <meta-arago@arago-project.org>; Tue, 22 Oct 2013 12:44:14 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9MHiEsG000918
	for <meta-arago@arago-project.org>; Tue, 22 Oct 2013 12:44:14 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 22 Oct 2013 12:44:14 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Rini, Tom" <trini@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH] udev: Re-fix touchscreen detection rule
Thread-Index: AQHOz0XICYUc+kAvXkGd8NOcpd0tXZoA/euA
Date: Tue, 22 Oct 2013 17:44:12 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597CF9E1@DLEE11.ent.ti.com>
References: <1382460184-12671-1-git-send-email-trini@ti.com>
In-Reply-To: <1382460184-12671-1-git-send-email-trini@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH] udev: Re-fix touchscreen detection rule
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
X-List-Received-Date: Tue, 22 Oct 2013 17:44:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Needs a PR bump but I can handle that when I push.

Tested-by: Chase Maupin <chase.maupin@ti.com>

Tested on AM437x-evm

>-----Original Message-----
>From: Tom Rini [mailto:tom.rini@gmail.com] On Behalf Of Rini, Tom
>Sent: Tuesday, October 22, 2013 11:43 AM
>To: meta-arago@arago-project.org
>Cc: Maupin, Chase; Cooper Jr., Franklin; Dmytriyenko, Denys
>Subject: [PATCH] udev: Re-fix touchscreen detection rule
>
>* Fix the rule to detect the touchscreen and create the
>  /dev/input/touchscreen0 device node more reliably.  udev knows
>how to
>  detect a touchscreen and sets ID_INPUT_TOUCHSCREEN for us to
>check
>  against.
>* This has already been submitted upstream and can be removed
>  when meta-arago switches to something that contains this fix,
>possibly
>  Dora.
>* The patch has already been submitted to oe-core at:
>
>http://article.gmane.org/gmane.comp.handhelds.openembedded.core/44
>297
>
>Cc: Chase Maupin <chase.maupin@ti.com>
>Cc: Franklin Cooper Jr. <fcooper@ti.com>
>Cc: Denys Dmytriyenko <denys@ti.com>
>Signed-off-by: Tom Rini <trini@ti.com>
>---
> .../recipes-core/udev/udev/local.rules             |    4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-core/udev/udev/local.rules
>b/meta-arago-distro/recipes-core/udev/udev/local.rules
>index d0cbf91..d0b0216 100644
>--- a/meta-arago-distro/recipes-core/udev/udev/local.rules
>+++ b/meta-arago-distro/recipes-core/udev/udev/local.rules
>@@ -17,7 +17,5 @@
> ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*",
>RUN+=3D"/sbin/modprobe $env{MODALIAS}"
>
> # Create a symlink to any touchscreen input device
>-# Trigger based on input type, that the evbit (-e) has EV_SYN and
>EV_ABS,
>-# has an EV_ABS value (-a) which is used for touchscreen type
>devices.
>-SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*",
>ATTRS{modalias}=3D=3D"input:*-e0*,3,*a0,1,*",
>SYMLINK+=3D"input/touchscreen0"
>+SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*",
>ENV{ID_INPUT_TOUCHSCREEN}=3D=3D"1", SYMLINK+=3D"input/touchscreen0"
>
>--
>1.7.9.5


