Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D9AA8529B3
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 13:24:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CDOxLY026727
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 08:24:59 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CDOwIV031264
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 08:24:58 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Thu, 12 Mar 2015 08:24:57 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/4] arago.conf: Include wayland	in
	DISTRO_FEATURES by default.
Thread-Index: AQHQXMdL+I25N9zhf0G8JBmu7PtIqJ0Y1k+Z
Date: Thu, 12 Mar 2015 13:24:56 +0000
Message-ID: <E0139233-A002-4982-BF64-4BF6F56B2B5A@ti.com>
References: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>,
	<1426164957-22030-4-git-send-email-j-stiffler@ti.com>,
	<A2A3AF03-C549-41C8-B3A8-21E46E7BA19C@ti.com>
In-Reply-To: <A2A3AF03-C549-41C8-B3A8-21E46E7BA19C@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/4] arago.conf: Include wayland	in	DISTRO_FEATURES by default.
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
X-List-Received-Date: Thu, 12 Mar 2015 13:25:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Also this patch really should have been the first one in your patchset. Sin=
ce based on the patch order your temporarily preventing any machine from in=
cluding Wayland and Weston. This patch fixes it but you generally want to a=
void the issue at all.


> On Mar 12, 2015, at 8:20 AM, Cooper Jr., Franklin <fcooper@ti.com> wrote:
>=20
> Honestly there is nothing technically wrong with depending on the screen =
but I feel that it should be removed from this patchset.=20
>=20
> As of now the machines that doesn't have the screen machine feature set a=
lready avoids all the packagegroups that would end up Wayland and Weston.
>=20
> If we want to universally pull in graphical packages based on the screen =
machine feature then I think it would make sense to do it then when it is a=
ctually going to do something.
>=20
>=20
>=20
>=20
>> On Mar 12, 2015, at 7:56 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>>=20
>> * This is done conditional depending if 'screen' is a MACHINE_FEATURE.
>>=20
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>> meta-arago-distro/conf/distro/arago.conf |    2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distr=
o/conf/distro/arago.conf
>> index 338d41b..1c14e6f 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -22,7 +22,7 @@ NO32LIBS =3D "0"
>> DISTRO_FEATURES =3D "alsa argp bluetooth ext2 irda largefile pcmcia usbg=
adget usbhost wifi xattr nfs zeroconf pci 3g ipv4 ipv6 pulseaudio ${DISTRO_=
FEATURES_LIBC}"
>>=20
>> # Set additional distro features
>> -DISTRO_FEATURES +=3D "pam"
>> +DISTRO_FEATURES +=3D "pam ${@base_contains('MACHINE_FEATURES', 'screen'=
, 'wayland', '', d)}"
>>=20
>> # Set preferred Qt version
>> QT_PROVIDER ?=3D "qt5"
>> --=20
>> 1.7.9.5
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

