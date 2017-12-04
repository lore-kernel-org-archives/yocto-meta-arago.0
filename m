Return-Path: <eyalr@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 98D2F52A27
	for <meta-arago@arago-project.org>;
	Mon,  4 Dec 2017 19:59:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB4Jxcqg003058
	for <meta-arago@arago-project.org>; Mon, 4 Dec 2017 13:59:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512417578;
	bh=srO3GiJ46tbI+J1NiW9eC6AyA5ntqHaaD5873sva8KY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=TimNVX+gVDwIg2SLtnxHM2xJoVZ7ddLWsBeAd8BT7ep8Nn5moMVJReo4hUE2fIRzz
	r4w1zIdJ+wnx1zqJHpr3UY50dFjhcAmS2QPybiBOUFJumWfgK86sGyp6WNJDHXhXtP
	iT9PHxqNTcM0JrtGIxSaDxGaZUCdMBGU0d4taI8M=
Received: from DFRE70.ent.ti.com (dncmailx.itg.ti.com [10.167.188.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB4Jxcsj014407
	for <meta-arago@arago-project.org>; Mon, 4 Dec 2017 13:59:38 -0600
Received: from DFRE01.ent.ti.com ([fe80::b027:5293:c8d8:d82a]) by
	DFRE70.ent.ti.com ([fe80::645e:109b:13d3:dfa7%25]) with mapi id
	14.03.0294.000; Mon, 4 Dec 2017 20:59:37 +0100
From: "Reizer, Eyal" <eyalr@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [PATCH 2/2] hostap-daemon-wl18xx: update recipe for version
	R8.7_SP3
Thread-Index: AdNsIuzxfVM0HZj8T4WuxXAxtMxYZABDn16AAAI/vNo=
Date: Mon, 4 Dec 2017 19:59:36 +0000
Message-ID: <2l82hg9b7spo2oks1u5hijv3.1512417573718@email.android.com>
References: <8665E2433BC68541A24DFFCA87B70F5B364A85F9@DFRE01.ent.ti.com>,
	<20171204195513.GE15340@edge>
In-Reply-To: <20171204195513.GE15340@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/2] hostap-daemon-wl18xx: update recipe for version R8.7_SP3
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
X-List-Received-Date: Mon, 04 Dec 2017 19:59:39 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2l82hg9b7spo2oks1u5hijv31512417573718emailandroidcom_"

--_000_2l82hg9b7spo2oks1u5hijv31512417573718emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi denys,

Same here. Not changed by us. The change is coming from newer upstream supp=
licant that is used here.

BR
Eyal

-------- Original Message --------
From: "Dmytriyenko, Denys" <denys@ti.com>
Date: Mon, Dec 4, 2017, 21:55
To: "Reizer, Eyal" <eyalr@ti.com>
CC: meta-arago@arago-project.org
Subject: Re: [PATCH 2/2] hostap-daemon-wl18xx: update recipe for version R8=
.7_SP3

On Sun, Dec 03, 2017 at 05:39:06AM -0500, Reizer, Eyal wrote:
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  .../recipes-connectivity/hostap/hostap-daemon-wl18xx.bb      | 12 ++++++=
------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-=
wl18xx.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl1=
8xx.bb
> index 1151012..0288a54 100644
> --- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.=
bb
> +++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.=
bb
> @@ -4,19 +4,19 @@
>  require hostap.inc
>
>  LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3D36b27801447e0662ee0138d17f=
e93880"
> +LIC_FILES_CHKSUM =3D "file://../COPYING;md5=3D292eece3f2ebbaa25608eed846=
4018a3"

Same request for license checksum change.


> -PR_append =3D "d"
> +PR_append =3D "e"
>
>  FILESEXTRAPATHS_append :=3D ":${THISDIR}/hostap-daemon"
>
>  # Add TI to the end to make it clear that this is a TI customized versio=
n
>  # of hostap
> -PV =3D "R8.6-devel-ti+git${SRCPV}"
> +PV =3D "R8.7_SP3-devel-ti+git${SRCPV}"
>
> -# Tag: R8.6
> -SRCREV =3D "f80fe345acf103ba6882ac8396f19584ac184904"
> -BRANCH =3D "upstream_24"
> +# Tag: R8.7_SP3
> +SRCREV =3D "ee8fbdb840d95e048f58fb62bf3b5472041b5417"
> +BRANCH =3D "upstream_25_rebase"
>
>  PROVIDES +=3D "hostap-daemon"
>  RPROVIDES_${PN} +=3D "hostap-daemon"
> --
> 2.7.4
>

--_000_2l82hg9b7spo2oks1u5hijv31512417573718emailandroidcom_
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
<div>Hi denys,<br>
<br>
Same here. Not changed by us. The change is coming from newer upstream supp=
licant that is used here.<br>
<br>
BR<br>
Eyal<br>
<br>
-------- Original Message --------<br>
From: &quot;Dmytriyenko, Denys&quot; &lt;denys@ti.com&gt;<br>
Date: Mon, Dec 4, 2017, 21:55<br>
To: &quot;Reizer, Eyal&quot; &lt;eyalr@ti.com&gt;<br>
CC: meta-arago@arago-project.org<br>
Subject: Re: [PATCH 2/2] hostap-daemon-wl18xx: update recipe for version R8=
.7_SP3<br>
<br>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Sun, Dec 03, 2017 at 05:39:06AM -0500, Reizer, =
Eyal wrote:<br>
&gt; Signed-off-by: Eyal Reizer &lt;eyalr@ti.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../recipes-connectivity/hostap/hostap-daemon-wl18xx.bb&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 12 &#43;&#43;&#43;&#43;&#43;&#43;------<br>
&gt;&nbsp; 1 file changed, 6 insertions(&#43;), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daem=
on-wl18xx.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-=
wl18xx.bb<br>
&gt; index 1151012..0288a54 100644<br>
&gt; --- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18=
xx.bb<br>
&gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-connectivity/hostap/hostap=
-daemon-wl18xx.bb<br>
&gt; @@ -4,19 &#43;4,19 @@<br>
&gt;&nbsp; require hostap.inc<br>
&gt;&nbsp; <br>
&gt;&nbsp; LICENSE =3D &quot;GPLv2&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://../COPYING;md5=3D36b2780=
1447e0662ee0138d17fe93880">file://../COPYING;md5=3D36b27801447e0662ee0138d1=
7fe93880</a>&quot;<br>
&gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://../COPYING;md5=3D292=
eece3f2ebbaa25608eed8464018a3">file://../COPYING;md5=3D292eece3f2ebbaa25608=
eed8464018a3</a>&quot;<br>
<br>
Same request for license checksum change.<br>
<br>
<br>
&gt; -PR_append =3D &quot;d&quot;<br>
&gt; &#43;PR_append =3D &quot;e&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; FILESEXTRAPATHS_append :=3D &quot;:${THISDIR}/hostap-daemon&quot=
;<br>
&gt;&nbsp; <br>
&gt;&nbsp; # Add TI to the end to make it clear that this is a TI customize=
d version<br>
&gt;&nbsp; # of hostap<br>
&gt; -PV =3D &quot;R8.6-devel-ti&#43;git${SRCPV}&quot;<br>
&gt; &#43;PV =3D &quot;R8.7_SP3-devel-ti&#43;git${SRCPV}&quot;<br>
&gt;&nbsp; <br>
&gt; -# Tag: R8.6<br>
&gt; -SRCREV =3D &quot;f80fe345acf103ba6882ac8396f19584ac184904&quot;<br>
&gt; -BRANCH =3D &quot;upstream_24&quot;<br>
&gt; &#43;# Tag: R8.7_SP3<br>
&gt; &#43;SRCREV =3D &quot;ee8fbdb840d95e048f58fb62bf3b5472041b5417&quot;<b=
r>
&gt; &#43;BRANCH =3D &quot;upstream_25_rebase&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; PROVIDES &#43;=3D &quot;hostap-daemon&quot;<br>
&gt;&nbsp; RPROVIDES_${PN} &#43;=3D &quot;hostap-daemon&quot;<br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
</div>
</span></font>
</body>
</html>

--_000_2l82hg9b7spo2oks1u5hijv31512417573718emailandroidcom_--
