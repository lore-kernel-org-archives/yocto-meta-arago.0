Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08548C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 05:02:03 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4566.1717131714399062503
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 May 2024 22:01:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ZvRByms6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44V51q8E097100;
	Fri, 31 May 2024 00:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717131712;
	bh=P0bDTN9va5+JVPXjqtn99Ld59aCxozh4upTG2AHDwEM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZvRByms6CFCPU9ZWbmP3t37MWyxslNiyrFGj54h5xjqQWtQGSdt6Dk4fwoBhUnYPc
	 xCKL6YFjDzJnhS9JFqFXNJyaGjLV9C1FsK6SrNRjDnGHuHeya3fMeyDHsr5f47pmFM
	 9tGqht3UKBSSFKmDpENfoVFO4PjzBzeS6833CnDQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44V51qfX017253
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 00:01:52 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 00:01:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 00:01:52 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44V51naI061621;
	Fri, 31 May 2024 00:01:50 -0500
Message-ID: <2954f4b1-b615-4952-b7c7-6886377174f8@ti.com>
Date: Fri, 31 May 2024 10:31:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][oe-layersetup][PATCH] oe-layersetup: add
 a scarthgap chromium config
To: <meta-arago@lists.yoctoproject.org>
CC: <denys@konsulko.com>, <rs@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20240530200704.27487-1-detheridge@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240530200704.27487-1-detheridge@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 44V51q8E097100
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 31 May 2024 05:02:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15344


On 31/05/24 01:37, Etheridge, Darren via lists.yoctoproject.org wrote:
> From: Darren Etheridge <detheridge@=E2=80=8Ati.=E2=80=8Acom> Add a chro=
mium config for=20
> Scarthgap, just like we did for Kirkstone, it is locked to=20
> meta-browser at Chromium v123 as we are not quite at a point where we=20
> can float with head as we are carrying
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> From: Darren Etheridge <detheridge@ti.com>
>
> Add a chromium config for Scarthgap, just like we did for Kirkstone,
> it is locked to meta-browser at Chromium v123 as we are not quite at
> a point where we can float with head as we are carrying patches in
> meta-arago to make things work,  however we are getting really close
> to dropping this and floating with each Chromium release.
>
> For Chromium to function correctly we need:
> [meta-ti][scarthgap/master] ti-img-rogue-umlibs: bump SRCREV for alloc =
patch
>
> from Randolph Sapp to have been picked up in meta-ti as this fixes an
> allocation problem that Chromium exposes.
>
> Also updating the commented out meta-browser lines to this same commit
> in the mainstream scarthgap configs.
>
> Signed-off-by: Darren Etheridge <detheridge@ti.com>



