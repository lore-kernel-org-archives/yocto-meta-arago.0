Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 3865452972
	for <meta-arago@arago-project.org>;
	Thu,  5 Dec 2013 12:52:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB5Cq1hs019037
	for <meta-arago@arago-project.org>; Thu, 5 Dec 2013 06:52:01 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB5Cq140030467
	for <meta-arago@arago-project.org>; Thu, 5 Dec 2013 06:52:01 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 5 Dec 2013 06:52:01 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/3] matrix-gui-tscal: Add init package to
	run	ts_calibrate
Thread-Index: AQHO8Tguub23/lCeQ0WoIXuGGrbhippEtwPwgADX/CA=
Date: Thu, 5 Dec 2013 12:52:01 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159876FE6@DLEE11.ent.ti.com>
References: <1386196643-11077-1-git-send-email-Chase.Maupin@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C5CE5B5@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C5CE5B5@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] matrix-gui-tscal: Add init package to run	ts_calibrate
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
X-List-Received-Date: Thu, 05 Dec 2013 12:52:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Cooper Jr., Franklin
>Sent: Wednesday, December 04, 2013 6:31 PM
>To: Maupin, Chase; meta-arago@arago-project.org
>Subject: RE: [meta-arago] [PATCH 1/3] matrix-gui-tscal: Add init
>package to run ts_calibrate
>
>Can we change the name of this recipe to reflect that it=92s a
>ts_calibrate init script and that it has no relationship with
>matrix-gui? Probably put it at recipes-graphics/ since that is the
>directory where tslib is located in.
>
>Another option:
>
>Looking at tslib there is already a script called tslib.sh that
>looks like it has a similar purpose. That script is located at
>/etc/profile.d/ which is meant for Application Environment
>variables to be set. So would simply overriding this file with our
>script work?
>

I'll have to check on this.  I don't think I'll get to it this week but may=
be.

>Qt has a similar file in /etc/profile.d called qte.sh. So we could
>even take the Qt portion (matrix/matrix-gui/init) and override
>this file. This way configuring Qt to work with our touchscreen
>isn't coupled with Matrix but rather Qt itself.
>
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Maupin, Chase
>> Sent: Wednesday, December 04, 2013 4:37 PM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [PATCH 1/3] matrix-gui-tscal: Add init
>package to run
>> ts_calibrate
>>
>> * Add a package that will run ts_calibrate if needed.  This
>>   will allow separating this logic from the matrix init script
>>   since it is not always needed.
>>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  .../recipes-core/matrix/matrix-gui-tscal/init      |   43
>++++++++++++++++++++
>>  .../recipes-core/matrix/matrix-gui-tscal_1.0.bb    |   25
>+++++++++++
>>  2 files changed, 68 insertions(+), 0 deletions(-)  create mode
>100644 meta-
>> arago-extras/recipes-core/matrix/matrix-gui-tscal/init
>>  create mode 100644 meta-arago-extras/recipes-
>core/matrix/matrix-gui-
>> tscal_1.0.bb
>>
>> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>tscal/init b/meta-
>> arago-extras/recipes-core/matrix/matrix-gui-tscal/init
>> new file mode 100644
>> index 0000000..e8d9197
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-
>tscal/init
>> @@ -0,0 +1,43 @@
>> +#!/bin/sh
>> +# Copyright (C) {2013} Texas Instruments Incorporated -
>> +http://www.ti.com/ # # This program is free software; you can
>> +redistribute it and/or # modify it under the terms of the GNU
>General
>> +Public License as # published by the Free Software Foundation
>version
>> +2.
>> +#
>> +# This program is distributed "as is" WITHOUT ANY WARRANTY of
>any #
>> +kind, whether express or implied; without even the implied
>warranty #
>> +of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>the #
>> GNU
>> +General Public License for more details.
>> +
>> +tsfile=3D/etc/pointercal
>> +
>> +# Check if the SD card is mounted and the first partition is #
>vfat.
>> +If so let's write the pointercal file there so that if #
>someone messes
>> +up calibration they can just delete the file from # any system
>and
>> +reboot the board.
>> +
>> +#TODO how can we find the SD card and not eMMC?  can we look
>for a "boot"
>> +# LABEL?
>> +mount | grep /media/mmcblk0p1 | grep vfat > /dev/null 2>&1 if [
>"$?" =3D
>> +"0" ] then
>> +    tsfile=3D/media/mmcblk0p1/pointercal
>> +    export TSLIB_CALIBFILE=3D$tsfile
>> +fi
>> +
>> +if [ ! -f $tsfile ] ; then
>> +    echo -n "Calibrating touchscreen (first time only)"
>> +    ts_calibrate
>> +    echo "."
>> +
>> +    # If we create a pointercal file and it was not in
>/etc/pointercal
>> +    # let's copy it there as well if it does not already exist.
>This is so
>> +    # that running other applications that look for
>/etc/pointercal and
>> +    # without TSLIB_CALIBFILE set will still get the right
>calibration.
>> +    # TODO: can we just globally export TSLIB_CALIBFILE?
>> +    if [ ! -f /etc/pointercal -a -f $tsfile ]
>> +    then
>> +        cp $tsfile /etc/pointercal
>> +    fi
>> +fi
>> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-
>tscal_1.0.bb
>> b/meta-arago-extras/recipes-core/matrix/matrix-gui-tscal_1.0.bb
>> new file mode 100644
>> index 0000000..9156a6a
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-
>tscal_1.0.bb
>> @@ -0,0 +1,25 @@
>> +DESCRIPTION =3D "Matrix GUI TS calibration init script"
>> +
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D
>>
>"file://init;beginline=3D2;endline=3D11;md5=3D4b2e3b15f01cf63d2cb7988afd
>cc6c60
>> "
>> +
>> +PR =3D "r0"
>> +
>> +S =3D "${WORKDIR}"
>> +
>> +INITSCRIPT_NAME =3D "matrix-gui-tscal"
>> +# Start this init script before the matrix gui launches
>> +INITSCRIPT_PARAMS =3D "start 96 2 3 4 5 ."
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>> +inherit update-rc.d
>> +
>> +SRC_URI =3D "file://init"
>> +
>> +do_install(){
>> +	# Install the init script
>> +	# TODO: replace init script with systemd files
>> +	install -d ${D}${sysconfdir}/init.d
>> +	install -m 0755 ${WORKDIR}/init
>> +${D}${sysconfdir}/init.d/matrix-gui-tscal
>> +}
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

