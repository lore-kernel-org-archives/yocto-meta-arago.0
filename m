Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCAFC4829D
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 10:31:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3744.1707733874157359758
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 02:31:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=JKOyIRAT;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CAVBYs046710;
	Mon, 12 Feb 2024 04:31:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707733871;
	bh=Wifklwo75dXt4S3H+O5nGBEdfSoMt4PmgHjvF3lGqWs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JKOyIRAT7ZpDdTHg8kxfYEu8l0LVeIwVZXQ/SnV7KmyO4pRo0DzLsj5Eoo+Wl5HoX
	 UTtnxsAb2JkeryNnbY+NmOwsyYBs0qyhwhpYWKRUhNaOj1ZCCI20SjRR4qazpjetAp
	 KKcz0g1p6N0AxK42HT9TF9vFpZvLHw9G7Row/qaU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CAVBdT062842
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Feb 2024 04:31:11 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 04:31:11 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 04:31:11 -0600
Received: from [172.24.227.88] (uda0500640.dhcp.ti.com [172.24.227.88])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CAV8mF097230;
	Mon, 12 Feb 2024 04:31:09 -0600
Message-ID: <1f8e047f-e04e-ef9c-8399-f9547e4027c3@ti.com>
Date: Mon, 12 Feb 2024 16:01:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][PATCH v2] meta-arago-extras: sysrepo: Update
 netopeer and sysrepo to start under systemd
Content-Language: en-US
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <srk@ti.com>, Ravi Gunasekaran <r-gunasekaran@ti.com>
References: <20240212075433.24446-1-r-gunasekaran@ti.com>
 <adf70c17-915f-4045-be3b-0f0d1a43b208@ti.com>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <adf70c17-915f-4045-be3b-0f0d1a43b208@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 41CAVBYs046710
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 12 Feb 2024 10:31:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15162

Chirag,

On 2/12/24 3:08 PM, Chirag Shilwant wrote:
> Ravi,
>=20
> Thanks for the v2.
>=20
> In both recipes I still see many references of /etc/ instead of Yocto v=
ariables which we have been carrying on from past.
> Better we fix all the references to use Yocto variables so as to mainta=
in consistency.
>=20

Would it be alright if I send a new patch on top of the v2 fixing the Yoc=
to variables?


> On 12/02/24 13:24, Ravi Gunasekaran wrote:
>> The init.d scripts for sysrepo and netopeer2-server requires certain
>> other init.d scripts that are now removed. And the systemd services ge=
nerated
>> systemd-sysv-generator is not sufficient.
>>
>> So introduce new unit files for sysrepo and netopeer2 and update the
>> respective bitbake recipes.
>>
>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>> ---
>> Changes from v1:
>> ---------------
>> * Use Yocto installation variables for /etc/ and /usr/lib
>>
>> v1: https://lore.kernel.org/yocto-meta-arago/20240209103337.25332-1-r-=
gunasekaran@ti.com/
>>
>> =C2=A0 .../netopeer2-serverd.service=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 29 +++++++=
++++++++
>> =C2=A0 .../netopeer2-server/netopeer2-server_git.bb=C2=A0 | 20 +++++++=
++-
>> =C2=A0 .../sysrepo/sysrepo/sysrepod.service=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 +++++++++++++++++++
>> =C2=A0 .../recipes-sysrepo/sysrepo/sysrepo_git.bb=C2=A0=C2=A0=C2=A0 | =
23 ++++++++++--
>> =C2=A0 4 files changed, 104 insertions(+), 5 deletions(-)
>> =C2=A0 create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-=
server/netopeer2-server/netopeer2-serverd.service
>> =C2=A0 create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo/sy=
srepo/sysrepod.service
>>
>> diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netope=
er2-server/netopeer2-serverd.service b/meta-arago-extras/recipes-sysrepo/=
netopeer2-server/netopeer2-server/netopeer2-serverd.service
>> new file mode 100644
>> index 00000000..3b365fca
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-ser=
ver/netopeer2-serverd.service
>> @@ -0,0 +1,29 @@
>> +#Permission is hereby granted, free of charge, to any person obtainin=
g a copy
>> +#of this software and associated documentation files (the "Software")=
, to deal
>> +#in the Software without restriction, including without limitation th=
e rights
>> +#to use, copy, modify, merge, publish, distribute, sublicense, and/or=
 sell
