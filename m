Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E4655529AB
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 13:37:33 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9CDbWWM007119;
	Fri, 12 Oct 2012 08:37:32 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9CDbWVV004579;
	Fri, 12 Oct 2012 08:37:32 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 12 Oct 2012 08:37:32 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v3] task-arago-tisdk-connectivity: Create
	new	connectivity tasks
Thread-Index: AQHNqDYasFByIpfbL0uKmXsHh2QlZ5e1rKog
Date: Fri, 12 Oct 2012 13:37:31 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015925C2AC@DLEE12.ent.ti.com>
References: <1350019703-10480-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1350019703-10480-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: Re: [PATCH v3] task-arago-tisdk-connectivity: Create new	connectivity tasks
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
X-List-Received-Date: Fri, 12 Oct 2012 13:37:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 12, 2012 12:28 AM
> To: meta-arago@arago-project.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-arago] [PATCH v3] task-arago-tisdk-connectivity:
> Create new connectivity tasks
>=20
> From: Franklin S Cooper Jr <fcooper@ti.com>
>=20
> * Create new task-arago-tisdk-connectivity task including host
> and target
>   versions. The contents of these tasks were originally located
> in
>   task-arago-tisdk-crypto and task-arago-toolchain-tisdk-crypto-
> host and also
>   the target version.
>=20
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
> ---
> Version 3 changes:
> Removed bt-obex since it was renamed to bluez-tools which was
> already added.
> Removed recieps from the RDEPENDS if they still haven't been
> commited to
> meta-ti. Only firmware/drivers related recipes fall under this
> catagory.
>=20
>  .../task-arago-tisdk-connectivity-sdk-host.bb      |   19 ++++++
>  .../task-arago-tisdk-connectivity-sdk-target.bb    |   19 ++++++
>  .../tasks/task-arago-tisdk-connectivity.bb         |   65
> ++++++++++++++++++++
>  3 files changed, 103 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-connectivity-sdk-host.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-connectivity-sdk-target.bb
>  create mode 100644 meta-arago-distro/recipes-core/tasks/task-
> arago-tisdk-connectivity.bb
>=20
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-connectivity-sdk-host.bb b/meta-arago-distro/recipes-
> core/tasks/task-arago-tisdk-connectivity-sdk-host.bb
> new file mode 100644
> index 0000000..14e793a
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> connectivity-sdk-host.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Task to install wlan and bluetooth sources in
> SDK"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +COMPATIBLE_MACHINE =3D "(am37x-evm|am180x-evm|ti33x)"
> +
> +PR =3D "r0"
> +
> +inherit task
> +
> +FIRMWARE_AND_DRIVERS_SRC =3D "ti-compat-wireless-wl12xx-src \
> +                            ti-compat-bluetooth-src \
> +                            bt-firmware-src \
> +                            bt-enable-src \
> +"
> +
> +# Need to add ${FIRMWARE_AND_DRIVERS_SRC} to the below list once
> the recipes have
> +# been added to meta-ti
> +RDEPENDS_${PN} =3D "\
> +"

I thought we were going to go ahead and make these recipes ready to go and =
just apply them after the patches were accepted in meta-ti.  I guess I'm OK=
 with this approach but it will be an empty package here.

> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-
> core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
> new file mode 100644
> index 0000000..c1ad218
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> connectivity-sdk-target.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Task to install wlan and bluetooth sources in
> SDK"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +COMPATIBLE_MACHINE =3D "(am37x-evm|am180x-evm|ti33x)"
> +
> +PR =3D "r0"
> +
> +inherit task
> +
> +# Bluetooth development packages
> +BLUETOOTH_STACK =3D "\
> +    bluez4-dev \
> +    openobex-dev \
> +"
> +
> +RDEPENDS_${PN} =3D "\
> +    ${BLUETOOTH_STACK} \
> +    wpa-supplicant-dev \
> +"
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-connectivity.bb b/meta-arago-distro/recipes-
> core/tasks/task-arago-tisdk-connectivity.bb
> new file mode 100644
> index 0000000..ecb86a9
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> connectivity.bb
> @@ -0,0 +1,65 @@
> +DESCRIPTION =3D "Task to install wlan and bluetooth packages into
> target FS"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +COMPATIBLE_MACHINE =3D "(am37x-evm|am180x-evm|ti33x)"
> +
> +PR =3D "r0"
> +
> +inherit task
> +
> +# WLAN support packages.
> +# These are the packages that all platforms use for WLAN support
> +WLAN_COMMON =3D "hostap-daemon \
> +               ti-wifi-utils \
> +               wireless-tools \
> +               htop \
> +               netperf \
> +               iw \
> +               crda \
> +               softap-udhcpd-config \
> +               oppserver \
> +               bluez-tools \
> +               obexd \
> +               pulseaudio \
> +               pulseaudio-server \
> +               pulseaudio-module-loopback \
> +               pulseaudio-module-bluetooth-discover \
> +               pulseaudio-module-bluetooth-device \
> +               eventdump \
> +               wpa-supplicant \
> +"
> +
> +FIRMWARE_AND_DRIVERS =3D "ti-compat-wireless-wl12xx \
> +                        ti-compat-bluetooth \
> +                        bt-firmware \
> +                        bt-enable \
> +                        wl12xx-firmware \
> +"
> +
> +BLUETOOTH_STACK =3D "\
> +    bluez4 \
> +    bluez4-agent \
> +    libasound-module-bluez \
> +    bluez-hcidump \
> +    openobex \
> +    openobex-apps \
> +    obexftp \
> +    ussp-push \
> +"
> +
> +# Need to add battleship to the below list once the application
> has been fixed
> +DEMO_APPS =3D "\
> +    bluetooth-gui \
> +    wifi-direct-demo \
> +    wpa-gui-e \
> +    wl1271-demo \
> +"
> +
> +# Need to add ${FIRMWARE_AND_DRIVERS} to the below list once the
> recipes have
> +# been added to meta-ti
> +RDEPENDS_${PN} =3D "\
> +    ${WLAN_COMMON} \
> +    ${WLAN_COMPAT} \
> +    ${BLUETOOTH_STACK} \
> +    ${DEMO_APPS} \
> +"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

