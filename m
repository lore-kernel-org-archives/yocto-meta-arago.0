Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id AC0405299E
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 13:58:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25Dw6pn008788
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:58:07 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25Dw5SI007371
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 07:58:05 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 5 Mar 2015 07:58:05 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [RFC 1/4] arago-prefs: Add ARAGO_QT_PLATFORM.
Thread-Index: AQHQV0kGTo1ZZ0m7BUqZjcUC1ha/ap0N6jyj
Date: Thu, 5 Mar 2015 13:58:05 +0000
Message-ID: <9B999005-42AE-42BD-A9E4-290CBFA93E76@ti.com>
References: <1425562410-19688-1-git-send-email-j-stiffler@ti.com>,
	<1425562410-19688-2-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1425562410-19688-2-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC 1/4] arago-prefs: Add ARAGO_QT_PLATFORM.
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
X-List-Received-Date: Thu, 05 Mar 2015 13:58:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




> On Mar 5, 2015, at 7:33 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> * Currently supports either "wayland" of "eglfs"
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> .../conf/distro/include/arago-prefs.inc            |    2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta=
-arago-distro/conf/distro/include/arago-prefs.inc
> index e689f8b..96d84b8 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -28,6 +28,8 @@ PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
> ARAGO_QT_PROVIDER =3D "${@base_conditional('QT_PROVIDER','qt5','',base_co=
ntains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d),d)}"
> PREFERRED_PROVIDER_qt4-embedded =3D "${ARAGO_QT_PROVIDER}"
>=20
> +ARAGO_QT_PLATFORM =3D "wayland"
I would abstract this from Qt and simply name it  along the line of Wayland=
_supported.

The reason why is you don't want to include Wayland if your using Qt4 so yo=
u should set the value of this variable globally based on if Qt5 is being u=
sed or not.
> +
> PREFERRED_VERSION_qt4-embedded =3D "4.8.5"
> PREFERRED_VERSION_qt4-native =3D "4.8.5"
> PREFERRED_VERSION_nativesdk-qt4-tools =3D "4.8.5"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

