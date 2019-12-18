Return-Path: <d-senicic1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id AAC83529C0
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 20:47:20 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIKjhHc027710
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 14:45:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576701943;
	bh=pwJ/jxQET8vrNAEd4VveVhji7qscrQh+KXBISLcE5Z4=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=pA6NNZcE/dYpThvvKgI7a7Cul2PVBJQyGyfm/ty/9/PvZvzymTfEfgZIhfZqkBTiG
	745l8bdxnD0ueIJUBgH6GsiGKzzRLkTZPL89Q6flzMPOYfrUKjtm/Pe0iV0Rpay/7A
	CxLcoeykxQJHuJ7UVuNEn4KgEWbfljDcfGclngu8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIKjhKl082080
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 14:45:43 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 18 Dec 2019 14:45:42 -0600
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1847.003; Wed, 18 Dec 2019 14:45:43 -0600
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-processor-sdk][PATCH 1/5] licenses: add Unlicense license
	text file
Thread-Index: AQHVtcuglYEg57jYt0+BuF3pj4neXafAW+qg
Date: Wed, 18 Dec 2019 20:45:42 +0000
Message-ID: <9a8aa72f10cc4a2fbf15da6ca4eb5e8d@ti.com>
References: <1576690275-13499-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1576690275-13499-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.96.62]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [meta-processor-sdk][PATCH 1/5] licenses: add Unlicense license text file
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
X-List-Received-Date: Wed, 18 Dec 2019 20:47:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK

I verified directory structure=20

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Wednesday, December 18, 2019 12:31 PM
To: meta-arago@arago-project.org
Cc: Senicic, Djordje; Stiffler, Jacob
Subject: [meta-processor-sdk][PATCH 1/5] licenses: add Unlicense license te=
xt file

* This license is used by neo-ai-dlr

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 conf/layer.conf    |  1 +
 licenses/Unlicense | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 licenses/Unlicense

diff --git a/conf/layer.conf b/conf/layer.conf
index 0334463..260a274 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,3 +7,4 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recip=
es*/*/*.bbappend"
 BBFILE_COLLECTIONS +=3D "meta-processor-sdk"
 BBFILE_PATTERN_meta-processor-sdk :=3D "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-processor-sdk =3D "15"
+LICENSE_PATH +=3D "${LAYERDIR}/licenses"
diff --git a/licenses/Unlicense b/licenses/Unlicense
new file mode 100644
index 0000000..cf1ab25
--- /dev/null
+++ b/licenses/Unlicense
@@ -0,0 +1,24 @@
+This is free and unencumbered software released into the public domain.
+
+Anyone is free to copy, modify, publish, use, compile, sell, or
+distribute this software, either in source code form or as a compiled
+binary, for any purpose, commercial or non-commercial, and by any
+means.
+
+In jurisdictions that recognize copyright laws, the author or authors
+of this software dedicate any and all copyright interest in the
+software to the public domain. We make this dedication for the benefit
+of the public at large and to the detriment of our heirs and
+successors. We intend this dedication to be an overt act of
+relinquishment in perpetuity of all present and future rights to this
+software under copyright law.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
+OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+OTHER DEALINGS IN THE SOFTWARE.
+
+For more information, please refer to <http://unlicense.org>
--=20
2.7.4


