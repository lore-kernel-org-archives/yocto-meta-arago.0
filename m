Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0DCC77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 09:30:14 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4767.1684920610865765444
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 May 2023 02:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xTinKMgL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34O9U6li031198;
	Wed, 24 May 2023 04:30:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684920606;
	bh=TXvE+OonCa2gwxABMankhB4Hh2Eesqt8AiLe9i9T8Qg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=xTinKMgLappnuVA/lK4/ExCtLVlGritc+FaS3DVk555RcVfb/vZKvZdQgqai8ZKQO
	 aqHqdcLjluc1pas7OAFRV8yDlQULFCkZO96qze7P61aLVfwNEe2YpcFYgQWsKhnoZ7
	 DUvk8uiOWOzgqzVBS3p12+Bos8KgxTyGC07tUNuI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34O9U6jx077799
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 May 2023 04:30:06 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 May 2023 04:30:05 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
 DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
 15.01.2507.023; Wed, 24 May 2023 04:30:05 -0500
From: "Shilwant, Chirag" <c-shilwant@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>, "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-arago@lists.yoctoproject.org" <meta-arago@lists.yoctoproject.org>,
        "Shilwant, Chirag" <c-shilwant@ti.com>
CC: "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>,
        "Bhagat, Paresh"
	<p-bhagat@ti.com>, "Gupta, Gyan" <g-gupta@ti.com>
Subject: Re: [EXTERNAL] [meta-arago][kirkstone][PATCH] recipes-tisdk:
 ti-tisdk-setup: Update SRCREV and Fix build issue
Thread-Topic: [EXTERNAL] [meta-arago][kirkstone][PATCH] recipes-tisdk:
 ti-tisdk-setup: Update SRCREV and Fix build issue
Thread-Index: AQHZjbzfUxCNegbzeE+RdA9ZT1q18K9pKA8s
Date: Wed, 24 May 2023 09:30:05 +0000
Message-ID: <69f7ada7cfa04c9ab79d33bbe17c8049@ti.com>
References: <1761E2BAC9C7663D.27388@lists.yoctoproject.org>
In-Reply-To: <1761E2BAC9C7663D.27388@lists.yoctoproject.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.69.146]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="_000_69f7ada7cfa04c9ab79d33bbe17c8049ticom_"
MIME-Version: 1.0
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 May 2023 09:30:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14457

--_000_69f7ada7cfa04c9ab79d33bbe17c8049ticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ignore this patch. As ti-tisdk-setup is related to file-system and just goe=
s as a part of SDK we should ideally remove it from meta-arago and have it =
in meta-processor-sdk to still ship it inside the SDK.

Will send a new patch for removing ti-tisdk-setup from meta-arago.

________________________________
From: meta-arago@lists.yoctoproject.org <meta-arago@lists.yoctoproject.org>=
 on behalf of Chirag Shilwant via lists.yoctoproject.org <c-shilwant=3Dti.c=
om@lists.yoctoproject.org>
Sent: 24 May 2023 02:53:33
To: Bajjuri, Praneeth; Denys Dmytriyenko; Eatmon, Ryan; meta-arago@lists.yo=
ctoproject.org
Cc: Adivi, Sai Sree Kartheek; Bhagat, Paresh; Gupta, Gyan
Subject: [EXTERNAL] [meta-arago][kirkstone][PATCH] recipes-tisdk: ti-tisdk-=
setup: Update SRCREV and Fix build issue

- Bump up SRCREV to 2d6d6dfeac3b6e0e5a72513b61ab888a1a1a2bac.
- Scripts were installed in /bin but not shipped resulting in QA issues. He=
nce,
ship all scripts under /bin.
- Fix syntax issue and update recipe revision.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.=
bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index e000e8c7..a89803c9 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -2,10 +2,10 @@ DESCRIPTION =3D "Package containing scripts to setup the =
development host and targ
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://setup.sh;beginline=3D3;endline=3D31;md5=3Dfc4=
b04a33df6d892c9f4d4a9d92b945e"

-PR =3D "r47"
+PR =3D "r48"

 BRANCH ?=3D "master"
-SRCREV =3D "eae21af9be4e7a0028045cc3e4038fe2157a266d"
+SRCREV =3D "2d6d6dfeac3b6e0e5a72513b61ab888a1a1a2bac"
 SRC_URI =3D "git://git.ti.com/git/arago-project/tisdk-setup-scripts.git;pr=
otocol=3Dhttps;branch=3D${BRANCH}"

 S =3D "${WORKDIR}/git"
@@ -55,5 +55,5 @@ do_install () {
     fi
 }

