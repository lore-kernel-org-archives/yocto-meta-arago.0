Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 104B7529B3
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 13:20:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CDKG9M026319
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 08:20:16 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CDKFjK028103
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 08:20:15 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Thu, 12 Mar 2015 08:20:14 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/4] arago.conf: Include wayland in
	DISTRO_FEATURES by default.
Thread-Index: AQHQXMP/SLq1Radux0+CZI5gIDm+Pp0Y1QXw
Date: Thu, 12 Mar 2015 13:20:14 +0000
Message-ID: <A2A3AF03-C549-41C8-B3A8-21E46E7BA19C@ti.com>
References: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>,
	<1426164957-22030-4-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1426164957-22030-4-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/4] arago.conf: Include wayland in	DISTRO_FEATURES by default.
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
X-List-Received-Date: Thu, 12 Mar 2015 13:20:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Honestly there is nothing technically wrong with depending on the screen bu=
t I feel that it should be removed from this patchset.=20

As of now the machines that doesn't have the screen machine feature set alr=
eady avoids all the packagegroups that would end up Wayland and Weston.

If we want to universally pull in graphical packages based on the screen ma=
chine feature then I think it would make sense to do it then when it is act=
ually going to do something.




> On Mar 12, 2015, at 7:56 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> * This is done conditional depending if 'screen' is a MACHINE_FEATURE.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> meta-arago-distro/conf/distro/arago.conf |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
> index 338d41b..1c14e6f 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -22,7 +22,7 @@ NO32LIBS =3D "0"
> DISTRO_FEATURES =3D "alsa argp bluetooth ext2 irda largefile pcmcia usbga=
dget usbhost wifi xattr nfs zeroconf pci 3g ipv4 ipv6 pulseaudio ${DISTRO_F=
EATURES_LIBC}"
>=20
> # Set additional distro features
> -DISTRO_FEATURES +=3D "pam"
> +DISTRO_FEATURES +=3D "pam ${@base_contains('MACHINE_FEATURES', 'screen',=
 'wayland', '', d)}"
>=20
> # Set preferred Qt version
> QT_PROVIDER ?=3D "qt5"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