Acked-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
>   configs/arago-scarthgap-chromium-config.txt | 16 ++++++++++++++++
>   configs/arago-scarthgap-config.txt          |  2 +-
>   configs/arago-scarthgap-next-config.txt     |  2 +-
>   configs/arago-scarthgap-wip-config.txt      |  2 +-
>   4 files changed, 19 insertions(+), 3 deletions(-)
>   create mode 100644 configs/arago-scarthgap-chromium-config.txt
>
> diff --git a/configs/arago-scarthgap-chromium-config.txt b/configs/arag=
o-scarthgap-chromium-config.txt
> new file mode 100644
> index 0000000..cad483c
> --- /dev/null
> +++ b/configs/arago-scarthgap-chromium-config.txt
> @@ -0,0 +1,16 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2..=
.:layern]
> +
> +bitbake,https://urldefense.com/v3/__https://git.openembedded.org/bitba=
ke,2.8,HEAD__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_njE=
OMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYoLpglMt$
> +meta-arago,https://urldefense.com/v3/__https://git.yoctoproject.org/me=
ta-arago,scarthgap,HEAD,layers=3Dmeta-arago-distro:meta-arago-extras:meta=
-arago-demos:meta-arago-test__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYg=
BaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYuZqBOAP$
> +meta-browser,https://urldefense.com/v3/__https://github.com/OSSystems/=
meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=3D=
meta-chromium__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_n=
jEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYoK8Ae-7$
> +meta-qt5,https://urldefense.com/v3/__https://github.com/meta-qt5/meta-=
qt5.git,scarthgap,HEAD,layers=3D__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemY=
fYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYqqachh9$
> +meta-virtualization,https://urldefense.com/v3/__https://git.yoctoproje=
ct.org/meta-virtualization,scarthgap,HEAD,layers=3D__;!!G3vK!UlYUzfroSht8=
G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYT=
YjNYdzdYvJJU-zc$
> +meta-openembedded,https://urldefense.com/v3/__https://git.openembedded=
.org/meta-openembedded,scarthgap,HEAD,layers=3Dmeta-networking:meta-pytho=
n:meta-oe:meta-gnome:meta-filesystems:meta-multimedia__;!!G3vK!UlYUzfroSh=
t8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25J=
YTYjNYdzdYkygNZt2$
> +meta-ti,https://urldefense.com/v3/__https://git.yoctoproject.org/meta-=
ti,scarthgap,HEAD,layers=3Dmeta-ti-extras:meta-ti-bsp__;!!G3vK!UlYUzfroSh=
t8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25J=
YTYjNYdzdYq0wAepN$
> +meta-arm,https://urldefense.com/v3/__https://git.yoctoproject.org/meta=
-arm,scarthgap,HEAD,layers=3Dmeta-arm:meta-arm-toolchain__;!!G3vK!UlYUzfr=
oSht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR=
25JYTYjNYdzdYqscvjIn$
> +meta-clang,https://urldefense.com/v3/__https://github.com/kraj/meta-cl=
ang,scarthgap,HEAD,layers=3D__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYg=
BaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYj9w9E4u$
> +oe-core,https://urldefense.com/v3/__https://git.openembedded.org/opene=
mbedded-core,scarthgap,HEAD,layers=3Dmeta__;!!G3vK!UlYUzfroSht8G1YPhtzA-J=
KLZ0jgemYfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYji=
7-rz5$
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=3Dyes
> diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthg=
ap-config.txt
> index d3fc5d4..f95056d 100644
> --- a/configs/arago-scarthgap-config.txt
> +++ b/configs/arago-scarthgap-config.txt
> @@ -3,7 +3,7 @@
>  =20
>   bitbake,https://urldefense.com/v3/__https://git.openembedded.org/bitb=
ake,2.8,HEAD__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_nj=
EOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYoLpglMt$
>   meta-arago,https://urldefense.com/v3/__https://git.yoctoproject.org/m=
eta-arago,scarthgap,HEAD,layers=3Dmeta-arago-distro:meta-arago-extras:met=
a-arago-demos:meta-arago-test__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYY=
gBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYuZqBOAP$
> -#meta-browser,https://urldefense.com/v3/__https://github.com/OSSystems=
/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=3D=
meta-chromium__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_n=
jEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYnVkRs3k$
> +#meta-browser,https://urldefense.com/v3/__https://github.com/OSSystems=
/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=3D=
meta-chromium__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_n=
jEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYoK8Ae-7$
>   meta-qt5,https://urldefense.com/v3/__https://github.com/meta-qt5/meta=
-qt5.git,scarthgap,HEAD,layers=3D__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgem=
YfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYqqachh9$
>   meta-virtualization,https://urldefense.com/v3/__https://git.yoctoproj=
ect.org/meta-virtualization,scarthgap,HEAD,layers=3D__;!!G3vK!UlYUzfroSht=
8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JY=
TYjNYdzdYvJJU-zc$
>   meta-openembedded,https://urldefense.com/v3/__https://git.openembedde=
d.org/meta-openembedded,scarthgap,HEAD,layers=3Dmeta-networking:meta-pyth=
on:meta-oe:meta-gnome:meta-filesystems:meta-multimedia__;!!G3vK!UlYUzfroS=
ht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25=
JYTYjNYdzdYkygNZt2$
> diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-sc=
arthgap-next-config.txt
> index b5e2088..ecd95c4 100644
> --- a/configs/arago-scarthgap-next-config.txt
> +++ b/configs/arago-scarthgap-next-config.txt
> @@ -11,7 +11,7 @@ MOTD: NOTE:
>  =20
>   bitbake,https://urldefense.com/v3/__https://git.openembedded.org/bitb=
ake,2.8,HEAD__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_nj=
EOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYoLpglMt$
>   meta-arago,https://urldefense.com/v3/__https://git.yoctoproject.org/m=
eta-arago,scarthgap-next,HEAD,layers=3Dmeta-arago-distro:meta-arago-extra=
s:meta-arago-demos:meta-arago-test__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jge=
mYfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYr4phnvy$
> -#meta-browser,https://urldefense.com/v3/__https://github.com/OSSystems=
/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=3D=
meta-chromium__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_n=
jEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYnVkRs3k$
> +#meta-browser,https://urldefense.com/v3/__https://github.com/OSSystems=
/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=3D=
meta-chromium__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_n=
jEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYoK8Ae-7$
>   meta-qt5,https://urldefense.com/v3/__https://github.com/meta-qt5/meta=
-qt5.git,scarthgap,HEAD,layers=3D__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgem=
YfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYqqachh9$
>   meta-virtualization,https://urldefense.com/v3/__https://git.yoctoproj=
ect.org/meta-virtualization,scarthgap,HEAD,layers=3D__;!!G3vK!UlYUzfroSht=
8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JY=
TYjNYdzdYvJJU-zc$
>   meta-openembedded,https://urldefense.com/v3/__https://git.openembedde=
d.org/meta-openembedded,scarthgap,HEAD,layers=3Dmeta-networking:meta-pyth=
on:meta-oe:meta-gnome:meta-filesystems:meta-multimedia__;!!G3vK!UlYUzfroS=
ht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25=
JYTYjNYdzdYkygNZt2$
> diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-sca=
rthgap-wip-config.txt
> index f49d3a1..2dd8209 100644
> --- a/configs/arago-scarthgap-wip-config.txt
> +++ b/configs/arago-scarthgap-wip-config.txt
> @@ -3,7 +3,7 @@
>  =20
>   bitbake,https://urldefense.com/v3/__https://git.openembedded.org/bitb=
ake,2.8,HEAD__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_nj=
EOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYoLpglMt$
>   meta-arago,https://urldefense.com/v3/__https://git.yoctoproject.org/m=
eta-arago,scarthgap-wip,HEAD,layers=3Dmeta-arago-distro:meta-arago-extras=
:meta-arago-demos:meta-arago-test__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgem=
YfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYvd0Qnjv$
> -#meta-browser,https://urldefense.com/v3/__https://github.com/OSSystems=
/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=3D=
meta-chromium__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_n=
jEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYnVkRs3k$
> +#meta-browser,https://urldefense.com/v3/__https://github.com/OSSystems=
/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=3D=
meta-chromium__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_n=
jEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYoK8Ae-7$
>   meta-qt5,https://urldefense.com/v3/__https://github.com/meta-qt5/meta=
-qt5.git,scarthgap,HEAD,layers=3D__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgem=
YfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYqqachh9$
>   meta-virtualization,https://urldefense.com/v3/__https://git.yoctoproj=
ect.org/meta-virtualization,scarthgap,HEAD,layers=3D__;!!G3vK!UlYUzfroSht=
8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JY=
TYjNYdzdYvJJU-zc$
>   meta-openembedded,https://urldefense.com/v3/__https://git.openembedde=
d.org/meta-openembedded,scarthgap,HEAD,layers=3Dmeta-networking:meta-pyth=
on:meta-oe:meta-gnome:meta-filesystems:meta-multimedia__;!!G3vK!UlYUzfroS=
ht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25=
JYTYjNYdzdYkygNZt2$
> --=20
> 2.36.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15342):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15342__;!!G3vK!UlYUzfroSht8G1YPhtzA-J=
KLZ0jgemYfYYgBaUIH3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYng=
_I4eS$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/106395731/7030289__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYgBaUI=
H3GrmXTlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYnThsI-p$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!UlYUzfroSht8G1YPhtzA-JKLZ0jgemYfYYgBaUIH3GrmX=
Tlu_njEOMPqyDyY_u6uRcFbyxANa6ywAEFR25JYTYjNYdzdYqjXh7VS$  [c-shilwant@ti.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

