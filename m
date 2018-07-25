Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id E005B529AE
	for <meta-arago@arago-project.org>;
	Wed, 25 Jul 2018 13:58:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6PDwj30052276
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 08:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532527125;
	bh=+DpgSew19WOYsAcFx9vk7REaOQ9+KiqoxUI8yHIRNnQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=MYuNloS96V6yS7n1mak4KdQ1zii0X1bc12xinEURqGVLrR3M6z5MEvzB9iFq0IElU
	8oTh7JUFtkZJEV7ZDD+STxR2Uf0ri9pMaD6NEtfna0QhEeO4kXhNTozIVfsacEOeIj
	8hlAoLsFj1AouO0nNCjJCy2wRoJAX/Lzdm2hRVz0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PDwjB6000326
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 08:58:45 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 25 Jul 2018 08:58:44 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1466.003; Wed, 25 Jul 2018 08:58:44 -0500
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-processor-sdk][PATCH 1/3] tidl-api: Update test video clip
Thread-Index: AQHUJA+8Ss99+IwzYU2xgMjSl2hbUqSf9w3Q
Date: Wed, 25 Jul 2018 13:58:44 +0000
Message-ID: <3724ddc59c3e4693a3fe7a4e7ddee04a@ti.com>
References: <1532519588-17585-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1532519588-17585-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.111.218]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [meta-processor-sdk][PATCH 1/3] tidl-api: Update test video clip
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
X-List-Received-Date: Wed, 25 Jul 2018 13:58:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Wednesday, July 25, 2018 7:53 AM
To: meta-arago@arago-project.org
Cc: Chengalvala, Vivek; Stiffler, Jacob; Senicic, Djordje
Subject: [meta-processor-sdk][PATCH 1/3] tidl-api: Update test video clip

* Use real-life video clip and list of classes

Cc: Djordje Senicic <x0157990@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/tidl-api/tidl-api-next.inc          | 3 +++
 recipes-ti/tidl-api/tidl-api_git.bbappend      | 1 +
 recipes-ti/tidl-api/tidl-examples_git.bbappend | 1 +
 recipes-ti/tidl-api/tidl-viewer_git.bbappend   | 1 +
 4 files changed, 6 insertions(+)
 create mode 100644 recipes-ti/tidl-api/tidl-api-next.inc
 create mode 100644 recipes-ti/tidl-api/tidl-api_git.bbappend
 create mode 100644 recipes-ti/tidl-api/tidl-examples_git.bbappend
 create mode 100644 recipes-ti/tidl-api/tidl-viewer_git.bbappend

diff --git a/recipes-ti/tidl-api/tidl-api-next.inc b/recipes-ti/tidl-api/ti=
dl-api-next.inc
new file mode 100644
index 0000000..8c34699
--- /dev/null
+++ b/recipes-ti/tidl-api/tidl-api-next.inc
@@ -0,0 +1,3 @@
+PR_append =3D ".tisdk0"
+
+SRCREV =3D "06585057d0f47bb930647123557bc5a1506dabda"
diff --git a/recipes-ti/tidl-api/tidl-api_git.bbappend b/recipes-ti/tidl-ap=
i/tidl-api_git.bbappend
new file mode 100644
index 0000000..63dbd4f
--- /dev/null
+++ b/recipes-ti/tidl-api/tidl-api_git.bbappend
@@ -0,0 +1 @@
+require tidl-api-next.inc
diff --git a/recipes-ti/tidl-api/tidl-examples_git.bbappend b/recipes-ti/ti=
dl-api/tidl-examples_git.bbappend
new file mode 100644
index 0000000..63dbd4f
--- /dev/null
+++ b/recipes-ti/tidl-api/tidl-examples_git.bbappend
@@ -0,0 +1 @@
+require tidl-api-next.inc
diff --git a/recipes-ti/tidl-api/tidl-viewer_git.bbappend b/recipes-ti/tidl=
-api/tidl-viewer_git.bbappend
new file mode 100644
index 0000000..63dbd4f
--- /dev/null
+++ b/recipes-ti/tidl-api/tidl-viewer_git.bbappend
@@ -0,0 +1 @@
+require tidl-api-next.inc
--=20
2.7.4


