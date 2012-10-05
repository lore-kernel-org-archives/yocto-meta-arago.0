Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4EDE0529D2
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 12:30:57 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95CUuZD028248;
	Fri, 5 Oct 2012 07:30:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95CUuCn001306;
	Fri, 5 Oct 2012 07:30:56 -0500
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 07:30:56 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH v2] task-arago-tisdk-connectivity: Create
	new	connectivity tasks
Thread-Index: AQHNosCroZqTPZvm1Um0JYt7GpxNopeqpGWg
Date: Fri, 5 Oct 2012 12:30:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159247C17@DLEE12.ent.ti.com>
References: <1349419361-21472-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349419361-21472-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v2] task-arago-tisdk-connectivity: Create new	connectivity tasks
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
X-List-Received-Date: Fri, 05 Oct 2012 12:30:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
> Sent: Friday, October 05, 2012 1:43 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH v2] task-arago-tisdk-connectivity:
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
> Version 2 changes:
> Use new task naming convention.
> Added bt-obex
>=20
>  .../task-arago-tisdk-connectivity-sdk-host.bb      |   18 ++++++
>  .../task-arago-tisdk-connectivity-sdk-target.bb    |   19 ++++++
>  .../tasks/task-arago-tisdk-connectivity.bb         |   65
> ++++++++++++++++++++
>  3 files changed, 102 insertions(+), 0 deletions(-)
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
> index 0000000..74e4f3f
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
> connectivity-sdk-host.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "Task to install wlan and bluetooth sources in
> SDK"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
> 4de20420"
> +PR =3D "r0"
> +
> +inherit task
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE =3D "(am37x-evm|am180x-evm|ti33x)"
> +
> +WLAN_SOURCES =3D "ti-compat-wireless-wl12xx-src \
> +                ti-compat-bluetooth-src \
> +                bt-firmware-src \
> +                bt-enable-src \
> +               "
> +
> +RDEPENDS_${PN} =3D "\
> +    ${WLAN_SOURCES} \
> +    "
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-
> core/tasks/task-arago-tisdk-connectivity-sdk-target.bb
> new file mode 100644
> index 0000000..a63c801
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
> +PR =3D "r1"
> +
> +inherit task
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE =3D "(am37x-evm|am180x-evm|ti33x)"
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
> +    "
> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
> tisdk-connectivity.bb b/meta-arago-distro/recipes-
> core/tasks/task-arago-tisdk-connectivity.bb
> new file mode 100644
> index 0000000..e0aa0bd
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
> +PR =3D "r0"
> +
> +inherit task
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE =3D "(am37x-evm|am180x-evm|ti33x)"
> +
> +# WLAN support packages.
> +# These are the packages that all platforms use for WLAN support
> +WLAN_COMMON =3D "hostap-daemon \
> +               ti-wifi-utils \
> +               wireless-tools \
> +               htop \
> +               netperf \
> +               iw \
> +               wl12xx-firmware \

You need to submit the wl12xx-firmware to meta-ti in order for this to work=
.

> +               crda \
> +               softap-udhcpd-config \
> +               oppserver \
> +               bt-obex \
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
> +# These are the WLAN packages that are used for compatibility
> with the
> +# 2.6.37 kernel used by some devices

This comment can be modified to not say 2.6.37.  The compat is used to make=
 the drivers work with older and newer kernel versions.

> +WLAN_COMPAT =3D "ti-compat-wireless-wl12xx \
> +               ti-compat-bluetooth \
> +               bt-firmware \
> +               wl1271-demo \
> +               bt-enable \
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
> +# battleship is not included since it doesn't compile with Qt
> 4.8

Please make sure you send this feedback to the battleship owner

> +DEMO_APPS =3D "\
> +    bluetooth-gui \
> +    wifi-direct-demo \
> +    wpa-gui-e \
> +"
> +
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

