Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 38E3B5296F
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 12:57:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92CvuFT016989;
	Wed, 2 Oct 2013 07:57:56 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92Cvuvj018389;
	Wed, 2 Oct 2013 07:57:56 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 2 Oct 2013 07:57:56 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 07/13] webkit-examples: enable building
	and packaging of examples
Thread-Index: AQHOvnWBB/ZoZ6yqZkid7/iWb7fhCJnhYPxQ
Date: Wed, 2 Oct 2013 12:57:56 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015977A5D7@DLEE11.ent.ti.com>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-8-git-send-email-denis@denix.org>
In-Reply-To: <1380611472-23600-8-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 07/13] webkit-examples: enable building and packaging of examples
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
X-List-Received-Date: Wed, 02 Oct 2013 12:57:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Some more explanation would be helpful here.  What is in the examples that =
you need to build and package?



>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Tuesday, October 01, 2013 2:11 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 07/13] webkit-examples: enable
>building and packaging of examples
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-qt/qt5/qtwebkit-examples/examples-build.patch
>| 9 +++++++++
> .../recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend
>| 5 +++++
> 2 files changed, 14 insertions(+)
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-
>examples/examples-build.patch
> create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-
>examples_5.1.0.bbappend
>
>diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit-
>examples/examples-build.patch b/meta-arago-distro/recipes-
>qt/qt5/qtwebkit-examples/examples-build.patch
>new file mode 100644
>index 0000000..d7dc6ae
>--- /dev/null
>+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-
>build.patch
>@@ -0,0 +1,9 @@
>+diff -uNr qtwebkit-examples-opensource-src-5.1.0-orig/qtwebkit-
>examples.pro qtwebkit-examples-opensource-src-5.1.0/qtwebkit-
>examples.pro
>+--- qtwebkit-examples-opensource-src-5.1.0-orig/qtwebkit-
>examples.pro	2013-07-02 03:10:27.000000000 -0400
>++++ qtwebkit-examples-opensource-src-5.1.0/qtwebkit-examples.pro
>	2013-09-29 21:31:10.761137146 -0400
>+@@ -2,4 +2,4 @@
>+
>+ load(qt_parts)
>+
>+-SUBDIRS +=3D doc
>++SUBDIRS +=3D doc examples
>diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit-
>examples_5.1.0.bbappend b/meta-arago-distro/recipes-
>qt/qt5/qtwebkit-examples_5.1.0.bbappend
>new file mode 100644
>index 0000000..7e41331
>--- /dev/null
>+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit-
>examples_5.1.0.bbappend
>@@ -0,0 +1,5 @@
>+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>+
>+SRC_URI +=3D "file://examples-build.patch"
>+
>+PR_append =3D "-arago0"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

