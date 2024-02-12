Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBD2C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 10:53:38 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.4007.1707735215224913913
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 02:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=eOT+qMx3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CArWkt050073;
	Mon, 12 Feb 2024 04:53:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707735212;
	bh=XRSvZS8r2hR5C4C0xPuuPKDNMMG0OB8UlZVcgRR9E+c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eOT+qMx3bNquwWMqkvSTXS9Nfy8WXCayzJV8GP/WV4nxkatyYGV+Kz+tKFPuPInTq
	 T2Q3OnZDmmlr/MMq5Czeg/6nlHu16jI/ipHh0fI+nPoncE0oq4CpXzCL2fDfhF/HTY
	 QmElJxycpxKZ0LfZngvXG7ZbOyJ6pMadB2ou7KWQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CArWo8079689
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Feb 2024 04:53:32 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 04:53:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 04:53:32 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CArTb6127587;
	Mon, 12 Feb 2024 04:53:30 -0600
Message-ID: <924fcb33-8db2-4754-a662-1c0e4f29464f@ti.com>
Date: Mon, 12 Feb 2024 16:23:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/kirkstone][PATCH v2] meta-arago-extras: sysrepo: Update
 netopeer and sysrepo to start under systemd
Content-Language: en-US
To: Ravi Gunasekaran <r-gunasekaran@ti.com>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <srk@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20240212075433.24446-1-r-gunasekaran@ti.com>
 <adf70c17-915f-4045-be3b-0f0d1a43b208@ti.com>
 <1f8e047f-e04e-ef9c-8399-f9547e4027c3@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <1f8e047f-e04e-ef9c-8399-f9547e4027c3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 41CArWkt050073
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Feb 2024 10:53:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15163

Ravi,

On 12/02/24 16:01, Ravi Gunasekaran wrote:
> Chirag,
>
> On 2/12/24 3:08 PM, Chirag Shilwant wrote:
>> Ravi,
>>
>> Thanks for the v2.
>>
>> In both recipes I still see many references of /etc/ instead of Yocto =
variables which we have been carrying on from past.
>> Better we fix all the references to use Yocto variables so as to maint=
ain consistency.
>>
> Would it be alright if I send a new patch on top of the v2 fixing the Y=
octo variables?

Yes you can. In that case it should go as a patch series with first=20
patch being your current v2
and second patch doing the recipe cleanup for fixing Yocto variables.

Patch series will help Ryan integrate it in proper order.

Thanks,
Chirag

