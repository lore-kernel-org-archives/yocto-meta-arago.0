Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 77DA05209D
	for <meta-arago@arago-project.org>;
	Thu, 25 Oct 2012 02:33:10 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9P2X9lx029325;
	Wed, 24 Oct 2012 21:33:09 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9P2X9rZ004714;
	Wed, 24 Oct 2012 21:33:09 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 24 Oct 2012 21:33:09 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH v5] task-arago-tisdk-connectivity: Create
	new connectivity tasks
Thread-Index: AQHNsk7swwTHnGD9fEGotoUcj2aXrpfJnSgA//+wJiA=
Date: Thu, 25 Oct 2012 02:33:08 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C30B63B@DFLE09.ent.ti.com>
References: <1351127995-16678-1-git-send-email-fcooper@ti.com>
	<20121025021810.GE3465@denix.org>
In-Reply-To: <20121025021810.GE3465@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v5] task-arago-tisdk-connectivity: Create new connectivity tasks
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
X-List-Received-Date: Thu, 25 Oct 2012 02:33:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I was hoping I could send out my updated version before you looked at it bu=
t you beat me to it. :)

-----Original Message-----
From: Denys Dmytriyenko [mailto:denis@denix.org]=20
Sent: Wednesday, October 24, 2012 9:18 PM
To: Franklin S. Cooper Jr
Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
Subject: Re: [meta-arago] [PATCH v5] task-arago-tisdk-connectivity: Create =
new connectivity tasks

On Wed, Oct 24, 2012 at 08:19:55PM -0500, Franklin S. Cooper Jr wrote:
> From: Franklin S Cooper Jr <fcooper@ti.com>
>=20
> * Create new task-arago-tisdk-connectivity task including host and target
>   versions. The contents of these tasks were originally located in
>   task-arago-tisdk-crypto and task-arago-toolchain-tisdk-crypto-host and =
also
>   the target version.
>=20
> Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>

Ack, will push tomorrow.

