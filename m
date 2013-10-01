Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 780125297F
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 12:50:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91CoweC014054;
	Tue, 1 Oct 2013 07:50:58 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91CowJO019119;
	Tue, 1 Oct 2013 07:50:58 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Tue, 1 Oct 2013 07:50:58 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 13/13] arago-qt5-image: add test minimal
	image for testing Qt5 migration
Thread-Index: AQHOvnZcn7vmP/DG0k2a9NfhB2N7apnfzNOd
Date: Tue, 1 Oct 2013 12:50:57 +0000
Message-ID: <8778D9F4-AC13-4D36-908F-922789671691@ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>,
	<1380611472-23600-14-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-14-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 13/13] arago-qt5-image: add test minimal image for testing Qt5 migration
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
X-List-Received-Date: Tue, 01 Oct 2013 12:50:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm not sure if Matrix is a useful application to include I'm this test ima=
ge. The backend for Matrix isn't included and no Matrix apps will be instal=
led so I'm assuming all this would do is open a white Window.

Why not include something like the thermostat demo which is a much full fea=
tured demo based on QWidgets and is probably our best means to discover any=
 potential problems.

> On Oct 1, 2013, at 2:17 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> .../recipes-core/images/arago-qt5-image.bb             | 18 +++++++++++++=
+++++
> 1 file changed, 18 insertions(+)
> create mode 100644 meta-arago-distro/recipes-core/images/arago-qt5-image.=
bb
>=20
> diff --git a/meta-arago-distro/recipes-core/images/arago-qt5-image.bb b/m=
eta-arago-distro/recipes-core/images/arago-qt5-image.bb
> new file mode 100644
> index 0000000..7d8ced9
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/images/arago-qt5-image.bb
> @@ -0,0 +1,18 @@
> +# Arago TI SDK base image
> +# gives you an image with Qt/E and other common packages shared by all T=
I SDKs.
> +
> +require arago-image.inc
> +inherit remove-net-rules
> +
> +COMPATIBLE_MACHINE =3D "omap3|omapl138|ti33x|ti43x|omap4|omap-a15"
> +
> +IMAGE_INSTALL +=3D "\
> +    packagegroup-arago-base \
> +    packagegroup-arago-console \
> +    packagegroup-arago-base-tisdk \
> +    matrix-gui-browser \
> +    qtwebkit-examples-examples \
> +    qtbase-plugins \
> +    "
> +
> +export IMAGE_BASENAME =3D "arago-qt5-image"
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

