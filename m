Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D91C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:19:55 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.2200.1740525593312586010
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 15:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Nke7xPmK;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51PNJmVV1917473
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 25 Feb 2025 17:19:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740525588;
	bh=cFOozFOMuQwQUys29iISgCBs54GueDnBUkezRnw+UX0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Nke7xPmKIYndrS6iSVMXOdl8ATy4JqfCMLht1+Mo/veHHh+uiq1lij28aeNashAvs
	 oXf+kaFIZ8Xi6xpP95nfVw24oebiYr1O5mVGO54rrexf6aV/nofr0gcIGBKS2AS60c
	 poYf9N+urhKmO54ghCjuz4fy6iT/OVqrxwT52YxE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51PNJme9108037;
	Tue, 25 Feb 2025 17:19:48 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Feb 2025 17:19:47 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Feb 2025 17:19:47 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51PNJlr4095742;
	Tue, 25 Feb 2025 17:19:47 -0600
Message-ID: <151d58da-a480-4dad-8938-ed26cf9be9b1@ti.com>
Date: Tue, 25 Feb 2025 17:19:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] meta-arago-extras: Add recipe for
 NNStreamer
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Chirag Shilwant
	<c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250222015358.3543400-1-afd@ti.com>
 <20250222022557.GD1879@denix.org>
 <6fd6c8a9-c5fe-4188-9e37-84ee294830c4@ti.com>
 <f960f3c0-07d4-4c18-b3a9-654e384380db@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <f960f3c0-07d4-4c18-b3a9-654e384380db@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 51PNJmVV1917473
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Feb 2025 23:19:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15919

