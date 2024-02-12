Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C52C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 11:13:38 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.4297.1707736412193747460
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 03:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=RXQJwU/c;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CBDT0W120352;
	Mon, 12 Feb 2024 05:13:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707736409;
	bh=DUHDuz+AbeZxdeprZOm9qP9yxMQOShNwInoo2WcUtoI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RXQJwU/c3vTX5NeY8w1NHCsi63j9+L4ykPuNX75M/37KyGXxXMtYra7I4J3MBx+er
	 dp2t6/ElBQN9QanUDoAZ52jTuwPDF1G4xflcuJ4AgKLti3fVsrbEvhIY9LMDAYPoM0
	 OphA8lxBYhpI1hDhV5U5WRU2+TDUpwCcz6cSyjgM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CBDTjW086038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Feb 2024 05:13:29 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 05:13:29 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 05:13:29 -0600
Received: from [172.24.227.88] (uda0500640.dhcp.ti.com [172.24.227.88])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CBDQ45024359;
	Mon, 12 Feb 2024 05:13:27 -0600
Message-ID: <c6cea247-23ff-0d3a-369b-b5f9cc75484d@ti.com>
Date: Mon, 12 Feb 2024 16:43:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][PATCH v2] meta-arago-extras: sysrepo: Update
 netopeer and sysrepo to start under systemd
Content-Language: en-US
To: Chirag Shilwant <c-shilwant@ti.com>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <srk@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20240212075433.24446-1-r-gunasekaran@ti.com>
 <adf70c17-915f-4045-be3b-0f0d1a43b208@ti.com>
 <1f8e047f-e04e-ef9c-8399-f9547e4027c3@ti.com>
 <924fcb33-8db2-4754-a662-1c0e4f29464f@ti.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <924fcb33-8db2-4754-a662-1c0e4f29464f@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 41CBDT0W120352
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Feb 2024 11:13:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15164



On 2/12/24 4:23 PM, Chirag Shilwant wrote:
> Ravi,
>=20
> On 12/02/24 16:01, Ravi Gunasekaran wrote:
>> Chirag,
>>
>> On 2/12/24 3:08 PM, Chirag Shilwant wrote:
>>> Ravi,
>>>
>>> Thanks for the v2.
>>>
>>> In both recipes I still see many references of /etc/ instead of Yocto=
 variables which we have been carrying on from past.
>>> Better we fix all the references to use Yocto variables so as to main=
tain consistency.
>>>
>> Would it be alright if I send a new patch on top of the v2 fixing the =
Yocto variables?
>=20
> Yes you can. In that case it should go as a patch series with first pat=
ch being your current v2
> and second patch doing the recipe cleanup for fixing Yocto variables.

Sure. I will send a v3.

>=20
> Patch series will help Ryan integrate it in proper order.
>=20
> Thanks,
> Chirag
>=20
>>
>>
>>> On 12/02/24 13:24, Ravi Gunasekaran wrote:
>>>> The init.d scripts for sysrepo and netopeer2-server requires certain
>>>> other init.d scripts that are now removed. And the systemd services =
generated
>>>> systemd-sysv-generator is not sufficient.
>>>>
>>>> So introduce new unit files for sysrepo and netopeer2 and update the
>>>> respective bitbake recipes.
>>>>
>>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>>> ---
>>>> Changes from v1:
>>>> ---------------
>>>> * Use Yocto installation variables for /etc/ and /usr/lib
>>>>
>>>> v1: https://lore.kernel.org/yocto-meta-arago/20240209103337.25332-1-=
r-gunasekaran@ti.com/
>>>>
>>>> =C2=A0=C2=A0 .../netopeer2-serverd.service=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2=
9 +++++++++++++++
>>>> =C2=A0=C2=A0 .../netopeer2-server/netopeer2-server_git.bb=C2=A0 | 20=
 +++++++++-
