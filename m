Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 857E4529A7
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 13:36:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91DanJH027619;
	Tue, 1 Oct 2013 08:36:49 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91DanXk023057;
	Tue, 1 Oct 2013 08:36:49 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 1 Oct 2013 08:36:49 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [meta-arago] [PATCH 09/13] qt-provider.bbclass: class to allow
	seamless switching between Qt4 and Qt5
Thread-Index: AQHOvnWBKfj8uPanE0+qboL2qvgHFJnf2aQP
Date: Tue, 1 Oct 2013 13:36:49 +0000
Message-ID: <A337C05E-E0C0-4D1E-B3BB-2BBA6D20F510@ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>,
	<1380611472-23600-10-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-10-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 09/13] qt-provider.bbclass: class to allow seamless switching between Qt4 and Qt5
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
X-List-Received-Date: Tue, 01 Oct 2013 13:36:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ack.

As a temp solution I can understand some of these classes being added to me=
ta-arago but in the long term will these patches be moved to meta-qt5?


> On Oct 1, 2013, at 2:11 AM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Recipes that need to compile against either Qt4 or Qt5 should inherit thi=
s class
> instead of "inherit qt4e" or "inherit qt5" directly. Setting global QT_PR=
OVIDER
> to either "qt4e" or "qt5" will configure those recipes automatically.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> meta-arago-distro/classes/qt-provider.bbclass | 19 +++++++++++++++++++
> 1 file changed, 19 insertions(+)
> create mode 100644 meta-arago-distro/classes/qt-provider.bbclass
>=20
> diff --git a/meta-arago-distro/classes/qt-provider.bbclass b/meta-arago-d=
istro/classes/qt-provider.bbclass
> new file mode 100644
> index 0000000..444c76a
> --- /dev/null
> +++ b/meta-arago-distro/classes/qt-provider.bbclass
> @@ -0,0 +1,19 @@
> +# Class to handle switching between Qt4 and Qt5
> +# Usage:
> +# 1. Set QT_PROVIDER in distro config to either "qt4e" or "qt5"
> +#    It defaults to "qt4e" when not set
> +#    Hasn't been tested with "qt4x11" but should theoretically work
> +# 2. Update recipes to inherit qt-provider instead of qt4e directly
> +# 3. May need to use below QT_DEPENDS_* and QT_RDEPENDS_* variables
> +#    instead of the actual Qt-version specific values
> +
> +QT_PROVIDER ?=3D "qt4e"
> +
> +inherit ${QT_PROVIDER}
> +
> +# Build-time dependencies
> +QT_DEPENDS_BASE =3D "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase',=
 'qt4-embedded', d)}"
> +QT_DEPENDS_WEBKIT =3D "${@base_conditional('QT_PROVIDER', 'qt5', 'qtwebk=
it', '', d)}"
> +
> +# Run-time dependencies
> +QT_RDEPENDS_FONTS =3D "${@base_conditional('QT_PROVIDER', 'qt5', 'qtbase=
-fonts', 'qt4-embedded-fonts', d)}"
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

