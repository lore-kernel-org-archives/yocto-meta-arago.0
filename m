Return-Path: <manisha.agrawal@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7BB99529B2
	for <meta-arago@arago-project.org>;
	Mon,  3 Dec 2018 21:13:38 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB3LDRAO072602
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 15:13:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543871607;
	bh=6n1dlwsA9uk/QjkeSmD+13Tk0yysJxwCd8RcmJDkJsY=;
	h=From:To:CC:Subject:Date:References;
	b=dD3HpQRTZwbXMcATkkoctoUspnNXcT9jqp8NSibFnxiDgw9hipmWACQR4chAR+Vt7
	EtBB8Fr3UFWxEbMObPPYFq5dsm/Pl3gd1jG5Ml8utqLP506GPFGRDZPeB99Tfp4Zu3
	aiLLvOjKB89zDtsPPlP5TZfgrKtYlQLh8spDvFkk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB3LDR7h073729
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 15:13:27 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 3 Dec 2018 15:13:27 -0600
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
	DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
	15.01.1591.008; Mon, 3 Dec 2018 15:13:27 -0600
From: "Agrawal, Manisha" <manisha.agrawal@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-processor-sdk][rocko][PATCH v1 1/5] linux: update to
	processor-sdk-linux-5.2.0
Thread-Index: AQHUi0j8zDvr+IPRnkaJpP5NRM7KtqVte4PwgAAH1rA=
Date: Mon, 3 Dec 2018 21:13:27 +0000
Message-ID: <5326d980bf794f85b0792ff908393ddb@ti.com>
References: <20181203204426.27752-1-manisha.agrawal@ti.com> 
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
X-List-Received-Date: Mon, 03 Dec 2018 21:13:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this patch. I have resent the one patch only with corrected s=
ubject line.=20

Regards,
Manisha


-----Original Message-----
From: Agrawal, Manisha=20
Sent: Monday, December 03, 2018 2:47 PM
To: meta-arago@arago-project.org
Cc: Dmytriyenko, Denys; Stiffler, Jacob; Gou, Hongmei
Subject: RE: [meta-processor-sdk][rocko][PATCH v1 1/5] linux: update to pro=
cessor-sdk-linux-5.2.0

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


