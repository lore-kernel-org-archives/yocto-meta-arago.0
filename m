Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031DAC4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 11:02:26 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.8961.1707476541955632916
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Feb 2024 03:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=k/0+I7FT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 419B2JCO121836;
	Fri, 9 Feb 2024 05:02:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707476539;
	bh=eg87Z12qI1wYU6wBnOJQlJ5xBPGZw5vf+1hQ8oSC+oM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=k/0+I7FThcxUZJVcvEMLfU7OfsGfsc9Aer7Fz0entcfrfa6mfnIiMkhSfVkAON7pJ
	 BxCSv7ZB0dSFHSxfDLEFx1mlRNvsBNkGTwWo5AqJEJHoEJoJvUm1yWTbpfjwef9ZxS
	 u0XKIWJrN5QVK29tFxuX1e6O9afToWafWBC6jw64=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 419B2Jas121052
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Feb 2024 05:02:19 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Feb 2024 05:02:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Feb 2024 05:02:18 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 419B2G2V059626;
	Fri, 9 Feb 2024 05:02:16 -0600
Message-ID: <fee79e2d-e00b-4ec8-9304-eeeb7d9997e7@ti.com>
Date: Fri, 9 Feb 2024 16:32:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago] [master/kirkstone][PATCH]
 meta-arago-extras: sysrepo: Update netopeer and sysrepo to start under
 systemd
Content-Language: en-US
To: <r-gunasekaran@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <srk@ti.com>
References: <20240209103337.25332-1-r-gunasekaran@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240209103337.25332-1-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 419B2JCO121836
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Feb 2024 11:02:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15150

Hi Ravi,

On 09/02/24 16:03, Ravi Gunasekaran via lists.yoctoproject.org wrote:
> The init.=E2=80=8Ad scripts for sysrepo and netopeer2-server requires c=
ertain=20
> other init.=E2=80=8Ad scripts that are now removed. And the systemd ser=
vices=20
> generated systemd-sysv-generator is not sufficient. So introduce new=20
> unit files for sysrepo and netopeer2
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> The init.d scripts for sysrepo and netopeer2-server requires certain
> other init.d scripts that are now removed. And the systemd services gen=
erated
> systemd-sysv-generator is not sufficient.
>
> So introduce new unit files for sysrepo and netopeer2 and update the
> respective bitbake recipes.
>
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
>   .../netopeer2-serverd.service                 | 29 +++++++++++++++
>   .../netopeer2-server/netopeer2-server_git.bb  | 20 +++++++++-
>   .../sysrepo/sysrepo/sysrepod.service          | 37 ++++++++++++++++++=
+
>   .../recipes-sysrepo/sysrepo/sysrepo_git.bb    | 23 ++++++++++--
>   4 files changed, 104 insertions(+), 5 deletions(-)
>   create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server=
/netopeer2-server/netopeer2-serverd.service
>   create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/=
sysrepod.service
>
> diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopee=
r2-server/netopeer2-serverd.service b/meta-arago-extras/recipes-sysrepo/n=
etopeer2-server/netopeer2-server/netopeer2-serverd.service
> new file mode 100644
> index 00000000..3b365fca
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-serv=
er/netopeer2-serverd.service
> @@ -0,0 +1,29 @@
> +#Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> +#of this software and associated documentation files (the "Software"),=
 to deal
> +#in the Software without restriction, including without limitation the=
 rights
