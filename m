Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7C17D529D5
	for <meta-arago@arago-project.org>;
	Fri,  3 Aug 2018 13:44:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w73DiX6e073447
	for <meta-arago@arago-project.org>; Fri, 3 Aug 2018 08:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533303873;
	bh=jr2GsmB9iLb4mmtysFbCfMCOZ8469ve8AARoqvk+0EI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=TwgcZ9PXTOD6LfYr1xn6H2ZDAIPdpnuIQRKk4p9enIgxezSDLmLtGOG05oWLKe0Ug
	XlcgdobBos5tlgO40mMS/vXFC5CzHFqwDMbaZjTh8towrVn4U4OJzXc7dlE0a0xe9f
	gagKRFw7IS+9hF4FkxGZrSOG/AJmx027Jb9JpCN4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w73DiX4v014316
	for <meta-arago@arago-project.org>; Fri, 3 Aug 2018 08:44:33 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 3 Aug 2018 08:44:33 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%18]) with mapi id
	15.01.1466.003; Fri, 3 Aug 2018 08:44:33 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Murphy, Dan" <dmurphy@ti.com>
Thread-Topic: [PATCH] optee: Update OPTEE tag to 3.2.0 and apply ti2018.03-rc1
	tag
Thread-Index: AQHUKpMEkicEvKLLq0SW2bfm4sTlBaStEHIAgAEsZ4D//844lQ==
Date: Fri, 3 Aug 2018 13:44:32 +0000
Message-ID: <59259d43-621f-4f63-8868-d6fdf1ba2c85@email.android.com>
References: <20180802185959.24811-1-dmurphy@ti.com>
	<29767ab9fcb44c3cbd9db74a4a41ac36@ti.com>,
	<0865fc76-c513-56a1-92e3-9f243568c600@ti.com>
In-Reply-To: <0865fc76-c513-56a1-92e3-9f243568c600@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] optee: Update OPTEE tag to 3.2.0 and apply ti2018.03-rc1 tag
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
X-List-Received-Date: Fri, 03 Aug 2018 13:44:40 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_59259d43621f4f638868d6fdf1ba2c85emailandroidcom_"

--_000_59259d43621f4f638868d6fdf1ba2c85emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It is on a separate branch, not master


On Aug 3, 2018 07:42, "Murphy, Dan" <dmurphy@ti.com> wrote:
Denys

On 08/02/2018 05:47 PM, Dmytriyenko, Denys wrote:
> ERROR: optee-os-3.2.0+gitAUTOINC+48952f9f76-r0.arago0 do_fetch: Fetcher f=
ailure: Unable to find revision 48952f9f76d885df4cb65f8479a4cf7dedf0ee54 in=
 branch master even from upstream
>

What was the issue you had to correct?  The Commit sha looks correct

Dan

>
>> -----Original Message-----
>> From: Murphy, Dan
>> Sent: Thursday, August 2, 2018 3:00 PM
>> To: meta-arago@arago-project.org
>> Cc: Dmytriyenko, Denys; Murphy, Dan
>> Subject: [PATCH] optee: Update OPTEE tag to 3.2.0 and apply ti2018.03-rc=
1 tag
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  .../recipes-security/optee/optee-client.bbappend              | 4 ++--
>>  .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
>>  .../recipes-security/optee/optee-test_git.bbappend            | 2 +-
>>  3 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbapp=
end
>> b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
>> index bb1f631d..52a6f588 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
>> @@ -5,7 +5,7 @@ SRC_URI =3D "git://git.ti.com/optee/ti-optee-
>> client.git;branch=3D${BRANCH} \
>>
>>  LIC_FILES_CHKSUM =3D
>> "file://${S}/LICENSE;md5=3D69663ab153298557a59c67a60a743e5b"
>>
>> -PV =3D "3.0.0+git${SRCPV}"
>> +PV =3D "3.2.0+git${SRCPV}"
>>
>>  BRANCH =3D "ti_optee_client"
>> -SRCREV =3D "09b69afa5e9e74aac39e383d74f14b4d61c90476"
>> +SRCREV =3D "2d542f2074223fde918e68efa4a9ff37f927e604"
>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbapp=
end
>> b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> index 655bd02e..ffbf0aeb 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>>
>>  PR_append =3D ".arago0"
>>
>> -PV =3D "3.1.0+git${SRCPV}"
>> +PV =3D "3.2.0+git${SRCPV}"
>>
>>  is_armv7 =3D "1"
>>  is_armv7_aarch64 =3D "0"
>> @@ -11,7 +11,7 @@ SRC_URI =3D "git://git.ti.com/optee/ti-optee-
>> os.git;branch=3D${BRANCH} \
>>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>  "
>>  BRANCH =3D "master"
>> -SRCREV =3D "940a24375ba5357d34fea7196dba48eadaee9abd"
>> +SRCREV =3D "48952f9f76d885df4cb65f8479a4cf7dedf0ee54"
>>
>>  ARMCORE =3D "CFG_ARM32_core=3Dy ta-targets=3Dta_arm32"
>>  ARMCORE_aarch64 =3D "CFG_ARM64_core=3Dy ta-targets=3Dta_arm64"
>> diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bba=
ppend
>> b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
>> index e6d10735..f85c719b 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
>> @@ -6,7 +6,7 @@ SRC_URI =3D "git://git.ti.com/optee/ti-optee-
>> test.git;branch=3D${BRANCH}"
>>
>>  SRC_URI +=3D "file://0001-host-xtest-Makefile-fix-COMPILE_NS_USER-not-b=
eing-
>> se.patch"
>>
>> -PV =3D "3.1.0+git${SRCPV}"
>> +PV =3D "3.2.0+git${SRCPV}"
>>
>>  BRANCH =3D "ti_optee_test"
>>  SRCREV =3D "b284eedf4fa20c21403ececfe0a47af55fbaa5d8"
>> --
>> 2.17.0.582.gccdcbd54c
>


