Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 842E252990
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:23:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DNS1K026056;
	Tue, 1 Oct 2013 08:23:28 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DNSsF004277;
	Tue, 1 Oct 2013 08:23:28 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 1 Oct 2013 08:23:28 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 11/13] arago.conf: set QT_PROVIDER to Qt5,
	bump distro version
Thread-Index: AQHOvnWCETBC/4K2CUCcgqJgFXrUnJnf1enx
Date: Tue, 1 Oct 2013 13:23:27 +0000
Message-ID: <4FEEA6A8-A5F9-41F2-A88D-731FC280F154@ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>,
	<1380611472-23600-12-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-12-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 11/13] arago.conf: set QT_PROVIDER to Qt5, bump distro version
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
X-List-Received-Date: Tue, 01 Oct 2013 13:23:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

As long as we put this on a separate branch based on my reasoning I mention=
ed on this patch set cover sheet then I have no problem with this.

> On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> meta-arago-distro/conf/distro/arago.conf | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
> index 18299bd..7ecd2b4 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -1,6 +1,8 @@
> # Name and version of the distribution
> DISTRO_NAME =3D "Arago"
> -DISTRO_VERSION =3D "2013.08"
> +DISTRO_VERSION =3D "2013.10"
> +
> +QT_PROVIDER =3D "qt5"
>=20
> # SDK paths and names
> SDK_NAME_PREFIX =3D "arago"
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

