Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AB79E52986
	for <meta-arago@arago-project.org>;
	Tue, 21 Jan 2014 17:11:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0LHBCoj018559
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 11:11:12 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0LHBCMe029814
	for <meta-arago@arago-project.org>; Tue, 21 Jan 2014 11:11:12 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 21 Jan 2014 11:11:12 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 1/3] ts-calibrate-init: Add init package
	to run ts_calibrate
Thread-Index: AQHPFsGh4k4Efczj+kaws4+RSH22spqPafNw
Date: Tue, 21 Jan 2014 17:11:11 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015991599F@DLEE11.ent.ti.com>
References: <1390324458-29919-1-git-send-email-Chase.Maupin@ti.com>
	<20140121155828.GB30525@edge>
In-Reply-To: <20140121155828.GB30525@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 1/3] ts-calibrate-init: Add init package to run ts_calibrate
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
X-List-Received-Date: Tue, 21 Jan 2014 17:11:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Tuesday, January 21, 2014 9:59 AM
>To: Maupin, Chase
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 1/3] ts-calibrate-init: Add init
>package to run ts_calibrate
>
>On Tue, Jan 21, 2014 at 11:14:16AM -0600, Chase Maupin wrote:
>> * Add a package that will run ts_calibrate if needed.  This
>>   will allow separating this logic from the matrix init script
>>   since it is not always needed and allow others to use it for
>>   their own systems without requiring matrix.
>>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  .../recipes-graphics/tslib/ts-calibrate-init/init  |   50
>++++++++++++++++++++
>>  .../tslib/ts-calibrate-init_1.0.bb                 |   29
>+++++++++++
>>  2 files changed, 79 insertions(+), 0 deletions(-)
>>  create mode 100644 meta-arago-extras/recipes-graphics/tslib/ts-
>calibrate-init/init
>>  create mode 100644 meta-arago-extras/recipes-graphics/tslib/ts-
>calibrate-init_1.0.bb
>>
>> diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-
>calibrate-init/init b/meta-arago-extras/recipes-graphics/tslib/ts-
>calibrate-init/init
>> new file mode 100644
>> index 0000000..26ea581
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-
>init/init
>> @@ -0,0 +1,50 @@
>> +#!/bin/sh
>> +# Copyright (C) {2013} Texas Instruments Incorporated -
>http://www.ti.com/
>> +#
>> +# This program is free software; you can redistribute it and/or
>> +# modify it under the terms of the GNU General Public License
>as
>> +# published by the Free Software Foundation version 2.
>> +#
>> +# This program is distributed "as is" WITHOUT ANY WARRANTY of
>any
>> +# kind, whether express or implied; without even the implied
>warranty
>> +# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>the
>> +# GNU General Public License for more details.
>> +
>> +tsfile=3D/etc/pointercal
>> +
>> +# First let's check if we even see a touchscreen device node.
>If not
>> +# then bail out.
>> +if [ ! -e /dev/input/touchscreen0 ]
>> +then
>> +    exit
>> +fi
>> +
>> +# Check if the SD card is mounted and the first partition is
>> +# vfat.  If so let's write the pointercal file there so that if
>> +# someone messes up calibration they can just delete the file
>from
>> +# any system and reboot the board.
>> +
>> +#TODO how can we find the SD card and not eMMC?  can we look
>for a "boot"
>> +# LABEL?
>> +mount | grep /media/mmcblk0p1 | grep vfat > /dev/null 2>&1
>> +if [ "$?" =3D "0" ]
>> +then
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
>> diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-
>calibrate-init_1.0.bb b/meta-arago-extras/recipes-
>graphics/tslib/ts-calibrate-init_1.0.bb
>> new file mode 100644
>> index 0000000..7fdbc26
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-
>init_1.0.bb
>> @@ -0,0 +1,29 @@
>> +# This recipe installs an init script that can be used to
>invoke ts_calibrate
>> +# on systems that need this done during the boot sequence.
>
>Should it RDEPENDS on tslib/ts_calibrate binary that is used in
>the initscript?

Good point.  I'll fix that.

>
>
>> +DESCRIPTION =3D "TS calibration init script"
>> +
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D
>"file://init;beginline=3D2;endline=3D11;md5=3D4b2e3b15f01cf63d2cb7988afd
>cc6c60"
>> +
>> +PR =3D "r0"
>> +
>> +S =3D "${WORKDIR}"
>> +
>> +INITSCRIPT_NAME =3D "ts-calibrate"
>> +
>> +# Start this init script early enough for other processes to be
>started later
>> +# in the init sequence
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
>> +	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/ts-
>calibrate
>> +}
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

