Return-Path: <manisha.agrawal@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id CCD09529E7
	for <meta-arago@arago-project.org>;
	Wed, 30 Aug 2017 17:59:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7UHxXES028365
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 12:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504115973;
	bh=+RZoyvA4OGzucVftGSzhai0Q3/lHb4JYm7L32nLE78A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Ebyh8qbdLIb65exKJ7lSzNnoAMqvfZq7jxKxSPGme0c5HDShHF/EiuWZJzkEwMEkW
	BVVCkqEw6NdnWD2NI2LbaJv9CV89gNu5GqMmST+bmWr6ZYEkl17R9JH8vLRHqKpkD8
	+4z7wxuH8WGJ71q/dLdz3CEZaoi6miRzJXAOeRw8=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7UHxX4D024437
	for <meta-arago@arago-project.org>; Wed, 30 Aug 2017 12:59:33 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Wed, 30 Aug 2017 12:59:33 -0500
From: "Agrawal, Manisha" <manisha.agrawal@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago][morty][PATCH v3] tisdk-rootfs-image: add evse-hmi
	packagegroup
Thread-Index: AQHTIbmcKj+iuHLzCUu85/7YGyGR8aKdL+yQ
Date: Wed, 30 Aug 2017 17:59:32 +0000
Message-ID: <3AC2660648D2B04999D9C7562469E8AF7EC38550@DFLE12.ent.ti.com>
References: <20170830175838.11557-1-manisha.agrawal@ti.com>
In-Reply-To: <20170830175838.11557-1-manisha.agrawal@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [morty][PATCH v3] tisdk-rootfs-image: add evse-hmi packagegroup
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
X-List-Received-Date: Wed, 30 Aug 2017 17:59:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please discard this one. It has wrong subject line.

Regards,
Manisha


-----Original Message-----
From: Agrawal, Manisha=20
Sent: Wednesday, August 30, 2017 12:59 PM
To: meta-arago@arago-project.org
Cc: Dmytriyenko, Denys; Stiffler, Jacob; Agrawal, Manisha
Subject: [meta-arago][morty][PATCH v3] tisdk-rootfs-image: add evse-hmi pac=
kagegroup

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/=
meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 1a477d1f..e40dc1f5 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -20,6 +20,7 @@ IMAGE_INSTALL +=3D "\
     packagegroup-arago-tisdk-amsdk \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-addons-extra \
+    packagegroup-arago-tisdk-hmi \
     "
=20
 export IMAGE_BASENAME =3D "tisdk-rootfs-image"
--=20
2.13.0


