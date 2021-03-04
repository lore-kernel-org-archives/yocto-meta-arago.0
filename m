Return-Path: <hnagalla@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id ACA58529B6
	for <meta-arago@arago-project.org>;
	Thu,  4 Mar 2021 11:06:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 124B6aaV119283
	for <meta-arago@arago-project.org>; Thu, 4 Mar 2021 05:06:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614855996;
	bh=PV7TV1SnSrjl5wPlLZwv0XnXS9EqDjO+XjrkuDW921c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Gkc64nlddr1HK9q9HEW2tsuOH9id3LllwMSf550azJKlMZp4cRl/XyTxP6TU9KVnw
	I5tkI77pqU52U5BkMCifp69MeR30YKgh0aHco2wi5FMrTm9tEYohpv6pIGVM4pIxIx
	qIxDzQlBzDhDVvCYQhvdQAIQEfFOgNYU4VkRovRo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 124B6aUa047151
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 4 Mar 2021 05:06:36 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 4 Mar 2021 05:06:35 -0600
Received: from DFLE100.ent.ti.com ([fe80::f19c:5926:3526:1b30]) by
	DFLE100.ent.ti.com ([fe80::f19c:5926:3526:1b30%17]) with mapi id
	15.01.1979.003; Thu, 4 Mar 2021 05:06:35 -0600
From: "Nagalla, Hari" <hnagalla@ti.com>
To: "Devshatwar, Nikhil" <nikhil.nd@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "Bajjuri, Praneeth" <praneeth@ti.com>
Thread-Topic: [meta-ti][dunfell/master][PATCH v2] packagegroups:
	tisdk-connectivity: Include TI wlan packages for k3 platforms
Thread-Index: AQHXEFoQaQX4VipHTEaNgjdtHRvmQqpzq7EA
Date: Thu, 4 Mar 2021 11:06:35 +0000
Message-ID: <d1191c275f81439d9386d8ef084472f7@ti.com>
References: <20210303182136.31765-1-nikhil.nd@ti.com>
In-Reply-To: <20210303182136.31765-1-nikhil.nd@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.61.169]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Mar 2021 03:17:37 +0000
Cc: "Vutla, Lokesh" <lokeshvutla@ti.com>, "Narang,
	Saurabh" <saurabhnarang@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>,
	Kishon Vijay Abraham <kishon@ti.com>
Subject: Re: [meta-ti][dunfell/master][PATCH v2] packagegroups: tisdk-connectivity: Include TI wlan packages for k3 platforms
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
X-List-Received-Date: Thu, 04 Mar 2021 11:06:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It looks fine to me..

Thanks
Hari

-----Original Message-----
From: Devshatwar, Nikhil=20
Sent: Wednesday, March 3, 2021 12:22 PM
To: meta-arago@arago-project.org; Bajjuri, Praneeth <praneeth@ti.com>
Cc: Vutla, Lokesh <lokeshvutla@ti.com>; Kishon Vijay Abraham <kishon@ti.com=
>; Nori, Sekhar <nsekhar@ti.com>; Nagalla, Hari <hnagalla@ti.com>; Narang, =
Saurabh <saurabhnarang@ti.com>; Devshatwar, Nikhil <nikhil.nd@ti.com>
Subject: [meta-ti][dunfell/master][PATCH v2] packagegroups: tisdk-connectiv=
ity: Include TI wlan packages for k3 platforms

Currently, the K3 platforms do not include the TI wlan related packages.
Add in the tisdk-connectivity packagegroup.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Suggested-by: Hari Nagalla <hnagalla@gmail.com>
Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>
---

Notes:
    changes from v1:
   =20
    * Drop the new recipe and simply include the existing packages for wili=
nk
      This way, all the platforms are using the same recipes and we don't
      have to maintain any new recipe just for the am64xx-sk
      The firmare will get picked from the repo
      git://git.ti.com/wilink8-wlan/wl18xx_fw.git

 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-tisdk-connectivity.bb
index 11109432..ab632924 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-connectivity.bb
@@ -89,6 +89,7 @@ CONNECTIVITY_RDEPENDS_append_dra7xx =3D "\
 CONNECTIVITY_RDEPENDS_append_k3 =3D "\
     ${WLAN_COMMON} \
     ${BT_COMMON} \
+    ${WLAN_TI} \
 "
=20
 RDEPENDS_${PN} =3D "\
--=20
2.17.1


