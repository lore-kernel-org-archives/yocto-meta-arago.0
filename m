Return-Path: <manisha.agrawal@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 80FAF52A3E
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 21:19:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81LJnIl020373
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504300789;
	bh=i6biMZFi658f1rGYT+TFPG7PKkrIaCPs40Zn8CcgrVI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=B+Tndf/rHygrqvLr6x2Vars1aIQeHx51sYTdhgzdINvjns9pGO8FsgXOz0cYUf7lf
	83URIdFgiArQF3kijtSSYIKoogO8BzBQhEksIaTqTMhtUSmTly/dPdVtMQmEmlv1N1
	nXxCSDtSqvW8SO0cpAT0lMl71DI/tYvCLZ/nnBZg=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LJnYR006471
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:19:49 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Fri, 1 Sep 2017 16:19:49 -0500
From: "Agrawal, Manisha" <manisha.agrawal@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-processor-sdk][PATCH v1] arago-core-tisdk-image : add
	hmi specific packagegroup
Thread-Index: AQHTI2fvy3IKXPIQmk6Yhh+ooR87N6KgiRpg
Date: Fri, 1 Sep 2017 21:19:49 +0000
Message-ID: <3AC2660648D2B04999D9C7562469E8AF7EC3B904@DFLE12.ent.ti.com>
References: <20170901211901.26533-1-manisha.agrawal@ti.com>
In-Reply-To: <20170901211901.26533-1-manisha.agrawal@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Subject: Re: [meta-processor-sdk][PATCH v1] arago-core-tisdk-image : add hmi specific packagegroup
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
X-List-Received-Date: Fri, 01 Sep 2017 21:19:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I had to split sending the patches in two groups as I wasn't able to send m=
ore than 7 patches in series at my end.=20

Regards,
Manisha


-----Original Message-----
From: Agrawal, Manisha=20
Sent: Friday, September 01, 2017 4:19 PM
To: meta-arago@arago-project.org
Cc: Dmytriyenko, Denys; Stiffler, Jacob; Agrawal, Manisha
Subject: [meta-processor-sdk][PATCH v1] arago-core-tisdk-image : add hmi sp=
ecific packagegroup

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-core/images/arago-core-tisdk-image.bbappend | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-core/images/arago-core-tisdk-image.bbappend b/recipes-=
core/images/arago-core-tisdk-image.bbappend
index 2857178..2c804f0 100644
--- a/recipes-core/images/arago-core-tisdk-image.bbappend
+++ b/recipes-core/images/arago-core-tisdk-image.bbappend
@@ -1,5 +1,9 @@
 PR_append =3D ".tisdk13"
=20
+IMAGE_INSTALL_append =3D " \                                              =
                                                                    =20
+      packagegroup-arago-tisdk-hmi-sdk-host \  "
+
 # The following FITIMAGE vars are copied from kernel-fitimage.bbclass.
 #
 # We need to get these into the prebuilt-images. We don't want to inherit =
the
--
2.13.0


