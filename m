Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E577DC27C4F
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 02:47:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.629.1718074065088028364
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Jun 2024 19:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=FdlAYxb7;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45B2lhT7066471
	for <meta-arago@lists.yoctoproject.org>; Mon, 10 Jun 2024 21:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718074063;
	bh=RlObG8KXipdN2+BEmcUF3CvfnLbMEa/Hn0e2nDhlMns=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=FdlAYxb7UyqEjBBqdPdtQ503ZdxQqt86eL1TTdFF694vI7Kw7yCBDuTDFtZ1vtHwy
	 j6jC75TEmcokt0HT60erQT4NLvsRzH+txSdg4nLuvRjq70jO+a3gU0IralNS/mHuTR
	 i9otjzOLKw8DCKCbkwifOKZVgPqVkDy37O638PQE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45B2lhxC054817
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 10 Jun 2024 21:47:43 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 21:47:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 21:47:43 -0500
Received: from [10.249.128.120] ([10.249.128.120])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45B2lf2n013039
	for <meta-arago@lists.yoctoproject.org>; Mon, 10 Jun 2024 21:47:42 -0500
Content-Type: multipart/alternative;
	boundary="------------KfbDVyojE0rrh5t7BVF4CBMN"
Message-ID: <283fe9c8-c5ed-43e8-856f-34380a763765@ti.com>
Date: Tue, 11 Jun 2024 08:17:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][scarthgap][PATCH] openssl-perf:
 Performance script for testing
To: <meta-arago@lists.yoctoproject.org>
References: <20240610150701.13401-1-reatmon@ti.com>
Content-Language: en-US
From: "Limaye, Aniket" <a-limaye@ti.com>
In-Reply-To: <20240610150701.13401-1-reatmon@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Jun 2024 02:47:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15382

--------------KfbDVyojE0rrh5t7BVF4CBMN
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 45B2lhT7066471


On 6/10/2024 8:37 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> We need to pull a single script in from the matrix-gui packages since=20
> they are getting removed. The openssl_perf.=E2=80=8Ash is required for =
the=20
> ti-test flow. Signed-off-by: Ryan Eatmon <reatmon@=E2=80=8Ati.=E2=80=8A=
com> ---=20
> ..=E2=80=8A.=E2=80=8A/openssl-perf/openssl-perf.=E2=80=8Abb | 23
> ZjQcmQRYFpfptBannerStart
> We need to pull a single script in from the matrix-gui packages since
> they are getting removed.  The openssl_perf.sh is required for the
> ti-test flow.
>
> Signed-off-by: Ryan Eatmon<reatmon@ti.com>
> ---
>   .../openssl-perf/openssl-perf.bb              | 23 ++++++++++++++++++=
+
>   .../recipes-core/packagegroups/ti-test.bb     |  1 +
>   2 files changed, 24 insertions(+)
>   create mode 100644 meta-arago-test/recipes-benchmark/openssl-perf/ope=
nssl-perf.bb

Reviewed-by: Aniket Limaye<a-limaye@ti.com>


