Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A84EF529D3
	for <meta-arago@arago-project.org>;
	Tue,  9 Jul 2013 16:00:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r69G0ZUD011664
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2013 11:00:35 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r69G0Zcc026917
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2013 11:00:35 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 9 Jul 2013 11:00:35 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: Help needed: Devkit header files not upto date with kernel
	headers
Thread-Index: Ac58uM2PpIbXIOSeQbWrqZRCbpOZMQAK7euAAApSroA=
Date: Tue, 9 Jul 2013 16:00:34 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49054937C6E@DLEE11.ent.ti.com>
References: <4F9216F96E5DF9428610502835A9F49054937C49@DLEE11.ent.ti.com>
	<20130709154017.GD14185@edge>
In-Reply-To: <20130709154017.GD14185@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Karicheri,
	Muralidharan" <m-karicheri2@ti.com>, "Shilimkar,
	Santosh" <santosh.shilimkar@ti.com>
Subject: Re: Help needed: Devkit header files not upto date with kernel headers
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
X-List-Received-Date: Tue, 09 Jul 2013 16:00:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Understand the user space headers and kernel space headers are different in=
 general.
But in this case, I am comparing the files under "uapi" directory. Which I =
assume is actually meant for user space api.
Am I wrong on this?
Given that , I expected the header file will be updated in building the dev=
kit. =20

For example if we have update on an "uapi" header file , as part of a kerne=
l patch,  Don't we expect the corresponding header file in devkit to be upd=
ated?
Appreciate your comments.

With regards,
Sam


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, July 09, 2013 11:40 AM
To: Nelson, Sam
Cc: meta-arago@arago-project.org; Karicheri, Muralidharan; Shilimkar, Santo=
sh
Subject: Re: Help needed: Devkit header files not upto date with kernel hea=
ders

On Tue, Jul 09, 2013 at 11:30:35AM -0400, Nelson, Sam wrote:
>    Hello all,
>=20
>    The header files under sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi doe=
s
>    not match the same file from the kernel tree.

That's normal. There's a difference between kernel and user-space facing he=
aders.

http://kernelnewbies.org/KernelHeaders


>    For example
>=20
>    Comparing the following 2 files, they are different.
>=20
>   =20
> sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi/usr/include/linux/ethtool.
> h
>=20
>    and
>=20
>   =20
> sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi/usr/src/kernel/include/uap
> i/linux/ethtool.h
>=20
>    =20
>=20
>    Looking into some details, the /usr/include/linux/ethtool.h, seems to =
come
>    from the libc package.

Yes, those are different even on my host machine. The first is marked as _L=
INUX_ETHTOOL_H and the second one as _UAPI_LINUX_ETHTOOL_H

http://lwn.net/Articles/113349/
http://lwn.net/Articles/507794/


>    Any ideas on what can be wrong in the recipes will be helpful.  Is the=
re
>    any way to update the user space header files to match the kernel head=
er
>    files?

There is a special recipe for that - linux-libc-headers.

--
Denys

