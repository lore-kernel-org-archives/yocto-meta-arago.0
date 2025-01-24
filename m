Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0680C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 14:31:13 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.13283.1737729069068801504
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 06:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=szEMBnE+;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50OEV7GY562251
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2025 08:31:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737729067;
	bh=xl+UsNMpUxgIFN1d1amN5zwqHoyGmlv9VycX8onCFwg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=szEMBnE+NizmKg5A1ugGOI3d+TZvC4l0e1qg0YeST5s9lEumvaFk8zHSO9g5SDsT/
	 lBEJqovvtQgWVCL7/PVxOVe2aKmv4NeOoH4yxCuDi1MUqZMebo1SlCWc69wUFBGc14
	 X7Y/LDKAKpAoA0lQ2aag/kgHueGtdIpTrlzIbSBY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50OEV6QK077454
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jan 2025 08:31:07 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 Jan 2025 08:31:06 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 Jan 2025 08:31:06 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50OEV4P1026737;
	Fri, 24 Jan 2025 08:31:04 -0600
Message-ID: <8f4738fd-a741-478c-ae31-e1afb2ec5ba2@ti.com>
Date: Fri, 24 Jan 2025 20:01:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][scarthgap][PATCH 1/1]
 meta-arago-extras: Add recipe for TFLite Runtime
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, Ryan <reatmon@ti.com>,
        <v-singh1@ti.com>, Khasim <khasim@ti.com>, Andrew Davis <afd@ti.com>
References: <20250123172509.445473-1-c-shilwant@ti.com>
 <20250123172509.445473-2-c-shilwant@ti.com>
 <068aa65b-e965-4dec-a779-e9baa0a1f11b@ti.com>
 <20250123223529.GA21836@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20250123223529.GA21836@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 50OEV7GY562251
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 24 Jan 2025 14:31:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15755

Hi Denys,

