Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611DACD13CF
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 12:29:50 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.22119.1725366587701452914
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Sep 2024 05:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=JTNSdNYc;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 483CTlNK109701
	for <meta-arago@lists.yoctoproject.org>; Tue, 3 Sep 2024 07:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725366587;
	bh=FJbaV9gmdBu6SLWb7XR+zatcT3N+IlGH3qm90rXps6c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JTNSdNYcaLD5EyYfONDjInpmBc2IKSxC4aslTGCPfgOJ4SHQzZVyrTDYLn2Tv/jCi
	 bpuklFqS8FxojyKlSDgrmQhAgHD/JC5W3ENgBBnWI71AUBmW8flUe/FrPv8A7r84Pz
	 ei1KYZl7gtSU/3wArDgO+bpM4luVqJrNcVqJwKYE=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 483CTkKu076995
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 3 Sep 2024 07:29:47 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Sep 2024 07:29:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Sep 2024 07:29:46 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 483CTifh124485;
	Tue, 3 Sep 2024 07:29:45 -0500
Message-ID: <12d6b29c-5aa3-44b6-90ff-6118194508cf@ti.com>
Date: Tue, 3 Sep 2024 17:59:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][oe-layersetup][PATCH] configs:
 processor-sdk-linux: Adding 10.0 release config for J7200
To: <s-alam@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>
References: <20240903092956.176169-1-s-alam@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240903092956.176169-1-s-alam@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 483CTlNK109701
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Sep 2024 12:29:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15550

Hi,
On 03/09/24 14:59, Sonu Alam via lists.yoctoproject.org wrote:
> - adding Add processor-gateway-10_00.=E2=80=8Atxt config used for build=
ing=20
> J7200. Signed-off-by: Sonu Alam <s-alam@=E2=80=8Ati.=E2=80=8Acom> ---=20
> ..=E2=80=8A.=E2=80=8A/processor-sdk-gateway-10_00.=E2=80=8Atxt | 19 +++=
++++++++++++++++ 1 file=20
> changed, 19 insertions(+) create mode 100644=20
> configs/processor-sdk-linux/processor-sdk-gateway-10_00.=E2=80=8Atxt
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uFdqXRfP9mw7KmZlH=
JKjfL_0qpAV7HQ4SjlfEzz95SC_HfVEmisdRpuvs5z957pvuJOItjK7WrCyztzAW3A$>=20
>
> ZjQcmQRYFpfptBannerEnd
> - adding Add


"adding Add" looks like a typo.
Commit message might need an update in v2 patch


> processor-gateway-10_00.txt config used for
>      building J7200.
>
> Signed-off-by: Sonu Alam <s-alam@ti.com>
> ---
>   .../processor-sdk-gateway-10_00.txt           | 19 ++++++++++++++++++=
+
>   1 file changed, 19 insertions(+)
>   create mode 100644 configs/processor-sdk-linux/processor-sdk-gateway-=
10_00.txt
>
> diff --git a/configs/processor-sdk-linux/processor-sdk-gateway-10_00.tx=
t b/configs/processor-sdk-linux/processor-sdk-gateway-10_00.txt
> new file mode 100644
> index 0000000..f69645e
> --- /dev/null
> +++ b/configs/processor-sdk-linux/processor-sdk-gateway-10_00.txt
> @@ -0,0 +1,19 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2..=
.:layern]
> +
> +bitbake,https://urldefense.com/v3/__https://git.openembedded.org/bitba=
ke,2.8,11d83170922a2c6b9db1f6e8c23e533526984b2c__;!!G3vK!W_emWiCsPkFHRqWZ=
QVGfIxeOjwB464IMWSA1NS1O5sx8KZGIUM82VKqZ-Wxca8Pf1oNlkGUK03-Y6SXv_8ZUSx1vU=
9J-DGPO$
> +meta-arago,https://urldefense.com/v3/__https://git.yoctoproject.org/me=
ta-arago,scarthgap,82833bae8835e06301c23c8833642ae4c02d303a,layers=3Dmeta=
-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test__;!!G3vK=
!W_emWiCsPkFHRqWZQVGfIxeOjwB464IMWSA1NS1O5sx8KZGIUM82VKqZ-Wxca8Pf1oNlkGUK=
03-Y6SXv_8ZUSx1vUyDNkMCe$


Better to use 10.00.07 tag for meta-arago instead of repo commit as it's=20
a 10.0 release config


