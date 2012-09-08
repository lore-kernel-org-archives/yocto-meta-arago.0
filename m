Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E22AD529B8
	for <meta-arago@arago-project.org>;
	Sat,  8 Sep 2012 16:01:43 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q88G1hQL011931;
	Sat, 8 Sep 2012 11:01:43 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q88G1gh4002006;
	Sat, 8 Sep 2012 11:01:43 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Sat, 8 Sep 2012 11:01:42 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago]	[meta-arago-distro][PATCH]
	task-arago-tisdk-connectivity: Add	bluetooth stack
Thread-Index: AQHNjInOrcMgIvmSjUSkiIwvTBx115eAnEhQgAABHh0=
Date: Sat, 8 Sep 2012 16:01:42 +0000
Message-ID: <7F14B13F-2AE6-4F01-9612-23A1DBB11022@ti.com>
References: <1346976237-18449-1-git-send-email-fcooper27jr@gmail.com>,
	<7D46E86EC0A8354091174257B2FED101591DDA07@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101591DDA07@DLEE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Franklin S.
	Cooper Jr" <fcooper27jr@gmail.com>
Subject: Re: [meta-arago-distro][PATCH]	task-arago-tisdk-connectivity: Add	bluetooth stack
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
X-List-Received-Date: Sat, 08 Sep 2012 16:01:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There are quite a bit of patches that need to be renamed that still haven't=
 been committed. I would prefer sending a single patch that renames all of =
the tasks once the patches are committed.

On Sep 8, 2012, at 10:58 AM, "Maupin, Chase" <chase.maupin@ti.com> wrote:

> Will you re-submit with new naming?
>=20
> Sincerely,
> Chase Maupin
> Software Applications
> ARM MPU
> e-mail: chase.maupin@ti.com
> phone: (214) 567-2950
>=20
> For support:
> Forums - http://community.ti.com/forums/
> Wiki - http://wiki.davincidsp.com/=20
>=20
>=20
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
>> Sent: Thursday, September 06, 2012 7:04 PM
>> To: meta-arago@arago-project.org
>> Cc: Franklin S. Cooper Jr
>> Subject: [meta-arago] [meta-arago-distro][PATCH] task-arago-
>> tisdk-connectivity: Add bluetooth stack
>>=20
>> * Add list of bluetooth stack libraries to task-arago-tisdk-
>> connectivity.
>> * This list was previously located in task-arago-tisdk-bsp and
>>  task-arago-toolchain-tisdk-bsp-target in arago.
>>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
>> ---
>> .../tasks/task-arago-tisdk-connectivity-target.bb  |    9
>> ++++++++-
>> .../tasks/task-arago-tisdk-connectivity.bb         |   16
>> +++++++++++++---
>> 2 files changed, 21 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
>> tisdk-connectivity-target.bb b/meta-arago-distro/recipes-
>> core/tasks/task-arago-tisdk-connectivity-target.bb
>> index deb7b7b..a63c801 100644
>> --- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
>> connectivity-target.bb
>> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
>> connectivity-target.bb
>> @@ -1,12 +1,19 @@
>> DESCRIPTION =3D "Task to install wlan and bluetooth sources in
>> SDK"
>> LICENSE =3D "MIT"
>> LIC_FILES_CHKSUM =3D
>> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
>> 4de20420"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>=20
>> inherit task
>> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> COMPATIBLE_MACHINE =3D "(am37x-evm|am180x-evm|ti33x)"
>>=20
>> +# Bluetooth development packages
>> +BLUETOOTH_STACK =3D "\
>> +    bluez4-dev \
>> +    openobex-dev \
>> +"
>> +
>> RDEPENDS_${PN} =3D "\
>> +    ${BLUETOOTH_STACK} \
>>     wpa-supplicant-dev \
>>     "
>> diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-
>> tisdk-connectivity.bb b/meta-arago-distro/recipes-
>> core/tasks/task-arago-tisdk-connectivity.bb
>> index 1ff849c..17f97d1 100644
>> --- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
>> connectivity.bb
>> +++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-
>> connectivity.bb
>> @@ -1,7 +1,7 @@
>> DESCRIPTION =3D "Task to install wlan and bluetooth packages into
>> target FS"
>> LICENSE =3D "MIT"
>> LIC_FILES_CHKSUM =3D
>> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b
>> 4de20420"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>=20
>> inherit task
>> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> @@ -42,10 +42,20 @@ WLAN_COMPAT =3D "ti-compat-wireless-wl12xx \
>>                bt-enable \
>> "
>>=20
>> -BLUETOOTH =3D "bluetooth-gui"
>> +BLUETOOTH_STACK =3D "\
>> +    bluez4 \
>> +    bluez4-agent \
>> +    libasound-module-bluez \
>> +    bluez-hcidump \
>> +    openobex \
>> +    openobex-apps \
>> +    obexftp \
>> +    ussp-push \
>> +    "
>>=20
>> RDEPENDS_${PN} =3D "\
>>     ${WLAN_COMMON} \
>>     ${WLAN_COMPAT} \
>> -    ${BLUETOOTH} \
>> +    ${BLUETOOTH_STACK} \
>> +    bluetooth-gui \
>> "
>> --
>> 1.7.0.4
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

