Return-Path: <manisha.agrawal@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 81D78529D6
	for <meta-arago@arago-project.org>;
	Mon,  3 Dec 2018 20:47:02 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB3Kkpl8029541
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:46:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543870011;
	bh=WVFXyraK1dYylrJueJWBO6jXaM0dQPvCsoM69JPzvU8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=jLKXjAbS6t8nF7Ma9VKAGnVXB9+dQdvMPqMvcwP+28aYjaff2a+gHjFBp+VptrTM0
	bQzH5r4gFE/fv0ycJ2goTuR2BBfGqpqsz87fq0UZn/e8RDul4a1HjXNxOPonUJuORb
	JzlwuE6qOKSZ9xumuKDEGecdhiP/nrHbKRWqCWV4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB3KkpQQ048208
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:46:51 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 3 Dec 2018 14:46:51 -0600
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
	DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
	15.01.1591.008; Mon, 3 Dec 2018 14:46:51 -0600
From: "Agrawal, Manisha" <manisha.agrawal@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-processor-sdk][rocko][PATCH v1 1/5] linux: update to
	processor-sdk-linux-5.2.0
Thread-Index: AQHUi0j8zDvr+IPRnkaJpP5NRM7KtqVte4Pw
Date: Mon, 3 Dec 2018 20:46:51 +0000
Message-ID: <5e66e677466845b0928af7602ca61619@ti.com>
References: <20181203204426.27752-1-manisha.agrawal@ti.com>
In-Reply-To: <20181203204426.27752-1-manisha.agrawal@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.59.86]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [meta-processor-sdk][rocko][PATCH v1 1/5] linux: update to processor-sdk-linux-5.2.0
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
X-List-Received-Date: Mon, 03 Dec 2018 20:47:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There's only one patch for this series. Please ignore the subject for 1/5, =
that was accidental from my part. If you need another patch with correct su=
bject line, I can send that. Let me know.

Regards,
Manisha

-----Original Message-----
From: Agrawal, Manisha=20
Sent: Monday, December 03, 2018 2:44 PM
To: meta-arago@arago-project.org
Cc: Agrawal, Manisha; Dmytriyenko, Denys; Stiffler, Jacob; Gou, Hongmei
Subject: [meta-processor-sdk][rocko][PATCH v1 1/5] linux: update to process=
or-sdk-linux-5.2.0

From: Jacob Stiffler <j-stiffler@ti.com>

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.14.bbappend | 4 ++--
 recipes-kernel/linux/linux-ti-staging_4.14.bbappend    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bbappend b/recip=
es-kernel/linux/linux-ti-staging-rt_4.14.bbappend
index c919674..7990fb9 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bbappend
@@ -1,7 +1,7 @@
 require linux-processor-sdk-4.14.inc
=20
-PR_append =3D ".3"
+PR_append =3D ".4"
=20
 KERNEL_GIT_URI =3D "git://git.ti.com/processor-sdk/processor-sdk-linux.git=
"
 BRANCH =3D "processor-sdk-linux-rt-4.14.y"
-SRCREV =3D "cfb76a2032cf42007d7aefcefda1b5a673999769"
+SRCREV =3D "da0d0b490cc5e450d1ea613b5805a5cc5f020e08"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bbappend b/recipes-=
kernel/linux/linux-ti-staging_4.14.bbappend
index 501fd3b..d749ea0 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bbappend
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bbappend
@@ -1,7 +1,7 @@
 require linux-processor-sdk-4.14.inc
=20
-PR_append =3D ".3"
+PR_append =3D ".4"
=20
 KERNEL_GIT_URI =3D "git://git.ti.com/processor-sdk/processor-sdk-linux.git=
"
 BRANCH =3D "processor-sdk-linux-4.14.y"
-SRCREV =3D "d315a9bb00b65589fa23ad07c0b07e3b672db0d0"
+SRCREV =3D "2fe2b351f345291e38e01349c039defb95d92b04"
--=20
2.13.0