>
>
>> On 12/02/24 13:24, Ravi Gunasekaran wrote:
>>> The init.d scripts for sysrepo and netopeer2-server requires certain
>>> other init.d scripts that are now removed. And the systemd services g=
enerated
>>> systemd-sysv-generator is not sufficient.
>>>
>>> So introduce new unit files for sysrepo and netopeer2 and update the
>>> respective bitbake recipes.
>>>
>>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>>> ---
>>> Changes from v1:
>>> ---------------
>>> * Use Yocto installation variables for /etc/ and /usr/lib
>>>
>>> v1: https://lore.kernel.org/yocto-meta-arago/20240209103337.25332-1-r=
-gunasekaran@ti.com/
>>>
>>>  =C2=A0 .../netopeer2-serverd.service=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 29 ++++=
+++++++++++
>>>  =C2=A0 .../netopeer2-server/netopeer2-server_git.bb=C2=A0 | 20 +++++=
++++-
>>>  =C2=A0 .../sysrepo/sysrepo/sysrepod.service=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 +++++++++++++++++++
>>>  =C2=A0 .../recipes-sysrepo/sysrepo/sysrepo_git.bb=C2=A0=C2=A0=C2=A0 =
| 23 ++++++++++--
>>>  =C2=A0 4 files changed, 104 insertions(+), 5 deletions(-)
>>>  =C2=A0 create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer=
2-server/netopeer2-server/netopeer2-serverd.service
>>>  =C2=A0 create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo/=
sysrepo/sysrepod.service
>>>
>>> diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netop=
eer2-server/netopeer2-serverd.service b/meta-arago-extras/recipes-sysrepo=
/netopeer2-server/netopeer2-server/netopeer2-serverd.service
>>> new file mode 100644
>>> index 00000000..3b365fca
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-se=
rver/netopeer2-serverd.service
>>> @@ -0,0 +1,29 @@
>>> +#Permission is hereby granted, free of charge, to any person obtaini=
ng a copy
>>> +#of this software and associated documentation files (the "Software"=
), to deal
>>> +#in the Software without restriction, including without limitation t=
he rights
>>> +#to use, copy, modify, merge, publish, distribute, sublicense, and/o=
r sell
>>> +#copies of the Software, and to permit persons to whom the Software =
is
>>> +#furnished to do so, subject to the following conditions:
>>> +#
>>> +#The above copyright notice and this permission notice shall be incl=
uded in
>>> +#all copies or substantial portions of the Software.
>>> +#
>>> +#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
>>> +#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
>>> +#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT S=
HALL THE
>>> +#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
>>> +#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING FROM,
>>> +#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALI=
NGS IN
>>> +#THE SOFTWARE.
>>> +
>>> +[Unit]
>>> +Description=3DNetopeer2-Server
>>> +After=3Dsysrepod.service
>>> +
>>> +[Service]
>>> +RemainAfterExit=3Dtrue
>>> +Type=3Doneshot
>>> +ExecStart=3D/usr/sbin/netopeer2-server -v 1
>>> +
>>> +[Install]
>>> +WantedBy=3Dmulti-user.target
>>> diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netop=
eer2-server_git.bb b/meta-arago-extras/recipes-sysrepo/netopeer2-server/n=
etopeer2-server_git.bb
>>> index e4278d23..427559e5 100644
>>> --- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-se=
rver_git.bb
>>> +++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-se=
rver_git.bb
>>> @@ -3,7 +3,12 @@ DESCRIPTION =3D "Netopeer2 is based on the new gener=
ation of the NETCONF and YANG
>>>  =C2=A0 LICENSE =3D "BSD-3-Clause"
>>>  =C2=A0 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41daedff0b24958b2e=
ba4f9086d782e1"
>>>  =C2=A0 -SRC_URI =3D "git://github.com/CESNET/Netopeer2.git;protocol=3D=
https;branch=3Ddevel file://netopeer2-server"
>>> +SRC_URI =3D "git://github.com/CESNET/Netopeer2.git;protocol=3Dhttps;=
branch=3Ddevel \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.c=
ontains('DISTRO_FEATURES', 'sysvinit', \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '=
file://netopeer2-server', '', d)} \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.c=
ontains('DISTRO_FEATURES', 'systemd', \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 '=
file://netopeer2-serverd.service', '', d)} \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>>  =C2=A0 =C2=A0 PV =3D "2.1.59+git${SRCPV}"
>>>  =C2=A0 SRCREV =3D "b81788d9a81770313a0eb7f88d4224726b3d6e15"
>>> @@ -16,10 +21,15 @@ RDEPENDS:${PN} +=3D "bash curl"
>>>  =C2=A0 FILES:${PN} +=3D "/usr/share/yang* /usr/share/netopeer2/* /us=
r/lib/sysrepo-plugind/*"
>>>  =C2=A0 =C2=A0 inherit cmake pkgconfig
>>> +inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd'=
, '', d)}
>>>  =C2=A0 =C2=A0 # Specify any options you want to pass to cmake using =
EXTRA_OECMAKE:
>>>  =C2=A0 EXTRA_OECMAKE =3D " -DCMAKE_INSTALL_PREFIX=3D/usr -DCMAKE_BUI=
LD_TYPE:String=3DRelease -DINSTALL_MODULES=3DOFF -DGENERATE_HOSTKEY=3DOFF=
 -DMERGE_LISTEN_CONFIG=3DOFF"
>>>  =C2=A0 +SYSTEMD_PACKAGES =3D "${PN}"
>>> +SYSTEMD_SERVICE:${PN} =3D "netopeer2-serverd.service"
>>> +SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
>>> +
>>>  =C2=A0 do_install:append () {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/netopeer2/scripts
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/scripts/=
setup.sh ${D}/etc/netopeer2/scripts/setup.sh
>>> @@ -27,5 +37,11 @@ do_install:append () {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/scripts/=
merge_config.sh ${D}/etc/netopeer2/scripts/merge_config.sh
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/netopeer2
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/init.d
>>> -=C2=A0=C2=A0=C2=A0 install -m 0755 ${WORKDIR}/netopeer2-server ${D}/=
etc/init.d/
>>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvi=
nit', 'true', 'false', d)}; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0755 ${WORKDIR=
}/netopeer2-server ${D}${sysconfdir}/init.d
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'syste=
md', 'true', 'false', d)}; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${systemd_=
system_unitdir}
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR=
}/netopeer2-serverd.service ${D}${systemd_system_unitdir}
>>> +=C2=A0=C2=A0=C2=A0 fi
>>>  =C2=A0 }
>>> diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrep=
od.service b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.s=
ervice
>>> new file mode 100644
>>> index 00000000..1b4c3e3b
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.serv=
ice
>>> @@ -0,0 +1,37 @@
>>> +#Permission is hereby granted, free of charge, to any person obtaini=
ng a copy
>>> +#of this software and associated documentation files (the "Software"=
), to deal
>>> +#in the Software without restriction, including without limitation t=
he rights
>>> +#to use, copy, modify, merge, publish, distribute, sublicense, and/o=
r sell
>>> +#copies of the Software, and to permit persons to whom the Software =
is
>>> +#furnished to do so, subject to the following conditions:
>>> +#
>>> +#The above copyright notice and this permission notice shall be incl=
uded in
>>> +#all copies or substantial portions of the Software.
>>> +#
>>> +#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
>>> +#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
>>> +#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT S=
HALL THE
>>> +#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
>>> +#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING FROM,
>>> +#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALI=
NGS IN
>>> +#THE SOFTWARE.
>>> +
>>> +[Unit]
>>> +Description=3DSysrepo
>>> +After=3Dlocal-fs.target
>>> +
>>> +[Service]
>>> +RemainAfterExit=3Dtrue
>>> +Type=3Doneshot
>>> +
>>> +ExecStartPre=3D/bin/bash -c 'NP2_MODULE_DIR=3D"/usr/share/yang/modul=
es/netopeer2" \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 NP2_MODULE_PERMS=3D"600" NP2_MODULE_OWNER=3D"root" \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 NP2_MODULE_GROUP=3D"root" \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 exec /etc/netopeer2/scripts/setup.sh'
>>> +ExecStartPre=3D/bin/bash /etc/netopeer2/scripts/merge_hostkey.sh
>>> +ExecStartPre=3D/bin/bash /etc/netopeer2/scripts/merge_config.sh
>>> +ExecStartPre=3D touch /etc/sysrepo/init
>>> +ExecStart=3D/usr/bin/sysrepo-plugind
>>> +
>>> +[Install]
>>> +WantedBy=3Dmulti-user.target
>>> diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb=
 b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
>>> index 18da3ca3..0688b61f 100644
>>> --- a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
>>> +++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
>>> @@ -4,7 +4,11 @@ DESCRIPTION =3D ""
>>>  =C2=A0 LICENSE =3D "BSD-3-Clause"
>>>  =C2=A0 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Def345f161efb68c383=
6e6f5648b2312f"
>>>  =C2=A0 -SRC_URI =3D "git://github.com/sysrepo/sysrepo.git;protocol=3D=
https;branch=3Ddevel file://sysrepo"
>>> +SRC_URI =3D "git://github.com/sysrepo/sysrepo.git;protocol=3Dhttps;b=
ranch=3Ddevel \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.u=
tils.contains('DISTRO_FEATURES', 'sysvinit', \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 'file://sysrepo','', d)} \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.u=
tils.contains('DISTRO_FEATURES', 'systemd', \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 'file://sysrepod.service','', d)}"
>>>  =C2=A0 =C2=A0 PV =3D "2.2.71+git${SRCPV}"
>>>  =C2=A0 SRCREV =3D "b828f0ab4693c613cc66efd053a146e05854d5c8"
>>> @@ -16,12 +20,18 @@ DEPENDS =3D "libyang protobuf protobuf-c protobuf=
-c-native libredblack libev libne
>>>  =C2=A0 FILES:${PN} +=3D "/usr/share/yang/* /usr/lib/sysrepo-plugind/=
*"
>>>  =C2=A0 =C2=A0 inherit cmake pkgconfig python3native python3-dir
>>> +inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd'=
, '', d)}
>>> +
>>>  =C2=A0 =C2=A0 # Specify any options you want to pass to cmake using =
EXTRA_OECMAKE:
>>>  =C2=A0 EXTRA_OECMAKE =3D " -DCMAKE_INSTALL_PREFIX:PATH=3D/usr -DCMAK=
E_BUILD_TYPE:String=3DRelease -DBUILD_EXAMPLES:String=3DFalse -DENABLE_TE=
STS:String=3DFalse -DREPOSITORY_LOC:PATH=3D/etc/sysrepo=C2=A0 -DCALL_TARG=
ET_BINS_DIRECTLY=3DFalse -DGEN_LANGUAGE_BINDINGS:String=3DFalse "
>>>  =C2=A0 =C2=A0 BBCLASSEXTEND =3D "native nativesdk"
>>>  =C2=A0 +SYSTEMD_PACKAGES =3D "${PN}"
>>> +SYSTEMD_SERVICE:${PN} =3D "sysrepod.service"
>>> +SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
>>> +
>>>  =C2=A0 do_install:append () {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/sysrepo/data/noti=
fications
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/sysrepo/yang
>>> @@ -29,6 +39,13 @@ do_install:append () {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/modules/=
ietf-netconf-with-defaults.yang ${D}/etc/sysrepo/yang/ietf-netconf-with-d=
efaults@2011-06-01.yang
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/modules/=
ietf-netconf.yang ${D}/etc/sysrepo/yang/ietf-netconf@2011-06-01.yang
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/init.d
>>> -=C2=A0=C2=A0=C2=A0 install -m 0775 ${WORKDIR}/sysrepo ${D}/etc/init.=
d/
>>> -=C2=A0=C2=A0=C2=A0 install -d ${D}/usr/lib/sysrepo/plugins
>>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvi=
nit', 'true', 'false', d)}; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0775 ${WORKDIR=
}/sysrepo ${D}${sysconfdir}/init.d
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}/=
sysrepo/plugins
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'syste=
md', 'true', 'false', d)}; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${systemd_=
system_unitdir}
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR=
}/sysrepod.service ${D}${systemd_system_unitdir}
>>> +=C2=A0=C2=A0=C2=A0 fi
>>>  =C2=A0 }
>>>
>>> base-commit: db4752d19a46406683f4a4adf8187de8075b70b6