> +#to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> +#copies of the Software, and to permit persons to whom the Software is
> +#furnished to do so, subject to the following conditions:
> +#
> +#The above copyright notice and this permission notice shall be includ=
ed in
> +#all copies or substantial portions of the Software.
> +#
> +#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> +#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> +#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL THE
> +#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHE=
R
> +#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> +#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> +#THE SOFTWARE.
> +
> +[Unit]
> +Description=3DNetopeer2-Server
> +After=3Dsysrepod.service
> +
> +[Service]
> +RemainAfterExit=3Dtrue
> +Type=3Doneshot
> +ExecStart=3D/usr/sbin/netopeer2-server -v 1
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopee=
r2-server_git.bb b/meta-arago-extras/recipes-sysrepo/netopeer2-server/net=
opeer2-server_git.bb
> index e4278d23..7c840243 100644
> --- a/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-serv=
er_git.bb
> +++ b/meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-serv=
er_git.bb
> @@ -3,7 +3,12 @@ DESCRIPTION =3D "Netopeer2 is based on the new generat=
ion of the NETCONF and YANG
>   LICENSE =3D "BSD-3-Clause"
>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41daedff0b24958b2eba4f9086=
d782e1"
>  =20
> -SRC_URI =3D "git://github.com/CESNET/Netopeer2.git;protocol=3Dhttps;br=
anch=3Ddevel file://netopeer2-server"
> +SRC_URI =3D "git://github.com/CESNET/Netopeer2.git;protocol=3Dhttps;br=
anch=3Ddevel \
> +          ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', \
> +	        'file://netopeer2-server', '', d)} \
> +          ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
> +	        'file://netopeer2-serverd.service', '', d)} \
> +          "
>  =20
>   PV =3D "2.1.59+git${SRCPV}"
>   SRCREV =3D "b81788d9a81770313a0eb7f88d4224726b3d6e15"
> @@ -16,10 +21,15 @@ RDEPENDS:${PN} +=3D "bash curl"
>   FILES:${PN} +=3D "/usr/share/yang* /usr/share/netopeer2/* /usr/lib/sy=
srepo-plugind/*"
>  =20
>   inherit cmake pkgconfig
> +inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', =
'', d)}
>  =20
>   # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
>   EXTRA_OECMAKE =3D " -DCMAKE_INSTALL_PREFIX=3D/usr -DCMAKE_BUILD_TYPE:=
String=3DRelease -DINSTALL_MODULES=3DOFF -DGENERATE_HOSTKEY=3DOFF -DMERGE=
_LISTEN_CONFIG=3DOFF"
>  =20
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE:${PN} =3D "netopeer2-serverd.service"
> +SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
> +
>   do_install:append () {
>       install -d ${D}/etc/netopeer2/scripts
>       install -o root -g root ${S}/scripts/setup.sh ${D}/etc/netopeer2/=
scripts/setup.sh
> @@ -27,5 +37,11 @@ do_install:append () {
>       install -o root -g root ${S}/scripts/merge_config.sh ${D}/etc/net=
opeer2/scripts/merge_config.sh
>       install -d ${D}/etc/netopeer2
>       install -d ${D}/etc/init.d
> -    install -m 0755 ${WORKDIR}/netopeer2-server ${D}/etc/init.d/
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fa=
lse', d)}; then
> +        install -m 0755 ${WORKDIR}/netopeer2-server ${D}/etc/init.d/
> +    fi
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fal=
se', d)}; then
> +        install -d ${D}${systemd_system_unitdir}
> +        install -m 0644 ${WORKDIR}/netopeer2-serverd.service ${D}${sys=
temd_system_unitdir}
> +    fi
>   }
> diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod=
.service b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.ser=
vice
> new file mode 100644
> index 00000000..1b4c3e3b
> --- /dev/null
> +++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.servic=
e
> @@ -0,0 +1,37 @@
> +#Permission is hereby granted, free of charge, to any person obtaining=
 a copy
> +#of this software and associated documentation files (the "Software"),=
 to deal
> +#in the Software without restriction, including without limitation the=
 rights
> +#to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
> +#copies of the Software, and to permit persons to whom the Software is
> +#furnished to do so, subject to the following conditions:
> +#
> +#The above copyright notice and this permission notice shall be includ=
ed in
> +#all copies or substantial portions of the Software.
> +#
> +#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> +#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> +#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL THE
> +#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHE=
R
> +#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
> +#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
> +#THE SOFTWARE.
> +
> +[Unit]
> +Description=3DSysrepo
> +After=3Dlocal-fs.target
> +
> +[Service]
> +RemainAfterExit=3Dtrue
> +Type=3Doneshot
> +
> +ExecStartPre=3D/bin/bash -c 'NP2_MODULE_DIR=3D"/usr/share/yang/modules=
/netopeer2" \
> +			   NP2_MODULE_PERMS=3D"600" NP2_MODULE_OWNER=3D"root" \
> +			   NP2_MODULE_GROUP=3D"root" \
> +			   exec /etc/netopeer2/scripts/setup.sh'
> +ExecStartPre=3D/bin/bash /etc/netopeer2/scripts/merge_hostkey.sh
> +ExecStartPre=3D/bin/bash /etc/netopeer2/scripts/merge_config.sh
> +ExecStartPre=3D touch /etc/sysrepo/init
> +ExecStart=3D/usr/bin/sysrepo-plugind
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb b=
/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
> index 18da3ca3..77da7b7a 100644
> --- a/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
> +++ b/meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo_git.bb
> @@ -4,7 +4,11 @@ DESCRIPTION =3D ""
>   LICENSE =3D "BSD-3-Clause"
>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Def345f161efb68c3836e6f5648=
b2312f"
>  =20
> -SRC_URI =3D "git://github.com/sysrepo/sysrepo.git;protocol=3Dhttps;bra=
nch=3Ddevel file://sysrepo"
> +SRC_URI =3D "git://github.com/sysrepo/sysrepo.git;protocol=3Dhttps;bra=
nch=3Ddevel \
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', \
> +                'file://sysrepo','', d)} \
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
> +                'file://sysrepod.service','', d)}"
>  =20
>   PV =3D "2.2.71+git${SRCPV}"
>   SRCREV =3D "b828f0ab4693c613cc66efd053a146e05854d5c8"
> @@ -16,12 +20,18 @@ DEPENDS =3D "libyang protobuf protobuf-c protobuf-c=
-native libredblack libev libne
>   FILES:${PN} +=3D "/usr/share/yang/* /usr/lib/sysrepo-plugind/*"
>  =20
>   inherit cmake pkgconfig python3native python3-dir
> +inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', =
'', d)}
> +
>  =20
>   # Specify any options you want to pass to cmake using EXTRA_OECMAKE:
>   EXTRA_OECMAKE =3D " -DCMAKE_INSTALL_PREFIX:PATH=3D/usr -DCMAKE_BUILD_=
TYPE:String=3DRelease -DBUILD_EXAMPLES:String=3DFalse -DENABLE_TESTS:Stri=
ng=3DFalse -DREPOSITORY_LOC:PATH=3D/etc/sysrepo  -DCALL_TARGET_BINS_DIREC=
TLY=3DFalse -DGEN_LANGUAGE_BINDINGS:String=3DFalse "
>  =20
>   BBCLASSEXTEND =3D "native nativesdk"
>  =20
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE:${PN} =3D "sysrepod.service"
> +SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
> +
>   do_install:append () {
>       install -d ${D}/etc/sysrepo/data/notifications
>       install -d ${D}/etc/sysrepo/yang
> @@ -29,6 +39,13 @@ do_install:append () {
>       install -o root -g root ${S}/modules/ietf-netconf-with-defaults.y=
ang ${D}/etc/sysrepo/yang/ietf-netconf-with-defaults@2011-06-01.yang
>       install -o root -g root ${S}/modules/ietf-netconf.yang ${D}/etc/s=
ysrepo/yang/ietf-netconf@2011-06-01.yang
>       install -d ${D}/etc/init.d
> -    install -m 0775 ${WORKDIR}/sysrepo ${D}/etc/init.d/
> -    install -d ${D}/usr/lib/sysrepo/plugins
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fa=
lse', d)}; then
> +        install -m 0775 ${WORKDIR}/sysrepo ${D}/etc/init.d/
> +        install -d ${D}/usr/lib/sysrepo/plugins

Using Yocto's Installation variables (just like you have it for systemd=20
below) is a good idea [1]
Eg,

  * ${D}/etc/init.d/ should be ${D}${sysconfdir}/init.d
  * ${D}/usr/lib/sysrepo/plugins should be ${D}${libdir}/sysrepo/plugins


Reference
---------
[1] http://www.embeddedlinux.org.cn/OEManual/directories_installation.htm=
l

> +    fi
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fal=
se', d)}; then
> +        install -d ${D}${systemd_system_unitdir}
> +        install -m 0644 ${WORKDIR}/sysrepod.service ${D}${systemd_syst=
em_unitdir}
> +    fi
>   }
>
> base-commit: db4752d19a46406683f4a4adf8187de8075b70b6
> --=20
> 2.17.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15148):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15148__;!!G3vK!WteFVQcTWZuhDmKaUzOjch=
X06LXVt5bLZibOfjHxJB6hb6iS8cqgjcWTUCC72HeA5RiRLZJ012AQbGldvKNki1dPVak8P43=
vSawg$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/104256565/7030289__;!!G3vK!WteFVQcTWZuhDmKaUzOjchX06LXVt5bLZibOfjH=
xJB6hb6iS8cqgjcWTUCC72HeA5RiRLZJ012AQbGldvKNki1dPVak8P27WlTjr$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!WteFVQcTWZuhDmKaUzOjchX06LXVt5bLZibOfjHxJB6hb=
6iS8cqgjcWTUCC72HeA5RiRLZJ012AQbGldvKNki1dPVak8P5U1J_IW$  [c-shilwant@ti.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

