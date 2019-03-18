Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4280A529D3
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2019 18:58:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2IIwh8l120835
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2019 13:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552935523;
	bh=yj0k1xAmSzOnmgSJKPGcOdCKRutrTXbiTHAMDYU9PNk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=tymhw2ow1qUksoC/zE47JXv1jv+4+DmVZu9iRKeCyIPOG+pnV+pYwDrU2W8RRv5Gz
	nCfQLZBh557IkD9jML3ryN/sPifBD3sonWYiEyEyCZlXACRyAIDObDDmND/adoNU8T
	EzDb+prC89T8QWH1IRAzUyNXltRn1eqy5uzj+C18=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2IIwhPY016322
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 18 Mar 2019 13:58:43 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 18 Mar 2019 13:58:43 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1713.004; Mon, 18 Mar 2019 13:58:43 -0500
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko/master][PATCH] [matrix-gui-apps] SRCREV bump
	for TIDL demo file path fix
Thread-Index: AQHU3bnGslYO40SWdk6Qk4RSlLkmaqYRvPzJ
Date: Mon, 18 Mar 2019 18:58:43 +0000
Message-ID: <9cb0d7c41bdc469599a9cc1c3e3df2e1@ti.com>
References: <20190315100310.20229-1-x0157990@ti.com>,
	<20190318183825.GB3374@beryl>
In-Reply-To: <20190318183825.GB3374@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.91.86.187]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko/master][PATCH] [matrix-gui-apps] SRCREV bump for TIDL demo file path fix
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
X-List-Received-Date: Mon, 18 Mar 2019 18:58:55 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9cb0d7c41bdc469599a9cc1c3e3df2e1ticom_"

--_000_9cb0d7c41bdc469599a9cc1c3e3df2e1ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Is this one is clearer?

[meta-arago][rocko/master][PATCH] matrix-gui-apps: SRCREV bump for TIDL dem=
o file path fix.


A change in matrix-gui-v2-apps repo need to be included.

________________________________
From: Dmytriyenko, Denys
Sent: Monday, March 18, 2019 2:38:25 PM
To: Senicic, Djordje
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [rocko/master][PATCH] [matrix-gui-apps] SRCREV bu=
mp for TIDL demo file path fix

Is the subject line correct?

On Fri, Mar 15, 2019 at 06:03:10AM -0400, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.in=
c b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index 82882ea4..8cd90427 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM =3D "LICENSE;md5=3D6e0ae7214f6c74c149cb2=
5f373057fa9"
>  LIC_FILES_CHKSUM :=3D "file://../${LICENSE_CHECKSUM}"
>
>  SRC_URI =3D "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;proto=
col=3Dgit;branch=3D${BRANCH}"
> -SRCREV =3D "f9fa5cb158902b6a3520fb7e853cc049ea920ae5"
> +SRCREV =3D "447330830a22028958c361f3f54020dc26427856"
>  BRANCH =3D "master"
> -INC_PR =3D "r67"
> +INC_PR =3D "r68"
>
>  # Pull in the base package for installing matrix applications
>  require matrix-gui-apps.inc
> --
> 2.17.1
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_9cb0d7c41bdc469599a9cc1c3e3df2e1ticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
<p><br>
</p>
<p>Is this one is clearer?</p>
<p>[meta-arago][rocko/master][PATCH] matrix-gui-apps: SRCREV bump for TIDL =
demo file path fix.</p>
<p><br>
</p>
<p>A change in matrix-gui-v2-apps repo need to be included.<br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Dmytriyenko, Denys<=
br>
<b>Sent:</b> Monday, March 18, 2019 2:38:25 PM<br>
<b>To:</b> Senicic, Djordje<br>
<b>Cc:</b> meta-arago@arago-project.org<br>
<b>Subject:</b> Re: [meta-arago] [rocko/master][PATCH] [matrix-gui-apps] SR=
CREV bump for TIDL demo file path fix</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Is the subject line correct?<br>
<br>
On Fri, Mar 15, 2019 at 06:03:10AM -0400, Djordje Senicic wrote:<br>
&gt; Signed-off-by: Djordje Senicic &lt;x0157990@ti.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | =
4 &#43;&#43;--<br>
&gt;&nbsp; 1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git=
.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc<br>
&gt; index 82882ea4..8cd90427 100644<br>
&gt; --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc<br=
>
&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-core/matrix/matrix-gui-app=
s-git.inc<br>
&gt; @@ -4,9 &#43;4,9 @@ LICENSE_CHECKSUM =3D &quot;LICENSE;md5=3D6e0ae7214=
f6c74c149cb25f373057fa9&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM :=3D &quot;<a href=3D"file://../${LICENSE_CHECK=
SUM}">file://../${LICENSE_CHECKSUM}</a>&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; SRC_URI =3D &quot;git://git.ti.com/matrix-gui-v2/matrix-gui-v2-a=
pps.git;protocol=3Dgit;branch=3D${BRANCH}&quot;<br>
&gt; -SRCREV =3D &quot;f9fa5cb158902b6a3520fb7e853cc049ea920ae5&quot;<br>
&gt; &#43;SRCREV =3D &quot;447330830a22028958c361f3f54020dc26427856&quot;<b=
r>
&gt;&nbsp; BRANCH =3D &quot;master&quot;<br>
&gt; -INC_PR =3D &quot;r67&quot;<br>
&gt; &#43;INC_PR =3D &quot;r68&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; # Pull in the base package for installing matrix applications<br=
>
&gt;&nbsp; require matrix-gui-apps.inc<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; meta-arago@arago-project.org<br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_9cb0d7c41bdc469599a9cc1c3e3df2e1ticom_--
