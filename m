Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11C5C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 22:12:14 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.705.1740521524875254577
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Feb 2025 14:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=U93eqaFV;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51PMC0Rn1348344
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 25 Feb 2025 16:12:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740521520;
	bh=UboxOvmlmW9tvR2U9cmlgnxyjvV8NjsjBXg7LTdvPn4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=U93eqaFVSHpynuGidERdcema2a6vzsLp5ZcLDn7HtWCbDcScep9QWQOayXacRsA2o
	 ThR8kXAq0zZQ/i2hSE5RyT6hZcUCf4RHEwDxjBiRiszn2GCQKYVWvrlVV423eaEDal
	 p8CZjISGlq0Jaw04DisyJP1ruTVbgJV1nwjFciX8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51PMC0XA070939;
	Tue, 25 Feb 2025 16:12:00 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Feb 2025 16:11:59 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Feb 2025 16:11:59 -0600
Received: from [10.249.33.110] ([10.249.33.110])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51PMBxJZ025998;
	Tue, 25 Feb 2025 16:11:59 -0600
Message-ID: <f960f3c0-07d4-4c18-b3a9-654e384380db@ti.com>
Date: Tue, 25 Feb 2025 16:11:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap][PATCH] meta-arago-extras: Add recipe for
 NNStreamer
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Chirag Shilwant
	<c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250222015358.3543400-1-afd@ti.com>
 <20250222022557.GD1879@denix.org>
 <6fd6c8a9-c5fe-4188-9e37-84ee294830c4@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <6fd6c8a9-c5fe-4188-9e37-84ee294830c4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 51PMC0Rn1348344
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Feb 2025 22:12:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15916