>> +#copies of the Software, and to permit persons to whom the Software i=
s
>> +#furnished to do so, subject to the following conditions:
>> +#
>> +#The above copyright notice and this permission notice shall be inclu=
ded in
>> +#all copies or substantial portions of the Software.
>> +#
>> +#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
>> +#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
>> +#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SH=
ALL THE
>> +#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTH=
ER
>> +#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING FROM,
>> +#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALIN=
GS IN
>> +#THE SOFTWARE.
>> +
>> +[Unit]
>> +Description=3DNetopeer2-Server
>> +After=3Dsysrepod.service
>> +
>> +[Service]
>> +RemainAfterExit=3Dtrue
>> +Type=3Doneshot
>> +ExecStart=3D/usr/sbin/netopeer2-server -v 1
>> +
>> +[Install]
>> +WantedBy=3Dmulti-user.target
>> diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netope=
er2-server_git.bb b/meta-arago-extras/recipes-sysrepo/netopeer2-server/ne=
topeer2-server_git.bb
>> index e4278d23..427559e5 100644
>> --- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-ser=
ver_git.bb
>> +++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-ser=
ver_git.bb
>> @@ -3,7 +3,12 @@ DESCRIPTION =3D "Netopeer2 is based on the new genera=
tion of the NETCONF and YANG
>> =C2=A0 LICENSE =3D "BSD-3-Clause"
>> =C2=A0 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41daedff0b24958b2eba=
4f9086d782e1"
>> =C2=A0 -SRC_URI =3D "git://github.com/CESNET/Netopeer2.git;protocol=3D=
https;branch=3Ddevel file://netopeer2-server"
>> +SRC_URI =3D "git://github.com/CESNET/Netopeer2.git;protocol=3Dhttps;b=
ranch=3Ddevel \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.co=
ntains('DISTRO_FEATURES', 'sysvinit', \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'f=
ile://netopeer2-server', '', d)} \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.co=
ntains('DISTRO_FEATURES', 'systemd', \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'f=
ile://netopeer2-serverd.service', '', d)} \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0 =C2=A0 PV =3D "2.1.59+git${SRCPV}"
>> =C2=A0 SRCREV =3D "b81788d9a81770313a0eb7f88d4224726b3d6e15"
>> @@ -16,10 +21,15 @@ RDEPENDS:${PN} +=3D "bash curl"
>> =C2=A0 FILES:${PN} +=3D "/usr/share/yang* /usr/share/netopeer2/* /usr/=
lib/sysrepo-plugind/*"
>> =C2=A0 =C2=A0 inherit cmake pkgconfig
>> +inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',=
 '', d)}
>> =C2=A0 =C2=A0 # Specify any options you want to pass to cmake using EX=
TRA_OECMAKE:
>> =C2=A0 EXTRA_OECMAKE =3D " -DCMAKE_INSTALL_PREFIX=3D/usr -DCMAKE_BUILD=
_TYPE:String=3DRelease -DINSTALL_MODULES=3DOFF -DGENERATE_HOSTKEY=3DOFF -=
DMERGE_LISTEN_CONFIG=3DOFF"
>> =C2=A0 +SYSTEMD_PACKAGES =3D "${PN}"
>> +SYSTEMD_SERVICE:${PN} =3D "netopeer2-serverd.service"
>> +SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
>> +
>> =C2=A0 do_install:append () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/netopeer2/scripts
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/scripts/se=
tup.sh ${D}/etc/netopeer2/scripts/setup.sh
>> @@ -27,5 +37,11 @@ do_install:append () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/scripts/me=
rge_config.sh ${D}/etc/netopeer2/scripts/merge_config.sh
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/netopeer2
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/init.d
>> -=C2=A0=C2=A0=C2=A0 install -m 0755 ${WORKDIR}/netopeer2-server ${D}/e=
tc/init.d/
>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvin=
it', 'true', 'false', d)}; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0755 ${WORKDIR}=
/netopeer2-server ${D}${sysconfdir}/init.d
>> +=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'system=
d', 'true', 'false', d)}; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${systemd_s=
ystem_unitdir}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}=
/netopeer2-serverd.service ${D}${systemd_system_unitdir}
>> +=C2=A0=C2=A0=C2=A0 fi
>> =C2=A0 }
>> diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepo=
d.service b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.se=
rvice
>> new file mode 100644
>> index 00000000..1b4c3e3b
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.servi=
ce
>> @@ -0,0 +1,37 @@
>> +#Permission is hereby granted, free of charge, to any person obtainin=
g a copy
>> +#of this software and associated documentation files (the "Software")=
, to deal
>> +#in the Software without restriction, including without limitation th=
e rights
>> +#to use, copy, modify, merge, publish, distribute, sublicense, and/or=
 sell
>> +#copies of the Software, and to permit persons to whom the Software i=
s
>> +#furnished to do so, subject to the following conditions:
>> +#
>> +#The above copyright notice and this permission notice shall be inclu=
ded in
>> +#all copies or substantial portions of the Software.
>> +#
>> +#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPR=
ESS OR
>> +#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABIL=
ITY,
>> +#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SH=
ALL THE
>> +#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTH=
ER
>> +#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARIS=
ING FROM,
>> +#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALIN=
GS IN
>> +#THE SOFTWARE.
>> +
>> +[Unit]
>> +Description=3DSysrepo
>> +After=3Dlocal-fs.target
>> +
>> +[Service]
>> +RemainAfterExit=3Dtrue
>> +Type=3Doneshot
>> +
>> +ExecStartPre=3D/bin/bash -c 'NP2_MODULE_DIR=3D"/usr/share/yang/module=
s/netopeer2" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 NP2_MODULE_PERMS=3D"600" NP2_MODULE_OWNER=3D"root" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 NP2_MODULE_GROUP=3D"root" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 exec /etc/netopeer2/scripts/setup.sh'
>> +ExecStartPre=3D/bin/bash /etc/netopeer2/scripts/merge_hostkey.sh
>> +ExecStartPre=3D/bin/bash /etc/netopeer2/scripts/merge_config.sh
>> +ExecStartPre=3D touch /etc/sysrepo/init
>> +ExecStart=3D/usr/bin/sysrepo-plugind
>> +
>> +[Install]
>> +WantedBy=3Dmulti-user.target
>> diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb =
b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
>> index 18da3ca3..0688b61f 100644
>> --- a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
>> +++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
>> @@ -4,7 +4,11 @@ DESCRIPTION =3D ""
>> =C2=A0 LICENSE =3D "BSD-3-Clause"
>> =C2=A0 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Def345f161efb68c3836e=
6f5648b2312f"
>> =C2=A0 -SRC_URI =3D "git://github.com/sysrepo/sysrepo.git;protocol=3Dh=
ttps;branch=3Ddevel file://sysrepo"
>> +SRC_URI =3D "git://github.com/sysrepo/sysrepo.git;protocol=3Dhttps;br=
anch=3Ddevel \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.ut=
ils.contains('DISTRO_FEATURES', 'sysvinit', \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 'file://sysrepo','', d)} \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.ut=
ils.contains('DISTRO_FEATURES', 'systemd', \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 'file://sysrepod.service','', d)}"
>> =C2=A0 =C2=A0 PV =3D "2.2.71+git${SRCPV}"
>> =C2=A0 SRCREV =3D "b828f0ab4693c613cc66efd053a146e05854d5c8"
>> @@ -16,12 +20,18 @@ DEPENDS =3D "libyang protobuf protobuf-c protobuf-=
c-native libredblack libev libne
>> =C2=A0 FILES:${PN} +=3D "/usr/share/yang/* /usr/lib/sysrepo-plugind/*"
>> =C2=A0 =C2=A0 inherit cmake pkgconfig python3native python3-dir
>> +inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',=
 '', d)}
>> +
>> =C2=A0 =C2=A0 # Specify any options you want to pass to cmake using EX=
TRA_OECMAKE:
>> =C2=A0 EXTRA_OECMAKE =3D " -DCMAKE_INSTALL_PREFIX:PATH=3D/usr -DCMAKE_=
BUILD_TYPE:String=3DRelease -DBUILD_EXAMPLES:String=3DFalse -DENABLE_TEST=
S:String=3DFalse -DREPOSITORY_LOC:PATH=3D/etc/sysrepo=C2=A0 -DCALL_TARGET=
_BINS_DIRECTLY=3DFalse -DGEN_LANGUAGE_BINDINGS:String=3DFalse "
>> =C2=A0 =C2=A0 BBCLASSEXTEND =3D "native nativesdk"
>> =C2=A0 +SYSTEMD_PACKAGES =3D "${PN}"
>> +SYSTEMD_SERVICE:${PN} =3D "sysrepod.service"
>> +SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
>> +
>> =C2=A0 do_install:append () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/sysrepo/data/notifi=
cations
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/sysrepo/yang
>> @@ -29,6 +39,13 @@ do_install:append () {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/modules/ie=
tf-netconf-with-defaults.yang ${D}/etc/sysrepo/yang/ietf-netconf-with-def=
aults@2011-06-01.yang
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -o root -g root ${S}/modules/ie=
tf-netconf.yang ${D}/etc/sysrepo/yang/ietf-netconf@2011-06-01.yang
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}/etc/init.d
>> -=C2=A0=C2=A0=C2=A0 install -m 0775 ${WORKDIR}/sysrepo ${D}/etc/init.d=
/
>> -=C2=A0=C2=A0=C2=A0 install -d ${D}/usr/lib/sysrepo/plugins
>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvin=
it', 'true', 'false', d)}; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0775 ${WORKDIR}=
/sysrepo ${D}${sysconfdir}/init.d
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${libdir}/s=
ysrepo/plugins
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'system=
d', 'true', 'false', d)}; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${systemd_s=
ystem_unitdir}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${WORKDIR}=
/sysrepod.service ${D}${systemd_system_unitdir}
>> +=C2=A0=C2=A0=C2=A0 fi
>> =C2=A0 }
>>
>> base-commit: db4752d19a46406683f4a4adf8187de8075b70b6

--=20
Regards,
Ravi