> +#meta-browser,https://urldefense.com/v3/__https://github.com/OSSystems=
/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=3D=
meta-chromium__;!!G3vK!W_emWiCsPkFHRqWZQVGfIxeOjwB464IMWSA1NS1O5sx8KZGIUM=
82VKqZ-Wxca8Pf1oNlkGUK03-Y6SXv_8ZUSx1vU461VMwQ$
> +meta-qt5,https://urldefense.com/v3/__https://github.com/meta-qt5/meta-=
qt5.git,scarthgap,eb828418264a49b8d00035cb3d7b12fcea3be801,layers=3D__;!!=
G3vK!W_emWiCsPkFHRqWZQVGfIxeOjwB464IMWSA1NS1O5sx8KZGIUM82VKqZ-Wxca8Pf1oNl=
kGUK03-Y6SXv_8ZUSx1vUxuDzguf$
> +meta-virtualization,https://urldefense.com/v3/__https://git.yoctoproje=
ct.org/meta-virtualization,scarthgap,6a80f140e387621f62964209a2e07d3bcfb1=
25ce,layers=3D__;!!G3vK!W_emWiCsPkFHRqWZQVGfIxeOjwB464IMWSA1NS1O5sx8KZGIU=
M82VKqZ-Wxca8Pf1oNlkGUK03-Y6SXv_8ZUSx1vU2M0YSEJ$
> +meta-openembedded,https://urldefense.com/v3/__https://git.openembedded=
.org/meta-openembedded,scarthgap,18f939a5fb37528a5415b05077ece383c346a119=
,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia__;!!G3vK!W_emWiCsPkFHRqWZQVGfIxeOjwB464IMWSA1NS1O5sx8KZG=
IUM82VKqZ-Wxca8Pf1oNlkGUK03-Y6SXv_8ZUSx1vU33t_7hv$
> +meta-ti,https://urldefense.com/v3/__https://git.yoctoproject.org/meta-=
ti,scarthgap,138077349667614f83637c98798c06249615a23e,layers=3Dmeta-ti-ex=
tras:meta-ti-bsp__;!!G3vK!W_emWiCsPkFHRqWZQVGfIxeOjwB464IMWSA1NS1O5sx8KZG=
IUM82VKqZ-Wxca8Pf1oNlkGUK03-Y6SXv_8ZUSx1vU5qkQKPY$


Better to use 10.00.07 tag for meta-ti instead of repo commit as it's a=20
10.0 release config


> +meta-arm,https://urldefense.com/v3/__https://git.yoctoproject.org/meta=
-arm,scarthgap,1b85bbb4cab9658da3cd926c62038b8559c5c64e,layers=3Dmeta-arm=
:meta-arm-toolchain__;!!G3vK!W_emWiCsPkFHRqWZQVGfIxeOjwB464IMWSA1NS1O5sx8=
KZGIUM82VKqZ-Wxca8Pf1oNlkGUK03-Y6SXv_8ZUSx1vU3QAjOwv$
> +meta-clang,https://urldefense.com/v3/__https://github.com/kraj/meta-cl=
ang,scarthgap,df21b1563910c80d7e2964971b7c5b79b5186922,layers=3D__;!!G3vK=
!W_emWiCsPkFHRqWZQVGfIxeOjwB464IMWSA1NS1O5sx8KZGIUM82VKqZ-Wxca8Pf1oNlkGUK=
03-Y6SXv_8ZUSx1vUyhpZqgM$
> +oe-core,https://urldefense.com/v3/__https://git.openembedded.org/opene=
mbedded-core,scarthgap,c00a9a8f25b0042b0723a5d20b88e92d473d22bf,layers=3D=
meta__;!!G3vK!W_emWiCsPkFHRqWZQVGfIxeOjwB464IMWSA1NS1O5sx8KZGIUM82VKqZ-Wx=
ca8Pf1oNlkGUK03-Y6SXv_8ZUSx1vUyJPinI4$
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=3Dyes
> +meta-tisdk,https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk,scarthgap,a=
f81e0d81c5efd005bfc0ef749f690f9748c70f6,layers=3D
> +LOCALCONF:DISTRO_FEATURES:append =3D " virtualization"
> +
> --=20
> 2.34.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15549):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15549__;!!G3vK!W_emWiCsPkFHRqWZQVGfIx=
eOjwB464IMWSA1NS1O5sx8KZGIUM82VKqZ-Wxca8Pf1oNlkGUK03-Y6SXv_8ZUSx1vUwq46kl=
Z$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/108242025/7030289__;!!G3vK!W_emWiCsPkFHRqWZQVGfIxeOjwB464IMWSA1NS1=
O5sx8KZGIUM82VKqZ-Wxca8Pf1oNlkGUK03-Y6SXv_8ZUSx1vU8rUM23L$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!W_emWiCsPkFHRqWZQVGfIxeOjwB464IMWSA1NS1O5sx8K=
ZGIUM82VKqZ-Wxca8Pf1oNlkGUK03-Y6SXv_8ZUSx1vU_GYmiqG$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