>
> diff --git a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-per=
f.bb b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
> new file mode 100644
> index 00000000..02f41f41
> --- /dev/null
> +++ b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Benchmark for checking various OpenSSL performance functi=
ons"
> +HOMEPAGE =3D"https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/=
tree/cryptos_apps_scripts/openssl_perf_scripts/openssl_perf.sh"
> +LICENSE =3D "CC-BY-SA-3.0"
> +LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D6e0ae7214f6c74c149cb25f37305=
7fa9"
> +
> +PV =3D "1.0"
> +
> +SRC_URI =3D " \
> +https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/cryptos=
_apps_scripts/openssl_perf_scripts/openssl_perf.sh;name=3Dopenssl_perf  \
> +https://git.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE=
;name=3Dlicense  \
> +"
> +SRC_URI[openssl_perf.sha256sum] =3D "1ba5188beb6a1fa69d9f34df12c596ed4=
9907c2b2d2ce2d985a305b9ecbed800"
> +SRC_URI[license.sha256sum] =3D "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f9=
7326695a0cc7074bd6c8d263e3"
> +
> +S =3D "${WORKDIR}"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/openssl_perf.sh ${D}${bindir}/openssl_perf.sh
> +}
> +
> +FILES:${PN} =3D "${bindir}/openssl_perf.sh"
> +
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/me=
ta-arago-test/recipes-core/packagegroups/ti-test.bb
> index b71c374b..8cb27f21 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -73,6 +73,7 @@ TI_TEST_TI_TOOLS =3D " \
>       cpuloadgen \
>       input-utils \
>       ltp-ddt \
> +    openssl-perf \
>       uvc-gadget \
>   "
>  =20
> --=20
> 2.17.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15380):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15380__;!!G3vK!X2xBTAguBiEEz6BzaVhIDm=
hdHD2-4ULGitSfHnKkKsQZ8eT3QWVnTPxtT1DIzH7Bw1XldfzU4umCw38iqVFzXYXgxZmP0N1=
9$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/106594333/6607860__;!!G3vK!X2xBTAguBiEEz6BzaVhIDmhdHD2-4ULGitSfHnK=
kKsQZ8eT3QWVnTPxtT1DIzH7Bw1XldfzU4umCw38iqVFzXYXgxc8giXyX$
> Group Owner:meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!X2xBTAguBiEEz6BzaVhIDmhdHD2-4ULGitSfHnKkKsQZ8=
eT3QWVnTPxtT1DIzH7Bw1XldfzU4umCw38iqVFzXYXgxUR72wMt$  [a-limaye@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
--------------KfbDVyojE0rrh5t7BVF4CBMN
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 45B2lhT7066471

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 6/10/2024 8:37 PM, Ryan Eatmon via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20240610150701.13401-1-reatmon@ti.com">
      <!-- BaNnErBlUrFlE-BoDy-start -->
      <!-- Preheader Text : BEGIN -->
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;height:0px;max-height:0px=
;opacity:0;overflow:hidden;">
        We need to pull a single script in from the matrix-gui packages
        since they are getting removed. The openssl_perf.=E2=80=8Ash is r=
equired
        for the ti-test flow. Signed-off-by: Ryan Eatmon
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:reatmon@=E2=80=8A=
ti.=E2=80=8Acom">&lt;reatmon@=E2=80=8Ati.=E2=80=8Acom&gt;</a> --- ..=E2=80=
=8A.=E2=80=8A/openssl-perf/openssl-perf.=E2=80=8Abb
        | 23
      </div>
      <!-- Preheader Text : END -->
      <!-- Email Banner : BEGIN -->
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;height:0px;max-height:0px=
;opacity:0;overflow:hidden;">ZjQcmQRYFpfptBannerStart</div>
      <!--[if ((ie)|(mso))]>
  <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" =
style=3D"padding: 16px 0px 16px 0px; direction: ltr" lang=3D"en"><tr><td>
    <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"padd=
ing: 0px 10px 5px 6px; width: 100%; border-radius:4px; border-top:4px sol=
id #90a4ae;background-color:#D0D8DC;"><tr><td valign=3D"top">
      <table align=3D"left" border=3D"0" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"padding: 4px 8px 4px 8px">
	<tr><td style=3D"color:#000000; font-family: 'Arial', sans-serif; font-w=
eight:bold; font-size:14px; direction: ltr">
	  This message was sent from outside of Texas Instruments.
	</td></tr>
	<tr><td style=3D"color:#000000; font-weight:normal; font-family: 'Arial'=
, sans-serif; font-size:12px; direction: ltr">
          Do not click links or open attachments unless you recognize the=
 source of this email and know the content is safe.  If you wish to repor=
t this message to IT Security, please forward the message as an attachmen=
t to phishing@list.ti.com
	</td></tr>

      </table>

    </td></tr></table>
  </td></tr></table>
<![endif]-->
      <!--[if !((ie)|(mso))]--><span style=3D"white-space: pre-wrap">We n=
eed to pull a single script in from the matrix-gui packages since</span>
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">they are getting removed.  The openssl_perf.sh is=
 required for the
ti-test flow.

Signed-off-by: Ryan Eatmon <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:reatmon@ti.com">&lt;reatmon@ti.com&gt;</a>
---
 .../openssl-perf/openssl-perf.bb              | 23 +++++++++++++++++++
 .../recipes-core/packagegroups/ti-test.bb     |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-arago-test/recipes-benchmark/openssl-perf/openss=
l-perf.bb</pre>
    </blockquote>
    <br>
    <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">Reviewed-by: Aniket Limaye <a class=3D"moz-txt-li=
nk-rfc2396E" href=3D"mailto:a-limaye@ti.com">&lt;a-limaye@ti.com&gt;</a><=
/pre>
    <p><br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:20240610150701.13401-1-reatmon@ti.com">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">

diff --git a/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.=
bb b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
new file mode 100644
index 00000000..02f41f41
--- /dev/null
+++ b/meta-arago-test/recipes-benchmark/openssl-perf/openssl-perf.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "Benchmark for checking various OpenSSL performance function=
s"
+HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://git.ti.c=
om/cgit/matrix-gui-v2/matrix-gui-v2-apps/tree/cryptos_apps_scripts/openss=
l_perf_scripts/openssl_perf.sh">"https://git.ti.com/cgit/matrix-gui-v2/ma=
trix-gui-v2-apps/tree/cryptos_apps_scripts/openssl_perf_scripts/openssl_p=
erf.sh"</a>
+LICENSE =3D "CC-BY-SA-3.0"
+LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://L=
ICENSE;md5=3D6e0ae7214f6c74c149cb25f373057fa9">"file://LICENSE;md5=3D6e0a=
e7214f6c74c149cb25f373057fa9"</a>
+
+PV =3D "1.0"
+
+SRC_URI =3D " \
+    <a class=3D"moz-txt-link-freetext" href=3D"https://git.ti.com/cgit/m=
atrix-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_perf_s=
cripts/openssl_perf.sh;name=3Dopenssl_perf">https://git.ti.com/cgit/matri=
x-gui-v2/matrix-gui-v2-apps/plain/cryptos_apps_scripts/openssl_perf_scrip=
ts/openssl_perf.sh;name=3Dopenssl_perf</a> \
+    <a class=3D"moz-txt-link-freetext" href=3D"https://git.ti.com/cgit/m=
atrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE;name=3Dlicense">https://git=
.ti.com/cgit/matrix-gui-v2/matrix-gui-v2-apps/plain/LICENSE;name=3Dlicens=
e</a> \
+"
+SRC_URI[openssl_perf.sha256sum] =3D "1ba5188beb6a1fa69d9f34df12c596ed499=
07c2b2d2ce2d985a305b9ecbed800"
+SRC_URI[license.sha256sum] =3D "7febd1df714fa4b1e44fe0b0f73ceac7f9b9f973=
26695a0cc7074bd6c8d263e3"
+
+S =3D "${WORKDIR}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/openssl_perf.sh ${D}${bindir}/openssl_perf.sh
+}
+
+FILES:${PN} =3D "${bindir}/openssl_perf.sh"
+
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta=
-arago-test/recipes-core/packagegroups/ti-test.bb
index b71c374b..8cb27f21 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -73,6 +73,7 @@ TI_TEST_TI_TOOLS =3D " \
     cpuloadgen \
     input-utils \
     ltp-ddt \
+    openssl-perf \
     uvc-gadget \
 "