> ---
> Version 5 changes:
> Use the standard 4 spaces for indentation Update comments
>=20
> Version 4 changes:
> Removed COMPATIBLE_MACHINE
> Added PACKAGE_ARCH and ALLOW_EMPTY when needed.
>=20
> Version 3 changes:
> Removed bt-objex since it was renamed to bluez-tools which was already ad=
ded.
> Removed recipes from the RDEPENDS if they still haven't been commited=20
> to meta-ti.
>=20
>  .../task-arago-tisdk-connectivity-sdk-host.bb      |   30 +++++++
>  .../task-arago-tisdk-connectivity-sdk-target.bb    |   37 ++++++++
>  .../tasks/task-arago-tisdk-connectivity.bb         |   87 ++++++++++++++=
++++++
>  3 files changed, 154 insertions(+), 0 deletions(-)  create mode=20
> 100644=20
> meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk
> -host.bb  create mode 100644=20
> meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-sdk
> -target.bb  create mode 100644=20
> meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
>=20
> diff --git=20
> a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-s
> dk-host.bb=20
> b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-s
> dk-host.bb
> new file mode 100644
> index 0000000..92a6353
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivi
> +++ ty-sdk-host.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION =3D "Task to install wlan and bluetooth sources into the SDK=
"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> +
> +PR =3D "r0"
> +
> +inherit task
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +ALLOW_EMPTY =3D "1"
> +
> +FIRMWARE_AND_DRIVERS_SRC =3D "
> +    ti-compat-wireless-wl12xx-src \
> +    ti-compat-bluetooth-src \
> +    bt-firmware-src \
> +    bt-enable-src \
> +"
> +
> +CONNECTIVITY_RDEPENDS =3D ""
> +
> +# Need to add ${FIRMWARE_AND_DRIVERS_SRC} to the below lists once the=20
> +recipes # have been added to meta-ti
> +
> +CONNECTIVITY_RDEPENDS_am37x-evm =3D ""
> +CONNECTIVITY_RDEPENDS_am180x-evm =3D ""
> +CONNECTIVITY_RDEPENDS_ti33x =3D ""
> +
> +RDEPENDS_${PN} =3D "\
> +    ${CONNECTIVITY_RDEPENDS} \
> +"
> diff --git=20
> a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-s
> dk-target.bb=20
> b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity-s
> dk-target.bb
> new file mode 100644
> index 0000000..a60bd34
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivi
> +++ ty-sdk-target.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION =3D "Task to install wlan and bluetooth headers and librarie=
s into the SDK"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> +
> +PR =3D "r0"
> +
> +inherit task
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +ALLOW_EMPTY =3D "1"
> +
> +# Bluetooth development packages
> +BLUETOOTH_STACK =3D "\
> +    bluez4-dev \
> +    openobex-dev \
> +"
> +
> +CONNECTIVITY_RDEPENDS =3D ""
> +
> +CONNECTIVITY_RDEPENDS_am37x-evm =3D "\
> +    ${BLUETOOTH_STACK} \
> +    wpa-supplicant-dev \
> +"
> +
> +CONNECTIVITY_RDEPENDS_am180x-evm =3D "\
> +    ${BLUETOOTH_STACK} \
> +    wpa-supplicant-dev \
> +"
> +
> +CONNECTIVITY_RDEPENDS_ti33x  =3D "\
> +    ${BLUETOOTH_STACK} \
> +    wpa-supplicant-dev \
> +"
> +
> +RDEPENDS_${PN} =3D "\
> +    ${CONNECTIVITY_RDEPENDS} \
> +"
> diff --git=20
> a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.b
> b=20
> b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.b
> b
> new file mode 100644
> index 0000000..1cbd0cc
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivi
> +++ ty.bb
> @@ -0,0 +1,87 @@
> +DESCRIPTION =3D "Task to install wlan and bluetooth packages into the ta=
rget FS"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> +
> +PR =3D "r0"
> +
> +inherit task
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +ALLOW_EMPTY =3D "1"
> +
> +# WLAN support packages.
> +# These are the packages that all platforms use for WLAN support=20
> +WLAN_COMMON =3D "\
> +    hostap-daemon \
> +    ti-wifi-utils \
> +    wireless-tools \
> +    htop \
> +    netperf \
> +    iw \
> +    crda \
> +    softap-udhcpd-config \
> +    oppserver \
> +    bluez-tools \
> +    obexd \
> +    pulseaudio \
> +    pulseaudio-server \
> +    pulseaudio-module-loopback \
> +    pulseaudio-module-bluetooth-discover \
> +    pulseaudio-module-bluetooth-device \
> +    eventdump \
> +    wpa-supplicant \
> +"
> +
> +FIRMWARE_AND_DRIVERS =3D "\
> +    ti-compat-wireless-wl12xx \
> +    ti-compat-bluetooth \
> +    bt-firmware \
> +    bt-enable \
> +    wl12xx-firmware \
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
> +# Need to add battleship to the below list once the application has=20
> +been fixed DEMO_APPS =3D "\
> +    bluetooth-gui \
> +    wifi-direct-demo \
> +    wpa-gui-e \
> +    wl1271-demo \
> +"
> +
> +CONNECTIVITY_RDEPENDS =3D ""
> +
> +# Need to add ${FIRMWARE_AND_DRIVERS} to the below lists once the=20
> +recipes have # been added to meta-ti
> +
> +CONNECTIVITY_RDEPENDS_am37x-evm =3D "\
> +    ${WLAN_COMMON} \
> +    ${BLUETOOTH_STACK} \
> +    ${DEMO_APPS} \
> +"
> +
> +CONNECTIVITY_RDEPENDS_am180x-evm  =3D "\
> +    ${WLAN_COMMON} \
> +    ${BLUETOOTH_STACK} \
> +    ${DEMO_APPS} \
> +"
> +
> +CONNECTIVITY_RDEPENDS_ti33x =3D "\
> +    ${WLAN_COMMON} \
> +    ${BLUETOOTH_STACK} \
> +    ${DEMO_APPS} \
> +"
> +
> +RDEPENDS_${PN} =3D "\
> +    ${CONNECTIVITY_RDEPENDS} \
> +"
> --
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>=20

