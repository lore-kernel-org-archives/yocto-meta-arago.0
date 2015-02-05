Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D752C529A7
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 15:47:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15FlI99016425
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:47:18 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15FlHiQ028489
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:47:17 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 5 Feb 2015 09:47:16 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] busybox/defconfig: Enable options
	required by LAVA
Thread-Index: AQHQQVZgG7uq5DFCQkK5ZINXYCEKKpziM1uL
Date: Thu, 5 Feb 2015 15:47:16 +0000
Message-ID: <D03ED281-CA31-45D5-8623-3B6CDAD42EC8@ti.com>
References: <1423148553-1225-1-git-send-email-ceh@ti.com>,
	<20150205151353.GC9943@edge>
In-Reply-To: <20150205151353.GC9943@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] busybox/defconfig: Enable options required by LAVA
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
X-List-Received-Date: Thu, 05 Feb 2015 15:47:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




> On Feb 5, 2015, at 9:14 AM, Dmytriyenko, Denys <denys@ti.com> wrote:
>=20
>> On Thu, Feb 05, 2015 at 10:02:33AM -0500, Carlos Hernandez wrote:
>> Linaro's Test Framework (LAVA) requires httpd and other options
>> enabled in busybox. Enable them so LAVA tests can be run on Arago
>> images.
>=20
> Looks good. The only concern I have is below.

Carlos,
Do we really need another web server?
We have lighttpd and thttpd already. Can either of those be reused especial=
ly thttpd since it's already a light weight web server.
>=20
>=20
>> Signed-off-by: Carlos Hernandez <ceh@ti.com>
>> ---
>> meta-arago-distro/recipes-core/busybox/busybox/defconfig | 12 ++++++----=
--
>> 1 file changed, 6 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/=
meta-arago-distro/recipes-core/busybox/busybox/defconfig
>> index 2d54b83..e0d6540 100644
>> --- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
>> +++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
>> @@ -135,8 +135,8 @@ CONFIG_CPIO=3Dy
>> # CONFIG_FEATURE_CPIO_O is not set
>> # CONFIG_FEATURE_CPIO_P is not set
>> # CONFIG_DPKG is not set
>> -# CONFIG_DPKG_DEB is not set
>> -# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
>> +CONFIG_DPKG_DEB=3Dy
>> +CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY=3Dy
>> CONFIG_GUNZIP=3Dy
>> CONFIG_GZIP=3Dy
>> # CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
>> @@ -154,7 +154,7 @@ CONFIG_FEATURE_TAR_GNU_EXTENSIONS=3Dy
>> # CONFIG_FEATURE_TAR_LONG_OPTIONS is not set
>> # CONFIG_FEATURE_TAR_TO_COMMAND is not set
>> # CONFIG_FEATURE_TAR_UNAME_GNAME is not set
>> -# CONFIG_FEATURE_TAR_NOPRESERVE_TIME is not set
>> +CONFIG_FEATURE_TAR_NOPRESERVE_TIME=3Dy
>> # CONFIG_FEATURE_TAR_SELINUX is not set
>> # CONFIG_UNCOMPRESS is not set
>> # CONFIG_UNLZMA is not set
>> @@ -700,7 +700,7 @@ CONFIG_MICROCOM=3Dy
>> # CONFIG_RFKILL is not set
>> # CONFIG_RUNLEVEL is not set
>> # CONFIG_RX is not set
>> -# CONFIG_SETSID is not set
>> +CONFIG_SETSID=3Dy
>> CONFIG_STRINGS=3Dy
>> # CONFIG_TASKSET is not set
>> # CONFIG_FEATURE_TASKSET_FANCY is not set
>> @@ -744,7 +744,7 @@ CONFIG_FEATURE_BRCTL_SHOW=3Dy
>> # CONFIG_FTPPUT is not set
>> # CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
>> CONFIG_HOSTNAME=3Dy
>> -# CONFIG_HTTPD is not set
>> +CONFIG_HTTPD=3Dy
>> # CONFIG_FEATURE_HTTPD_RANGES is not set
>> # CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set
>> # CONFIG_FEATURE_HTTPD_SETUID is not set
>> @@ -845,7 +845,7 @@ CONFIG_UDHCP_DEBUG=3D0
>> # CONFIG_FEATURE_UDHCP_8021Q is not set
>> CONFIG_UDHCPC_DEFAULT_SCRIPT=3D"/usr/share/udhcpc/default.script"
>> CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=3D80
>> -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-R -n"
>> +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-R -b"
>=20
> This supposedly changes udhcp behavior to go into background when waiting=
 for=20
> an IP address, if not received right away, instead of exiting with an err=
or.
> I personally don't have an issue with this, but will it affect SDK OOB=20
> experience in any way? Guys?
I'll double check but why instead of changing the default behavior simply a=
dd &? I'm assuming you will get the same result but won't have to worry abo=
ut breaking anything.
>=20
> --=20
> Denys
>=20
>=20
>> CONFIG_UDPSVD=3Dy
>> CONFIG_VCONFIG=3Dy
>> CONFIG_WGET=3Dy
>> --=20
>> 1.9.1
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

