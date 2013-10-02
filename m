Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7EB145296F
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 12:58:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92CwmS1001790;
	Wed, 2 Oct 2013 07:58:48 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92Cwm2S019438;
	Wed, 2 Oct 2013 07:58:48 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Wed, 2 Oct 2013 07:58:48 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 08/13] qt5.bbclass: add new class similar
	to existing qt4e for configuring recipes
Thread-Index: AQHOvnWCL8p45WWMpUuUwAIgn/LIApnhYURA
Date: Wed, 2 Oct 2013 12:58:48 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015977A604@DLEE11.ent.ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-9-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-9-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 08/13] qt5.bbclass: add new class similar to existing qt4e for configuring recipes
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
X-List-Received-Date: Wed, 02 Oct 2013 12:58:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Echo of Franklin's upstreaming comment.

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, October 01, 2013 2:11 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 08/13] qt5.bbclass: add new class
>similar to existing qt4e for configuring recipes
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>The base class to set everything for recipes to build against Qt5
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/classes/qt5.bbclass | 20 ++++++++++++++++++++
> 1 file changed, 20 insertions(+)
> create mode 100644 meta-arago-distro/classes/qt5.bbclass
>
>diff --git a/meta-arago-distro/classes/qt5.bbclass b/meta-arago-
>distro/classes/qt5.bbclass
>new file mode 100644
>index 0000000..8669ea4
>--- /dev/null
>+++ b/meta-arago-distro/classes/qt5.bbclass
>@@ -0,0 +1,20 @@
>+# Class to mimic the old qt4e to prep recipe for use with Qt5
>libraries
>+
>+QT5EDEPENDS ?=3D "qtbase "
>+DEPENDS_prepend =3D "${QT5EDEPENDS}"
>+
>+inherit qmake5
>+
>+# we don't want conflicts with qt4
>+OE_QMAKE_PATH_HEADERS =3D "${OE_QMAKE_PATH_QT_HEADERS}"
>+OE_QMAKE_PATH_ARCHDATA =3D "${OE_QMAKE_PATH_QT_ARCHDATA}"
>+OE_QMAKE_PATH_DATA =3D "${OE_QMAKE_PATH_QT_DATA}"
>+OE_QMAKE_PATH_BINS =3D "${OE_QMAKE_PATH_QT_BINS}"
>+OE_QMAKE_PATH_TRANSLATIONS =3D "${OE_QMAKE_PATH_QT_TRANSLATIONS}"
>+OE_QMAKE_PATH_DOCS =3D "${OE_QMAKE_PATH_QT_DOCS}"
>+OE_QMAKE_PATH_SETTINGS =3D "${OE_QMAKE_PATH_QT_SETTINGS}"
>+OE_QMAKE_PATH_EXAMPLES =3D "${OE_QMAKE_PATH_QT_EXAMPLES}"
>+OE_QMAKE_PATH_TESTS =3D "${OE_QMAKE_PATH_QT_TESTS}"
>+
>+# Qt uses atomic instructions not supported in thumb mode
>+ARM_INSTRUCTION_SET =3D "arm"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

