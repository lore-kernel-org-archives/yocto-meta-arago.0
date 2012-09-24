Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 33FDA52A68
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2012 21:02:18 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8OL2H8U002029;
	Mon, 24 Sep 2012 16:02:17 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8OL2H5C011962;
	Mon, 24 Sep 2012 16:02:17 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Mon, 24 Sep 2012 16:02:17 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [meta-arago-extras][PATCH] ti-oobe-script: Add
	script to parse ip address
Thread-Index: AQHNmFhj5rZVXr5TokuW9WS8ZNwi4ZeaUSEA//+t8KQ=
Date: Mon, 24 Sep 2012 21:02:17 +0000
Message-ID: <581308D9-5B88-4B46-A8A0-F94B4C97E155@ti.com>
References: <1348274766-27559-1-git-send-email-fcooper@ti.com>,
	<20120924205600.GC4278@denix.org>
In-Reply-To: <20120924205600.GC4278@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-arago-extras][PATCH] ti-oobe-script: Add script to parse ip address
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
X-List-Received-Date: Mon, 24 Sep 2012 21:02:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I realized that I submitted several recipes and had meta-arago-extras in th=
e title when some are meant to be in distro. The actual patches are correct=
 however.

I am not aware of any plans to currently extend it so I am fine with renami=
ng it to parse-ip. I will send an updated patch.

On Sep 24, 2012, at 4:56 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:

> On Fri, Sep 21, 2012 at 07:46:06PM -0500, Franklin S. Cooper Jr wrote:
>> * Add script to parse ip address from the target system
>>  and save it into a mmc partition that is mountable by
>>  the host PC.
>> * This is used to determine the right ip address to bring
>>  up remote Matrix.
>>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> .../recipes-tisdk/ti-oobe-script/ti-oobe-script.bb |   24 ++++++++++
>> .../ti-oobe-script/ti-oobe-script/init             |   46 ++++++++++++++=
++++++
>> 2 files changed, 70 insertions(+), 0 deletions(-)
>> create mode 100644 meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oob=
e-script.bb
>> create mode 100644 meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oob=
e-script/init
>=20
> Not a big deal, but the subject says extras, while the recipe is actually=
 in=20
> distro, which I think is the correct location.
>=20
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-scri=
pt.bb b/meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-script.bb
>> new file mode 100644
>> index 0000000..4aba91d
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-script.bb
>> @@ -0,0 +1,24 @@
>> +DESCRIPTION =3D "Script to parse ip address during boot and make it ava=
ilable to the host system using shared partitions"
>> +LICENSE =3D "BSD"
>> +LIC_FILES_CHKSUM =3D "file://init;beginline=3D3;endline=3D31;md5=3Dfc4b=
04a33df6d892c9f4d4a9d92b945e"
>> +
>> +COMPATIBLE_MACHINE =3D "ti33x"
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>> +SRC_URI =3D "file://init"
>> +
>> +PR =3D "r0"
>> +
>> +S =3D "${WORKDIR}"
>> +
>> +INITSCRIPT_NAME =3D "parse-ip"
>=20
> Also, wouldn't it be better to call the recipe parse-ip as well, instead =
of=20
> ti-oobe-script? Is it meant to be extended in the future?
>=20
>=20
>> +INITSCRIPT_PARAMS =3D "defaults 98"
>> +
>> +inherit update-rc.d
>> +
>> +do_install() {
>> +    install -d ${D}${sysconfdir}/init.d
>> +    install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/parse-ip
>> +}
>> +
>> +FILES_${PN} =3D "${sysconfdir}"
>> diff --git a/meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-scri=
pt/init b/meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-script/ini=
t
>> new file mode 100644
>> index 0000000..0020ea2
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-tisdk/ti-oobe-script/ti-oobe-script/init
>> @@ -0,0 +1,46 @@
>> +#!/bin/sh
>> +
>> +# This distribution contains contributions or derivatives under copyrig=
ht
>> +# as follows:
>> +#
>> +# Copyright (c) 2010, Texas Instruments Incorporated
>> +# All rights reserved.
>> +#
>> +# Redistribution and use in source and binary forms, with or without
>> +# modification, are permitted provided that the following conditions
>> +# are met:
>> +# - Redistributions of source code must retain the above copyright noti=
ce,
>> +#   this list of conditions and the following disclaimer.
>> +# - Redistributions in binary form must reproduce the above copyright
>> +#   notice, this list of conditions and the following disclaimer in the
>> +#   documentation and/or other materials provided with the distribution=
.
>> +# - Neither the name of Texas Instruments nor the names of its
>> +#   contributors may be used to endorse or promote products derived
>> +#   from this software without specific prior written permission.
>> +#
>> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
>> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIM=
ITED
>> +# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTI=
CULAR
>> +# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
>> +# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
>> +# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
>> +# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
>> +# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY O=
F
>> +# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING =
NEGLIGENCE
>> +# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVE=
N IF
>> +# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>> +
>> +case "$1" in
>> +    start )
>> +        if [ -e /media/mmcblk0p1 ]
>> +        then
>> +            echo `ifconfig | grep 'inet addr:' | grep -v '127.0.0.1' | =
cut -d: -f2 | awk '{print $1}'` > /media/mmcblk0p1/.ipaddr
>> +            sync
>> +        sync
>> +    fi
>> +    ;;
>> +    stop )
>> +        exit 0;;
>> +esac
>> +
>> +exit 0
>> --=20
>> 1.7.0.4
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

