Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id EE414529A7
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 15:59:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15FxQpG017148
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:59:26 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15FxPhv005494
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 09:59:25 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Thu, 5 Feb 2015 09:59:25 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] busybox/defconfig: Enable options
	required by LAVA
Thread-Index: AQHQQVZgG7uq5DFCQkK5ZINXYCEKKpziM1uLgABmBYD//51fdA==
Date: Thu, 5 Feb 2015 15:59:24 +0000
Message-ID: <3F32BBC6-B86C-4BF0-9F1C-F3CBD996E665@ti.com>
References: <1423148553-1225-1-git-send-email-ceh@ti.com>
	<20150205151353.GC9943@edge>
	<D03ED281-CA31-45D5-8623-3B6CDAD42EC8@ti.com>,
	<20150205155225.GH9943@edge>
In-Reply-To: <20150205155225.GH9943@edge>
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
X-List-Received-Date: Thu, 05 Feb 2015 15:59:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




> On Feb 5, 2015, at 9:52 AM, Dmytriyenko, Denys <denys@ti.com> wrote:
>=20
>> On Thu, Feb 05, 2015 at 10:47:16AM -0500, Cooper Jr., Franklin wrote:
>>=20
>>=20
>>=20
>>>> On Feb 5, 2015, at 9:14 AM, Dmytriyenko, Denys <denys@ti.com> wrote:
>>>>=20
>>>> On Thu, Feb 05, 2015 at 10:02:33AM -0500, Carlos Hernandez wrote:
>>>> Linaro's Test Framework (LAVA) requires httpd and other options
>>>> enabled in busybox. Enable them so LAVA tests can be run on Arago
>>>> images.
>>>=20
>>> Looks good. The only concern I have is below.
>>=20
>> Carlos,
>> Do we really need another web server?
>> We have lighttpd and thttpd already. Can either of those be reused=20
>> especially thttpd since it's already a light weight web server.
>=20
> I guess this question would need to be directed to LAVA guys. Not sure if=
=20
> their build includes any of those other http servers, hence they enabled =
the=20
> simplest one.
>=20
> We do indeed already have 2 http servers, and yes it would be nice to re-=
use=20
> one of them instead of enabling 3rd one. But the question is - who will=20
> validate and, if needed, update corresponding LAVA pieces to work with th=
ttpd?
Let me check how we currently use thttpd. I wouldn't mind replacing it with=
 httpd if possible instead of adding a third web server.
>=20
>=20
>>>> Signed-off-by: Carlos Hernandez <ceh@ti.com>
>>>> ---
>>>> meta-arago-distro/recipes-core/busybox/busybox/defconfig | 12 ++++++--=
----
>>>> 1 file changed, 6 insertions(+), 6 deletions(-)
>>>>=20
>>>> diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig =
b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
>>>> index 2d54b83..e0d6540 100644
>>>> --- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
>>>> +++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
>>>> @@ -135,8 +135,8 @@ CONFIG_CPIO=3Dy
>>>> # CONFIG_FEATURE_CPIO_O is not set
>>>> # CONFIG_FEATURE_CPIO_P is not set
>>>> # CONFIG_DPKG is not set
>>>> -# CONFIG_DPKG_DEB is not set
>>>> -# CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY is not set
>>>> +CONFIG_DPKG_DEB=3Dy
>>>> +CONFIG_FEATURE_DPKG_DEB_EXTRACT_ONLY=3Dy
>>>> CONFIG_GUNZIP=3Dy
>>>> CONFIG_GZIP=3Dy
>>>> # CONFIG_FEATURE_GZIP_LONG_OPTIONS is not set
>>>> @@ -154,7 +154,7 @@ CONFIG_FEATURE_TAR_GNU_EXTENSIONS=3Dy
>>>> # CONFIG_FEATURE_TAR_LONG_OPTIONS is not set
>>>> # CONFIG_FEATURE_TAR_TO_COMMAND is not set
>>>> # CONFIG_FEATURE_TAR_UNAME_GNAME is not set
>>>> -# CONFIG_FEATURE_TAR_NOPRESERVE_TIME is not set
>>>> +CONFIG_FEATURE_TAR_NOPRESERVE_TIME=3Dy
>>>> # CONFIG_FEATURE_TAR_SELINUX is not set
>>>> # CONFIG_UNCOMPRESS is not set
>>>> # CONFIG_UNLZMA is not set
>>>> @@ -700,7 +700,7 @@ CONFIG_MICROCOM=3Dy
>>>> # CONFIG_RFKILL is not set
>>>> # CONFIG_RUNLEVEL is not set
>>>> # CONFIG_RX is not set
>>>> -# CONFIG_SETSID is not set
>>>> +CONFIG_SETSID=3Dy
>>>> CONFIG_STRINGS=3Dy
>>>> # CONFIG_TASKSET is not set
>>>> # CONFIG_FEATURE_TASKSET_FANCY is not set
>>>> @@ -744,7 +744,7 @@ CONFIG_FEATURE_BRCTL_SHOW=3Dy
>>>> # CONFIG_FTPPUT is not set
>>>> # CONFIG_FEATURE_FTPGETPUT_LONG_OPTIONS is not set
>>>> CONFIG_HOSTNAME=3Dy
>>>> -# CONFIG_HTTPD is not set
>>>> +CONFIG_HTTPD=3Dy
>>>> # CONFIG_FEATURE_HTTPD_RANGES is not set
>>>> # CONFIG_FEATURE_HTTPD_USE_SENDFILE is not set
>>>> # CONFIG_FEATURE_HTTPD_SETUID is not set
>>>> @@ -845,7 +845,7 @@ CONFIG_UDHCP_DEBUG=3D0
>>>> # CONFIG_FEATURE_UDHCP_8021Q is not set
>>>> CONFIG_UDHCPC_DEFAULT_SCRIPT=3D"/usr/share/udhcpc/default.script"
>>>> CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=3D80
>>>> -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-R -n"
>>>> +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS=3D"-R -b"
>>>=20
>>> This supposedly changes udhcp behavior to go into background when waiti=
ng for=20
>>> an IP address, if not received right away, instead of exiting with an e=
rror.
>>> I personally don't have an issue with this, but will it affect SDK OOB=
=20
>>> experience in any way? Guys?
>=20
>> I'll double check but why instead of changing the default behavior simpl=
y=20
>> add &? I'm assuming you will get the same result but won't have to worry=
=20
>> about breaking anything.
>=20
> That's still not the same - with -n flag udhcp will time out soon if not=
=20
> received IP address, while with -b it will go into background and will wa=
it=20
> for IP address there. So, if you add & at the end of command with -n it w=
ill=20
> go into background, but exit soon after, which is not the same.
>=20
So it sits indefinitely and assigns ip's whenever it can? If so I would act=
ual prefer that. I still need to check.
>=20
>>>=20
>>> --=20
>>> Denys
>>>=20
>>>=20
>>>> CONFIG_UDPSVD=3Dy
>>>> CONFIG_VCONFIG=3Dy
>>>> CONFIG_WGET=3Dy
>>>> --=20
>>>> 1.9.1
>>>>=20
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