>>>> =C2=A0=C2=A0 .../sysrepo/sysrepo/sysrepod.service=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 +++++++++++++++++++
>>>> =C2=A0=C2=A0 .../recipes-sysrepo/sysrepo/sysrepo_git.bb=C2=A0=C2=A0=C2=
=A0 | 23 ++++++++++--
>>>> =C2=A0=C2=A0 4 files changed, 104 insertions(+), 5 deletions(-)
>>>> =C2=A0=C2=A0 create mode 100644 meta-arago-extras/recipes-sysrepo/ne=
topeer2-server/netopeer2-server/netopeer2-serverd.service
>>>> =C2=A0=C2=A0 create mode 100644 meta-arago-extras/recipes-sysrepo/sy=
srepo/sysrepo/sysrepod.service
>>>>
>>>> diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/neto=
peer2-server/netopeer2-serverd.service b/meta-arago-extras/recipes-sysrep=
o/netopeer2-server/netopeer2-server/netopeer2-serverd.service
>>>> new file mode 100644
>>>> index 00000000..3b365fca
>>>> --- /dev/null
>>>> +++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-s=
erver/netopeer2-serverd.service
>>>> @@ -0,0 +1,29 @@
>>>> +#Permission is hereby granted, free of charge, to any person obtain=
ing a copy
>>>> +#of this software and associated documentation files (the "Software=
"), to deal
>>>> +#in the Software without restriction, including without limitation =
the rights
>>>> +#to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell
>>>> +#copies of the Software, and to permit persons to whom the Software=
 is
