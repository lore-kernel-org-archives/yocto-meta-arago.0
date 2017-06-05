Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 3E7AB52A4F
	for <meta-arago@arago-project.org>;
	Mon,  5 Jun 2017 22:08:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v55M8Pv9013338
	for <meta-arago@arago-project.org>; Mon, 5 Jun 2017 17:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496700505;
	bh=93eDZqGtGa6D+jm9x1wJnzyBmwsRqy1RMZmIEm8wJcA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=oCFG+US/9l2xgOOaxDpucXfSAD7ewJDcSg7Si13ZyFN1TCiWbAyA/BcTet+0cAarw
	QUad1FDBnAYgTOuWw7hqXskxo0dmobws1OOCdlcXzk9B4X7fSp0MYrhW46k5IN6RnH
	89k7jsuTO/+Lt3svrZVCUcg23l6khvJl9JmQC4P4=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v55M8Okv017745
	for <meta-arago@arago-project.org>; Mon, 5 Jun 2017 17:08:24 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Mon, 5 Jun 2017 17:08:24 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/master][PATCH 1/2] qtwebbrowser-example:
	add QT web browser example
Thread-Index: AQHS3kcK1Cd5tEENxkyqqGZVbSzNNKIW0i9Q
Date: Mon, 5 Jun 2017 22:08:24 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A25386196@DFLE09.ent.ti.com>
References: <1496691014-53218-1-git-send-email-e-ruei1@ti.com>
	<20170605215928.GS9756@edge>
In-Reply-To: <20170605215928.GS9756@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/master][PATCH 1/2] qtwebbrowser-example: add QT web browser example
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
X-List-Received-Date: Mon, 05 Jun 2017 22:08:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

Please see my answers in-line below:

Best regards,

Eric


-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, June 05, 2017 5:59 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [morty/master][PATCH 1/2] qtwebbrowser-example: a=
dd QT web browser example

Eric,

Is it a standalone app? Why did you call it qtwebbrowser-example?
[ER] Yes, it is a standalone QT app.
         I call it qtwebbrowser-example to indicate that it is a QT demo ex=
ample, not a QT module such as qtwebengine.
         What name do you suggest?

Also, would it make sense to keep the main recipe in meta-arago-extra and a=
pply the fullscreen patch in meta-arago-distro? BTW, the patch is missing U=
pstream-Status field.
[ER] Yes, I can do that.

It seems you are copying the sources to the target as well - is it expected=
?
[ER] Yes, we would like the source code to be available just like some othe=
r QT demo programs.
=20
Also, when using "cp" to copy files, please use below or similar:
cp -R --no-dereference --preserve=3Dmode,links
[ER] Yes, I will follow your reference.

--
Denys


On Mon, Jun 05, 2017 at 03:30:13PM -0400, Eric Ruei wrote:
> - This is a touch-friendly web broswer based on qtwebengine and QML
>=20
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  ...0001-qtwebbrowser-disable-FullScreen-mode.patch | 28 ++++++++++++++++=
++
>  .../recipes-qt/qt5/qtwebbrowser-example_1.0.bb     | 33 ++++++++++++++++=
++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example=
/0001-qtwebbrowser-disable-FullScreen-mode.patch
>  create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example=
_1.0.bb
>=20
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example/0001-q=
twebbrowser-disable-FullScreen-mode.patch b/meta-arago-distro/recipes-qt/qt=
5/qtwebbrowser-example/0001-qtwebbrowser-disable-FullScreen-mode.patch
> new file mode 100644
> index 0000000..9cac96a
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example/0001-qtwebbro=
wser-disable-FullScreen-mode.patch
> @@ -0,0 +1,28 @@
> +From 268cf8dec9486fd875ab7fae241273e7b5b2a143 Mon Sep 17 00:00:00 2001
> +From: Eric Ruei <e-ruei1@ti.com>
> +Date: Fri, 2 Jun 2017 15:29:01 -0400
> +Subject: [PATCH] qtwebbrowser: disable FullScreen mode
> +
> +We need to disable full-screen mode because there is no way to exit in t=
hat mode
> +
> +Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> +---
> + src/main.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/main.cpp b/src/main.cpp
> +index 2181f15..5f146b6 100644
> +--- a/src/main.cpp
> ++++ b/src/main.cpp
> +@@ -101,7 +101,7 @@ int main(int argc, char **argv)
> +     if (view.size().isEmpty())
> +         view.setGeometry(0, 0, 800, 600);
> + #else
> +-    view.showFullScreen();
> ++    view.show();
> + #endif
> +=20
> +     app.exec();
> +--=20
> +1.9.1
> +
> diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example_1.0.bb=
 b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example_1.0.bb
> new file mode 100644
> index 0000000..a063207
> --- /dev/null
> +++ b/meta-arago-distro/recipes-qt/qt5/qtwebbrowser-example_1.0.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "Qt Touch-Friendly WebBroswer"
> +HOMEPAGE =3D "http://blog.qt.io/blog/2016/07/18/qt-webbrowser-1-0/"
> +SECTION =3D "multimedia"
> +LICENSE =3D "GPL-3.0 & GFDL-1.3"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSE.GPLv3;md5=3Da40e2bb02b1ac431f461afd03ff9d1d6 \
> +    file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> +"
> +DEPENDS +=3D "qtwebengine"
> +
> +PR =3D "r1"
> +
> +BRANCH =3D "dev"
> +SRCREV =3D "023733af5523a5ad84359926224fa106001215f4"
> +
> +SRC_URI =3D "git://code.qt.io/qt-apps/qtwebbrowser.git;protocol=3Dgit;br=
anch=3D${BRANCH} \
> +    file://0001-qtwebbrowser-disable-FullScreen-mode.patch \
> +"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit qt-provider
> +
> +# Install qtwebbrowser under /usr/share/qt5/examples/webengine
> +do_install() {
> +    install -d ${D}${datadir}/qt5/examples/webengine/webbrowser/src
> +    install -m 0755 src/qtwebbrowser ${D}${datadir}/qt5/examples/webengi=
ne/webbrowser/qtwebbrowser
> +    cp -r ${S}/* ${D}${datadir}/qt5/examples/webengine/webbrowser/.
> +}
> +
> +FILES_${PN} +=3D  " \
> +/usr/share/qt5/examples/webengine/webbrowser/* \
> +"
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

