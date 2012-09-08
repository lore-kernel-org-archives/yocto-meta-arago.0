Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 8D706529B8
	for <meta-arago@arago-project.org>;
	Sat,  8 Sep 2012 15:57:57 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q88FvuOT002507;
	Sat, 8 Sep 2012 10:57:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q88FvupW030332;
	Sat, 8 Sep 2012 10:57:56 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Sat, 8 Sep 2012 10:57:56 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [meta-arago-distro][PATCH]
	task-arago-tisdk-connectivity: Add bluetooth stack
Thread-Index: AQHNjInOrcMgIvmSjUSkiIwvTBx115eAnEhQ
Date: Sat, 8 Sep 2012 15:57:55 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101591DDA07@DLEE12.ent.ti.com>
References: <1346976237-18449-1-git-send-email-fcooper27jr@gmail.com>
In-Reply-To: <1346976237-18449-1-git-send-email-fcooper27jr@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: Re: [meta-arago-distro][PATCH]	task-arago-tisdk-connectivity: Add bluetooth stack
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
X-List-Received-Date: Sat, 08 Sep 2012 15:57:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Will you re-submit with new naming?

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Thursday, September 06, 2012 7:04 PM
> To: meta-arago@arago-project.org
> Cc: Franklin S. Cooper Jr
> Subject: [meta-arago] [meta-arago-distro][PATCH] task-arago-
> tisdk-connectivity: Add bluetooth stack
>=20
> * Add list of bluetooth stack libraries to task-arago-tisdk-
> connectivity.
> * This list was previously located in task-arago-tisdk-bsp and
>   task-arago-toolchain-tisdk-bsp-target in arago.
>=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
> ---
>  .../tasks/task-arago-tisdk-connectivity-target.bb  |    9
> ++++++++-
>  .../tasks/task-arago-tisdk-connectivity.bb         |   16
> +++++++++++++---
>  2 files changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-connectivity-target.bb b/meta-arago-distro/recipes-
> core/tasks/task-arago-tisdk-connectivity-target.bb
> index deb7b7b..a63c801 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> connectivity-target.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> connectivity-target.bb
> @@ -1,12 +1,19 @@
>  DESCRIPTION =3D "Task to install wlan and bluetooth sources in
> SDK"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> -PR =3D "r0"
> +PR =3D "r1"
>=20
>  inherit task
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE =3D "(am37x-evm|am180x-evm|ti33x)"
>=20
> +# Bluetooth development packages
> +BLUETOOTH_STACK =3D "\
> +    bluez4-dev \
> +    openobex-dev \
> +"
> +
>  RDEPENDS_${PN} =3D "\
> +    ${BLUETOOTH_STACK} \
>      wpa-supplicant-dev \
>      "
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-connectivity.bb b/meta-arago-distro/recipes-
> core/tasks/task-arago-tisdk-connectivity.bb
> index 1ff849c..17f97d1 100644
> --- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> connectivity.bb
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> connectivity.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "Task to install wlan and bluetooth packages into
> target FS"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> -PR =3D "r0"
> +PR =3D "r1"
>=20
>  inherit task
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> @@ -42,10 +42,20 @@ WLAN_COMPAT =3D "ti-compat-wireless-wl12xx \
>                 bt-enable \
>  "
>=20
> -BLUETOOTH =3D "bluetooth-gui"
> +BLUETOOTH_STACK =3D "\
> +    bluez4 \
> +    bluez4-agent \
> +    libasound-module-bluez \
> +    bluez-hcidump \
> +    openobex \
> +    openobex-apps \
> +    obexftp \
> +    ussp-push \
> +    "
>=20
>  RDEPENDS_${PN} =3D "\
>      ${WLAN_COMMON} \
>      ${WLAN_COMPAT} \
> -    ${BLUETOOTH} \
> +    ${BLUETOOTH_STACK} \
> +    bluetooth-gui \
>  "
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