>>>> +#furnished to do so, subject to the following conditions:
>>>> +#
>>>> +#The above copyright notice and this permission notice shall be inc=
luded in
>>>> +#all copies or substantial portions of the Software.
>>>> +#
>>>> +#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
>>>> +#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
>>>> +#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL THE
>>>> +#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
>>>> +#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING FROM,
>>>> +#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN
>>>> +#THE SOFTWARE.
>>>> +
>>>> +[Unit]
>>>> +Description=3DNetopeer2-Server
>>>> +After=3Dsysrepod.service
>>>> +
>>>> +[Service]
>>>> +RemainAfterExit=3Dtrue
>>>> +Type=3Doneshot
>>>> +ExecStart=3D/usr/sbin/netopeer2-server -v 1
>>>> +
>>>> +[Install]
>>>> +WantedBy=3Dmulti-user.target
>>>> diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/neto=
peer2-server_git.bb b/meta-arago-extras/recipes-sysrepo/netopeer2-server/=
netopeer2-server_git.bb
>>>> index e4278d23..427559e5 100644
>>>> --- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-s=
erver_git.bb
>>>> +++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-s=
erver_git.bb
>>>> @@ -3,7 +3,12 @@ DESCRIPTION =3D "Netopeer2 is based on the new gene=
ration of the NETCONF and YANG
>>>> =C2=A0=C2=A0 LICENSE =3D "BSD-3-Clause"
>>>> =C2=A0=C2=A0 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41daedff0b24=
958b2eba4f9086d782e1"
>>>> =C2=A0=C2=A0 -SRC_URI =3D "git://github.com/CESNET/Netopeer2.git;pro=
tocol=3Dhttps;branch=3Ddevel file://netopeer2-server"
>>>> +SRC_URI =3D "git://github.com/CESNET/Netopeer2.git;protocol=3Dhttps=
;branch=3Ddevel \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.=
contains('DISTRO_FEATURES', 'sysvinit', \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
'file://netopeer2-server', '', d)} \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.=
contains('DISTRO_FEATURES', 'systemd', \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
'file://netopeer2-serverd.service', '', d)} \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>>> =C2=A0=C2=A0 =C2=A0 PV =3D "2.1.59+git${SRCPV}"
>>>> =C2=A0=C2=A0 SRCREV =3D "b81788d9a81770313a0eb7f88d4224726b3d6e15"
>>>> @@ -16,10 +21,15 @@ RDEPENDS:${PN} +=3D "bash curl"
>>>> =C2=A0=C2=A0 FILES:${PN} +=3D "/usr/share/yang* /usr/share/netopeer2=
/* /usr/lib/sysrepo-plugind/*"
>>>> =C2=A0=C2=A0 =C2=A0 inherit cmake pkgconfig
>>>> +inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd=
', '', d)}
>>>> =C2=A0=C2=A0 =C2=A0 # Specify any options you want to pass to cmake =
using EXTRA_OECMAKE:
>>>> =C2=A0=C2=A0 EXTRA_OECMAKE =3D " -DCMAKE_INSTALL_PREFIX=3D/usr -DCMA=
KE_BUILD_TYPE:String=3DRelease -DINSTALL_MODULES=3DOFF -DGENERATE_HOSTKEY=
=3DOFF -DMERGE_LISTEN_CONFIG=3DOFF"
>>>> =C2=A0=C2=A0 +SYSTEMD_PACKAGES =3D "${PN}"
>>>> +SYSTEMD_SERVICE:${PN} =3D "netopeer2-serverd.service"
>>>> +SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
>>>> +
>>>> =C2=A0=C2=A0 do_install:append () {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/netopeer2/s=
cripts
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/sc=
ripts/setup.sh ${D}/etc/netopeer2/scripts/setup.sh
>>>> @@ -27,5 +37,11 @@ do_install:append () {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/sc=
ripts/merge_config.sh ${D}/etc/netopeer2/scripts/merge_config.sh
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/netopeer2
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/init.d
>>>> -=C2=A0=C2=A0=C2=A0 install -m 0755 ${WORKDIR}/netopeer2-server ${D}=
/etc/init.d/
>>>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'sysv=
init', 'true', 'false', d)}; then
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0755 ${WORKDI=
R}/netopeer2-server ${D}${sysconfdir}/init.d
>>>> +=C2=A0=C2=A0=C2=A0 fi
>>>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'syst=
emd', 'true', 'false', d)}; then
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${systemd=
_system_unitdir}
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDI=
R}/netopeer2-serverd.service ${D}${systemd_system_unitdir}
>>>> +=C2=A0=C2=A0=C2=A0 fi
>>>> =C2=A0=C2=A0 }
>>>> diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysre=
pod.service b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.=
service
>>>> new file mode 100644
>>>> index 00000000..1b4c3e3b
>>>> --- /dev/null
>>>> +++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.ser=
vice
>>>> @@ -0,0 +1,37 @@
>>>> +#Permission is hereby granted, free of charge, to any person obtain=
ing a copy
>>>> +#of this software and associated documentation files (the "Software=
"), to deal
>>>> +#in the Software without restriction, including without limitation =
the rights
>>>> +#to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell
>>>> +#copies of the Software, and to permit persons to whom the Software=
 is
>>>> +#furnished to do so, subject to the following conditions:
>>>> +#
>>>> +#The above copyright notice and this permission notice shall be inc=
luded in
>>>> +#all copies or substantial portions of the Software.
>>>> +#
>>>> +#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
>>>> +#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
>>>> +#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL THE
>>>> +#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
>>>> +#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING FROM,
>>>> +#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN
>>>> +#THE SOFTWARE.
>>>> +
>>>> +[Unit]
>>>> +Description=3DSysrepo
>>>> +After=3Dlocal-fs.target
>>>> +
>>>> +[Service]
>>>> +RemainAfterExit=3Dtrue
>>>> +Type=3Doneshot
>>>> +
>>>> +ExecStartPre=3D/bin/bash -c 'NP2_MODULE_DIR=3D"/usr/share/yang/modu=
les/netopeer2" \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 NP2_MODULE_PERMS=3D"600" NP2_MODULE_OWNER=3D"root" \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 NP2_MODULE_GROUP=3D"root" \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 exec /etc/netopeer2/scripts/setup.sh'
>>>> +ExecStartPre=3D/bin/bash /etc/netopeer2/scripts/merge_hostkey.sh
>>>> +ExecStartPre=3D/bin/bash /etc/netopeer2/scripts/merge_config.sh
>>>> +ExecStartPre=3D touch /etc/sysrepo/init
>>>> +ExecStart=3D/usr/bin/sysrepo-plugind
>>>> +
>>>> +[Install]
>>>> +WantedBy=3Dmulti-user.target
>>>> diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.b=
b b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
>>>> index 18da3ca3..0688b61f 100644
>>>> --- a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
>>>> +++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
>>>> @@ -4,7 +4,11 @@ DESCRIPTION =3D ""
>>>> =C2=A0=C2=A0 LICENSE =3D "BSD-3-Clause"
>>>> =C2=A0=C2=A0 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Def345f161efb=
68c3836e6f5648b2312f"
>>>> =C2=A0=C2=A0 -SRC_URI =3D "git://github.com/sysrepo/sysrepo.git;prot=
ocol=3Dhttps;branch=3Ddevel file://sysrepo"
>>>> +SRC_URI =3D "git://github.com/sysrepo/sysrepo.git;protocol=3Dhttps;=
branch=3Ddevel \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.=
utils.contains('DISTRO_FEATURES', 'sysvinit', \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 'file://sysrepo','', d)} \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.=
utils.contains('DISTRO_FEATURES', 'systemd', \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 'file://sysrepod.service','', d)}"
>>>> =C2=A0=C2=A0 =C2=A0 PV =3D "2.2.71+git${SRCPV}"
>>>> =C2=A0=C2=A0 SRCREV =3D "b828f0ab4693c613cc66efd053a146e05854d5c8"
>>>> @@ -16,12 +20,18 @@ DEPENDS =3D "libyang protobuf protobuf-c protobu=
f-c-native libredblack libev libne
>>>> =C2=A0=C2=A0 FILES:${PN} +=3D "/usr/share/yang/* /usr/lib/sysrepo-pl=
ugind/*"
>>>> =C2=A0=C2=A0 =C2=A0 inherit cmake pkgconfig python3native python3-di=
r
>>>> +inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd=
', '', d)}
>>>> +
>>>> =C2=A0=C2=A0 =C2=A0 # Specify any options you want to pass to cmake =
using EXTRA_OECMAKE:
>>>> =C2=A0=C2=A0 EXTRA_OECMAKE =3D " -DCMAKE_INSTALL_PREFIX:PATH=3D/usr =
-DCMAKE_BUILD_TYPE:String=3DRelease -DBUILD_EXAMPLES:String=3DFalse -DENA=
BLE_TESTS:String=3DFalse -DREPOSITORY_LOC:PATH=3D/etc/sysrepo=C2=A0 -DCAL=
L_TARGET_BINS_DIRECTLY=3DFalse -DGEN_LANGUAGE_BINDINGS:String=3DFalse "
>>>> =C2=A0=C2=A0 =C2=A0 BBCLASSEXTEND =3D "native nativesdk"
>>>> =C2=A0=C2=A0 +SYSTEMD_PACKAGES =3D "${PN}"
>>>> +SYSTEMD_SERVICE:${PN} =3D "sysrepod.service"
>>>> +SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
>>>> +
>>>> =C2=A0=C2=A0 do_install:append () {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/sysrepo/dat=
a/notifications
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/sysrepo/yan=
g
>>>> @@ -29,6 +39,13 @@ do_install:append () {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/mo=
dules/ietf-netconf-with-defaults.yang ${D}/etc/sysrepo/yang/ietf-netconf-=
with-defaults@2011-06-01.yang
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/mo=
dules/ietf-netconf.yang ${D}/etc/sysrepo/yang/ietf-netconf@2011-06-01.yan=
g
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/init.d
>>>> -=C2=A0=C2=A0=C2=A0 install -m 0775 ${WORKDIR}/sysrepo ${D}/etc/init=
.d/
>>>> -=C2=A0=C2=A0=C2=A0 install -d ${D}/usr/lib/sysrepo/plugins
>>>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'sysv=
init', 'true', 'false', d)}; then
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0775 ${WORKDI=
R}/sysrepo ${D}${sysconfdir}/init.d
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}=
/sysrepo/plugins
>>>> +=C2=A0=C2=A0=C2=A0 fi
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'syst=
emd', 'true', 'false', d)}; then
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${systemd=
_system_unitdir}
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDI=
R}/sysrepod.service ${D}${systemd_system_unitdir}
>>>> +=C2=A0=C2=A0=C2=A0 fi
>>>> =C2=A0=C2=A0 }
>>>>
>>>> base-commit: db4752d19a46406683f4a4adf8187de8075b70b6

--=20
Regards,
Ravi