On 2/21/2025 8:53 PM, Andrew Davis wrote:
> On 2/21/25 8:25 PM, Denys Dmytriyenko wrote:
>> On Fri, Feb 21, 2025 at 07:53:58PM -0600, Andrew Davis via=20
>> lists.yoctoproject.org wrote:
>>> NNStreamer is an efficient and flexible stream pipeline framework for
>>> complex neural network applications.
>>>
>>> NNStreamer provides a set of GStreamer plugins so developers may appl=
y
>>> neural networks, attach related frameworks (including ROS, IIO,
>>> FlatBuffers, and Protocol Buffers), and manipulate tensor data stream=
s
>>> in GStreamer pipelines easily and execute such pipelines efficiently.
>>>
>>> It was initially developed by Samsung and then transferred to LF AI
>>> Foundation as an incubation project.
>>
>> FWIW, nnstreamer project on github has its own meta-neural-network=20
>> layer with
>> a corresponding nnstreamer recipe:
>> https://github.com/nnstreamer/meta-neural-network
>> https://github.com/nnstreamer/meta-neural-network/blob/master/recipes-=
nnstreamer/nnstreamer/nnstreamer_2.4.2.bb
>>
>=20
> I did find that earlier when looking for existing recipes for this
> framework, but that recipe needs some work. That layer also pulls
> in a bunch of other stuff we don't need/want.
>=20
> I did use that as a kicking-off point. I'll try to push back my
> fixes at some point. Maybe we can work to move that into a more
> common layer.
>=20
>>
>>> Learn more at https://nnstreamer.ai/
>>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>> =C2=A0 .../nnstreamer/nnstreamer_2.4.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 68 +++++++++++++++++++
>>> =C2=A0 1 file changed, 68 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
>>>
>>> diff --git=20
>>> a/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb=
=20
>>> b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
>>> new file mode 100644
>>> index 00000000..55de11e8
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb
>>> @@ -0,0 +1,68 @@
>>> +SUMMARY =3D "NNStreamer, Stream Pipeline Paradigm for Nerual Network=
=20
>>> Applications"
>>> +DESCRIPTION =3D "NNStreamer is a set of Gstreamer plugins that allow=
=20
>>> Gstreamer developers to adopt neural network models easily and=20
>>> efficiently."
>>> +LICENSE =3D "LGPL-2.1-only"
>>> +LIC_FILES_CHKSUM =3D=20
>>> "file://LICENSE;md5=3Dc25e5c1949624d71896127788f1ba590"
>>> +
>>> +SRC_URI =3D=20
>>> "git://github.com/nnstreamer/nnstreamer.git;branch=3Dmain;protocol=3D=
https"
>>> +PV =3D "2.4.0+git"
>>> +SRCREV =3D "7c57c288250578cad598f065b6fda6c0ff720cf9"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +inherit meson pkgconfig
>>> +
>>> +DEPENDS =3D " \
>>> +=C2=A0=C2=A0=C2=A0 orc-native \
>>> +=C2=A0=C2=A0=C2=A0 glib-2.0 \
>>> +=C2=A0=C2=A0=C2=A0 gstreamer1.0 \
>>> +=C2=A0=C2=A0=C2=A0 gstreamer1.0-plugins-base \
>>> +=C2=A0=C2=A0=C2=A0 python3 \
>>> +=C2=A0=C2=A0=C2=A0 python3-numpy \
>>> +=C2=A0=C2=A0=C2=A0 json-glib \
>>> +"
>>> +
>>> +PACKAGECONFIG ??=3D " \
>>> +=C2=A0=C2=A0=C2=A0 protobuf \
>>> +=C2=A0=C2=A0=C2=A0 flatbuffers \
>>> +=C2=A0=C2=A0=C2=A0 tests \
>>> +=C2=A0=C2=A0=C2=A0 armnn \
>>> +=C2=A0=C2=A0=C2=A0 onnxruntime \
>>> +=C2=A0=C2=A0=C2=A0 tensorflow-lite \
>>> +"
>>> +
>>> +PACKAGECONFIG[tests] =3D "-Denable-test=3Dtrue -Dinstall-test=3Dtrue=
,=20
>>> -Denable-test=3Dfalse, gtest"
>>> +PACKAGECONFIG[protobuf] =3D "-Dprotobuf-support=3Denabled,=20
>>> -Dprotobuf-support=3Ddisabled, protobuf protobuf-native"
>>> +PACKAGECONFIG[flatbuffers] =3D "-Dflatbuf-support=3Denabled,=20
>>> -Dflatbuf-support=3Ddisabled, flatbuffers flatbuffers-native"
>>> +PACKAGECONFIG[armnn] =3D "-Darmnn-support=3Denabled,=20
>>> -Darmnn-support=3Ddisabled, armnn"
>>> +PACKAGECONFIG[onnxruntime] =3D "-Donnxruntime-support=3Denabled,=20
>>> -Donnxruntime-support=3Ddisabled, onnxruntime"
>>> +PACKAGECONFIG[tensorflow-lite] =3D "-Dtflite2-support=3Denabled,=20
>>> -Dtflite2-support=3Ddisabled, tensorflow-lite"
>>> +
>>> +do_install:append() {
>>> +=C2=A0=C2=A0=C2=A0 CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no=
-preserve=3Downership"
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Install test data
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/${bindir}/unittest-nnstreamer/tes=
ts
>>> +=C2=A0=C2=A0=C2=A0 cp $CP_ARGS ${S}/tests/test_models=20
>>> ${D}/${bindir}/unittest-nnstreamer/tests
>>> +=C2=A0=C2=A0=C2=A0 rm -f=20
>>> ${D}/${bindir}/unittest-nnstreamer/tests/test_models/models/tvm*
>>> +}
>>> +
>>> +FILES:${PN} +=3D "\
>>> +=C2=A0=C2=A0=C2=A0 ${libdir}/*.so \
>>> +=C2=A0=C2=A0=C2=A0 ${libdir}/gstreamer-1.0/*.so \
>>> +=C2=A0=C2=A0=C2=A0 ${libdir}/nnstreamer/* \
>>> +=C2=A0=C2=A0=C2=A0 ${sysconfdir}/nnstreamer.ini \
>>> +"
>>> +INSANE_SKIP:${PN} +=3D "dev-so"
>>> +
>>> +PACKAGES =3D+ "${PN}-tests"
>>> +
>>> +FILES:${PN}-tests +=3D "\
>>> +=C2=A0=C2=A0=C2=A0 ${libdir}/nnstreamer/customfilters/* \
>>> +=C2=A0=C2=A0=C2=A0 ${bindir}/unittest-nnstreamer/* \
>>> +"
>>> +
>>> +FILES:${PN}-dev =3D "\
>>> +=C2=A0=C2=A0=C2=A0 ${includedir}/nnstreamer/* \
>>> +=C2=A0=C2=A0=C2=A0 ${libdir}/*.a \
>>
>> FWIW, these get automatically packaged into ${PN}-staticdev
>>
>=20
> Let me remove this and see where those go.

Are we waiting for a v2 then?


> Andrew
>=20
>>
>>> +=C2=A0=C2=A0=C2=A0 ${libdir}/pkgconfig/*.pc \
>>> +"
>>> --=20
>>> 2.39.2

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

