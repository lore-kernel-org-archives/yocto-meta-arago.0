Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC61C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 15:34:47 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.62311.1749483279385531326
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 08:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ZAtXY/Is;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 559FYch5801691
	for <meta-arago@lists.yoctoproject.org>; Mon, 9 Jun 2025 10:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749483278;
	bh=fbGg21mt+0eMtixnckEMlaqLAZV2u0Aoqo8ETKcIPI4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZAtXY/Is5edOMhL2ma66HWqktt5kPGo9ge9PWYL/IcGR/vcDoQ6EtP9n5/yhyAloO
	 YrJzE1XKPrfSHfA8tnDt3J18+XHUllXmxRGKCq4SHG7uVNITA34EeSDV6OuQtmUqLM
	 58KF0PmCIcw7/EXBIEi0QD2DjNO+ozOqtlKj54rk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 559FYc6B3786967
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 9 Jun 2025 10:34:38 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 10:34:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 10:34:38 -0500
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 559FYcBr1617423;
	Mon, 9 Jun 2025 10:34:38 -0500
Message-ID: <d237e078-cbd4-437d-b000-647ef8a8e7e2@ti.com>
Date: Mon, 9 Jun 2025 10:34:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [oe-layersetup][master]
 configs/arago-scarthgap-chromium-*: Chromium v130 -> 132
To: "Shilwant, Chirag" <c-shilwant@ti.com>
CC: "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>,
        "Etheridge, Darren" <detheridge@ti.com>,
        "SAHU, JEEVAN KUMAR" <j-sahu@ti.com>
References: <70bd6a5e-9ab8-4da6-8b82-fdfd22d5f32a@email.android.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <70bd6a5e-9ab8-4da6-8b82-fdfd22d5f32a@email.android.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 559FYch5801691
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 Jun 2025 15:34:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16261

Dear Chirag,

Thank you for pointing this out ! I just sent a patch resolving this.

Kind Regards,

Antonios

On 6/6/25 2:49 AM, Shilwant, Chirag wrote:
> Hi Antonios,
>
> On 05-Jun-2025 11:52=E2=80=AFpm, "Antonios Christidis via=20
> lists.yoctoproject.org" <a-christidis=3Dti.com@lists.yoctoproject.org>=20
> wrote:
>
>     From: Antonios Christidis <a-christidis@ti.com>
>
>     Update all scarthgap-chromium configs to point to a new commit
>     sha. Now
>     building version 132.
>
>
>
> Several other configs seems to have missed the SHA update for=20
> meta-browser. Checkout commit [0] from Darren.
>
> Even though meta-browser is commented in those oe-configs, we used to=20
> ensure the commit SHA are consistent across all configs.
>
>
> [0]:=20
> https://git.ti.com/cgit/arago-project/oe-layersetup/commit/?id=3D5ceb90=
305e54f60c02ab5d716e4d69ce1248a60b
>
>
>
> Chirag
>
>
>     Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>     ---
>     =C2=A0configs/arago-scarthgap-chromium-config.txt | 2 +-
>     =C2=A0kas/arago-scarthgap-chromium-config.yml | 2 +-
>     =C2=A0src/configs/arago-scarthgap-chromium-config.xml | 2 +-
>     =C2=A03 files changed, 3 insertions(+), 3 deletions(-)
>
>     diff --git a/configs/arago-scarthgap-chromium-config.txt
>     b/configs/arago-scarthgap-chromium-config.txt
>     index ae873e8..00982c0 100644
>     --- a/configs/arago-scarthgap-chromium-config.txt
>     +++ b/configs/arago-scarthgap-chromium-config.txt
>     @@ -3,7 +3,7 @@
>
>     =C2=A0bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
>     =C2=A0meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,=
HEAD,layers=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
>     -meta-browser,https://github.com/OSSystems/meta-browser.git,master,=
68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa4,layers=3Dmeta-chromium
>     +meta-browser,https://github.com/OSSystems/meta-browser.git,master,=
27ca52f635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
>     =C2=A0#meta-selinux,https://git.yoctoproject.org/meta-selinux,scart=
hgap,HEAD,layers=3D
>     =C2=A0meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layer=
s=3D
>     =C2=A0meta-virtualization,https://git.yoctoproject.org/meta-virtual=
ization,scarthgap,HEAD,layers=3D
>     diff --git a/kas/arago-scarthgap-chromium-config.yml
>     b/kas/arago-scarthgap-chromium-config.yml
>     index a929eda..fb10504 100644
>     --- a/kas/arago-scarthgap-chromium-config.yml
>     +++ b/kas/arago-scarthgap-chromium-config.yml
>     @@ -18,7 +18,7 @@ repos:
>     =C2=A0=C2=A0 meta-browser:
>     =C2=A0=C2=A0=C2=A0=C2=A0 url: "https://github.com/OSSystems/meta-br=
owser.git"
>     =C2=A0=C2=A0=C2=A0=C2=A0 branch: "master"
>     -=C2=A0=C2=A0=C2=A0 commit: "68e8cbf51ac46c8c1b3923ee2b20e27ba9d3fa=
a4"
>     +=C2=A0=C2=A0=C2=A0 commit: "27ca52f635a31f5f9762813a8527dd31323549=
b7"
>     =C2=A0=C2=A0=C2=A0=C2=A0 layers:
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 meta-chromium:
>
>     diff --git a/src/configs/arago-scarthgap-chromium-config.xml
>     b/src/configs/arago-scarthgap-chromium-config.xml
>     index ba7c95e..faebe57 100644
>     --- a/src/configs/arago-scarthgap-chromium-config.xml
>     +++ b/src/configs/arago-scarthgap-chromium-config.xml
>     @@ -16,7 +16,7 @@
>     <layer>meta-arago-test</layer>
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 </layers>
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </repo>
>     -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-brow=
ser'
>     url=3D'https://github.com/OSSystems/meta-browser.git'
>     branch=3D'master' commit=3D'68e8cbf51ac46c8c1b3923ee2b20e27ba9d3faa=
4'>
>     +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <repo name=3D'meta-brow=
ser'
>     url=3D'https://github.com/OSSystems/meta-browser.git'
>     branch=3D'master' commit=3D'27ca52f635a31f5f9762813a8527dd31323549b=
7'>
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <layers>
>     <layer>meta-chromium</layer>
>     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 </layers>
>     --=20
>     2.34.1
>
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#16255):
>     https://lists.yoctoproject.org/g/meta-arago/message/16255
>     Mute This Topic: https://lists.yoctoproject.org/mt/113490476/703028=
9
>     Group Owner: meta-arago+owner@lists.yoctoproject.org
>     Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub
>     [c-shilwant@ti.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