=20
--=20
2.17.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#15380): <a
href=3D"https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta=
-arago/message/15380__;!!G3vK!X2xBTAguBiEEz6BzaVhIDmhdHD2-4ULGitSfHnKkKsQ=
Z8eT3QWVnTPxtT1DIzH7Bw1XldfzU4umCw38iqVFzXYXgxZmP0N19$"
      moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://ur=
ldefense.com/v3/__https://lists.yoctoproject.org/g/meta-arago/message/153=
80__;!!G3vK!X2xBTAguBiEEz6BzaVhIDmhdHD2-4ULGitSfHnKkKsQZ8eT3QWVnTPxtT1DIz=
H7Bw1XldfzU4umCw38iqVFzXYXgxZmP0N19$</a>
Mute This Topic: <a
href=3D"https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/106=
594333/6607860__;!!G3vK!X2xBTAguBiEEz6BzaVhIDmhdHD2-4ULGitSfHnKkKsQZ8eT3Q=
WVnTPxtT1DIzH7Bw1XldfzU4umCw38iqVFzXYXgxc8giXyX$"
      moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://ur=
ldefense.com/v3/__https://lists.yoctoproject.org/mt/106594333/6607860__;!=
!G3vK!X2xBTAguBiEEz6BzaVhIDmhdHD2-4ULGitSfHnKkKsQZ8eT3QWVnTPxtT1DIzH7Bw1X=
ldfzU4umCw38iqVFzXYXgxc8giXyX$</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-ar=
ago+owner@lists.yoctoproject.org">meta-arago+owner@lists.yoctoproject.org=
</a>
Unsubscribe: <a
href=3D"https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta=
-arago/unsub__;!!G3vK!X2xBTAguBiEEz6BzaVhIDmhdHD2-4ULGitSfHnKkKsQZ8eT3QWV=
nTPxtT1DIzH7Bw1XldfzU4umCw38iqVFzXYXgxUR72wMt$"
      moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://ur=
ldefense.com/v3/__https://lists.yoctoproject.org/g/meta-arago/unsub__;!!G=
3vK!X2xBTAguBiEEz6BzaVhIDmhdHD2-4ULGitSfHnKkKsQZ8eT3QWVnTPxtT1DIzH7Bw1Xld=
fzU4umCw38iqVFzXYXgxUR72wMt$</a> [<a class=3D"moz-txt-link-abbreviated" h=
ref=3D"mailto:a-limaye@ti.com">a-limaye@ti.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


</pre>
    </blockquote>
  </body>
</html>

--------------KfbDVyojE0rrh5t7BVF4CBMN--