On 24/01/25 04:05, Denys Dmytriyenko wrote:
> > >+do_configure[network] =3D "1" > >+ > >+do_configure:=E2=80=8Aprepen=
d() { >=20
> >+ if [ -n "${http_proxy}" ]; then > >+ export=20
> HTTP_PROXY=3D${http_proxy} > >+ export http_proxy=3D${http_proxy} > >+ =
fi=20
> > >+ >
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uPdqXRfP1m07amYkf=
LMjnW_0WPoGAUc_xiEhDJ8PA6NpT0xA8jTf-KB9808zSr3fgbwdqDV_S4_t$>=20
>
> ZjQcmQRYFpfptBannerEnd
> > >+do_configure[network] =3D "1"
> > >+
> > >+do_configure:prepend() {
> > >+    if [ -n "${http_proxy}" ]; then
> > >+        export HTTP_PROXY=3D${http_proxy}
> > >+        export http_proxy=3D${http_proxy}
> > >+    fi
> > >+
> > >+    if [ -n "${https_proxy}" ]; then
> > >+        export HTTPS_PROXY=3D${https_proxy}
> > >+        export https_proxy=3D${https_proxy}
> > >+    fi
> >=20
> >=20
> > Are these checks needed? If it is unset then exporting doesn't hurt,
> > could replace all this with:
> >=20
> > export http_proxy
> > export https_proxy
> > do_configure[network] =3D "1"
> >=20
> > >+do_compile[network] =3D "1"
> > >+
> > >+do_compile:prepend() {
> > >+    # Used to download cmake dependencies when behind a proxy
> > >+    if [ -n "${http_proxy}" ]; then
> > >+        export HTTP_PROXY=3D${http_proxy}
> > >+        export http_proxy=3D${http_proxy}
> > >+    fi
> > >+
> > >+    if [ -n "${https_proxy}" ]; then
> > >+        export HTTPS_PROXY=3D${https_proxy}
> > >+        export https_proxy=3D${https_proxy}
> > >+    fi
> >=20
> > Do you need network during compile? Seems to only be used in configur=
e.
>
> Both of the above will get you in trouble later on - these are consider=
ed a
> very bad antisocial behavior and an almost sure way to strip off of any=
 Yocto
> Project Compatible status...



I completely understand your concerns about following best practices in=20
Yocto.
I was aware that the Yocto documentation now recommends limiting network=20
access
to the do_fetch task. However, I'd like to point out that many official=20
Yocto Project
layers still enable network access after do_fetch.

For example, in meta-openembedded, there are several recipes that enable=20
network access
during do_configure and do_compile. Following are few references,

- meta-oe/recipes-support/crucible [1]
- meta-oe/recipes-dbs/influxdb [2]
- meta-oe/recipes-test/syzkaller [3]
- meta-arago-extras/recipes-devtools/websocketd [4]

These are few examples which I founded just my doing a grep on layers=20
used in TI SDK
but I'm sure there would be more such recipes in other layers which are=20
under Yocto
Project banner & still enabling network after do_fetch.

It's interesting to note that the Yocto Project documentation itself=20
provides example
of how to enable network access outside of do_fetch [5]. This highlights=20
the complexity
of building certain packages, especially those with dynamic dependencies.

Projects like Golang and TensorFlow have more traction towards x86-based=20
systems, making
it challenging to revamp their build workflows. As a result, many Yocto=20
layers, including
meta-imx-ml [6], meta-st-x-linux-ai [7], and even meta-tensorflow (the=20
official Yocto
Project layer for TensorFlow), builds TFLite by enabling network access=20
during
do_configure and do_compile [8]

Furthermore, the TensorFlow CMake build system is not intelligent enough=20
to detect the
presence of existing dependencies. This makes it difficult to cleanly=20
build TensorFlow
Lite without network connectivity. I'd like to point out that=20
meta-webosose:recipes-upstreamable
which attempts to build TFLite without network connectivity [9], but it=20
ends up with a
recipe that uses dirty hacks to delete CMake files for certain delegates.
This approach makes the recipe non-scalable and difficult to migrate to=20
newer versions
(I believe that's one of the reason they are still on TFLite v2.9 for=20
past 2 years!)

Similarly, Golang-based projects face similar challenges. That's why=20
we're enabling network
access at do_compile for websocketd in meta-arago [4]

Btw, I'd like to mention that I've already addressed the do_compile=20
network access issue
by switching to setuptools3 [10]. Nevertheless, I still require network=20
access at the
do_configure stage to complete the build process. I hope this provides=20
more context
to the issue.

Ideally, if we want to fix this problem, Yocto Project should educate=20
projects like Golang,
Tensorflow, etc. about the traction of these projects in non x86 based=20
systems
where majority of people end up using Yocto project which doesn't like=20
fetching dependencies
at runtime. Post which several folks can collaborate & ensure to add a=20
build mechanism
which is Yocto Project friendly!



[1]:=20
https://git.openembedded.org/meta-openembedded/plain/meta-oe/recipes-supp=
ort/crucible/crucible_2023.11.02.bb?h=3Dscarthgap

[2]:=20
https://git.openembedded.org/meta-openembedded/plain/meta-oe/recipes-dbs/=
influxdb/influxdb_1.8.10.bb?h=3Dscarthgap

[3]:=20
https://git.openembedded.org/meta-openembedded/plain/meta-oe/recipes-test=
/syzkaller/syzkaller_git.bb?h=3Dscarthgap

[4]:=20
https://git.ti.com/cgit/arago-project/meta-arago/commit/meta-arago-extras=
/recipes-devtools/websocketd/websocketd_0.4.1.bb?h=3Dscarthgap&id=3D29ef9=
88fae74cd26c418d0e728f757b3c26f23da

[5]:=20
https://docs.yoctoproject.org/5.0.6/migration-guides/migration-4.0.html#f=
etching-changes

[6]:=20
https://github.com/nxp-imx/meta-imx/blob/scarthgap-6.6.36-2.1.0/meta-imx-=
ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.16.2.bb#L46

[7]:=20
https://github.com/STMicroelectronics/meta-st-x-linux-ai/blob/scarthgap/r=
ecipes-frameworks/tensorflow-lite/tensorflow-lite_git.bb#L75

[8]:=20
https://git.yoctoproject.org/meta-tensorflow/tree/recipes-framework/tenso=
rflow/tensorflow.inc#n64

[9]:=20
https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-=
upstreamable/tensorflow-lite/tensorflow-lite_2.9.3.inc#L140

[10]: https://lists.yoctoproject.org/g/meta-arago/message/15754



---
Chirag



>
> I'd suggest spending some time trying to find a way to do any and all
> downloads inside the do_fetch() task, which is the only one allowed to =
have
> network access.
>
> In other words - do_configure() and do_compile() are definitely not the=
 right
> places to do any network fetching...
>
> --=20
> Denys