-FILES:${PN} +=3D "setup.sh"
-RDEPENDS:${PN} +=3D "bash"
+FILES:${PN} =3D "setup.sh /bin/*"
+RDEPENDS:${PN} =3D "bash"
--
2.17.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#14456): https://lists.yoctoproject.org/g/meta-arago/mes=
sage/14456
Mute This Topic: https://lists.yoctoproject.org/mt/99096759/7030289
Group Owner: meta-arago+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [c-shilwant@=
ti.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--_000_69f7ada7cfa04c9ab79d33bbe17c8049ticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>Ignore this patch. As ti-tisdk-setup is related to file-system and just =
goes as a part of SDK we should ideally remove it from meta-arago and have =
it in meta-processor-sdk to still ship it inside the SDK.<br>
<br>
Will send a new patch for removing <span>ti-tisdk-setup</span> from meta-ar=
ago.<br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> meta-arago@lists.yo=
ctoproject.org &lt;meta-arago@lists.yoctoproject.org&gt; on behalf of Chira=
g Shilwant via lists.yoctoproject.org &lt;c-shilwant=3Dti.com@lists.yoctopr=
oject.org&gt;<br>
<b>Sent:</b> 24 May 2023 02:53:33<br>
<b>To:</b> Bajjuri, Praneeth; Denys Dmytriyenko; Eatmon, Ryan; meta-arago@l=
ists.yoctoproject.org<br>
<b>Cc:</b> Adivi, Sai Sree Kartheek; Bhagat, Paresh; Gupta, Gyan<br>
<b>Subject:</b> [EXTERNAL] [meta-arago][kirkstone][PATCH] recipes-tisdk: ti=
-tisdk-setup: Update SRCREV and Fix build issue</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">- Bump up SRCREV to 2d6d6dfeac3b6e0e5a72513b61ab88=
8a1a1a2bac.<br>
- Scripts were installed in /bin but not shipped resulting in QA issues. He=
nce,<br>
ship all scripts under /bin.<br>
- Fix syntax issue and update recipe revision.<br>
<br>
Signed-off-by: Chirag Shilwant &lt;c-shilwant@ti.com&gt;<br>
---<br>
&nbsp;.../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | 8 &#43;&#43;&#43;&#43;----<br>
&nbsp;1 file changed, 4 insertions(&#43;), 4 deletions(-)<br>
<br>
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.=
bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb<br>
index e000e8c7..a89803c9 100644<br>
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb<br>
&#43;&#43;&#43; b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-s=
etup.bb<br>
@@ -2,10 &#43;2,10 @@ DESCRIPTION =3D &quot;Package containing scripts to s=
etup the development host and targ<br>
&nbsp;LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://setup.sh;beginline=3D3;e=
ndline=3D31;md5=3Dfc4b04a33df6d892c9f4d4a9d92b945e">file://setup.sh;beginli=
ne=3D3;endline=3D31;md5=3Dfc4b04a33df6d892c9f4d4a9d92b945e</a>&quot;<br>
&nbsp;<br>
-PR =3D &quot;r47&quot;<br>
&#43;PR =3D &quot;r48&quot;<br>
&nbsp;<br>
&nbsp;BRANCH ?=3D &quot;master&quot;<br>
-SRCREV =3D &quot;eae21af9be4e7a0028045cc3e4038fe2157a266d&quot;<br>
&#43;SRCREV =3D &quot;2d6d6dfeac3b6e0e5a72513b61ab888a1a1a2bac&quot;<br>
&nbsp;SRC_URI =3D &quot;git://git.ti.com/git/arago-project/tisdk-setup-scri=
pts.git;protocol=3Dhttps;branch=3D${BRANCH}&quot;<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
@@ -55,5 &#43;55,5 @@ do_install () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
-FILES:${PN} &#43;=3D &quot;setup.sh&quot;<br>
-RDEPENDS:${PN} &#43;=3D &quot;bash&quot;<br>
&#43;FILES:${PN} =3D &quot;setup.sh /bin/*&quot;<br>
&#43;RDEPENDS:${PN} =3D &quot;bash&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#14456): <a href=3D"https://lists.yoctoproject.org/g/met=
a-arago/message/14456">
https://lists.yoctoproject.org/g/meta-arago/message/14456</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/99096759/7030=
289">https://lists.yoctoproject.org/mt/99096759/7030289</a><br>
Group Owner: meta-arago&#43;owner@lists.yoctoproject.org<br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arago/unsub">=
https://lists.yoctoproject.org/g/meta-arago/unsub</a> [c-shilwant@ti.com]<b=
r>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_69f7ada7cfa04c9ab79d33bbe17c8049ticom_--

