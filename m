Return-Path: <manisha.agrawal@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 7A4BD52A3E
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 21:20:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81LKaPv020512
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504300836;
	bh=4lAsFDq5eVKpnuZWoUqEi+TFTG8qGMX1SD9cwKzCnf8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=sumUaCcOcggkrgn5NVYRex0RjNAy/kHLV32xQ4FrCEtHSFtKogDvzDPgzDVekP8tT
	Q6XaN9AP2kVKnWmvS2vZt2NoZj9QwASKmdduMK+3+xeSfJgOpo0TB/RyS3fp/FAt+p
	euP8vUj8zgCb+I0INTFN/WUd2r74FkunmH+kDsZc=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LKaWg024233
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:20:36 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Fri, 1 Sep 2017 16:20:36 -0500
From: "Agrawal, Manisha" <manisha.agrawal@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH 1/8] recipes-apps : add evse-hmi demo
Thread-Index: AQHTI2Yk+KDhnzpInEW1KQYBCu+vBKKgiU6w
Date: Fri, 1 Sep 2017 21:20:34 +0000
Message-ID: <3AC2660648D2B04999D9C7562469E8AF7EC3B92E@DFLE12.ent.ti.com>
References: <20170901210611.26095-1-manisha.agrawal@ti.com>
In-Reply-To: <20170901210611.26095-1-manisha.agrawal@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [PATCH 1/8] recipes-apps : add evse-hmi demo
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
X-List-Received-Date: Fri, 01 Sep 2017 21:20:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this series. They were meant for [meta-processor-sdk] subject=
 but somehow my git send email deleted the prefix.=20

Regards,
Manisha


-----Original Message-----
From: Agrawal, Manisha=20
Sent: Friday, September 01, 2017 4:06 PM
To: meta-arago@arago-project.org
Cc: Dmytriyenko, Denys; Stiffler, Jacob; Agrawal, Manisha
Subject: [PATCH 1/8] recipes-apps : add evse-hmi demo

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-apps/evse-hmi/evse-hmi_git.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100755 recipes-apps/evse-hmi/evse-hmi_git.bb

diff --git a/recipes-apps/evse-hmi/evse-hmi_git.bb b/recipes-apps/evse-hmi/=
evse-hmi_git.bb
new file mode 100755
index 0000000..abd4e90
--- /dev/null
+++ b/recipes-apps/evse-hmi/evse-hmi_git.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "HMI demo for electronic vehicle charging station (EVSE) using=
 QT QWidget tools"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://main.cpp;beginline=3D1;endline=3D33;md5=3Da9c=
de3921a8be42ed79ab74661799104"
+
+inherit qt-provider
+
+PV =3D "1.0"
+PR =3D "r0"
+
+BRANCH =3D "master"
+SRC_URI =3D "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=3Dgit;bra=
nch=3D${BRANCH}"
+
+SRCREV =3D "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
+
+S =3D "${WORKDIR}/git"
+
+CREATE_SRCIPK_evse-hmi =3D "1"                                            =
                                  =20
+SRCIPK_INSTALL_DIR_evse-hmi =3D "example-applications/${PN}-${PV}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 evse_hmi ${D}${bindir} }
--
2.13.0