On 2/25/25 4:11 PM, Ryan Eatmon wrote:
>=20
>=20
> On 2/21/2025 8:53 PM, Andrew Davis wrote:
>> On 2/21/25 8:25 PM, Denys Dmytriyenko wrote:
>>> On Fri, Feb 21, 2025 at 07:53:58PM -0600, Andrew Davis via lists.yoct=
oproject.org wrote:
>>>> NNStreamer is an efficient and flexible stream pipeline framework fo=
r
>>>> complex neural network applications.
>>>>
>>>> NNStreamer provides a set of GStreamer plugins so developers may app=
ly
>>>> neural networks, attach related frameworks (including ROS, IIO,
>>>> FlatBuffers, and Protocol Buffers), and manipulate tensor data strea=
ms
>>>> in GStreamer pipelines easily and execute such pipelines efficiently.
>>>>
>>>> It was initially developed by Samsung and then transferred to LF AI
>>>> Foundation as an incubation project.
>>>
>>> FWIW, nnstreamer project on github has its own meta-neural-network la=
yer with
>>> a corresponding nnstreamer recipe:
>>> https://github.com/nnstreamer/meta-neural-network
>>> https://github.com/nnstreamer/meta-neural-network/blob/master/recipes=
-nnstreamer/nnstreamer/nnstreamer_2.4.2.bb
>>>
>>
>> I did find that earlier when looking for existing recipes for this
>> framework, but that recipe needs some work. That layer also pulls
>> in a bunch of other stuff we don't need/want.
>>
>> I did use that as a kicking-off point. I'll try to push back my
>> fixes at some point. Maybe we can work to move that into a more
>> common layer.
>>
>>>
>>>> Learn more at https://nnstreamer.ai/
>>>>
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>> =C2=A0 .../nnstreamer/nnstreamer_2.4.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 68 +++++++++++++++++++
>>>> =C2=A0 1 file changed, 68 insertions(+)
>>>> =C2=A0 create mode 100644 meta-arago-extras/recipes-multimedia/nnstr=
eamer/nnstreamer_2.4.0.bb
>>>>
>>>> diff --git a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstrea=
mer_2.4.0.bb b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer=
_2.4.0.bb
>>>> new file mode 100644
>>>> index 00000000..55de11e8
>>>> --- /dev/null
>>>> +++ b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4=
.0.bb
>>>> @@ -0,0 +1,68 @@
>>>> +SUMMARY =3D "NNStreamer, Stream Pipeline Paradigm for Nerual Networ=
k Applications"
>>>> +DESCRIPTION =3D "NNStreamer is a set of Gstreamer plugins that allo=
w Gstreamer developers to adopt neural network models easily and efficien=
tly."
>>>> +LICENSE =3D "LGPL-2.1-only"
>>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc25e5c1949624d7189612778=
8f1ba590"
>>>> +
>>>> +SRC_URI =3D "git://github.com/nnstreamer/nnstreamer.git;branch=3Dma=
in;protocol=3Dhttps"
>>>> +PV =3D "2.4.0+git"
>>>> +SRCREV =3D "7c57c288250578cad598f065b6fda6c0ff720cf9"
>>>> +
>>>> +S =3D "${WORKDIR}/git"
>>>> +
>>>> +inherit meson pkgconfig
>>>> +
>>>> +DEPENDS =3D " \
>>>> +=C2=A0=C2=A0=C2=A0 orc-native \
>>>> +=C2=A0=C2=A0=C2=A0 glib-2.0 \
>>>> +=C2=A0=C2=A0=C2=A0 gstreamer1.0 \
>>>> +=C2=A0=C2=A0=C2=A0 gstreamer1.0-plugins-base \
>>>> +=C2=A0=C2=A0=C2=A0 python3 \
>>>> +=C2=A0=C2=A0=C2=A0 python3-numpy \
>>>> +=C2=A0=C2=A0=C2=A0 json-glib \
>>>> +"
>>>> +
>>>> +PACKAGECONFIG ??=3D " \
>>>> +=C2=A0=C2=A0=C2=A0 protobuf \
>>>> +=C2=A0=C2=A0=C2=A0 flatbuffers \
>>>> +=C2=A0=C2=A0=C2=A0 tests \
>>>> +=C2=A0=C2=A0=C2=A0 armnn \
>>>> +=C2=A0=C2=A0=C2=A0 onnxruntime \
>>>> +=C2=A0=C2=A0=C2=A0 tensorflow-lite \
>>>> +"
>>>> +
>>>> +PACKAGECONFIG[tests] =3D "-Denable-test=3Dtrue -Dinstall-test=3Dtru=
e, -Denable-test=3Dfalse, gtest"
>>>> +PACKAGECONFIG[protobuf] =3D "-Dprotobuf-support=3Denabled, -Dprotob=
uf-support=3Ddisabled, protobuf protobuf-native"
>>>> +PACKAGECONFIG[flatbuffers] =3D "-Dflatbuf-support=3Denabled, -Dflat=
buf-support=3Ddisabled, flatbuffers flatbuffers-native"
>>>> +PACKAGECONFIG[armnn] =3D "-Darmnn-support=3Denabled, -Darmnn-suppor=
t=3Ddisabled, armnn"
>>>> +PACKAGECONFIG[onnxruntime] =3D "-Donnxruntime-support=3Denabled, -D=
onnxruntime-support=3Ddisabled, onnxruntime"
>>>> +PACKAGECONFIG[tensorflow-lite] =3D "-Dtflite2-support=3Denabled, -D=
tflite2-support=3Ddisabled, tensorflow-lite"
>>>> +
>>>> +do_install:append() {
>>>> +=C2=A0=C2=A0=C2=A0 CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --n=
o-preserve=3Downership"
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 # Install test data
>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${bindir}/unittest-nnstreamer/te=
sts
>>>> +=C2=A0=C2=A0=C2=A0 cp $CP_ARGS ${S}/tests/test_models ${D}/${bindir=
}/unittest-nnstreamer/tests
>>>> +=C2=A0=C2=A0=C2=A0 rm -f ${D}/${bindir}/unittest-nnstreamer/tests/t=
est_models/models/tvm*
>>>> +}
>>>> +
>>>> +FILES:${PN} +=3D "\
>>>> +=C2=A0=C2=A0=C2=A0 ${libdir}/*.so \
>>>> +=C2=A0=C2=A0=C2=A0 ${libdir}/gstreamer-1.0/*.so \
>>>> +=C2=A0=C2=A0=C2=A0 ${libdir}/nnstreamer/* \
>>>> +=C2=A0=C2=A0=C2=A0 ${sysconfdir}/nnstreamer.ini \
>>>> +"
>>>> +INSANE_SKIP:${PN} +=3D "dev-so"
>>>> +
>>>> +PACKAGES =3D+ "${PN}-tests"
>>>> +
>>>> +FILES:${PN}-tests +=3D "\
>>>> +=C2=A0=C2=A0=C2=A0 ${libdir}/nnstreamer/customfilters/* \
>>>> +=C2=A0=C2=A0=C2=A0 ${bindir}/unittest-nnstreamer/* \
>>>> +"
>>>> +
>>>> +FILES:${PN}-dev =3D "\
>>>> +=C2=A0=C2=A0=C2=A0 ${includedir}/nnstreamer/* \
>>>> +=C2=A0=C2=A0=C2=A0 ${libdir}/*.a \
>>>
>>> FWIW, these get automatically packaged into ${PN}-staticdev
>>>
>>
>> Let me remove this and see where those go.
>=20
> Are we waiting for a v2 then?
>=20

Yeah, seems this one line was not needed, removed it and sending v2 now.

Andrew

>=20
>> Andrew
>>
>>>
>>>> +=C2=A0=C2=A0=C2=A0 ${libdir}/pkgconfig/*.pc \
>>>> +"
>>>> --=20
>>>> 2.39.2
>=20

