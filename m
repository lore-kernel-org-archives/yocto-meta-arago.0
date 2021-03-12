Return-Path: <hnagalla@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 845DC52A9E
	for <meta-arago@arago-project.org>;
	Fri, 12 Mar 2021 14:11:45 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12CEC0We056197
	for <meta-arago@arago-project.org>; Fri, 12 Mar 2021 08:12:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615558320;
	bh=6SQd/KndpQUKzHuPH+klEiuUYXXpS/584teA5DmzOpE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Km4Vw602Q6u6hULiNLOPhhlFyPKzZ7Pbfv7aS1sF36DfP0so/jAgpmEIqrlDS6lcZ
	2REiU52jP3Uzh7Gk6f4GBe+KjN2Q2hbe0h0ccFPIiYGaC25shABMeqgAg0o43p5dtS
	PKxqOlsB1jbC+lpnYWYV7Ugfe7Q0ZwX52H0xucTk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12CEC0hk019897
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 12 Mar 2021 08:12:00 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 12 Mar 2021 08:12:00 -0600
Received: from DFLE100.ent.ti.com ([fe80::f19c:5926:3526:1b30]) by
	DFLE100.ent.ti.com ([fe80::f19c:5926:3526:1b30%17]) with mapi id
	15.01.2176.009; Fri, 12 Mar 2021 08:12:00 -0600
From: "Nagalla, Hari" <hnagalla@ti.com>
To: "Devshatwar, Nikhil" <nikhil.nd@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Bajjuri, Praneeth" <praneeth@ti.com>
Thread-Topic: [meta-arago][dunfell][PATCH v3] packagegroups:
	tisdk-connectivity: Include TI wlan packages for k3 platforms
Thread-Index: AQHXFegY/kcxjVlDhkaJHA8u8dwfh6qAZnvA
Date: Fri, 12 Mar 2021 14:12:00 +0000
Message-ID: <ca820feb23b6466fac63dab322464cb9@ti.com>
References: <20210310200045.1287-1-nikhil.nd@ti.com>
In-Reply-To: <20210310200045.1287-1-nikhil.nd@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.76.64]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Mar 2021 15:01:46 +0000
Cc: "Vutla, Lokesh" <lokeshvutla@ti.com>, "Narang,
	Saurabh" <saurabhnarang@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>,
	Kishon Vijay Abraham <kishon@ti.com>
Subject: Re: [dunfell][PATCH v3] packagegroups: tisdk-connectivity: Include TI wlan packages for k3 platforms
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
X-List-Received-Date: Fri, 12 Mar 2021 14:11:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I believe, you could do the same for 'BT_TI' components. Add it to the CONN=
ECTIVITY_RDEPENDS variable.

In the current builds, BT FW is missing.. The above would fix it..

Thanks
Hari

-----Original Message-----
From: Devshatwar, Nikhil=20
Sent: Wednesday, March 10, 2021 2:01 PM
To: meta-arago@arago-project.org; Bajjuri, Praneeth <praneeth@ti.com>
Cc: Vutla, Lokesh <lokeshvutla@ti.com>; Kishon Vijay Abraham <kishon@ti.com=
>; Nori, Sekhar <nsekhar@ti.com>; Nagalla, Hari <hnagalla@ti.com>; Narang, =
Saurabh <saurabhnarang@ti.com>; Devshatwar, Nikhil <nikhil.nd@ti.com>
Subject: [meta-arago][dunfell][PATCH v3] packagegroups: tisdk-connectivity:=
 Include TI wlan packages for k3 platforms

Currently, the K3 platforms do not include the TI wlan related packages.
Add in the tisdk-connectivity packagegroup.

While at it, combine the packages added in all overrides into CONNECTIVITY_=
RDEPENDS variable and remove from overrides.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Suggested-by: Hari Nagalla <hnagalla@gmail.com>
Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>
---

Notes:
    changes from v2:
    * Combine the common package list into CONNECTIVITY_RDEPENDS
   =20
    changes from v1:
   =20
    * Drop the new recipe and simply include the existing packages for wili=
nk
      This way, all the platforms are using the same recipes and we don't
      have to maintain any new recipe just for the am64xx-sk
      The firmare will get picked from the repo
      git://git.ti.com/wilink8-wlan/wl18xx_fw.git

 .../packagegroup-arago-tisdk-connectivity.bb    | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-tisdk-connectivity.bb
index 11109432..8a8189fe 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
+++ sdk-connectivity.bb
@@ -61,36 +61,25 @@ CONNECTIVITY_RDEPENDS =3D " \
     iproute2-devlink \
     net-snmp \
     net-snmp-server-snmpd \
-"
-
-CONNECTIVITY_RDEPENDS_append_ti33x =3D "\
     ${WLAN_COMMON} \
     ${WLAN_TI} \
     ${BT_COMMON} \
+"
+
+CONNECTIVITY_RDEPENDS_append_ti33x =3D "\
     ${BT_TI} \
     ${DEMO_APPS} \
 "
=20
 CONNECTIVITY_RDEPENDS_append_ti43x =3D "\
-    ${WLAN_COMMON} \
-    ${WLAN_TI} \
-    ${BT_COMMON} \
     ${BT_TI} \
     ${DEMO_APPS} \
 "
=20
 CONNECTIVITY_RDEPENDS_append_dra7xx =3D "\
-    ${WLAN_COMMON} \
-    ${WLAN_TI} \
-    ${BT_COMMON} \
     ${BT_TI} \
 "
=20
-CONNECTIVITY_RDEPENDS_append_k3 =3D "\
-    ${WLAN_COMMON} \
-    ${BT_COMMON} \
-"
-
 RDEPENDS_${PN} =3D "\
     ${CONNECTIVITY_RDEPENDS} \
 "
--
2.17.1