--
------------------
Dan Murphy

--_000_59259d43621f4f638868d6fdf1ba2c85emailandroidcom_
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
<div>
<div dir=3D"auto">It is on a separate branch, not master
<div dir=3D"auto"><br>
</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">On Aug 3, 2018 07:42, &quot;Murphy, Dan&quot; =
&lt;dmurphy@ti.com&gt; wrote:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Denys<br>
<br>
On 08/02/2018 05:47 PM, Dmytriyenko, Denys wrote:<br>
&gt; ERROR: optee-os-3.2.0&#43;gitAUTOINC&#43;48952f9f76-r0.arago0 do_fetch=
: Fetcher failure: Unable to find revision 48952f9f76d885df4cb65f8479a4cf7d=
edf0ee54 in branch master even from upstream<br>
&gt; <br>
<br>
What was the issue you had to correct?&nbsp; The Commit sha looks correct<b=
r>
<br>
Dan<br>
<br>
&gt; <br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: Murphy, Dan<br>
&gt;&gt; Sent: Thursday, August 2, 2018 3:00 PM<br>
&gt;&gt; To: meta-arago@arago-project.org<br>
&gt;&gt; Cc: Dmytriyenko, Denys; Murphy, Dan<br>
&gt;&gt; Subject: [PATCH] optee: Update OPTEE tag to 3.2.0 and apply ti2018=
.03-rc1 tag<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Dan Murphy &lt;dmurphy@ti.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp; .../recipes-security/optee/optee-client.bbappend&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 &#43=
;&#43;--<br>
&gt;&gt;&nbsp; .../recipes-security/optee/optee-os_git.bbappend&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 &#43=
;&#43;--<br>
&gt;&gt;&nbsp; .../recipes-security/optee/optee-test_git.bbappend&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 &#43;-<br>
&gt;&gt;&nbsp; 3 files changed, 5 insertions(&#43;), 5 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-arago-distro/recipes-security/optee/optee-client=
.bbappend<br>
&gt;&gt; b/meta-arago-distro/recipes-security/optee/optee-client.bbappend<b=
r>
&gt;&gt; index bb1f631d..52a6f588 100644<br>
&gt;&gt; --- a/meta-arago-distro/recipes-security/optee/optee-client.bbappe=
nd<br>
&gt;&gt; &#43;&#43;&#43; b/meta-arago-distro/recipes-security/optee/optee-c=
lient.bbappend<br>
&gt;&gt; @@ -5,7 &#43;5,7 @@ SRC_URI =3D &quot;git://git.ti.com/optee/ti-op=
tee-<br>
&gt;&gt; client.git;branch=3D${BRANCH} \<br>
&gt;&gt;<br>
&gt;&gt;&nbsp; LIC_FILES_CHKSUM =3D<br>
&gt;&gt; &quot;<a href=3D"file://${S}/LICENSE;md5=3D69663ab153298557a59c67a=
60a743e5b">file://${S}/LICENSE;md5=3D69663ab153298557a59c67a60a743e5b</a>&q=
uot;<br>
&gt;&gt;<br>
&gt;&gt; -PV =3D &quot;3.0.0&#43;git${SRCPV}&quot;<br>
&gt;&gt; &#43;PV =3D &quot;3.2.0&#43;git${SRCPV}&quot;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp; BRANCH =3D &quot;ti_optee_client&quot;<br>
&gt;&gt; -SRCREV =3D &quot;09b69afa5e9e74aac39e383d74f14b4d61c90476&quot;<b=
r>
&gt;&gt; &#43;SRCREV =3D &quot;2d542f2074223fde918e68efa4a9ff37f927e604&quo=
t;<br>
&gt;&gt; diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git=
.bbappend<br>
&gt;&gt; b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend<b=
r>
&gt;&gt; index 655bd02e..ffbf0aeb 100644<br>
&gt;&gt; --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappe=
nd<br>
&gt;&gt; &#43;&#43;&#43; b/meta-arago-distro/recipes-security/optee/optee-o=
s_git.bbappend<br>
&gt;&gt; @@ -2,7 &#43;2,7 @@ FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/=
${PN}:&quot;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp; PR_append =3D &quot;.arago0&quot;<br>
&gt;&gt;<br>
&gt;&gt; -PV =3D &quot;3.1.0&#43;git${SRCPV}&quot;<br>
&gt;&gt; &#43;PV =3D &quot;3.2.0&#43;git${SRCPV}&quot;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp; is_armv7 =3D &quot;1&quot;<br>
&gt;&gt;&nbsp; is_armv7_aarch64 =3D &quot;0&quot;<br>
&gt;&gt; @@ -11,7 &#43;11,7 @@ SRC_URI =3D &quot;git://git.ti.com/optee/ti-=
optee-<br>
&gt;&gt; os.git;branch=3D${BRANCH} \<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; <a href=3D"file://0001-allow-setting-sysroot-for-libgcc-lookup.patch"=
>
file://0001-allow-setting-sysroot-for-libgcc-lookup.patch</a> \<br>
&gt;&gt;&nbsp; &quot;<br>
&gt;&gt;&nbsp; BRANCH =3D &quot;master&quot;<br>
&gt;&gt; -SRCREV =3D &quot;940a24375ba5357d34fea7196dba48eadaee9abd&quot;<b=
r>
&gt;&gt; &#43;SRCREV =3D &quot;48952f9f76d885df4cb65f8479a4cf7dedf0ee54&quo=
t;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp; ARMCORE =3D &quot;CFG_ARM32_core=3Dy ta-targets=3Dta_arm32&q=
uot;<br>
&gt;&gt;&nbsp; ARMCORE_aarch64 =3D &quot;CFG_ARM64_core=3Dy ta-targets=3Dta=
_arm64&quot;<br>
&gt;&gt; diff --git a/meta-arago-distro/recipes-security/optee/optee-test_g=
it.bbappend<br>
&gt;&gt; b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend=
<br>
&gt;&gt; index e6d10735..f85c719b 100644<br>
&gt;&gt; --- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbap=
pend<br>
&gt;&gt; &#43;&#43;&#43; b/meta-arago-distro/recipes-security/optee/optee-t=
est_git.bbappend<br>
&gt;&gt; @@ -6,7 &#43;6,7 @@ SRC_URI =3D &quot;git://git.ti.com/optee/ti-op=
tee-<br>
&gt;&gt; test.git;branch=3D${BRANCH}&quot;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp; SRC_URI &#43;=3D &quot;<a href=3D""></a>file://0001-host-xte=
st-Makefile-fix-COMPILE_NS_USER-not-being-<br>
&gt;&gt; se.patch&quot;<br>
&gt;&gt;<br>
&gt;&gt; -PV =3D &quot;3.1.0&#43;git${SRCPV}&quot;<br>
&gt;&gt; &#43;PV =3D &quot;3.2.0&#43;git${SRCPV}&quot;<br>
&gt;&gt;<br>
&gt;&gt;&nbsp; BRANCH =3D &quot;ti_optee_test&quot;<br>
&gt;&gt;&nbsp; SRCREV =3D &quot;b284eedf4fa20c21403ececfe0a47af55fbaa5d8&qu=
ot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.17.0.582.gccdcbd54c<br>
&gt; <br>
<br>
<br>
-- <br>
------------------<br>
Dan Murphy<br>
</div>
</span></font>
</body>
</html>

--_000_59259d43621f4f638868d6fdf1ba2c85emailandroidcom_--
